require "Vehicles/ISUI/91nissan240sx_CarMechanicsOverlay"
require "Vehicles/ISUI/49powerWagonMechanicsOverlay"
require "Vehicles/ISUI/63beetleCarMechanicsOverlay"
require "Vehicles/ISUI/63Type2VanCarMechanicsOverlay"
require "Vehicles/ISUI/67gt500CarMechanicsOverlay"
require "Vehicles/ISUI/69miniCarMechanicsOverlay"
require "Vehicles/ISUI/70barracudaCarMechanicsOverlay"
require "Vehicles/ISUI/70dodgeCarMechanicsOverlay"
require "Vehicles/ISUI/75grandPrixCarMechanicsOverlay"
require "Vehicles/ISUI/80manKat1CarMechanicsOverlay"
require "Vehicles/ISUI/81deloreanDMC12_CarMechanicsOverlay"
require "Vehicles/ISUI/82porsche911CarMechanicsOverlay"
require "Vehicles/ISUI/84mercCarMechanicsOverlay"
require "Vehicles/ISUI/87buickRegalCarMechanicsOverlay"
require "Vehicles/ISUI/87toyotaMR2CarMechanicsOverlay"
require "Vehicles/ISUI/89dodgeCaravanCarMechanicsOverlay"
require "Vehicles/ISUI/89volvo200CarMechanicsOverlay"
require "Vehicles/ISUI/90bmwE30CarMechanicsOverlay"
require "Vehicles/ISUI/90fordF350ambulanceMechOverlay"
require "Vehicles/ISUI/91geoMetroCarMechanicsOverlay"
require "Vehicles/ISUI/92amgeneralM998CarMechanicsOverlay"
require "Vehicles/ISUI/92nissanGTRMechOverlay"
require "Vehicles/ISUI/93chevySuburban_CarMechanicsOverlay"
require "Vehicles/ISUI/93fordF350_CarMechanicsOverlay"
require "Vehicles/ISUI/98stageaCarMechanicsOverlay"
require "Vehicles/ISUI/isoContainerCarMechanicsOverlay"
--require "Vehicles/ISUI/815TatraCarMechanicsOverlay"
require "Vehicles/ISUI/91fordLTDCarMechanicsOverlay"

local x = ISCarMechanicsOverlay.CarList

local skinMap = {
	["Base.91nissan240sx"] = {
		"Base.91nissan240sx_4SIS",
		"Base.91nissan240sx2_4SIS",
	},

	["Base.49powerWagonPA"] = {
		"Base.49powerWagonPA_Skin",
	},
	
	["Base.63beetleBuggy"] = {
		"Base.63beetleBuggy_Skin",
		"Base.63beetleBuggy_Xait",
	},
	
	["Base.63Type2VanApocalypse"] = {
		"Base.63Type2VanApocalypse_Skin",
	},
	
	["Base.67gt500e"] = {
		"Base.67gt500e_Skin",
		"Base.67gt500e_Alkash",
	},
	
	["Base.69miniIJ"] = {
		"Base.69miniIJ_Skin",
	},
	
	["Base.70barracudaAAR"] = {
		"Base.70barracudaAAR_Skin",
		"Base.70barracudaAAR_beast",
		"Base.70barracudaAAR_SOBR",
	},
	
	["Base.70dodgeRT"] = {
		"Base.70dodgeBG_Skin",
		"Base.70dodgePD_Skin",
		"Base.70dodgePD_Alkash",
		"Base.70dodgePD_Goons",
	},
	
	["Base.75grandPrixHurst"] = {
		"Base.75grandPrixHurst_Skin",
	},
	
	["Base.80manKat1"] = {
		"Base.80manKat1_Erm",
		"Base.80manKat1_Square",
		"Base.80manKat1_UnholyFEAR",
	},
	
	["Base.81deloreanDMC12"] = {
		"Base.81deloreanDMC12_Skin",
	},
	
	["Base.82porsche911turbo"] = {
		"Base.82porsche911turbo_Skin",
		"Base.82porsche911rwb_Skin",
	},
	
	["Base.84mercLWB4"] = {
		"Base.84mercLWB4_Skin",
		"Base.84mercLWB4M_Boo",
	},
	
	["Base.87buickRegalTurboTfbi"] = {
		"Base.87buickRegalTurboTfbi_Skin",
		"Base.87buickRegalTurboTfbi_Kakcuk",
		"Base.87buickRegalTurboTfbi_stik",
	},
	
	["Base.87toyotaMR2"] = {
		"Base.87toyotaMR2_Skin",
	},
	
	["Base.89dodgeCaravanNomad"] = {
		"Base.89dodgeCaravanNomad_Skin",
	},
	
	["Base.89volvo245wagon"] = {
		"Base.89volvo245wagon_vstanislav",
	},
	
	["Base.90bmwE30m3"] = {
		"Base.90bmwE30m3_Skin",
		"Base.90bmwE30m3_DTM_TIC",
		"Base.90bmwE30m3_DTM_JAG",
	},
	
	["Base.90fordF350ambulance"] = {
		"Base.90fordF350ambulance_Watermelon",
	},
	
	["Base.91geoMetro"] = {
		"Base.91geoMetro_Skin",
	},
	
	["Base.92amgeneralM998"] = {
		"Base.92amgeneralM998_Skin",
		"Base.92amgeneralM998_Sinod",
		"Base.92amgeneralM998_Dismor",
		"Base.92amgeneralM998_LILITH",
		"Base.92amgeneralM998_Obi",
		"Base.92amgeneralM998_Yanka",
	},
	
	["Base.92nissanGTR"] = {
		"Base.92nissanGTR_Skin",
		"Base.92nissanGTR_Ksora",
		"Base.92nissanGTR_ganksta",
		"Base.92nissanGTR_Pol217",
		"Base.92nissanGTR_RACCOON",
	},
	
	["Base.93chevySuburbanfbi"] = {
		"Base.93chevySuburbanfbi_Skin",
	},
	
	["Base.93fordF350"] = {
		"Base.93fordF350_Skin",
		"Base.93fordF350pd_Sinod",
	},
	
	["Base.98stagea260RS"] = {
		"Base.98stagea260RS_Skin",
		"Base.98stagea260RS_Kamys",
	},
	
	["Base.isoContainer2"] = {
		"Base.isoContainer2_Skin",
		"Base.isoContainer2_UndeadYas",
	},
	
	["Base.91fordLTD"] = {
		"Base.91fordLTD_Rusty",
		"Base.91fordLTDksp_Rusty",
		"Base.91fordLTDksp2_Rusty",
		"Base.91fordLTDpd_Rusty",
		"Base.91fordLTDunmarked_Rusty",
		"Base.91fordLTDranger_Rusty",
		"Base.91fordLTDtaxi_Rusty",
	},
	
	["Base.91fordLTDwagon"] = {
		"Base.91fordLTDwagon_Rusty",
	},
	
	-- ["Base.Tatra8156X6"] = {
		-- "Base.Tatra8156X6FD_Sayderax",
		-- "Base.Tatra8156X6FD_Watermelon",
	-- },
}

for base, aliases in pairs(skinMap) do
	if x[base] then
		for _, alias in ipairs(aliases) do
			x[alias] = x[base]
		end
	end
end