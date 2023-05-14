/obj/item/clothing/gloves/botanic_leather
	name = "botanist's leather gloves"
	desc = "These leather gloves protect against thorns, barbs, prickles, spikes and other harmful objects of floral origin.  They're also quite warm."
	icon_state = "leather"
	inhand_icon_state = null
	greyscale_colors = null
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	clothing_traits = list(TRAIT_PLANT_SAFE)
<<<<<<< HEAD
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 50, FIRE = 70, ACID = 30)
=======
	armor_type = /datum/armor/gloves_botanic_leather

/datum/armor/gloves_botanic_leather
	bio = 50
	fire = 70
	acid = 30
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
