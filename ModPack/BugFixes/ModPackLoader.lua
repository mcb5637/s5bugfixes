ModLoader.BugFixes = {
	Manifest = {
		EntityTypes = {
			"PU_SoldierCavalry1", "PU_SoldierSword2", "PU_SoldierPoleArm2", "PU_SoldierRifle1", "PU_SoldierBow2", "PU_SoldierRifle2", "CU_BanditSoldierSword1",
			"CU_BlackKnight_SoldierMace1", "CU_Barbarian_SoldierClub1", "CU_Evil_SoldierBearman1", "PU_SoldierPoleArm3", "PU_SoldierBow3",
			"CU_Evil_SoldierSkirmisher1", "PU_SoldierHeavyCavalry1", "PU_SoldierSword4", "PU_SoldierPoleArm4", "PU_SoldierCavalry2", "PU_SoldierBow4",
			"CU_BlackKnight_SoldierSword3", "PU_SoldierHeavyCavalry2", "PU_SoldierSword1", "CU_BanditSoldierBow1", "PU_SoldierPoleArm1", "PU_SoldierSword3",
			"PU_SoldierBow1", "CU_BlackKnight_SoldierMace2", "CU_BanditLeaderBow1", "CU_BanditSoldierBow1", "CU_Evil_LeaderSkirmisher1",
			"CU_Evil_SoldierSkirmisher1", "PU_Hero5", "PU_Hero10", "PU_LeaderBow1", "PU_LeaderBow2", "PU_LeaderBow3", "PU_LeaderBow4", "PU_SoldierBow1",
			"PU_SoldierBow2", "PU_SoldierBow3", "PU_SoldierBow4", "PU_LeaderCavalry1", "PU_LeaderCavalry2", "PU_SoldierCavalry1", "PU_SoldierCavalry2",
			"PU_LeaderRifle1", "PU_LeaderRifle2", "PU_SoldierRifle1", "PU_SoldierRifle2", "PV_Cannon3", "PV_Cannon1", "PV_Cannon2", "PV_Cannon4",
			"XD_BuildBlockScriptEntity"
		},
		TaskLists = {"TL_BATTLE_RIFLE", "TL_BATTLE_BOW", "TL_BATTLE_CROSSBOW", "TL_BATTLE_HEROBOW", "TL_BATTLE_SKIRMISHER"}
	}
}

--- gets called on loading your ModPack.
function ModLoader.BugFixes.Init()
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
