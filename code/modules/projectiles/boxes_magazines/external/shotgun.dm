/obj/item/ammo_box/magazine/m12g
	name = "shotgun magazine (12g buckshot slugs)"
	desc = "A drum magazine."
	icon_state = "m12gb"
	base_icon_state = "m12gb"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = CALIBER_SHOTGUN
	max_ammo = 8

/obj/item/ammo_box/magazine/m12g/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[CEILING(ammo_count(FALSE)/8, 1)*8]"

/obj/item/ammo_box/magazine/m12g/stun
	name = "shotgun magazine (12g taser slugs)"
<<<<<<< HEAD
	icon_state = "m12gs"
=======
	base_icon_state = "m12gs"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ammo_type = /obj/item/ammo_casing/shotgun/stunslug

/obj/item/ammo_box/magazine/m12g/slug
	name = "shotgun magazine (12g slugs)"
<<<<<<< HEAD
	icon_state = "m12gb"    //this may need an unique sprite
=======
	base_icon_state = "m12gsl"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ammo_type = /obj/item/ammo_casing/shotgun

/obj/item/ammo_box/magazine/m12g/dragon
	name = "shotgun magazine (12g dragon's breath)"
<<<<<<< HEAD
	icon_state = "m12gf"
=======
	base_icon_state = "m12gf"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ammo_type = /obj/item/ammo_casing/shotgun/dragonsbreath

/obj/item/ammo_box/magazine/m12g/bioterror
	name = "shotgun magazine (12g bioterror)"
<<<<<<< HEAD
	icon_state = "m12gt"
=======
	base_icon_state = "m12gt"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ammo_type = /obj/item/ammo_casing/shotgun/dart/bioterror

/obj/item/ammo_box/magazine/m12g/meteor
	name = "shotgun magazine (12g meteor slugs)"
<<<<<<< HEAD
	icon_state = "m12gbc"
=======
	base_icon_state = "m12gbc"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ammo_type = /obj/item/ammo_casing/shotgun/meteorslug
