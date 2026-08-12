--****************************************************************
--** BD Vehicle Tints & Furs — KoTnz BOV sound layer            **
--** Surge on lift/shift after boost build-up, plays to the end **
--****************************************************************

local TARGETS = {
	["82porsche911rwb_KoTnz"] = true,
};

local BOOST_ARM_RPM     = 3500;   -- throttle held above this RPM = boost armed
local SURGE_VOLUME      = 0.25;
local SURGE_COOLDOWN_MS = 1200;

local SURGE_POOL = {
	"PRS82_KoTnz_TurboSurge1",
	"PRS82_KoTnz_TurboSurge2",
	"PRS82_KoTnz_TurboSurge3",
};

local function isTarget(vehicle)
	local script = vehicle:getScript();
	if not script then return false end
	return TARGETS[script:getName()] == true;
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
	-- In reverse the accelerator is the Backward key, not Forward.
	local throttle = isKeyDown(getCore():getKey(gear < 0 and "Backward" or "Forward"));

	local lastGear    = md.lastGear    or gear;
	local wasThrottle = md.wasThrottle or false;
	local boostArmed  = md.boostArmed  or false;
	local surgeReady  = (md.surgeNextMs or 0) <= now;

	-- gear: 0 = neutral, -1 = reverse, 1..N = forward. Reverse boosts too.
	if throttle and gear ~= 0 and rpm >= BOOST_ARM_RPM then
		boostArmed = true;
	end

	local liftEvent  = boostArmed and wasThrottle and not throttle and gear ~= 0;
	local shiftEvent = boostArmed and lastGear > 0 and gear > lastGear;

	-- Fire and forget — the sample always rings out in full; the cooldown keeps
	-- overlapping surges from stacking.
	if surgeReady and (liftEvent or shiftEvent) then
		local emitter = vehicle:getEmitter();
		local id = emitter:playSound(SURGE_POOL[ZombRand(#SURGE_POOL) + 1]);
		if id then emitter:setVolume(id, SURGE_VOLUME); end
		md.surgeNextMs = now + SURGE_COOLDOWN_MS;
		boostArmed = false;
	end

	-- Decay armed state if RPM drops well below arm threshold without an event
	if boostArmed and rpm < (BOOST_ARM_RPM - 800) then
		boostArmed = false;
	end

	md.lastGear    = gear;
	md.wasThrottle = throttle;
	md.boostArmed  = boostArmed;
end

Events.OnPlayerUpdate.Add(onPlayerUpdate);
