<<<<<<< HEAD
/datum/ai_planning_subtree/robot_customer/SelectBehaviors(datum/ai_controller/controller, delta_time)
=======
/datum/ai_planning_subtree/robot_customer/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(controller.blackboard[BB_CUSTOMER_LEAVING])
		controller.queue_behavior(/datum/ai_behavior/leave_venue, BB_CUSTOMER_ATTENDING_VENUE)
		return SUBTREE_RETURN_FINISH_PLANNING

	if(controller.blackboard[BB_CUSTOMER_CURRENT_TARGET])

		controller.queue_behavior(/datum/ai_behavior/break_spine, BB_CUSTOMER_CURRENT_TARGET)
		return SUBTREE_RETURN_FINISH_PLANNING

<<<<<<< HEAD
	var/datum/weakref/seat_ref = controller.blackboard[BB_CUSTOMER_MY_SEAT]
	var/obj/structure/holosign/robot_seat/seat_marker = seat_ref?.resolve()
=======
	var/obj/structure/holosign/robot_seat/seat_marker = controller.blackboard[BB_CUSTOMER_MY_SEAT]
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	if(!seat_marker) //We havn't got a seat yet! find one!
		controller.queue_behavior(/datum/ai_behavior/find_seat)
		return SUBTREE_RETURN_FINISH_PLANNING

<<<<<<< HEAD
	controller.set_movement_target(seat_marker)
=======
	controller.set_movement_target(type, seat_marker)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	if(!controller.blackboard[BB_CUSTOMER_CURRENT_ORDER]) //We haven't ordered yet even ordered yet. go on! go over there and go do it!
		controller.queue_behavior(/datum/ai_behavior/order_food)
		return SUBTREE_RETURN_FINISH_PLANNING
	else
		controller.queue_behavior(/datum/ai_behavior/wait_for_food)
