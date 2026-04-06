R32A = R32A or {}
R32A.states = R32A.states or {}

R32A.vehicles = {
	["Base.70dodgePD_Alkash"] = {turboSound = "GTRturbo", crackSound = "GTRcrackling", rpmUp = 3900, rpmDown = 2900},
	["Base.92nissanGTR_ganksta"] = {turboSound = "GTRturbo", crackSound = "GTRcrackling", rpmUp = 3900, rpmDown = 2900},
	["Base.92nissanGTR_Pol217"] = {turboSound = "GTRturbo", crackSound = "GTRcrackling", rpmUp = 3900, rpmDown = 2900}
}

function R32A.updateTurbo(player)
	local vehicle = player:getVehicle()
	if not vehicle then return end
	
	local config = R32A.vehicles[vehicle:getScriptName()]
	if not config or not vehicle:isEngineRunning() then return end
	
	local vid = vehicle:getId()
	local speed = vehicle:getEngineSpeed()
	
	if R32A.states[vid] == nil then R32A.states[vid] = false end
	
	if not R32A.states[vid] and speed >= config.rpmUp then
		getSoundManager():PlaySound(config.turboSound, false, 1)
		R32A.states[vid] = true
		
	elseif R32A.states[vid] and speed < config.rpmDown then
		getSoundManager():PlaySound(config.crackSound, false, 1)
		R32A.states[vid] = false
	end
end
Events.OnPlayerUpdate.Add(R32A.updateTurbo)