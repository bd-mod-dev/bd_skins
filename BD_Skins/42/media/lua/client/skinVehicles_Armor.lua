require "91nissan240sx_armor"
require "49powerWagon_armor"
require "63beetle_armor"
require "63Type2Van_armor"
require "67gt500_armor"
require "69mini_armor"
require "70barracuda_armor"
require "70dodge_armor"
require "75grandPrix_armor"
require "80manKat1_armor"
require "81deloreanDMC12_armor"
require "82porsche911_armor"
require "84mercW460_armor"
require "87buickRegal_armor"
require "87toyotaMR2_armor"
require "89dodgeCaravan_armor"
require "89volvo200_armor"
require "90bmwE30_armor"
require "90fordF350ambulance_armor"
require "91geoMetro_armor"
require "92amgeneralM998_armor"
require "92nissanGTR_armor"
require "93chevySuburban_armor"
require "93fordF350_armor"
require "98stagea_armor"
require "91fordLTD_armor"

if N240 and N240.activeArmor then
	DAMN.Armor:add("Base.91nissan240sx_4SIS",  N240.activeArmor)
	DAMN.Armor:add("Base.91nissan240sx2_4SIS", N240.activeArmor)
end


if PWR and PWR.activeArmor then
	DAMN.Armor:add("Base.49powerWagonPA_Skin", PWR.activeArmor)
end


if BTL63 and BTL63.activeArmor then
	local function whatever30(player, vehicle)
		BTL63.activeArmor(player, vehicle)
		local part = vehicle:getPartById("EngineDoor")
		if part and part:getCondition() < 30 then
			DAMN.Armor:setPartCondition(part, 30)
		end
	end
	DAMN.Armor:add("Base.63beetleBuggy_Skin", whatever30)
	DAMN.Armor:add("Base.63beetleBuggy_Xait", whatever30)
end


if VAN63 and VAN63.activeArmor then
	DAMN.Armor:add("Base.63Type2VanApocalypse_Skin", VAN63.activeArmor)
end


if GT500 and GT500.activeArmor then
	DAMN.Armor:add("Base.67gt500e_Skin", GT500.activeArmor)
	DAMN.Armor:add("Base.67gt500e_Alkash", GT500.activeArmor)
end


if MINI69 and MINI69.activeArmor then
	DAMN.Armor:add("Base.69miniIJ_Skin", MINI69.activeArmor)
end


if CUDA and CUDA.activeArmor then
	DAMN.Armor:add("Base.70barracudaAAR_Skin", CUDA.activeArmor)
	DAMN.Armor:add("Base.70barracudaAAR_beast", CUDA.activeArmor)
	DAMN.Armor:add("Base.70barracudaAAR_SOBR", CUDA.activeArmor)
end


if DG70 and DG70.activeArmor then
	DAMN.Armor:add("Base.70dodgeBG_Skin", DG70.activeArmor)
	DAMN.Armor:add("Base.70dodgePD_Skin", DG70.activeArmor)
	DAMN.Armor:add("Base.70dodgePD_Alkash", DG70.activeArmor)
	DAMN.Armor:add("Base.70dodgePD_Goons", DG70.activeArmor)
end


if PRX75 and PRX75.activeArmor then
	DAMN.Armor:add("Base.75grandPrixHurst_Skin", PRX75.activeArmor)
end


if MAN80 and MAN80.activeArmor then
	DAMN.Armor:add("Base.80manKat1_Erm", MAN80.activeArmor)
	DAMN.Armor:add("Base.80manKat1_Square", MAN80.activeArmor)
	DAMN.Armor:add("Base.80manKat1_UnholyFEAR", MAN80.activeArmor)
end


if DMC12 and DMC12.activeArmor then
	DAMN.Armor:add("Base.81deloreanDMC12_Skin", DMC12.activeArmor)
end


if PRS82 and PRS82.activeArmor then
	DAMN.Armor:add("Base.82porsche911turbo_Skin", PRS82.activeArmor)
	DAMN.Armor:add("Base.82porsche911rwb_Skin", PRS82.activeArmor)
end


