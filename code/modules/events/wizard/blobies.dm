/datum/round_event_control/wizard/blobies //avast!
	name = "Zombie Outbreak"
	weight = 3
	typepath = /datum/round_event/wizard/blobies
	max_occurrences = 3
	description = "Spawns a blob spore on every corpse."
<<<<<<< HEAD
=======
	min_wizard_trigger_potency = 3
	max_wizard_trigger_potency = 7
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/round_event/wizard/blobies/start()

	for(var/mob/living/carbon/human/H in GLOB.dead_mob_list)
		new /mob/living/simple_animal/hostile/blob/blobspore(H.loc)
