/obj/item/clothing/shoes/sandal
	desc = "A pair of rather plain wooden sandals."
	name = "sandals"
	icon_state = "wizard"
	inhand_icon_state = "wizshoe"
<<<<<<< HEAD
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.5)
	strip_delay = 5
	equip_delay_other = 50
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 10, FIRE = 0, ACID = 0)
	can_be_tied = FALSE
	species_exception = list(/datum/species/golem)

=======
	custom_materials = list(/datum/material/wood = SHEET_MATERIAL_AMOUNT * 0.5)
	resistance_flags = FLAMMABLE
	strip_delay = 5
	equip_delay_other = 50
	armor_type = /datum/armor/shoes_sandal
	can_be_tied = FALSE
	species_exception = list(/datum/species/golem)

/datum/armor/shoes_sandal
	bio = 10

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/clothing/shoes/sandal/magic
	name = "magical sandals"
	desc = "A pair of sandals imbued with magic."
	resistance_flags = FIRE_PROOF | ACID_PROOF
