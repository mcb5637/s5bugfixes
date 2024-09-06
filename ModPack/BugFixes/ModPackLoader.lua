ModLoader.BugFixes = {
	Manifest = {
		EntityTypes = {
			"PB_Farm1",
			"PB_Farm2",
			"PB_Farm3",
			"PB_Headquarters1",
			"PB_Headquarters2",
			"PB_Headquarters3",
			"PB_Residence1",
			"PB_Residence2",
			"PB_Residence3",
			"PB_IronMine1",
			"PB_IronMine2",
			"PB_IronMine3",
			"PB_StoneMine1",
			"PB_StoneMine2",
			"PB_StoneMine3",
			"PB_SulfurMine1",
			"PB_SulfurMine2",
			"PB_SulfurMine3",
			"PB_ClayMine1",
			"PB_ClayMine2",
			"PB_ClayMine3",
			"PB_Brickworks1",
			"PB_Brickworks2",
			"PB_Sawmill1",
			"PB_Sawmill2",
			"PB_Blacksmith1",
			"PB_Blacksmith2",
			"PB_Blacksmith3",
			"PB_VillageCenter1",
			"PB_VillageCenter2",
			"PB_VillageCenter3",
			"PB_Market1",
			"PB_Market2",
			"PB_University1",
			"PB_University2",
			"PB_Monastery1",
			"PB_Monastery2",
			"PB_Monastery3",
			"PB_Barracks1",
			"PB_Barracks2",
			"PB_WeatherTower1",
			"PB_PowerPlant1",
			"PB_Archery1",
			"PB_Archery2",
			"PB_Alchemist1",
			"PB_Alchemist2",
			"PB_Bank1",
			"PB_Bank2",
			"PB_StoneMason1",
			"PB_StoneMason2",
			"PB_Foundry1",
			"PB_Foundry2",
			"PB_Stable1",
			"PB_Stable2",
			"PB_Tower1",
			"PB_Tower2",
			"PB_Tower3",
			"PB_DarkTower1",
			"PB_DarkTower2",
			"PB_DarkTower3",
			"PB_Beautification05",
			"PB_Beautification07",
			"CU_BlackKnight_SoldierSword3",
			"CU_BanditLeaderSword1",
			"CU_BanditSoldierSword1",
			"CU_BlackKnight_SoldierMace1",
			"CU_BlackKnight_SoldierMace2",
			"CU_Barbarian_SoldierClub1",
			"PU_BattleSerf",
			"PU_Hero5",
			"PU_SoldierSword1",
			"PU_SoldierSword2",
			"PU_SoldierSword3",
			"PU_SoldierSword4",
			"PU_SoldierPoleArm1",
			"PU_SoldierPoleArm2",
			"PU_SoldierPoleArm3",
			"PU_SoldierPoleArm4",
			"PU_LeaderBow1",
			"PU_LeaderBow2",
			"PU_LeaderBow3",
			"PU_LeaderBow4",
			"PU_SoldierBow1",
			"PU_SoldierBow2",
			"PU_SoldierBow3",
			"PU_SoldierBow4",
			"PU_LeaderCavalry1",
			"PU_LeaderCavalry2",
			"PU_SoldierCavalry1",
			"PU_SoldierCavalry2",
			"PU_SoldierHeavyCavalry1",
			"PU_SoldierHeavyCavalry2",
			"PV_Cannon1",
			"PV_Cannon2",
			"PV_Cannon3",
			"PV_Cannon4",
			"XD_BuildBlockScriptEntity",
			"PU_LeaderRifle1",
			"PU_LeaderRifle2",
			"PU_SoldierRifle1",
			"PU_SoldierRifle2",
			"CU_Evil_SoldierBearman1",
			"CU_Evil_LeaderSkirmisher1",
			"CU_Evil_SoldierSkirmisher1",
			"CU_Evil_Queen",
			"CU_BanditLeaderBow1",
			"CU_BanditSoldierBow1",
			"PU_Thief",
			"PU_Hero10",
			"PB_MasterBuilderWorkshop",
			"PB_Tavern1",
			"PB_Tavern2",
			"PB_GunsmithWorkshop1",
			"PB_GunsmithWorkshop2",
			"CU_Thief",
		},
		TaskLists = {"TL_BATTLE_RIFLE", "TL_BATTLE_BOW", "TL_BATTLE_CROSSBOW", "TL_BATTLE_HEROBOW", "TL_BATTLE_SKIRMISHER"},
		Technologies = {"T_TownGuard", "UP2_Headquarter"},
	},
}

--- gets called on loading your ModPack.
function ModLoader.BugFixes.Init()
	--- remove every entry not already existing (so it can safely be loaded in base)
	ModLoader.BugFixes.ClearInvalidEntries(ModLoader.BugFixes.Manifest.EntityTypes, Entities)
	ModLoader.BugFixes.ClearInvalidEntries(ModLoader.BugFixes.Manifest.TaskLists, TaskLists)
	ModLoader.BugFixes.ClearInvalidEntries(ModLoader.BugFixes.Manifest.Technologies, Technologies)
	--- merge own manifest into the main mods one
	ModLoader.MergeManifest(ModLoader.Manifest, ModLoader.BugFixes.Manifest)

	-- do it here, so any manifest change can override it again
	CppLogic.Logic.SetDamageFactor(DamageClasses.DC_Strike, ArmorClasses.ArmorClassFur, 0.9)
	CppLogic.Logic.SetDamageFactor(DamageClasses.DC_Pierce, ArmorClasses.ArmorClassFur, 0.9)
	CppLogic.Logic.SetDamageFactor(DamageClasses.DC_Chaos, ArmorClasses.ArmorClassFur, 0.7)
	CppLogic.Logic.SetDamageFactor(DamageClasses.DC_Siege, ArmorClasses.ArmorClassFur, 0.2)
	CppLogic.Logic.SetDamageFactor(DamageClasses.DC_Hero, ArmorClasses.ArmorClassFur, 0.8)
	CppLogic.Logic.SetDamageFactor(DamageClasses.DC_Evil, ArmorClasses.ArmorClassFur, 1)
	CppLogic.Logic.SetDamageFactor(DamageClasses.DC_Bullet, ArmorClasses.ArmorClassFur, 1.5)
	CppLogic.ModLoader.SetDamageclassesToReload()
end

---@param mf string[]
---@param list table<string, number>
function ModLoader.BugFixes.ClearInvalidEntries(mf, list)
	for i = table.getn(mf), 1, -1 do
		local e = mf[i]
		if not list[e] then
			table.remove(mf, i)
		end
	end
end
