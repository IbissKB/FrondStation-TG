
/obj/item/mod/control/pre_equipped/contractor
	worn_icon = 'modular_skyrat/modules/contractor/icons/worn_modsuit.dmi'
	icon = 'modular_skyrat/modules/contractor/icons/modsuit.dmi'
<<<<<<< HEAD
	theme = /datum/mod_theme/contractor
	applied_cell = /obj/item/stock_parts/cell/hyper
	initial_modules = list(
=======
	icon_state = "contractor-control"
	theme = /datum/mod_theme/contractor
	applied_cell = /obj/item/stock_parts/cell/hyper
	applied_modules = list(
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/tether,
	)
<<<<<<< HEAD

/obj/item/mod/control/pre_equipped/contractor/upgraded
	applied_cell = /obj/item/stock_parts/cell/bluespace
	initial_modules = list(
		/obj/item/mod/module/baton_holster,
=======
	default_pins = list(
		/obj/item/mod/module/armor_booster,
		/obj/item/mod/module/tether,
	)

/obj/item/mod/control/pre_equipped/contractor/upgraded
	applied_cell = /obj/item/stock_parts/cell/bluespace
	applied_modules = list(
		/obj/item/mod/module/baton_holster/preloaded,
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/storage/syndicate,
	)
<<<<<<< HEAD

/obj/item/mod/control/pre_equipped/contractor/upgraded/adminbus
	initial_modules = list(
		/obj/item/mod/module/baton_holster/preloaded,
=======
	default_pins = list(
		/obj/item/mod/module/armor_booster,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/baton_holster,
	)

/obj/item/mod/control/pre_equipped/contractor/upgraded/adminbus
	applied_modules = list(
		/obj/item/mod/module/baton_holster/preloaded/upgraded,
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/jetpack/advanced,
		/obj/item/mod/module/scorpion_hook,
		/obj/item/mod/module/springlock/contractor/no_complexity,
		/obj/item/mod/module/storage/syndicate,
	)
<<<<<<< HEAD
=======
	default_pins = list(
		/obj/item/mod/module/armor_booster,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/baton_holster/preloaded,
		/obj/item/mod/module/scorpion_hook,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

// For the prefs menu
/obj/item/mod/control/pre_equipped/empty/contractor
	theme = /datum/mod_theme/contractor
