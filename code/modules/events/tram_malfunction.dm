<<<<<<< HEAD
#define TRAM_MALFUNCTION_TIME_UPPER 420
#define TRAM_MALFUNCTION_TIME_LOWER 240
=======
#define TRAM_MALFUNCTION_TIME_UPPER 210
#define TRAM_MALFUNCTION_TIME_LOWER 120
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/round_event_control/tram_malfunction
	name = "Tram Malfunction"
	typepath = /datum/round_event/tram_malfunction
<<<<<<< HEAD
	weight = 20
	max_occurrences = 4
	earliest_start = 15 MINUTES
	category = EVENT_CATEGORY_ENGINEERING

//Check if there's a tram we can cause to malfunction.
/datum/round_event_control/tram_malfunction/can_spawn_event(players_amt)
=======
	weight = 40
	max_occurrences = 4
	earliest_start = 15 MINUTES
	category = EVENT_CATEGORY_ENGINEERING
	description = "Tram crossing signals malfunction, tram collision damage is increased."
	min_wizard_trigger_potency = 0
	max_wizard_trigger_potency = 3

//Check if there's a tram we can cause to malfunction.
/datum/round_event_control/tram_malfunction/can_spawn_event(players_amt, allow_magic = FALSE)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	if (!.)
		return FALSE

	for(var/tram_id in GLOB.active_lifts_by_type)
		var/datum/lift_master/tram_ref = GLOB.active_lifts_by_type[tram_id][1]
		if(tram_ref.specific_lift_id == MAIN_STATION_TRAM)
			return .

	return FALSE

/datum/round_event/tram_malfunction
	announce_when = 1
	end_when = TRAM_MALFUNCTION_TIME_LOWER
	var/specific_lift_id = MAIN_STATION_TRAM
	var/original_lethality

/datum/round_event/tram_malfunction/setup()
	end_when = rand(TRAM_MALFUNCTION_TIME_LOWER, TRAM_MALFUNCTION_TIME_UPPER)

/datum/round_event/tram_malfunction/announce()
<<<<<<< HEAD
	priority_announce("Our automated monitoring indicates the software controlling the tram is malfunctioning. Please take care as we diagnose and resolve the issue.", "CentCom Engineering Division")

/datum/round_event/tram_malfunction/start()
	for(var/obj/machinery/crossing_signal/signal as anything in GLOB.tram_signals)
		if(signal.obj_flags & EMAGGED)
			return

		signal.start_malfunction()

	for(var/obj/structure/industrial_lift/tram as anything in GLOB.lifts)
		original_lethality = tram.collision_lethality
		tram.collision_lethality = 2

/datum/round_event/tram_malfunction/end()
	for(var/obj/machinery/crossing_signal/signal in GLOB.tram_signals)
		signal.end_malfunction()

	for(var/obj/structure/industrial_lift/tram as anything in GLOB.lifts)
		tram.collision_lethality = original_lethality

	priority_announce("We've successfully reset the software of the tram, normal operations are now resuming. Sorry for any inconvienence this may have caused. We hope you have a good rest of your shift.", "CentCom Engineering Division")
=======
	priority_announce("Our automated control system has lost contact with the tram's on board computer. Please take extra care while we diagnose and resolve the issue. Signals and emergency braking may not be available during this time.", "CentCom Engineering Division")

/datum/round_event/tram_malfunction/start()
	for(var/obj/machinery/crossing_signal/signal as anything in GLOB.tram_signals)
		signal.start_malfunction()

	for(var/obj/machinery/door/window/tram/door as anything in GLOB.tram_doors)
		door.start_malfunction()

	for(var/obj/machinery/destination_sign/sign as anything in GLOB.tram_signs)
		sign.malfunctioning = TRUE

	for(var/obj/structure/industrial_lift/tram as anything in GLOB.lifts)
		original_lethality = tram.collision_lethality
		tram.collision_lethality = original_lethality * 1.25

/datum/round_event/tram_malfunction/end()
	for(var/obj/machinery/crossing_signal/signal as anything in GLOB.tram_signals)
		signal.end_malfunction()

	for(var/obj/machinery/door/window/tram/door as anything in GLOB.tram_doors)
		door.end_malfunction()

	for(var/obj/machinery/destination_sign/sign as anything in GLOB.tram_signs)
		sign.malfunctioning = FALSE

	for(var/obj/structure/industrial_lift/tram as anything in GLOB.lifts)
		tram.collision_lethality = original_lethality

	priority_announce("We've successfully reset the software on the tram, normal operations are now resuming. Sorry for any inconvienence this may have caused.", "CentCom Engineering Division")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

#undef TRAM_MALFUNCTION_TIME_UPPER
#undef TRAM_MALFUNCTION_TIME_LOWER
