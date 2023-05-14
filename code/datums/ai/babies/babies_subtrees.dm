/**
 * Reproduce with a similar mob.
 */
/datum/ai_planning_subtree/make_babies
	var/chance = 5

<<<<<<< HEAD
/datum/ai_planning_subtree/make_babies/SelectBehaviors(datum/ai_controller/controller, delta_time)
	. = ..()

	if(controller.pawn.gender != FEMALE || !DT_PROB(chance, delta_time))
=======
/datum/ai_planning_subtree/make_babies/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()

	if(controller.pawn.gender != FEMALE || !SPT_PROB(chance, seconds_per_tick))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		return

	var/partner_types = controller.blackboard[BB_BABIES_PARTNER_TYPES]
	var/baby_types = controller.blackboard[BB_BABIES_CHILD_TYPES]

	if(!partner_types || !baby_types)
		return

	// Baby can't reproduce
	if(is_type_in_list(controller.pawn, baby_types))
		return

<<<<<<< HEAD
	var/datum/weakref/weak_target = controller.blackboard[BB_BABIES_TARGET]
	var/atom/target = weak_target?.resolve()

	// Find target
	if(!target || QDELETED(target))
=======
	var/atom/target = controller.blackboard[BB_BABIES_TARGET]

	// Find target
	if(QDELETED(target))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		controller.queue_behavior(/datum/ai_behavior/find_partner, BB_BABIES_TARGET, BB_BABIES_PARTNER_TYPES, BB_BABIES_CHILD_TYPES)
		return

	// Do target
<<<<<<< HEAD
	if(target)
		controller.queue_behavior(/datum/ai_behavior/make_babies, BB_BABIES_TARGET, BB_BABIES_CHILD_TYPES)
		return SUBTREE_RETURN_FINISH_PLANNING
=======
	controller.queue_behavior(/datum/ai_behavior/make_babies, BB_BABIES_TARGET, BB_BABIES_CHILD_TYPES)
	return SUBTREE_RETURN_FINISH_PLANNING
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
