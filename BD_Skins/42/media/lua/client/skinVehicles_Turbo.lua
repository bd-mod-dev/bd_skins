R32A = R32A or {}
R32A.states = R32A.states or {}

R32A.vehicles = {
	["Base.70dodgePD_Alkash"] = {turboSound = "GTRturbo", crackSound = "GTRcrackling", rpmUp = 3900, rpmDown = 2900},
	["Base.92nissanGTR_ganksta"] = {turboSound = "GTRturbo", crackSound = "GTRcrackling", rpmUp = 3900, rpmDown = 2900},
	["Base.92nissanGTR_Pol217"] = {turboSound = "GTRturbo", crackSound = "GTRcrackling", rpmUp = 3900, rpmDown = 2900}
}

local sm = getSoundManager()
local vehicles = R32A.vehicles
local states = R32A.states

function R32A.updateTurbo(player)
	local vehicle = player:getVehicle()
	if not vehicle or not vehicle:isEngineRunning() then return end

	local config = vehicles[vehicle:getScriptName()]
	if not config then return end

	local vid = vehicle:getId()
	local speed = vehicle:getEngineSpeed()
	local state = states[vid] or false
	
	if not state and speed >= config.rpmUp then
		sm:PlaySound(config.turboSound, false, 1)
		states[vid] = true

	elseif state and speed < config.rpmDown then
		sm:PlaySound(config.crackSound, false, 1)
		states[vid] = false
	end
end
Events.OnPlayerUpdate.Add(R32A.updateTurbo)