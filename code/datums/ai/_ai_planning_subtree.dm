///A subtree is attached to a controller and is occasionally called by /ai_controller/SelectBehaviors(), this mainly exists to act as a way to subtype and modify SelectBehaviors() without needing to subtype the ai controller itself
/datum/ai_planning_subtree


///Determines what behaviors should the controller try processing; if this returns SUBTREE_RETURN_FINISH_PLANNING then the controller won't go through the other subtrees should multiple exist in controller.planning_subtrees
<<<<<<< HEAD
/datum/ai_planning_subtree/proc/SelectBehaviors(datum/ai_controller/controller, delta_time)
=======
/datum/ai_planning_subtree/proc/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return
