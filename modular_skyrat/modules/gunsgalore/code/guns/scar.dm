/obj/item/gun/ballistic/automatic/scar
	name = "SCAR-L"
	desc = "Part of the SCAR family rifles. This one is SCAR-L, which is for 'Light'. Chambered in .277 Aestus."
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_guns40x32.dmi'
	icon_state = "scar"
	lefthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_righthand.dmi'
	inhand_icon_state = "scar"
	worn_icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_back.dmi'
	worn_icon_state = "scar"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/m16
	can_suppress = FALSE
<<<<<<< HEAD
	burst_size = 3
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	fire_delay = 1.90
	fire_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/scar_fire.ogg'
	fire_sound_volume = 50
	rack_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/scar_cock.ogg'
	load_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/scar_mag_out.ogg'
	load_empty_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/scar_mag_in.ogg'
	eject_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/scar_mag_out.ogg'
	alt_icons = TRUE
<<<<<<< HEAD
=======

/obj/item/gun/ballistic/automatic/scar/Initialize(mapload)
	. = ..()

	AddComponent(/datum/component/automatic_fire, fire_delay)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
