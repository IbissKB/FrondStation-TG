<<<<<<< HEAD
/datum/ai_planning_subtree/haunted/SelectBehaviors(datum/ai_controller/controller, delta_time)
=======
/datum/ai_planning_subtree/haunted/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	var/obj/item/item_pawn = controller.pawn

	if(ismob(item_pawn.loc)) //We're being held, maybe escape?
		if(controller.blackboard[BB_LIKES_EQUIPPER])//don't unequip from people it's okay with
			return
<<<<<<< HEAD
		if(DT_PROB(HAUNTED_ITEM_ESCAPE_GRASP_CHANCE, delta_time))
			controller.queue_behavior(/datum/ai_behavior/item_escape_grasp)
		return SUBTREE_RETURN_FINISH_PLANNING

	if(!DT_PROB(HAUNTED_ITEM_ATTACK_HAUNT_CHANCE, delta_time))
=======
		if(SPT_PROB(HAUNTED_ITEM_ESCAPE_GRASP_CHANCE, seconds_per_tick))
			controller.queue_behavior(/datum/ai_behavior/item_escape_grasp)
		return SUBTREE_RETURN_FINISH_PLANNING

	if(!SPT_PROB(HAUNTED_ITEM_ATTACK_HAUNT_CHANCE, seconds_per_tick))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		return

	var/list/to_haunt_list = controller.blackboard[BB_TO_HAUNT_LIST]

<<<<<<< HEAD
	for(var/datum/weakref/target_ref as anything in to_haunt_list)
		if(to_haunt_list[target_ref] <= 0)
			to_haunt_list -= target_ref
			continue

		var/mob/living/real_target = target_ref.resolve()
		if(QDELETED(real_target))
			to_haunt_list -= target_ref
			continue

		if(get_dist(real_target, item_pawn) <= 7)
			controller.blackboard[BB_HAUNT_TARGET] = target_ref
=======
	for(var/mob/living/haunt_target as anything in to_haunt_list)
		if(to_haunt_list[haunt_target] <= 0)
			controller.remove_thing_from_blackboard_key(BB_TO_HAUNT_LIST, haunt_target)
			continue

		if(get_dist(haunt_target, item_pawn) <= 7)
			controller.set_blackboard_key(BB_HAUNT_TARGET, haunt_target)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			controller.queue_behavior(/datum/ai_behavior/item_move_close_and_attack/ghostly/haunted, BB_HAUNT_TARGET, BB_HAUNTED_THROW_ATTEMPT_COUNT)
			return SUBTREE_RETURN_FINISH_PLANNING
