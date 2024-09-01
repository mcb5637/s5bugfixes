
function ModBugfixes_Init()
	CppLogic.Entity.Settler.EnableConversionHook()
	CppLogic.Logic.SetPaydayCallback()
	CppLogic.Combat.EnableAoEProjectileFix() -- aoe projektile beachten damage/armorclass und schadensboni durch techs/helden
	CppLogic.Logic.EnableAllHurtEntityTrigger(true) -- hurtentity trigger auch ausführen, wenn der angreifer tot ist
	CppLogic.Combat.EnableCamoFix() -- camo wird nicht beendet, wenn projektile treffen
	CppLogic.Logic.EnableExperienceClassFix(true) -- level 1 gibt boni, misschance boni funktionieren
	CppLogic.Logic.EnableBuildOnMovementFix(true) -- auf siedlern bauen bricht bewegung nicht mehr ab
	CppLogic.Effect.EnableEffectTriggers(true) -- effect created
	CppLogic.Logic.EnableResourceTriggers(true, false)
	CppLogic.Logic.EnableSettlerBuyTriggers()
	CppLogic.Logic.SetLeadersRegenerateTroopHealth(true) -- truppen hp regenerieren
	CppLogic.Entity.Settler.EnableRangedEffectSoldierHeal(true) -- truppen hp von salim geheilt
	CppLogic.Logic.FixSnipeDamage(nil)
	CppLogic.Logic.TaskListSetChangeTaskListCheckUncancelable(true)
end

Trigger.RequestTrigger(Events.CPPLOGIC_EVENT_ON_MAP_STARTED, nil, "ModBugfixes_Init", 1)
