///This behavior is for obj/items, it is used to free themselves out of the hands of whoever is holding them
/datum/ai_behavior/item_escape_grasp

<<<<<<< HEAD
/datum/ai_behavior/item_escape_grasp/perform(delta_time, datum/ai_controller/controller)
=======
/datum/ai_behavior/item_escape_grasp/perform(seconds_per_tick, datum/ai_controller/controller)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	var/obj/item/item_pawn = controller.pawn
	var/mob/item_holder = item_pawn.loc
	if(!istype(item_holder))
		finish_action(controller, FALSE) //We're no longer being held. abort abort!!
	item_pawn.visible_message(span_warning("[item_pawn] slips out of the hands of [item_holder]!"))
	item_holder.dropItemToGround(item_pawn, TRUE)
	finish_action(controller, TRUE)


///This behavior is for obj/items, it is used to move closer to a target and throw themselves towards them.
/datum/ai_behavior/item_move_close_and_attack
	required_distance = 3
	behavior_flags = AI_BEHAVIOR_REQUIRE_MOVEMENT
	action_cooldown = 20
	///Sound to use
	var/attack_sound
	///Max attemps to make
	var/max_attempts = 3

/datum/ai_behavior/item_move_close_and_attack/setup(datum/ai_controller/controller, target_key, throw_count_key)
	. = ..()
<<<<<<< HEAD
	var/datum/weakref/target_ref = controller.blackboard[target_key]
	controller.set_movement_target(target_ref?.resolve())

/datum/ai_behavior/item_move_close_and_attack/perform(delta_time, datum/ai_controller/controller, target_key, throw_count_key)
	. = ..()
	var/obj/item/item_pawn = controller.pawn
	var/datum/weakref/target_ref = controller.blackboard[target_key]
	var/atom/throw_target = target_ref?.resolve()
=======
	var/atom/target = controller.blackboard[target_key]
	if (isnull(target))
		return FALSE
	set_movement_target(controller, target)

/datum/ai_behavior/item_move_close_and_attack/perform(seconds_per_tick, datum/ai_controller/controller, target_key, throw_count_key)
	. = ..()
	var/obj/item/item_pawn = controller.pawn
	var/atom/throw_target = controller.blackboard[target_key]
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	item_pawn.visible_message(span_warning("[item_pawn] hurls towards [throw_target]!"))
	item_pawn.throw_at(throw_target, rand(4,5), 9)
	playsound(item_pawn.loc, attack_sound, 100, TRUE)
<<<<<<< HEAD
	controller.blackboard[throw_count_key]++
=======
	controller.add_blackboard_key(throw_count_key, 1)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(controller.blackboard[throw_count_key] >= max_attempts)
		finish_action(controller, TRUE, target_key, throw_count_key)

/datum/ai_behavior/item_move_close_and_attack/finish_action(datum/ai_controller/controller, succeeded, target_key, throw_count_key)
	. = ..()
	reset_blackboard(controller, succeeded, target_key, throw_count_key)

/datum/ai_behavior/item_move_close_and_attack/proc/reset_blackboard(datum/ai_controller/controller, succeeded, target_key, throw_count_key)
<<<<<<< HEAD
	controller.blackboard -= target_key
	controller.blackboard[throw_count_key] = 0
=======
	controller.clear_blackboard_key(target_key)
	controller.set_blackboard_key(throw_count_key, 0)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/ai_behavior/item_move_close_and_attack/ghostly
	attack_sound = 'sound/items/haunted/ghostitemattack.ogg'
	max_attempts = 4

/datum/ai_behavior/item_move_close_and_attack/ghostly/haunted

/datum/ai_behavior/item_move_close_and_attack/ghostly/haunted/finish_action(datum/ai_controller/controller, succeeded, target_key, throw_count_key)
<<<<<<< HEAD
	var/datum/weakref/target_ref = controller.blackboard[target_key]
	controller.blackboard[BB_TO_HAUNT_LIST][target_ref]--
=======
	controller.add_blackboard_key_assoc(BB_TO_HAUNT_LIST, controller.blackboard[target_key], -1)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return ..()
