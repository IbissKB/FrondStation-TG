///used by cows
/datum/ai_planning_subtree/tip_reaction

<<<<<<< HEAD
/datum/ai_planning_subtree/tip_reaction/SelectBehaviors(datum/ai_controller/controller, delta_time)
=======
/datum/ai_planning_subtree/tip_reaction/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	var/tip_reacting = controller.blackboard[BB_BASIC_MOB_TIP_REACTING]
	if(!tip_reacting)
		return
	controller.queue_behavior(/datum/ai_behavior/tipped_reaction, BB_BASIC_MOB_TIPPER, BB_BASIC_MOB_TIP_REACTING)
	return SUBTREE_RETURN_FINISH_PLANNING //no point in trying, boy. you're TIPPED.
