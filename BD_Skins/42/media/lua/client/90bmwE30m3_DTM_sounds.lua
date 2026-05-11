--****************************************************************
--** BD Vehicle Tints & Furs — E30 M3 DTM burble sound layer    **
--** Lift/shift burble only — no surge (naturally-aspirated S14) **
--****************************************************************

local TARGETS = {
	["90bmwE30m3_DTM_TIC"] = true,
	["90bmwE30m3_DTM_JAG"] = true,
};

local BOOST_ARM_RPM    = 4000;
local BURBLE_PEAK_RPM  = 5000;

-- S14 race engine: sharp, prominent pops — more High/Mid, fewer silents, louder overall
local BURBLE_POOL = {
	{ name = "E30_DTM_BurbleHigh", volume = 0.65 },
	{ name = "E30_DTM_BurbleMid",  volume = 0.70 },
	{ name = "E30_DTM_BurbleHigh", volume = 0.60 },
	{ name = "E30_DTM_BurbleMid",  volume = 0.75 },
	{ name = nil },
	{ name = "E30_DTM_BurbleHigh", volume = 0.55 },
	{ name = "E30_DTM_BurbleLow",  volume = 0.65 },
	{ name = "E30_DTM_BurbleMid",  volume = 0.68 },
	{ name = "E30_DTM_BurbleHigh", volume = 0.70 },
	{ name = nil },
	{ name = "E30_DTM_BurbleMid",  volume = 0.60 },
	{ name = "E30_DTM_BurbleHigh", volume = 0.50 },
};

local BURBLE_COOLDOWN_MS = 900;

local THROTTLE_HOLD_TICKS = 3;
local FADE_TICKS          = 10;
local FADE_FACTOR         = 0.75;  -- volume multiplier per fade step (10 ticks → ~5% final)

local function isTarget(vehicle)
	local script = vehicle:getScript();
	if not script then return false end
	return TARGETS[script:getName()] == true;
end

local function playTracked(emitter, md, idKey, volKey, fadeKey, name, volume)
	if md[idKey] then emitter:stopSound(md[idKey]); end
	local id = emitter:playSound(name);
	md[idKey]  = id;
	md[volKey] = volume;
	md[fadeKey] = nil;
	if id then emitter:setVolume(id, volume); end
end

local function stepFade(emitter, md, idKey, volKey, fadeKey)
	local left = md[fadeKey];
	if not left then return end
	local id = md[idKey];
	if not id then
		md[fadeKey] = nil; md[volKey] = nil;
		return;
	end
	left = left - 1;
	if left <= 0 then
		emitter:stopSound(id);
		md[idKey] = nil; md[volKey] = nil; md[fadeKey] = nil;
	else
		local v = (md[volKey] or 0) * FADE_FACTOR;
		md[volKey]  = v;
		md[fadeKey] = left;
		emitter:setVolume(id, v);
	end
end

local function onPlayerUpdate(player)
	if not player or not player:isLocalPlayer() or not player:isDriving() then return end

	local vehicle = player:getVehicle();
	if not vehicle or not isTarget(vehicle) then return end
	if not vehicle:isEngineRunning() then return end

	local md       = vehicle:getModData();
	local now      = getTimestampMs();
	local rpm      = vehicle:getEngineSpeed();
	local gear     = vehicle:getTransmissionNumber();
	local throttle = isKeyDown(Keyboard.KEY_W);
	local emitter  = vehicle:getEmitter();

	local lastGear    = md.dtmLastGear    or gear;
	local wasThrottle = md.dtmWasThrottle or false;
	local boostArmed  = md.dtmBoostArmed  or false;
	local peakRpm     = md.dtmPeakRpm     or 0;
	local burbleReady = (md.dtmBurbleNextMs or 0) <= now;

	if (md.dtmBurbleId) and throttle then
		md.dtmThrottleHoldTicks = (md.dtmThrottleHoldTicks or 0) + 1;
	else
		md.dtmThrottleHoldTicks = 0;
	end

	if throttle and gear > 0 and rpm >= BOOST_ARM_RPM then
		boostArmed = true;
		if rpm > peakRpm then peakRpm = rpm; end
	end

	local liftEvent  = boostArmed and wasThrottle and not throttle and gear > 0;
	local shiftEvent = boostArmed and gear > lastGear and gear > 0;

	if burbleReady and (liftEvent or shiftEvent) and peakRpm >= BURBLE_PEAK_RPM then
		local idx  = ((md.dtmBurbleIdx or 0) % #BURBLE_POOL) + 1;
		local pick = BURBLE_POOL[idx];
		if pick.name then
			playTracked(emitter, md, "dtmBurbleId", "dtmBurbleVol", "dtmBurbleFade",
			            pick.name, pick.volume);
		end
		md.dtmBurbleIdx    = idx;
		md.dtmBurbleNextMs = now + BURBLE_COOLDOWN_MS;
		boostArmed = false;
		peakRpm    = 0;
	end

	if boostArmed and rpm < (BOOST_ARM_RPM - 800) then
		boostArmed = false;
		peakRpm    = 0;
	end

	if md.dtmThrottleHoldTicks > THROTTLE_HOLD_TICKS then
		if md.dtmBurbleId and not md.dtmBurbleFade then
			md.dtmBurbleFade = FADE_TICKS;
		end
	end

	stepFade(emitter, md, "dtmBurbleId", "dtmBurbleVol", "dtmBurbleFade");

	md.dtmLastGear    = gear;
	md.dtmWasThrottle = throttle;
	md.dtmBoostArmed  = boostArmed;
	md.dtmPeakRpm     = peakRpm;
end

Events.OnPlayerUpdate.Add(onPlayerUpdate);
