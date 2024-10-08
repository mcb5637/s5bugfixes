ModBugfixes = {}
function ModBugfixes.Init()
	CppLogic.Entity.Settler.EnableConversionHook()
	CppLogic.Logic.SetPaydayCallback()
	CppLogic.Combat.EnableAoEProjectileFix()
	CppLogic.Logic.EnableAllHurtEntityTrigger(true)
	CppLogic.Combat.EnableCamoFix()
	CppLogic.Logic.EnableExperienceClassFix(true)
	CppLogic.Logic.EnableBuildOnMovementFix(true)
	CppLogic.Effect.EnableEffectTriggers(true)
	CppLogic.Logic.EnableResourceTriggers(true, false)
	CppLogic.Logic.EnableSettlerBuyTriggers()
	CppLogic.Logic.SetLeadersRegenerateTroopHealth(true)
	CppLogic.Entity.Settler.EnableRangedEffectSoldierHeal(true)
	CppLogic.Logic.FixSnipeDamage(nil)
	CppLogic.Logic.TaskListSetChangeTaskListCheckUncancelable(true)
	CppLogic.Logic.EnableCannonInProgressAttraction(true)
	CppLogic.Effect.EnableLightningFix(true)

	ModBugfixes.InitUI()

	ModBugfixes.GUIUpdate_GroupStrength = GUIUpdate_GroupStrength
	GUIUpdate_GroupStrength = ModBugfixes.GUIUpdate_GroupStrengthOverride
	ModBugfixes.GameCallback_GUI_SelectionChanged = GameCallback_GUI_SelectionChanged
	GameCallback_GUI_SelectionChanged = ModBugfixes.GameCallback_GUI_SelectionChangedOverride
	ModBugfixes.GUIUpdate_SettlersInBuilding = GUIUpdate_SettlersInBuilding
	GUIUpdate_SettlersInBuilding = ModBugfixes.GUIUpdate_SettlersInBuildingOverride
	ModBugfixes.GameCallback_SettlerKilled = GameCallback_SettlerKilled
	GameCallback_SettlerKilled = ModBugfixes.GameCallback_SettlerKilledOverride
	ModBugfixes.GUIUpdate_Damage = GUIUpdate_Damage
	GUIUpdate_Damage = ModBugfixes.GUIUpdate_DamageOverride
	ModBugfixes.GUIUpdate_SelectionGeneric = GUIUpdate_SelectionGeneric
	GUIUpdate_SelectionGeneric = ModBugfixes.GUIUpdate_SelectionGenericOverride

	local f = ModBugfixes.STT[XNetworkUbiCom.Tool_GetCurrentLanguageShortName()]
	if f then
		f()
	end

	return true
end

