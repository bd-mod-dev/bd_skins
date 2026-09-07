--****************************************************************
--** BD Vehicle Simple Skins and Tints — 82 Porsche 911 (all)   **
--****************************************************************

local skins = {
    "Vehicles/Vehicles_82porsche911turbo_Shell_IsThatGold",
    "Vehicles/Vehicles_82porsche911turbo_Shell_IsThatMetal",
    "Vehicles/Vehicles_82porsche911turbo_Shell_LemonLicorice",
    "Vehicles/Vehicles_82porsche911turbo_Shell_LimeCandy",
    "Vehicles/Vehicles_82porsche911turbo_Shell_OrangeLime",
    "Vehicles/Vehicles_82porsche911turbo_Shell_OrangeLimePale",
    "Vehicles/Vehicles_82porsche911turbo_Shell_OrangeLimeVivid",
    "Vehicles/Vehicles_82porsche911turbo_Shell_RoseCandy",
    "Vehicles/Vehicles_82porsche911turbo_Shell_str1",
    "Vehicles/Vehicles_82porsche911turbo_Shell_str2",
    "Vehicles/Vehicles_82porsche911turbo_Shell_str3",
    "Vehicles/Vehicles_82porsche911turbo_Shell_str4",
    "Vehicles/Vehicles_82porsche911turbo_Shell_str5",
    "Vehicles/Vehicles_82porsche911turbo_Shell_str6",
    "Vehicles/Vehicles_82porsche911turbo_Shell_str7",
}

Events.OnGameBoot.Add(function()
    for _, tex in ipairs(skins) do
        DAMN.ScriptTools:addSkinToVehicleScript("Base.82porsche911turbo", tex);
    end
    DAMN.ScriptTools:addSkinToVehicleScript("Base.82porsche911rwb", "Vehicles/Vehicles_82porsche911rwb_Shell_DTM_GULF");
end)
