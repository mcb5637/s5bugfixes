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

	ModBugfixes.InitUI()

	ModBugfixes.GUIUpdate_GroupStrength = GUIUpdate_GroupStrength
	GUIUpdate_GroupStrength = ModBugfixes.GUIUpdate_GroupStrengthOverride
	ModBugfixes.GameCallback_GUI_SelectionChanged = GameCallback_GUI_SelectionChanged
	GameCallback_GUI_SelectionChanged = ModBugfixes.GameCallback_GUI_SelectionChangedOverride
	ModBugfixes.GUIUpdate_SettlersInBuilding = GUIUpdate_SettlersInBuilding
	GUIUpdate_SettlersInBuilding = ModBugfixes.GUIUpdate_SettlersInBuildingOverride
	ModBugfixes.GameCallback_SettlerKilled = GameCallback_SettlerKilled
	GameCallback_SettlerKilled = ModBugfixes.GameCallback_SettlerKilledOverride

	-- Erec (dadurch statt dadruch)
	CppLogic.Logic.SetStringTableText("command_auraofwar", "@color:180,180,180,255 Aura der Stärke @cr @color:255,255,255,255 Erec ruft seine Männer zur Disziplin auf. Sie schlagen dadurch härter zu.")
	-- Meisterschütze (Schützen laufen jetzt schneller)
	CppLogic.Logic.SetStringTableText("BetterTrainingArchery_disabled", "@color:180,180,180,255 Meisterschütze @cr @color:255,255,255,255 @color:255,204,51,255 benötigt: @color:255,255,255,255 Schießanlage @cr @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Schützen und Scharfschützen laufen schneller.")
	CppLogic.Logic.SetStringTableText("BetterTrainingArchery_normal", "@color:180,180,180,255 Meisterschütze @cr @color:255,255,255,255 @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Schützen und Scharfschützen laufen schneller.")
	CppLogic.Logic.SetStringTableText("BetterTrainingArchery_researched", "@color:180,180,180,255 Meisterschütze @cr @color:255,255,255,255 Eure Schützen und Scharfschützen sind nun meisterhafte Läufer!")
	-- Stehendes Heer (Schaltet keine Formation mehr frei)
	CppLogic.Logic.SetStringTableText("StandingArmy_disabled", "@color:180,180,180,255 Stehendes Heer  @cr @color:255,204,51,255 benötigt: @color:255,255,255,255 Wehrpflicht, Festung @cr @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Schießplatz, Dario Statue")
	CppLogic.Logic.SetStringTableText("StandingArmy_normal", "@color:180,180,180,255 Stehendes Heer  @cr @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Schießplatz, Dario Statue")
	CppLogic.Logic.SetStringTableText("StandingArmy_researched", "@color:180,180,180,255 Stehendes Heer  @cr @color:255,255,255,255 Nun könnt Ihr Schießplätze bauen und dort Schützen rekrutieren.")
	-- Taktiken (Schaltet Formationen frei)
	CppLogic.Logic.SetStringTableText("Tactics_disabled", "@color:180,180,180,255 Taktiken  @cr @color:255,204,51,255 benötigt: @color:255,255,255,255 Stehendes Heer, Universität @cr @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Stall, taktische Karte, Obelisk, Kampfformationen")
	CppLogic.Logic.SetStringTableText("Tactics_normal", "@color:180,180,180,255 Taktiken  @cr @color:255,204,51,255 ermöglicht: @color:255,255,255,255 Stall, taktische Karte, Obelisk, Kampfformationen")
	CppLogic.Logic.SetStringTableText("Tactics_researched", "@color:180,180,180,255 Taktiken  @cr @color:255,255,255,255 Nun könnt Ihr Ställe für berittenen Einheiten bauen. Benutzt auch die taktische Karte und neue Formationen um in der Schlacht erfolgreich zu sein.")

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
	if Logic.IsBuilding(e) == 1 and Logic.IsConstructionComplete(e) == 1 and Logic.GetUpgradeCategoryByBuildingType(Logic.GetEntityType(e))
					== UpgradeCategories.Tavern then
		XGUIEng.ShowWidget(gvGUI_WidgetID.BuildingTabs, 1)
		XGUIEng.UnHighLightGroup(gvGUI_WidgetID.InGame, "BuildingMenuGroup")
		XGUIEng.HighLightButton(gvGUI_WidgetID.ToBuildingSettlersMenu, 1)

		XGUIEng.ShowWidget(gvGUI_WidgetID.ActivateOvertimes, 0)
		XGUIEng.ShowWidget(gvGUI_WidgetID.QuitOvertimes, 0)
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

CppLogic.API.EnableScriptTriggerEval(true)
Trigger.RequestTrigger(Events.CPPLOGIC_EVENT_ON_MAP_STARTED, nil, "ModBugfixes.Init", 1)
Trigger.RequestTrigger(Events.CPPLOGIC_EVENT_ON_SAVEGAME_LOADED, nil, "ModBugfixes.InitUI", 1)
