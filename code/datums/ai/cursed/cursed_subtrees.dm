<<<<<<< HEAD
/datum/ai_planning_subtree/cursed/SelectBehaviors(datum/ai_controller/controller, delta_time)
	var/obj/item/item_pawn = controller.pawn

	//make sure we have a target
	var/datum/weakref/target_ref = controller.blackboard[BB_CURSE_TARGET]
	var/mob/living/carbon/curse_target = target_ref?.resolve()
=======
/datum/ai_planning_subtree/cursed/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	var/obj/item/item_pawn = controller.pawn

	//make sure we have a target
	var/mob/living/carbon/curse_target = controller.blackboard[BB_CURSE_TARGET]
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(!curse_target)
		controller.queue_behavior(/datum/ai_behavior/find_and_set, BB_CURSE_TARGET, /mob/living/carbon, CURSED_VIEW_RANGE)
		return
	//make sure attack is valid
	if(get_dist(curse_target, item_pawn) > CURSED_VIEW_RANGE)
<<<<<<< HEAD
		controller.blackboard[BB_CURSE_TARGET] = null
		return
	controller.set_movement_target(curse_target)
	controller.queue_behavior(/datum/ai_behavior/item_move_close_and_attack/ghostly/cursed)
=======
		controller.clear_blackboard_key(BB_CURSE_TARGET)
		return
	controller.queue_behavior(/datum/ai_behavior/item_move_close_and_attack/ghostly/cursed, BB_CURSE_TARGET)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