function ModBugfixes.InitUI()
	XGUIEng.SetWidgetPosition("Command_Attack", 76, 4)

	CppLogic.UI.WidgetMaterialSetTextureCoordinates("OvertimesButtonEnable", 0, 0, 0.25, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("OvertimesButtonEnable", 0, "data\\graphics\\textures\\gui\\b_generic_building.png")
	XGUIEng.SetMaterialColor("OvertimesButtonEnable", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("OvertimesButtonEnable", 1, 0.25, 0.25, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("OvertimesButtonEnable", 1, "data\\graphics\\textures\\gui\\b_generic_building.png")
	XGUIEng.SetMaterialColor("OvertimesButtonEnable", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("OvertimesButtonEnable", 2, 0.25, 0.25, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("OvertimesButtonEnable", 2, "data\\graphics\\textures\\gui\\b_generic_building.png")
	XGUIEng.SetMaterialColor("OvertimesButtonEnable", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("OvertimesButtonEnable", 3, 0, 0.25, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("OvertimesButtonEnable", 3, "data\\graphics\\textures\\gui\\b_generic_building.png")
	XGUIEng.SetMaterialColor("OvertimesButtonEnable", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("OvertimesButtonEnable", 4, 0.75, 0.25, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("OvertimesButtonEnable", 4, "data\\graphics\\textures\\gui\\b_generic_building.png")
	XGUIEng.SetMaterialColor("OvertimesButtonEnable", 4, 255, 255, 255, 255)

	CppLogic.UI.WidgetMaterialSetTextureCoordinates("OvertimesButtonDisable", 0, 0, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("OvertimesButtonDisable", 0, "data\\graphics\\textures\\gui\\b_generic_building.png")
	XGUIEng.SetMaterialColor("OvertimesButtonDisable", 0, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("OvertimesButtonDisable", 1, 0.25, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("OvertimesButtonDisable", 1, "data\\graphics\\textures\\gui\\b_generic_building.png")
	XGUIEng.SetMaterialColor("OvertimesButtonDisable", 1, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("OvertimesButtonDisable", 2, 0.25, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("OvertimesButtonDisable", 2, "data\\graphics\\textures\\gui\\b_generic_building.png")
	XGUIEng.SetMaterialColor("OvertimesButtonDisable", 2, 255, 255, 255, 255)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("OvertimesButtonDisable", 3, 0, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("OvertimesButtonDisable", 3, "data\\graphics\\textures\\gui\\b_generic_building.png")
	XGUIEng.SetMaterialColor("OvertimesButtonDisable", 3, 128, 128, 128, 128)
	CppLogic.UI.WidgetMaterialSetTextureCoordinates("OvertimesButtonDisable", 4, 0.75, 0.375, 0.25, 0.125)
	XGUIEng.SetMaterialTexture("OvertimesButtonDisable", 4, "data\\graphics\\textures\\gui\\b_generic_building.png")
	XGUIEng.SetMaterialColor("OvertimesButtonDisable", 4, 255, 255, 255, 255)

	CppLogic.UI.WidgetOverrideUpdateFunc("Thief_RechargePlaceExplosives", function() ModBugfixes.GUIUpdate_HeroAbilityEx(Abilities.AbilityPlaceKeg, "Thief_PlaceExplosives", Technologies.T_ThiefSabotage) end)
	CppLogic.UI.WidgetOverrideUpdateFunc("Thief_PlaceExplosives", function() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Thief_PlaceExplosives", true)

	CppLogic.UI.WidgetOverrideUpdateFunc("Scout_RechargeTorches", function() ModBugfixes.GUIUpdate_HeroAbilityEx(Abilities.AbilityScoutTorches, "Scout_Torches", Technologies.T_ScoutTorches) end)
	CppLogic.UI.WidgetOverrideUpdateFunc("Scout_Torches", function() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Scout_Torches", true)

	CppLogic.UI.WidgetOverrideUpdateFunc("Scout_RechargeFindResources", function() ModBugfixes.GUIUpdate_HeroAbilityEx(Abilities.AbilityScoutFindResources, "Scout_FindResources", Technologies.T_ScoutFindResources) end)
	CppLogic.UI.WidgetOverrideUpdateFunc("Scout_FindResources", function() end)
	CppLogic.UI.WidgetSetUpdateManualFlag("Scout_FindResources", true)
end

function ModBugfixes.GUIUpdate_GroupStrengthOverride()
	ModBugfixes.GUIUpdate_GroupStrength()
	local l = GUI.GetSelectedEntity()
	if l == nil then
		return
	end
	local a = Logic.LeaderGetNumberOfSoldiers(l)
	if a > 0 then
		return
	end
	for _, wid in ipairs(gvGUI_WidgetID.DetailsGroupStrengthSoldiers) do
		XGUIEng.DisableButton(wid, 1)
	end
end

function ModBugfixes.GameCallback_GUI_SelectionChangedOverride()
	ModBugfixes.GameCallback_GUI_SelectionChanged()

	local e = GUI.GetSelectedEntity()
	if not e then
		return
	end
	if Logic.IsBuilding(e) == 1 and Logic.IsConstructionComplete(e) == 1 then
		local ucat = Logic.GetUpgradeCategoryByBuildingType(Logic.GetEntityType(e))

		if ucat == UpgradeCategories.Tavern then
			XGUIEng.ShowWidget(gvGUI_WidgetID.BuildingTabs, 1)
			XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingMenuGroup")
			XGUIEng.HighLightButton(gvGUI_WidgetID.ToBuildingSettlersMenu, 1)

			XGUIEng.ShowWidget(gvGUI_WidgetID.ActivateOvertimes, 0)
			XGUIEng.ShowWidget(gvGUI_WidgetID.QuitOvertimes, 0)
		end
	elseif Logic.IsLeader(e) == 1 and Logic.GetEntityType(e) ~= Entities.PU_BattleSerf then
		XGUIEng.ShowWidget("Commands_Leader", 1)
	end
end

function ModBugfixes.GUIUpdate_SettlersInBuildingOverride()
	ModBugfixes.GUIUpdate_SettlersInBuilding()
	local e = GUI.GetSelectedEntity()
	if e == nil then
		return
	end
	if Logic.IsBuilding(e) ~= 1 then
		return
	end

	local ty = Logic.GetEntityType(e)
	local ucat = Logic.GetUpgradeCategoryByBuildingType(ty)

	if ucat ~= UpgradeCategories.Tavern then
		return
	end

	local tab = {}
	local max = 0

	tab = {Logic.GetAttachedEaterToBuilding(e)}
	max = Logic.GetMaxNumberOfEaters(e)

	XGUIEng.ShowAllSubWidgets(gvGUI_WidgetID.WorkerButtonContainer, 0)
	for i = 1, max, 1 do
		local ButtonName = "WorkerContainer" .. i
		XGUIEng.ShowWidget(ButtonName, 1)
		XGUIEng.SetBaseWidgetUserVariable(ButtonName, 0, tab[i + 1])
	end
end

function ModBugfixes.GameCallback_SettlerKilledOverride(attackerpl, targetpl, attackerid, ...)
	-- setting LocalMusic.LastBattleMusicStarted effectively disables original
	if attackerpl ~= targetpl and GUI.GetPlayerID() == targetpl then
		if LocalMusic.LastBattleMusicStarted < Logic.GetTime() then
			if Logic.IsEntityInCategory(attackerid, EntityCategories.EvilLeader) == 1 then
				LocalMusic.BattlesOnTheMap = 2
			else
				LocalMusic.BattlesOnTheMap = 1
			end
			LocalMusic.LastBattleMusicStarted = Logic.GetTime() + 127
			LocalMusic.SongLength = 0
		end
	end

	---@diagnostic disable-next-line: deprecated
	ModBugfixes.GameCallback_SettlerKilled(attackerpl, targetpl, attackerid, unpack(arg))
end

function ModBugfixes.GUIUpdate_HeroAbilityEx(ab, b, tech)
	local pb = XGUIEng.GetCurrentWidgetID()
	local e = GUI.GetSelectedEntity()
	if Logic.IsHero(e) == 1 then
		e = HeroSelection_GetCurrentSelectedHeroID()
	end
	local max = Logic.HeroGetAbilityRechargeTime(e, ab)
	local cur = Logic.HeroGetAbiltityChargeSeconds(e, ab)
	local disa = 0
	if cur >= max then
		XGUIEng.SetMaterialColor(pb, 1, 0, 0, 0, 0)
	else
		XGUIEng.SetMaterialColor(pb, 1, 214, 44, 24, 189)
		disa = 1
	end
	XGUIEng.SetProgressBarValues(pb, cur, max)

	local t = Logic.GetTechnologyState(GUI.GetPlayerID(), tech)
	if t == 0 or t == 1 or t == 2 or t == 5 or t == 3 then
		disa = 1
	end
	XGUIEng.DisableButton(b, disa)
end

function ModBugfixes.GUIUpdate_DamageOverride()
	ModBugfixes.GUIUpdate_Damage()
	local e = GUI.GetSelectedEntity()
	local top = Logic.GetFoundationTop(e)
	if IsValid(top) then
		local d = Logic.GetEntityDamage(top)
		if not d then
			d = 0
		end
		XGUIEng.SetTextByValue( XGUIEng.GetCurrentWidgetID(), d, 1)
	end
end
function ModBugfixes.GUIUpdate_SelectionGenericOverride()
	ModBugfixes.GUIUpdate_SelectionGeneric()
	local e = GUI.GetSelectedEntity()
	local top = Logic.GetFoundationTop(e)
	if IsValid(top) then
		XGUIEng.ShowWidget("DetailsDamage", 1)
	end
end

ModBugfixes.STT = {}
function ModBugfixes.STT.de()
	-- Erec (dadurch statt dadruch)
	CppLogic.Logic.SetStringTableText("MenuHero4/command_auraofwar", "@color:180,180,180,255 Aura der Stärke @cr @color:255,255,255,255 Erec ruft seine Männer zur Disziplin auf. Sie schlagen dadurch härter zu.")
	-- Meisterschütze (Schützen laufen jetzt schneller)
	CppLogic.Logic.SetStringTableText("MenuArchery/BetterTrainingArchery_disabled", "@color:180,180,180,255 Meisterschütze @cr @color:255,255,255,255 @color:255,204,51,255 benötigt: @color:255,255,255,255 Schießanlage @cr @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Schützen und Scharfschützen laufen schneller.")
	CppLogic.Logic.SetStringTableText("MenuArchery/BetterTrainingArchery_normal", "@color:180,180,180,255 Meisterschütze @cr @color:255,255,255,255 @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Schützen und Scharfschützen laufen schneller.")
	CppLogic.Logic.SetStringTableText("MenuArchery/BetterTrainingArchery_researched", "@color:180,180,180,255 Meisterschütze @cr @color:255,255,255,255 Eure Schützen und Scharfschützen sind nun meisterhafte Läufer!")
	-- Stehendes Heer (Schaltet keine Formation mehr frei)
	CppLogic.Logic.SetStringTableText("MenuUniversity/StandingArmy_disabled", "@color:180,180,180,255 Stehendes Heer  @cr @color:255,204,51,255 benötigt: @color:255,255,255,255 Wehrpflicht, Festung @cr @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Schießplatz, Dario Statue")
	CppLogic.Logic.SetStringTableText("MenuUniversity/StandingArmy_normal", "@color:180,180,180,255 Stehendes Heer  @cr @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Schießplatz, Dario Statue")
	CppLogic.Logic.SetStringTableText("MenuUniversity/StandingArmy_researched", "@color:180,180,180,255 Stehendes Heer  @cr @color:255,255,255,255 Nun könnt Ihr Schießplätze bauen und dort Schützen rekrutieren.")
	-- Taktiken (Schaltet Formationen frei)
	CppLogic.Logic.SetStringTableText("MenuUniversity/Tactics_disabled", "@color:180,180,180,255 Taktiken  @cr @color:255,204,51,255 benötigt: @color:255,255,255,255 Stehendes Heer, Universität @cr @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Stall, taktische Karte, Obelisk, Kampfformationen")
	CppLogic.Logic.SetStringTableText("MenuUniversity/Tactics_normal", "@color:180,180,180,255 Taktiken  @cr @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Stall, taktische Karte, Obelisk, Kampfformationen")
	CppLogic.Logic.SetStringTableText("MenuUniversity/Tactics_researched", "@color:180,180,180,255 Taktiken  @cr @color:255,255,255,255 Nun könnt Ihr Ställe für berittenen Einheiten bauen. Benutzt auch die taktische Karte und neue Formationen um in der Schlacht erfolgreich zu sein.")
	-- büchsenmacherERei
	CppLogic.Logic.SetStringTableText("names/PB_GunsmithWorkshop1", "Büchsen @bs macherei")
end

CppLogic.API.EnableScriptTriggerEval(true)
Trigger.RequestTrigger(Events.CPPLOGIC_EVENT_ON_MAP_STARTED, nil, "ModBugfixes.Init", 1)
Trigger.RequestTrigger(Events.CPPLOGIC_EVENT_ON_SAVEGAME_LOADED, nil, "ModBugfixes.InitUI", 1)
