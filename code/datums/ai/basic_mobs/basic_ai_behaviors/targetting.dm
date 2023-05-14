/datum/ai_behavior/find_potential_targets
	action_cooldown = 2 SECONDS
	/// How far can we see stuff?
	var/vision_range = 9
	/// Static typecache list of potentially dangerous objs
	var/static/list/hostile_machines = typecacheof(list(/obj/machinery/porta_turret, /obj/vehicle/sealed/mecha))

<<<<<<< HEAD
/datum/ai_behavior/find_potential_targets/perform(delta_time, datum/ai_controller/controller, target_key, targetting_datum_key, hiding_location_key)
	. = ..()
	var/list/potential_targets
=======
/datum/ai_behavior/find_potential_targets/perform(seconds_per_tick, datum/ai_controller/controller, target_key, targetting_datum_key, hiding_location_key)
	. = ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	var/mob/living/living_mob = controller.pawn
	var/datum/targetting_datum/targetting_datum = controller.blackboard[targetting_datum_key]

	if(!targetting_datum)
		CRASH("No target datum was supplied in the blackboard for [controller.pawn]")

<<<<<<< HEAD
	potential_targets = hearers(vision_range, controller.pawn) - living_mob //Remove self, so we don't suicide
=======
	var/atom/current_target = controller.blackboard[target_key]
	if (targetting_datum.can_attack(living_mob, current_target))
		finish_action(controller, succeeded = FALSE)
		return

	controller.clear_blackboard_key(target_key)
	var/list/potential_targets = hearers(vision_range, controller.pawn) - living_mob //Remove self, so we don't suicide
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	for(var/HM in typecache_filter_list(range(vision_range, living_mob), hostile_machines)) //Can we see any hostile machines?
		if(can_see(living_mob, HM, vision_range))
			potential_targets += HM

	if(!potential_targets.len)
<<<<<<< HEAD
		finish_action(controller, FALSE)
=======
		finish_action(controller, succeeded = FALSE)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		return

	var/list/filtered_targets = list()

	for(var/atom/pot_target in potential_targets)
		if(targetting_datum.can_attack(living_mob, pot_target))//Can we attack it?
			filtered_targets += pot_target
			continue

	if(!filtered_targets.len)
<<<<<<< HEAD
		finish_action(controller, FALSE)
		return

	var/atom/target = pick(filtered_targets)
	controller.blackboard[target_key] = WEAKREF(target)
=======
		finish_action(controller, succeeded = FALSE)
		return

	var/atom/target = pick_final_target(controller, filtered_targets)
	controller.set_blackboard_key(target_key, target)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	var/atom/potential_hiding_location = targetting_datum.find_hidden_mobs(living_mob, target)

	if(potential_hiding_location) //If they're hiding inside of something, we need to know so we can go for that instead initially.
<<<<<<< HEAD
		controller.blackboard[hiding_location_key] = WEAKREF(potential_hiding_location)

	finish_action(controller, TRUE)
=======
		controller.set_blackboard_key(hiding_location_key, potential_hiding_location)

	finish_action(controller, succeeded = TRUE)

/datum/ai_behavior/find_potential_targets/finish_action(datum/ai_controller/controller, succeeded, ...)
	. = ..()
	if (succeeded)
		controller.CancelActions() // On retarget cancel any further queued actions so that they will setup again with new target

/// Returns the desired final target from the filtered list of targets
/datum/ai_behavior/find_potential_targets/proc/pick_final_target(datum/ai_controller/controller, list/filtered_targets)
	return pick(filtered_targets)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
