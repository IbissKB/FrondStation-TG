/obj/item/ammo_box/magazine/m10mm
	name = "pistol magazine (10mm)"
	desc = "A gun magazine."
<<<<<<< HEAD
	icon_state = "9x19p-8"
=======
	icon_state = "9x19p"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	base_icon_state = "9x19p"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = CALIBER_10MM
	max_ammo = 8
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/m10mm/fire
	name = "pistol magazine (10mm incendiary)"
<<<<<<< HEAD
	icon_state = "9x19pI-8"
	base_icon_state = "9x19pI"
	desc = "A gun magazine. Loaded with rounds which ignite the target."
=======
	icon_state = "9x19pI"
	base_icon_state = "9x19pI"
	desc = "A 10mm pistol magazine. Loaded with rounds which ignite the target."
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ammo_type = /obj/item/ammo_casing/c10mm/fire

/obj/item/ammo_box/magazine/m10mm/hp
	name = "pistol magazine (10mm HP)"
<<<<<<< HEAD
	icon_state = "9x19pH-8"
	base_icon_state = "9x19pH"
	desc= "A gun magazine. Loaded with hollow-point rounds, extremely effective against unarmored targets, but nearly useless against protective clothing."
=======
	icon_state = "9x19pH"
	base_icon_state = "9x19pH"
	desc= "A 10mm pistol magazine. Loaded with hollow-point rounds, extremely effective against unarmored targets, but nearly useless against protective clothing."
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ammo_type = /obj/item/ammo_casing/c10mm/hp

/obj/item/ammo_box/magazine/m10mm/ap
	name = "pistol magazine (10mm AP)"
<<<<<<< HEAD
	icon_state = "9x19pA-8"
	base_icon_state = "9x19pA"
	desc= "A gun magazine. Loaded with rounds which penetrate armour, but are less effective against normal targets."
=======
	icon_state = "9x19pA"
	base_icon_state = "9x19pA"
	desc= "A 10mm pistol magazine. Loaded with rounds which penetrate armour, but are less effective against normal targets."
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ammo_type = /obj/item/ammo_casing/c10mm/ap

/obj/item/ammo_box/magazine/m45
	name = "handgun magazine (.45)"
	icon_state = "45-8"
	base_icon_state = "45"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = CALIBER_45
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/m9mm
<<<<<<< HEAD
//	name = "pistol magazine (9mm)"			// SKYRAT EDIT: Original
	name = "pistol magazine (9x25mm)"		// SKYRAT EDIT: Calibre rename
	icon_state = "9x19p-8"
=======
	name = "pistol magazine (9mm)"
	icon_state = "9x19p"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	base_icon_state = "9x19p"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 8
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/m9mm/fire
<<<<<<< HEAD
	//name = "pistol magazine (9mm incendiary)" // SKYRAT EDIT: Original
	name = "pistol magazine (9x25mm incendiary)" // SKYRAT EDIT: Calibre rename
	icon_state = "9x19pI-8"
=======
	name = "pistol magazine (9mm incendiary)"
	icon_state = "9x19pI"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	base_icon_state = "9x19pI"
	desc = "A gun magazine. Loaded with rounds which ignite the target."
	ammo_type = /obj/item/ammo_casing/c9mm/fire

/obj/item/ammo_box/magazine/m9mm/hp
<<<<<<< HEAD
	//name = "pistol magazine (9mm HP)" // SKYRAT EDIT: Original
	name = "pistol magazine (9x25mm HP)" // SKYRAT EDIT: Calibre rename
	icon_state = "9x19pH-8"
=======
	name = "pistol magazine (9mm HP)"
	icon_state = "9x19pH"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	base_icon_state = "9x19pH"
	desc= "A gun magazine. Loaded with hollow-point rounds, extremely effective against unarmored targets, but nearly useless against protective clothing."
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/magazine/m9mm/ap
<<<<<<< HEAD
	//name = "pistol magazine (9mm AP)" // SKYRAT EDIT: Original
	name = "pistol magazine (9x25mm AP)" // SKYRAT EDIT: Calibre rename
	icon_state = "9x19pA-8"
=======
	name = "pistol magazine (9mm AP)"
	icon_state = "9x19pA"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	base_icon_state = "9x19pA"
	desc= "A gun magazine. Loaded with rounds which penetrate armour, but are less effective against normal targets."
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/magazine/m9mm_aps
<<<<<<< HEAD
//	name = "stechkin pistol magazine (9mm)"		// SKYRAT EDIT: Original
	name = "stechkin pistol magazine (9x25mm)"	// SKYRAT EDIT: Calibre rename
=======
	name = "stechkin pistol magazine (9mm)"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon_state = "9mmaps-15"
	base_icon_state = "9mmaps"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 15

/obj/item/ammo_box/magazine/m9mm_aps/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[round(ammo_count(), 5)]"

/obj/item/ammo_box/magazine/m9mm_aps/fire
<<<<<<< HEAD
//	name = "stechkin pistol magazine (9mm incendiary)"		// SKYRAT EDIT: Original
	name = "stechkin pistol magazine (9x25mm incendiary)"	// SKYRAT EDIT: Calibre rename
=======
	name = "stechkin pistol magazine (9mm incendiary)"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ammo_type = /obj/item/ammo_casing/c9mm/fire
	max_ammo = 15

/obj/item/ammo_box/magazine/m9mm_aps/hp
<<<<<<< HEAD
//	name = "stechkin pistol magazine (9mm HP)"		// SKYRAT EDIT: Original
	name = "stechkin pistol magazine (9x25mm HP)"	// SKYRAT EDIT: Calibre rename
=======
	name = "stechkin pistol magazine (9mm HP)"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ammo_type = /obj/item/ammo_casing/c9mm/hp
	max_ammo = 15

/obj/item/ammo_box/magazine/m9mm_aps/ap
<<<<<<< HEAD
//	name = "stechkin pistol magazine (9mm AP)"		// SKYRAT EDIT: Original
	name = "stechkin pistol magazine (9x25mm AP)"	// SKYRAT EDIT: Calibre rename
=======
	name = "stechkin pistol magazine (9mm AP)"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ammo_type = /obj/item/ammo_casing/c9mm/ap
	max_ammo = 15

/obj/item/ammo_box/magazine/m50
	name = "handgun magazine (.50ae)"
	icon_state = "50ae"
	ammo_type = /obj/item/ammo_casing/a50ae
	caliber = CALIBER_50
	max_ammo = 7
	multiple_sprites = AMMO_BOX_PER_BULLET
<<<<<<< HEAD
=======

/obj/item/ammo_box/magazine/r10mm
	name = "regal condor magazine (10mm)"
	icon_state = "r10mm-8"
	base_icon_state = "r10mm"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = CALIBER_10MM
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/r10mm/empty
	icon_state = "r10mm-0"
	start_empty = TRUE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
