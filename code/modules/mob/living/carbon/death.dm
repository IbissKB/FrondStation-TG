/mob/living/carbon/death(gibbed)
	if(stat == DEAD)
		return

	losebreath = 0

	if(!gibbed)
		INVOKE_ASYNC(src, PROC_REF(emote), "deathgasp")
<<<<<<< HEAD
	reagents.end_metabolization(src)

	add_memory_in_range(src, 7, MEMORY_DEATH, list(DETAIL_PROTAGONIST = src), memory_flags = MEMORY_FLAG_NOMOOD, story_value = STORY_VALUE_OKAY, memory_flags = MEMORY_CHECK_BLIND_AND_DEAF)

	. = ..()

	if(!gibbed)
=======
		add_memory_in_range(src, 7, /datum/memory/witnessed_death, protagonist = src)
	reagents.end_metabolization(src)

	. = ..()

	if(!gibbed && !QDELING(src)) //double check they didn't start getting deleted in ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		attach_rot()

	for(var/T in get_traumas())
		var/datum/brain_trauma/BT = T
		BT.on_death()

/mob/living/carbon/proc/inflate_gib() // Plays an animation that makes mobs appear to inflate before finally gibbing
	addtimer(CALLBACK(src, PROC_REF(gib), null, null, TRUE, TRUE), 25)
	var/matrix/M = matrix()
	M.Scale(1.8, 1.2)
	animate(src, time = 40, transform = M, easing = SINE_EASING)

/mob/living/carbon/gib(no_brain, no_organs, no_bodyparts, safe_gib = FALSE)
<<<<<<< HEAD
	add_memory_in_range(src, 7, MEMORY_GIBBED, list(DETAIL_PROTAGONIST = src), STORY_VALUE_AMAZING, MEMORY_FLAG_NOMOOD, memory_flags = MEMORY_CHECK_BLINDNESS)
=======
	add_memory_in_range(src, 7, /datum/memory/witness_gib, protagonist = src)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(safe_gib) // If you want to keep all the mob's items and not have them deleted
		for(var/obj/item/W in src)
			dropItemToGround(W)
			if(prob(50))
				step(W, pick(GLOB.alldirs))
	var/atom/Tsec = drop_location()
	for(var/mob/M in src)
		M.forceMove(Tsec)
		visible_message(span_danger("[M] bursts out of [src]!"))
<<<<<<< HEAD
	. = ..()
=======
	return ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/mob/living/carbon/spill_organs(no_brain, no_organs, no_bodyparts)
	var/atom/Tsec = drop_location()
	if(!no_bodyparts)
		if(no_organs)//so the organs don't get transfered inside the bodyparts we'll drop.
<<<<<<< HEAD
			for(var/X in internal_organs)
				if(no_brain || !istype(X, /obj/item/organ/internal/brain))
					qdel(X)
		else //we're going to drop all bodyparts except chest, so the only organs that needs spilling are those inside it.
			for(var/obj/item/organ/organs as anything in internal_organs)
				if(no_brain && istype(organs, /obj/item/organ/internal/brain))
					qdel(organs) //so the brain isn't transfered to the head when the head drops.
					continue
				// SKYRAT EDIT START - Non-spillable organs
				if(!organs.drop_when_organ_spilling)
					qdel(organs)
					continue
				// SKYRAT EDIT END
				var/org_zone = check_zone(organs.zone) //both groin and chest organs.
				if(org_zone == BODY_ZONE_CHEST)
					organs.Remove(src)
					organs.forceMove(Tsec)
					organs.throw_at(get_edge_target_turf(src,pick(GLOB.alldirs)),rand(1,3),5)
	else
		for(var/obj/item/organ/organs as anything in internal_organs)
			if(no_brain && istype(organs, /obj/item/organ/internal/brain))
				qdel(organs)
				continue
			if(no_organs && !istype(organs, /obj/item/organ/internal/brain))
				qdel(organs)
				continue
			// SKYRAT EDIT START - Non-spillable organs
			if(!organs.drop_when_organ_spilling)
				qdel(organs)
				continue
			// SKYRAT EDIT END
			organs.Remove(src)
			organs.forceMove(Tsec)
			organs.throw_at(get_edge_target_turf(src,pick(GLOB.alldirs)),rand(1,3),5)

/mob/living/carbon/spread_bodyparts()
	for(var/X in bodyparts)
		var/obj/item/bodypart/BP = X
		BP.drop_limb()
		BP.throw_at(get_edge_target_turf(src,pick(GLOB.alldirs)),rand(1,3),5)
=======
			for(var/X in organs)
				if(no_brain || !istype(X, /obj/item/organ/internal/brain))
					qdel(X)
		else //we're going to drop all bodyparts except chest, so the only organs that needs spilling are those inside it.
			for(var/obj/item/organ/organ as anything in organs)
				if(no_brain && istype(organ, /obj/item/organ/internal/brain))
					qdel(organ) //so the brain isn't transfered to the head when the head drops.
					continue
				var/org_zone = check_zone(organ.zone) //both groin and chest organs.
				if(org_zone == BODY_ZONE_CHEST)
					organ.Remove(src)
					organ.forceMove(Tsec)
					organ.throw_at(get_edge_target_turf(src,pick(GLOB.alldirs)),rand(1,3),5)
	else
		for(var/obj/item/organ/organ as anything in organs)
			if(no_brain && istype(organ, /obj/item/organ/internal/brain))
				qdel(organ)
				continue
			if(no_organs && !istype(organ, /obj/item/organ/internal/brain))
				qdel(organ)
				continue
			organ.Remove(src)
			organ.forceMove(Tsec)
			organ.throw_at(get_edge_target_turf(src,pick(GLOB.alldirs)),rand(1,3),5)

/// Launches all bodyparts away from the mob. skip_head will keep the head attached.
/mob/living/carbon/spread_bodyparts(skip_head = FALSE)
	for(var/obj/item/bodypart/part as anything in bodyparts)
		if(skip_head && part.body_zone == BODY_ZONE_HEAD)
			continue
		part.drop_limb()
		part.throw_at(get_edge_target_turf(src, pick(GLOB.alldirs)), rand(1,3), 5)

/mob/living/carbon/set_suicide(suicide_state) //you thought that box trick was pretty clever, didn't you? well now hardmode is on, boyo.
	. = ..()
	var/obj/item/organ/internal/brain/userbrain = get_organ_slot(ORGAN_SLOT_BRAIN)
	if(userbrain)
		userbrain.suicided = suicide_state

/mob/living/carbon/can_suicide()
	if(!..())
		return FALSE
	if(!(mobility_flags & MOBILITY_USE)) //just while I finish up the new 'fun' suiciding verb. This is to prevent metagaming via suicide
		to_chat(src, span_warning("You can't commit suicide whilst immobile! (You can type Ghost instead however)."))
		return FALSE
	return TRUE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
