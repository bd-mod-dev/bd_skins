--****************************************************************
--** BD Vehicle Tints & Furs — 4SIS dynamic sound layer          **
--** Falloff-based: surge on lift/shift after boost build-up     **
--****************************************************************

local TARGETS = {
	["91nissan240sx_4SIS"]  = true,
	["91nissan240sx2_4SIS"] = true,
};

-- Tunables — see 91nissan240sx_4SIS_engine.txt for shift points
local BOOST_ARM_RPM         = 3500;   -- throttle held above this RPM = boost armed
local BURBLE_PEAK_RPM       = 4750;   -- peak RPM threshold to maybe pop a burble

local SURGE_VOLUME          = 0.25;   -- flat; low-rev gate is BOOST_ARM_RPM above

local SURGE_COOLDOWN_MS     = 1200;

-- Throttle re-application cuts the lingering falloff samples.
-- After THROTTLE_HOLD_TICKS of held throttle, fade active sounds across FADE_TICKS.
local THROTTLE_HOLD_TICKS   = 3;
local FADE_TICKS            = 2;
local FADE_FACTOR           = 0.5;    -- volume multiplier per fade step

-- Surge sample pool — picked at random, no silent slots (a surge always fires on the event).
local SURGE_POOL = {
	"N240_4SIS_TurboSurge1",
	"N240_4SIS_TurboSurge2",
	"N240_4SIS_TurboSurge3",
	"N240_4SIS_TurboSurge1",
	"N240_4SIS_TurboSurge2",
	"N240_4SIS_TurboSurge3",
	"N240_4SIS_TurboSurge1",
	"N240_4SIS_TurboSurge2",
	"N240_4SIS_TurboSurge3",
};

-- Burble accent pool — cycled, not random. Includes silent slots so it doesn't fire every time.
-- Distribution: low x3, mid x4, high x2 (rare), silent x3. Volumes vary per slot.
local BURBLE_POOL = {
	{ name = "N240_4SIS_BurbleLow",  volume = 0.45 },
	{ name = "N240_4SIS_BurbleMid",  volume = 0.55 },
	{ name = nil },
	{ name = "N240_4SIS_BurbleMid",  volume = 0.40 },
	{ name = "N240_4SIS_BurbleLow",  volume = 0.60 },
	{ name = "N240_4SIS_BurbleHigh", volume = 0.50 },
	{ name = "N240_4SIS_BurbleMid",  volume = 0.35 },
	{ name = nil },
	{ name = "N240_4SIS_BurbleLow",  volume = 0.50 },
	{ name = "N240_4SIS_BurbleMid",  volume = 0.65 },
	{ name = nil },
	{ name = "N240_4SIS_BurbleHigh", volume = 0.30 },
};

local function isTarget(vehicle)
	local script = vehicle:getScript();
	if not script then return false end
	return TARGETS[script:getName()] == true;
end

-- Play and remember id+volume on the slot so we can fade/stop it later.
local function playTracked(emitter, md, slot, name, volume)
	local idKey, volKey, fadeKey = slot.id, slot.vol, slot.fade;
	-- If a previous sample is still tracked, hard-stop it so we don't leak
	if md[idKey] then emitter:stopSound(md[idKey]); end
	local id = emitter:playSound(name);
	md[idKey]   = id;
	md[volKey]  = volume;
	md[fadeKey] = nil;
	if id then emitter:setVolume(id, volume); end
end

-- One fade step. Returns nothing; mutates modData.
local function stepFade(emitter, md, slot)
	local idKey, volKey, fadeKey = slot.id, slot.vol, slot.fade;
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

local SURGE_SLOT  = { id = "surgeId",  vol = "surgeVol",  fade = "surgeFade"  };
local BURBLE_SLOT = { id = "burbleId", vol = "burbleVol", fade = "burbleFade" };

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

	local lastGear     = md.lastGear     or gear;
	local wasThrottle  = md.wasThrottle  or false;
	local boostArmed   = md.boostArmed   or false;
	local peakRpm      = md.peakRpm      or 0;
	local surgeReady   = (md.surgeNextMs or 0) <= now;

	-- Throttle hold counter — only meaningful while a falloff sample is alive.
	-- Drops to 0 when no tracked sound exists or when throttle is released, so the
	-- next fired sample always gets its full 3-tick grace period.
	if (md.surgeId or md.burbleId) and throttle then
		md.throttleHoldTicks = (md.throttleHoldTicks or 0) + 1;
	else
		md.throttleHoldTicks = 0;
	end

	-- Arm boost when throttle held above the threshold; track peak RPM during build
	if throttle and gear > 0 and rpm >= BOOST_ARM_RPM then
		boostArmed = true;
		if rpm > peakRpm then peakRpm = rpm; end
	end

	-- Falloff events: throttle release OR upshift while armed
	local liftEvent  = boostArmed and wasThrottle and not throttle and gear > 0;
	local shiftEvent = boostArmed and gear > lastGear and gear > 0;

	if surgeReady and (liftEvent or shiftEvent) then
		playTracked(emitter, md, SURGE_SLOT, SURGE_POOL[ZombRand(#SURGE_POOL) + 1], SURGE_VOLUME);
		if peakRpm >= BURBLE_PEAK_RPM then
			local idx  = ((md.burbleIdx or 0) % #BURBLE_POOL) + 1;
			local pick = BURBLE_POOL[idx];
			if pick.name then
				playTracked(emitter, md, BURBLE_SLOT, pick.name, pick.volume);
			end
			md.burbleIdx = idx;
		end
		md.surgeNextMs = now + SURGE_COOLDOWN_MS;
		boostArmed = false;
		peakRpm    = 0;
	end

	-- Decay armed state if RPM drops well below arm threshold without an event
	if boostArmed and rpm < (BOOST_ARM_RPM - 800) then
		boostArmed = false;
		peakRpm    = 0;
	end

	-- After enough sustained throttle, fade the burble tail. Surge is left alone so it rings to the end.
	if md.throttleHoldTicks > THROTTLE_HOLD_TICKS then
		if md.burbleId and not md.burbleFade then md.burbleFade = FADE_TICKS; end
	end

	stepFade(emitter, md, SURGE_SLOT);
	stepFade(emitter, md, BURBLE_SLOT);

	md.lastGear    = gear;
	md.wasThrottle = throttle;
	md.boostArmed  = boostArmed;
	md.peakRpm     = peakRpm;
end

Events.OnPlayerUpdate.Add(onPlayerUpdate);