if W460 and W460.activeArmor then
	DAMN.Armor:add("Base.84mercLWB4_Skin", W460.activeArmor)
	DAMN.Armor:add("Base.84mercLWB4M_Boo", W460.activeArmor)
end


if GNX87 and GNX87.activeArmor then
	DAMN.Armor:add("Base.87buickRegalTurboTfbi_Skin", GNX87.activeArmor)
	DAMN.Armor:add("Base.87buickRegalTurboTfbi_Kakcuk", GNX87.activeArmor)
	DAMN.Armor:add("Base.87buickRegalTurboTfbi_stik", GNX87.activeArmor)
end


if MR2 and MR2.activeArmor then
	DAMN.Armor:add("Base.87toyotaMR2_Skin", MR2.activeArmor)
end


if DGC89 and DGC89.activeArmor then
	DAMN.Armor:add("Base.89dodgeCaravanNomad_Skin", DGC89.activeArmor)
end


if VL200 and VL200.activeArmor then
	DAMN.Armor:add("Base.89volvo245wagon_vstanislav", VL200.activeArmor)
end


if BMWE30 and BMWE30.activeArmor then
	DAMN.Armor:add("Base.90bmwE30m3_Skin",    BMWE30.activeArmor)
	DAMN.Armor:add("Base.90bmwE30m3_DTM_TIC", BMWE30.activeArmor)
	DAMN.Armor:add("Base.90bmwE30m3_DTM_JAG", BMWE30.activeArmor)
end


if F350 and F350.activeArmor then
	DAMN.Armor:add("Base.90fordF350ambulance_Watermelon", F350.activeArmor)
end


if GEO91 and GEO91.activeArmor then
	DAMN.Armor:add("Base.91geoMetro_Skin", GEO91.activeArmor)
end


if M998 and M998.activeArmor then
	DAMN.Armor:add("Base.92amgeneralM998_Skin", M998.activeArmor)
	DAMN.Armor:add("Base.92amgeneralM998_Sinod", M998.activeArmor)
	DAMN.Armor:add("Base.92amgeneralM998_Dismor", M998.activeArmor)
	DAMN.Armor:add("Base.92amgeneralM998_LILITH", M998.activeArmor)
end


if R32 and R32.activeArmor then
	DAMN.Armor:add("Base.92nissanGTR_Skin", R32.activeArmor)
	DAMN.Armor:add("Base.92nissanGTR_Ksora", R32.activeArmor)
	DAMN.Armor:add("Base.92nissanGTR_ganksta", R32.activeArmor)
	DAMN.Armor:add("Base.92nissanGTR_Pol217", R32.activeArmor)
	DAMN.Armor:add("Base.92nissanGTR_RACCOON", R32.activeArmor)
end


if SUB93 and SUB93.activeArmor then
	DAMN.Armor:add("Base.93chevySuburbanfbi_Skin", SUB93.activeArmor)
end


if F3502 and F3502.activeArmor then
	DAMN.Armor:add("Base.93fordF350_Skin", F3502.activeArmor)
	DAMN.Armor:add("Base.93fordF350pd_Sinod", F3502.activeArmor)
end


if STAGEA and STAGEA.activeArmor then
	DAMN.Armor:add("Base.98stagea260RS_Skin", STAGEA.activeArmor)
	DAMN.Armor:add("Base.98stagea260RS_Kamys", STAGEA.activeArmor)
end


if LTD91 and LTD91.activeArmor then
	DAMN.Armor:add("Base.91fordLTD_Rusty", LTD91.activeArmor)
	DAMN.Armor:add("Base.91fordLTDksp_Rusty", LTD91.activeArmor)
	DAMN.Armor:add("Base.91fordLTDksp2_Rusty", LTD91.activeArmor)
	DAMN.Armor:add("Base.91fordLTDpd_Rusty", LTD91.activeArmor)
	DAMN.Armor:add("Base.91fordLTDranger_Rusty", LTD91.activeArmor)
	DAMN.Armor:add("Base.91fordLTDtaxi_Rusty", LTD91.activeArmor)
	DAMN.Armor:add("Base.91fordLTDunmarked_Rusty", LTD91.activeArmor)
	DAMN.Armor:add("Base.91fordLTDwagon_Rusty", LTD91.activeArmor)
end