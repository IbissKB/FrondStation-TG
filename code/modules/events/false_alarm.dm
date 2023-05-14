/datum/round_event_control/falsealarm
	name = "False Alarm"
	typepath = /datum/round_event/falsealarm
	weight = 20
	max_occurrences = 5
<<<<<<< HEAD
	var/forced_type //Admin abuse
	category = EVENT_CATEGORY_BUREAUCRATIC
	description = "Fakes an event announcement."

/datum/round_event_control/falsealarm/admin_setup(mob/admin)
	if(!check_rights(R_FUN))
		return

	var/list/possible_types = list()

	for(var/datum/round_event_control/E in SSevents.control)
		var/datum/round_event/event = E.typepath
		if(!initial(event.fakeable))
			continue
		possible_types += E

	forced_type = input(usr, "Select the scare.","False event") as null|anything in sort_names(possible_types)

/datum/round_event_control/falsealarm/can_spawn_event(players_amt)
=======
	category = EVENT_CATEGORY_BUREAUCRATIC
	description = "Fakes an event announcement."
	admin_setup = list(/datum/event_admin_setup/listed_options/false_alarm)

/datum/round_event_control/falsealarm/can_spawn_event(players_amt, allow_magic = FALSE)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	if(!.)
		return .

	if(!length(gather_false_events()))
		return FALSE
	return TRUE

/datum/round_event/falsealarm
	announce_when = 0
	end_when = 1
	fakeable = FALSE
<<<<<<< HEAD
=======
	/// Admin's pick of fake event (wow! you picked blob!! you're so creative and smart!)
	var/forced_type
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/round_event/falsealarm/announce(fake)
	if(fake) //What are you doing
		return
	var/players_amt = get_active_player_count(alive_check = 1, afk_check = 1, human_check = 1)

	var/events_list = gather_false_events(players_amt)
	var/datum/round_event_control/event_control
<<<<<<< HEAD
	var/datum/round_event_control/falsealarm/C = control
	if(C.forced_type)
		event_control = C.forced_type
		C.forced_type = null
=======
	if(forced_type)
		event_control = forced_type
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	else
		event_control = pick(events_list)
	if(event_control)
		var/datum/round_event/Event = new event_control.typepath()
		message_admins("False Alarm: [Event]")
		Event.kill() //do not process this event - no starts, no ticks, no ends
		Event.announce(TRUE) //just announce it like it's happening

/proc/gather_false_events(players_amt)
	. = list()
	for(var/datum/round_event_control/E in SSevents.control)
		if(istype(E, /datum/round_event_control/falsealarm))
			continue
		if(!E.can_spawn_event(players_amt))
			continue

		var/datum/round_event/event = E.typepath
		if(!initial(event.fakeable))
			continue
		. += E
<<<<<<< HEAD
=======

/datum/event_admin_setup/listed_options/false_alarm
	normal_run_option = "Random Fake Event"

/datum/event_admin_setup/listed_options/false_alarm/get_list()
	var/list/possible_types = list()
	for(var/datum/round_event_control/event_control in SSevents.control)
		var/datum/round_event/event = event_control.typepath
		if(!initial(event.fakeable))
			continue
		possible_types += event_control
	return possible_types

/datum/event_admin_setup/listed_options/false_alarm/apply_to_event(datum/round_event/falsealarm/event)
	event.forced_type = chosen
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
