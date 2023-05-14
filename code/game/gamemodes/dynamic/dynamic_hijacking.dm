/datum/game_mode/dynamic/proc/setup_hijacking()
	RegisterSignal(SSdcs, COMSIG_GLOB_PRE_RANDOM_EVENT, PROC_REF(on_pre_random_event))

/datum/game_mode/dynamic/proc/on_pre_random_event(datum/source, datum/round_event_control/round_event_control)
	SIGNAL_HANDLER
	if (!round_event_control.dynamic_should_hijack)
		return

	if (random_event_hijacked != HIJACKED_NOTHING)
<<<<<<< HEAD
		dynamic_log("Random event [round_event_control.name] tried to roll, but Dynamic vetoed it (random event has already ran).")
=======
		log_dynamic_and_announce("Random event [round_event_control.name] tried to roll, but Dynamic vetoed it (random event has already ran).")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		SSevents.spawnEvent()
		SSevents.reschedule()
		return CANCEL_PRE_RANDOM_EVENT

	var/time_range = rand(random_event_hijack_minimum, random_event_hijack_maximum)

	if (world.time - last_midround_injection_attempt < time_range)
		random_event_hijacked = HIJACKED_TOO_RECENT
<<<<<<< HEAD
		dynamic_log("Random event [round_event_control.name] tried to roll, but the last midround injection \
=======
		log_dynamic_and_announce("Random event [round_event_control.name] tried to roll, but the last midround injection \
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			was too recent. Heavy injection chance has been raised to [get_heavy_midround_injection_chance(dry_run = TRUE)]%.")
		return CANCEL_PRE_RANDOM_EVENT

	if (next_midround_injection() - world.time < time_range)
<<<<<<< HEAD
		dynamic_log("Random event [round_event_control.name] tried to roll, but the next midround injection is too soon.")
=======
		log_dynamic_and_announce("Random event [round_event_control.name] tried to roll, but the next midround injection is too soon.")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		return CANCEL_PRE_RANDOM_EVENT
