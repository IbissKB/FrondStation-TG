/mob/living/carbon/alien/adult/death(gibbed)
	if(stat == DEAD)
		return

	. = ..()

	update_icons()
	status_flags |= CANPUSH

//When the alien queen dies, all others must pay the price for letting her die.
/mob/living/carbon/alien/adult/royal/queen/death(gibbed)
	if(stat == DEAD)
		return

	for(var/mob/living/carbon/C in GLOB.alive_mob_list)
		if(C == src) //Make sure not to proc it on ourselves.
			continue
<<<<<<< HEAD
		var/obj/item/organ/internal/alien/hivenode/node = C.getorgan(/obj/item/organ/internal/alien/hivenode)
=======
		var/obj/item/organ/internal/alien/hivenode/node = C.get_organ_by_type(/obj/item/organ/internal/alien/hivenode)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		if(istype(node)) // just in case someone would ever add a diffirent node to hivenode slot
			node.queen_death()

	return ..()
