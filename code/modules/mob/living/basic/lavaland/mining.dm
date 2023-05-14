///prototype for mining mobs
/mob/living/basic/mining

	combat_mode = TRUE
<<<<<<< HEAD
	faction = list("mining")
=======
	faction = list(FACTION_MINING)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0
	maximum_survivable_temperature = INFINITY

/mob/living/basic/mining/Initialize(mapload)
	. = ..()
<<<<<<< HEAD
	ADD_TRAIT(src, TRAIT_LAVA_IMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_ASHSTORM_IMMUNE, INNATE_TRAIT)
=======
	add_traits(list(TRAIT_LAVA_IMMUNE, TRAIT_ASHSTORM_IMMUNE), INNATE_TRAIT)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	AddElement(/datum/element/mob_killed_tally, "mobs_killed_mining")
