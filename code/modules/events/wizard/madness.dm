/datum/round_event_control/wizard/madness
	name = "Curse of Madness"
	weight = 1
	typepath = /datum/round_event/wizard/madness
	earliest_start = 0 MINUTES
	description = "Reveals a horrifying truth to everyone, giving them a trauma."
<<<<<<< HEAD

	var/forced_secret

/datum/round_event_control/wizard/madness/admin_setup(mob/admin)
	if(!check_rights(R_FUN))
		return

	var/suggested = pick(strings(REDPILL_FILE, "redpill_questions"))

	forced_secret = (input(usr, "What horrifying truth will you reveal?", "Curse of Madness", sort_list(suggested)) as text|null) || suggested

/datum/round_event/wizard/madness/start()
	var/datum/round_event_control/wizard/madness/C = control

	var/horrifying_truth

	if(C.forced_secret)
		horrifying_truth = C.forced_secret
		C.forced_secret = null
	else
		horrifying_truth = pick(strings(REDPILL_FILE, "redpill_questions"))

	curse_of_madness(null, horrifying_truth)
=======
	admin_setup = list(/datum/event_admin_setup/text_input/madness)

/datum/round_event/wizard/madness
	/// the horrifying truth sent to the crew, can be picked by admins.
	var/horrifying_truth

/datum/round_event/wizard/madness/start()
	if(!horrifying_truth)
		horrifying_truth = pick(strings(REDPILL_FILE, "redpill_questions"))

	curse_of_madness(null, horrifying_truth)

/datum/event_admin_setup/text_input/madness
	input_text = "What horrifying truth will you reveal?"

/datum/event_admin_setup/text_input/madness/get_text_suggestion()
	return pick(strings(REDPILL_FILE, "redpill_questions"))

/datum/event_admin_setup/text_input/madness/apply_to_event(datum/round_event/wizard/madness/event)
	event.horrifying_truth = chosen
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
