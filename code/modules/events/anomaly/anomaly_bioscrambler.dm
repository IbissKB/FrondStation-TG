/datum/round_event_control/anomaly/anomaly_bioscrambler
	name = "Anomaly: Bioscrambler"
	typepath = /datum/round_event/anomaly/anomaly_bioscrambler

	min_players = 10
	max_occurrences = 5
	weight = 20
	description = "This anomaly replaces the limbs of nearby people."
<<<<<<< HEAD

/datum/round_event/anomaly/anomaly_bioscrambler
	start_when = 10
	announce_when = 3
	anomaly_path = /obj/effect/anomaly/bioscrambler

/datum/round_event/anomaly/anomaly_bioscrambler/announce(fake)
	priority_announce("Localized limb swapping agent. Expected location: [impact_area.name]. Wear biosuits to counter the effects. Calculated half-life of %9£$T$%F3 years", "Anomaly Alert")
=======
	min_wizard_trigger_potency = 0
	max_wizard_trigger_potency = 2

/datum/round_event/anomaly/anomaly_bioscrambler
	start_when = ANOMALY_START_MEDIUM_TIME
	announce_when = ANOMALY_ANNOUNCE_MEDIUM_TIME
	anomaly_path = /obj/effect/anomaly/bioscrambler

/datum/round_event/anomaly/anomaly_bioscrambler/announce(fake)
	priority_announce("Biologic limb swapping agent detected on [ANOMALY_ANNOUNCE_MEDIUM_TEXT] [impact_area.name]. Wear biosuits or other protective gear to counter the effects. Calculated half-life of %9£$T$%F3 years.", "Anomaly Alert", ANNOUNCER_ANOMALIES) //SKYRAT EDIT CHANGE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
