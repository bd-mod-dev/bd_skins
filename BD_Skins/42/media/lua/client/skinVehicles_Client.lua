require "Hooks/DAMN_EnterAnimations";

DAMN = DAMN or {};
DAMN.EnterAnimations:registerVehicleScript("Base.49powerWagonPA_Skin", "basic");

-- 63beetleBuggy_Skin
-- 63beetleBuggy_Xait

-- 63Type2VanApocalypse_Skin

DAMN.EnterAnimations:registerVehicleScript("Base.67gt500e_Skin", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.67gt500e_Alkash", "low");

DAMN.EnterAnimations:registerVehicleScript("Base.69miniIJ_Skin", "low");

DAMN.EnterAnimations:registerVehicleScript("Base.70barracudaAAR_Skin", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.70barracudaAAR_beast", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.70barracudaAAR_SOBR", "low");

DAMN.EnterAnimations:registerVehicleScript("Base.70dodgeBG_Skin", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.70dodgePD_Skin", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.70dodgePD_Alkash", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.70dodgePD_Goons", "low");

DAMN.EnterAnimations:registerVehicleScript("Base.75grandPrixHurst_Skin", "low");

-- 80manKat1_Erm 42.12
-- 80manKat1_Square 42.12
-- 80manKat1_UnholyFEAR 42.12

DAMN.EnterAnimations:registerVehicleScript("Base.81deloreanDMC12_Skin", "sport");

DAMN.EnterAnimations:registerVehicleScript("Base.82porsche911turbo_Skin", "sport");
DAMN.EnterAnimations:registerVehicleScript("Base.82porsche911rwb_Skin", "sport");

DAMN.EnterAnimations:registerVehicleScript("Base.84mercLWB4_Skin", "basic");
DAMN.EnterAnimations:registerVehicleScript("Base.84mercLWB4M_Boo", "basic");

DAMN.EnterAnimations:registerVehicleScript("Base.87buickRegalTurboTfbi_SKin", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.87buickRegalTurboTfbi_Kakcuk", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.87buickRegalTurboTfbi_stik", "low");

DAMN.EnterAnimations:registerVehicleScript("Base.87toyotaMR2_Skin", "low");

-- 89dodgeCaravanNomad_Skin

DAMN.EnterAnimations:registerVehicleScript("Base.89volvo245wagon_vstanislav", "low");

DAMN.EnterAnimations:registerVehicleScript("Base.90bmwE30m3_Skin", "low");

-- 91geoMetro_Skin

DAMN.EnterAnimations:registerVehicleScript("Base.92amgeneralM998_Skin", "basic");
DAMN.EnterAnimations:registerVehicleScript("Base.92amgeneralM998_Sinod", "basic");
DAMN.EnterAnimations:registerVehicleScript("Base.92amgeneralM998_Dismor", "basic");
DAMN.EnterAnimations:registerVehicleScript("Base.92amgeneralM998_LILITH", "basic");

DAMN.EnterAnimations:registerVehicleScript("Base.92nissanGTR_Skin", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.92nissanGTR_Ksora", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.92nissanGTR_ganksta", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.92nissanGTR_Pol217", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.92nissanGTR_RACCOON", "low");

DAMN.EnterAnimations:registerVehicleScript("Base.93chevySuburbanfbi_Skin", "basic");

DAMN.EnterAnimations:registerVehicleScript("Base.93fordF350_Skin", "basic");
DAMN.EnterAnimations:registerVehicleScript("Base.93fordF350pd_Sinod", "basic");

DAMN.EnterAnimations:registerVehicleScript("Base.98stagea260RS_Skin", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.98stagea260RS_Kamys", "low");

DAMN.EnterAnimations:registerVehicleScript("Base.91fordLTD_Rusty", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.91fordLTDksp_Rusty", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.91fordLTDksp2_Rusty", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.91fordLTDpd_Rusty", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.91fordLTDranger_Rusty", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.91fordLTDtaxi_Rusty", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.91fordLTDunmarked_Rusty", "low");
DAMN.EnterAnimations:registerVehicleScript("Base.91fordLTDwagon_Rusty", "low");

DAMN.EnterAnimations:registerVehicleScript("Base.90fordF350ambulance_Watermelon", function(seatIndex, player)
	if seatIndex == 0
		then
			return {
				["damnPosition"] = "driver",
				["damnRole"] = "",
			};
		elseif seatIndex == 1
		then
			return {
				["damnPosition"] = "passenger",
				["damnRole"] = "",
			};
		elseif seatIndex == 2
		then
			return {
				["damnPosition"] = "facingRight",
				["damnRole"] = "",
			};
		elseif seatIndex == 4
		then
			return {
				["damnPosition"] = "lying",
				["damnRole"] = "",
			};
		else
			return {
				["damnPosition"] = "facingLeft",
				["damnRole"] = "",
			};
		end
	end);



if not MR2_Skin_Sunroof_Hooked then
	MR2_Skin_Sunroof_Hooked = true
    local oldShowRadial = ISVehicleMenu.showRadialMenu

    ISVehicleMenu.showRadialMenu = function(playerObj)
        if oldShowRadial then oldShowRadial(playerObj) end

        local vehicle = playerObj and playerObj:getVehicle()
        if not vehicle then return end

        local radialMenu = getPlayerRadialMenu(playerObj:getPlayerNum())
		if not radialMenu then return end
        local script = vehicle:getScript():getFullName()

        if script == "Base.87toyotaMR2_Skin" then
            local part = vehicle:getPartById("DAMNSunRoof")
            if part and DAMN.Parts:partIsInstalled(part) then
                local door = part:getDoor()
				if not door then return end
				if door:isOpen() then
					radialMenu:addSlice(getText("IGUI_DAMN_close_sunroof"), getTexture("media/textures/Slice_MR2_roof.png"), function()
						vehicle:playPartAnim(part, "Close")
						door:setOpen(false)
                    end)
                else
                    radialMenu:addSlice(getText("IGUI_DAMN_open_sunroof"), getTexture("media/textures/Slice_MR2_roof.png"), function()
                        vehicle:playPartAnim(part, "Open")
                        door:setOpen(true)
                    end)
                end
            end
        end
    end
end