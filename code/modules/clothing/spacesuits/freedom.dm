/obj/item/clothing/head/helmet/space/freedom
	name = "eagle helmet"
	desc = "An advanced, space-proof helmet. It appears to be modeled after an old-world eagle."
	icon = 'icons/obj/clothing/head/costume.dmi'
	worn_icon = 'icons/mob/clothing/head/costume.dmi'
	icon_state = "griffinhat"
	inhand_icon_state = null
<<<<<<< HEAD
	armor = list(MELEE = 20, BULLET = 40, LASER = 30, ENERGY = 40, BOMB = 100, BIO = 100, FIRE = 80, ACID = 80)
=======
	armor_type = /datum/armor/space_freedom
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	strip_delay = 130
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = ACID_PROOF | FIRE_PROOF

<<<<<<< HEAD
=======
/datum/armor/space_freedom
	melee = 20
	bullet = 40
	laser = 30
	energy = 40
	bomb = 100
	bio = 100
	fire = 80
	acid = 80

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/clothing/suit/space/freedom
	name = "eagle suit"
	desc = "An advanced, light suit, fabricated from a mixture of synthetic feathers and space-resistant material. A gun holster appears to be integrated into the suit and the wings appear to be stuck in 'freedom' mode."
	icon_state = "freedom"
	inhand_icon_state = null
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
<<<<<<< HEAD
	armor = list(MELEE = 20, BULLET = 40, LASER = 30,ENERGY = 40, BOMB = 100, BIO = 100, FIRE = 80, ACID = 80)
=======
	armor_type = /datum/armor/space_freedom
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	strip_delay = 130
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = ACID_PROOF | FIRE_PROOF
	slowdown = 0
