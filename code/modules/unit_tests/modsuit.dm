/// Checks all pre-equipped MODsuit paths to see if they have something set wrong.
/datum/unit_test/modsuit_checks

/datum/unit_test/modsuit_checks/Run()
	var/list/paths = typesof(/obj/item/mod/control/pre_equipped)

	for(var/modpath in paths)
<<<<<<< HEAD
		var/obj/item/mod/control/mod = new modpath()
=======
		var/obj/item/mod/control/pre_equipped/mod = new modpath()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		TEST_ASSERT(mod.theme, "[modpath] spawned without a theme.")
		TEST_ASSERT(mod.helmet, "[modpath] spawned without a helmet.")
		TEST_ASSERT(mod.chestplate, "[modpath] spawned without a chestplate.")
		TEST_ASSERT(mod.gauntlets, "[modpath] spawned without gauntlets.")
		TEST_ASSERT(mod.boots, "[modpath] spawned without boots.")
		var/list/modules = list()
		var/complexity_max = mod.complexity_max
		var/complexity = 0
<<<<<<< HEAD
		for(var/obj/item/mod/module/module as anything in mod.initial_modules)
			module = new module()
			complexity += module.complexity
			TEST_ASSERT(complexity <= complexity_max, "[modpath] starting modules reach above max complexity.")
			TEST_ASSERT(!is_type_in_list(module, mod.theme.module_blacklist), "[modpath] starting modules are in [mod.theme.type] blacklist.")
=======
		for(var/obj/item/mod/module/module as anything in mod.applied_modules + mod.theme.inbuilt_modules)
			module = new module()
			complexity += module.complexity
			TEST_ASSERT(complexity <= complexity_max, "[modpath] starting modules reach above max complexity.")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			for(var/obj/item/mod/module/module_to_check as anything in modules)
				TEST_ASSERT(!is_type_in_list(module, module_to_check.incompatible_modules), "[modpath] initial module [module.type] is incompatible with initial module [module_to_check.type]")
				TEST_ASSERT(!is_type_in_list(module_to_check, module.incompatible_modules), "[modpath] initial module [module.type] is incompatible with initial module [module_to_check.type]")
			modules += module

