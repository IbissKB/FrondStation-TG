<<<<<<< HEAD
/datum/ai_planning_subtree/dog
	COOLDOWN_DECLARE(heel_cooldown)
	COOLDOWN_DECLARE(reset_ignore_cooldown)

/datum/ai_planning_subtree/dog/SelectBehaviors(datum/ai_controller/dog/controller, delta_time)
	var/mob/living/living_pawn = controller.pawn

	// occasionally reset our ignore list
	if(COOLDOWN_FINISHED(src, reset_ignore_cooldown) && length(controller.blackboard[BB_FETCH_IGNORE_LIST]))
		COOLDOWN_START(src, reset_ignore_cooldown, AI_FETCH_IGNORE_DURATION)
		controller.blackboard[BB_FETCH_IGNORE_LIST] = list()

	// if we were just ordered to heel, chill out for a bit
	if(!COOLDOWN_FINISHED(src, heel_cooldown))
		return

	// if we're not already carrying something and we have a fetch target (and we're not already doing something with it), see if we can eat/equip it
	if(!controller.blackboard[BB_SIMPLE_CARRY_ITEM] && controller.blackboard[BB_FETCH_TARGET])
		var/atom/movable/interact_target = controller.blackboard[BB_FETCH_TARGET]
		if(in_range(living_pawn, interact_target) && (isturf(interact_target.loc)))
			controller.set_movement_target(interact_target)
			if(IS_EDIBLE(interact_target))
				controller.queue_behavior(/datum/ai_behavior/eat_snack)
			else if(isitem(interact_target))
				controller.queue_behavior(/datum/ai_behavior/simple_equip)
			else
				controller.blackboard[BB_FETCH_TARGET] = null
				controller.blackboard[BB_FETCH_DELIVER_TO] = null
			return

	// if we're carrying something and we have a destination to deliver it, do that
	if(controller.blackboard[BB_SIMPLE_CARRY_ITEM] && controller.blackboard[BB_FETCH_DELIVER_TO])
		var/atom/return_target = controller.blackboard[BB_FETCH_DELIVER_TO]
		if(!can_see(controller.pawn, return_target, length=AI_DOG_VISION_RANGE))
			// if the return target isn't in sight, we'll just forget about it and carry the thing around
			controller.blackboard[BB_FETCH_DELIVER_TO] = null
			return
		controller.set_movement_target(return_target)
		controller.queue_behavior(/datum/ai_behavior/deliver_item)
		return

	if(DT_PROB(10, delta_time))
		for(var/mob/living/iter_living in oview(2, living_pawn))
			if(iter_living.stat != CONSCIOUS || !HAS_TRAIT(iter_living, TRAIT_HATED_BY_DOGS))
				continue

			living_pawn.audible_message(span_warning("[living_pawn] growls at [iter_living], seemingly annoyed by [iter_living.p_their()] presence."), hearing_distance = COMBAT_MESSAGE_RANGE)
			controller.set_movement_target(iter_living)
			controller.blackboard[BB_DOG_HARASS_TARGET] = WEAKREF(iter_living)
			controller.blackboard[BB_DOG_HARASS_HARM] = FALSE
			controller.queue_behavior(/datum/ai_behavior/harass)
			return
=======
/// Find someone we don't like and annoy them
/datum/ai_planning_subtree/dog_harassment

/datum/ai_planning_subtree/dog_harassment/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	if(!SPT_PROB(10, seconds_per_tick))
		return
	controller.queue_behavior(/datum/ai_behavior/find_hated_dog_target, BB_DOG_HARASS_TARGET, BB_PET_TARGETTING_DATUM)
	var/atom/harass_target = controller.blackboard[BB_DOG_HARASS_TARGET]
	if (isnull(harass_target))
		return

	controller.queue_behavior(/datum/ai_behavior/basic_melee_attack/dog, BB_DOG_HARASS_TARGET, BB_PET_TARGETTING_DATUM)
	return SUBTREE_RETURN_FINISH_PLANNING

/datum/ai_behavior/find_hated_dog_target

/datum/ai_behavior/find_hated_dog_target/setup(datum/ai_controller/controller, target_key, targetting_datum_key)
	. = ..()
	var/mob/living/dog = controller.pawn
	var/datum/targetting_datum/targetting_datum = controller.blackboard[targetting_datum_key]
	for(var/mob/living/iter_living in oview(2, dog))
		if(iter_living.stat != CONSCIOUS || !HAS_TRAIT(iter_living, TRAIT_HATED_BY_DOGS))
			continue
		if(!isnull(dog.buckled))
			dog.audible_message(span_notice("[dog] growls at [iter_living], yet [dog.p_they()] [dog.p_are()] much too comfy to move."), hearing_distance = COMBAT_MESSAGE_RANGE)
			continue
		if(!targetting_datum.can_attack(dog, iter_living))
			continue

		dog.audible_message(span_warning("[dog] growls at [iter_living], seemingly annoyed by [iter_living.p_their()] presence."), hearing_distance = COMBAT_MESSAGE_RANGE)
		controller.set_blackboard_key(target_key, iter_living)
		controller.set_blackboard_key(BB_DOG_HARASS_HARM, FALSE)
		return TRUE

	controller.clear_blackboard_key(target_key)

/datum/ai_behavior/find_hated_dog_target/perform(seconds_per_tick, datum/ai_controller/controller, target_key)
	. = ..()
	finish_action(controller, TRUE)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
