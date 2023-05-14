/datum/round_event_control/grid_check
	name = "Grid Check"
	typepath = /datum/round_event/grid_check
	weight = 10
	max_occurrences = 3
	category = EVENT_CATEGORY_ENGINEERING
	description = "Turns off all APCs for a while, or until they are manually rebooted."
<<<<<<< HEAD
=======
	min_wizard_trigger_potency = 0
	max_wizard_trigger_potency = 4
	/// Cooldown for the announement associated with this event.
	/// Necessary due to the fact that this event is player triggerable.
	COOLDOWN_DECLARE(announcement_spam_protection)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/round_event/grid_check
	announce_when = 1
	start_when = 1

/datum/round_event/grid_check/announce(fake)
<<<<<<< HEAD
	if(fake || (GLOB.power_failure_message_cooldown > world.time))
		priority_announce("Abnormal activity detected in [station_name()]'s powernet. As a precautionary measure, the station's power will be shut off for an indeterminate duration.", "Critical Power Failure", ANNOUNCER_POWEROFF)
=======
	var/datum/round_event_control/grid_check/controller = control
	if(!COOLDOWN_FINISHED(controller, announcement_spam_protection) && !fake)
		return
	priority_announce("Abnormal activity detected in [station_name()]'s powernet. As a precautionary measure, the station's power will be shut off for an indeterminate duration.", "Critical Power Failure", ANNOUNCER_POWEROFF)
	if(!fake) // Only start the CD if we're real
		COOLDOWN_START(controller, announcement_spam_protection, 30 SECONDS)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/round_event/grid_check/start()
	power_fail(30, 120)
