/datum/round_event_control/anomaly
	name = "Anomaly: Energetic Flux"
	typepath = /datum/round_event/anomaly

	min_players = 1
	max_occurrences = 0 //This one probably shouldn't occur! It'd work, but it wouldn't be very fun.
	weight = 15
	category = EVENT_CATEGORY_ANOMALIES
	description = "This anomaly shocks and explodes. This is the base type."
<<<<<<< HEAD
	///The admin-chosen spawn location.
	var/turf/spawn_location

/datum/round_event_control/anomaly/admin_setup(mob/admin)
	. = ..()

	if(!check_rights(R_FUN))
		return ADMIN_CANCEL_EVENT

	if(tgui_alert(usr, "Spawn anomaly at your current location?", "Anomaly Alert", list("Yes", "No")) == "Yes")
		spawn_location = get_turf(usr)

/datum/round_event/anomaly
	var/area/impact_area
	var/datum/anomaly_placer/placer = new()
	var/obj/effect/anomaly/anomaly_path = /obj/effect/anomaly/flux
	announce_when = 1

/datum/round_event/anomaly/setup()

	end_when = start_when + 1 //Admin vars are cleared on end(), so we make sure the anomaly spawns before then.

	var/datum/round_event_control/anomaly/anomaly_event = control
	if(anomaly_event.spawn_location)
		impact_area = get_area(anomaly_event.spawn_location)
=======
	admin_setup = list(/datum/event_admin_setup/set_location/anomaly)

/datum/round_event/anomaly
	start_when = ANOMALY_START_HARMFUL_TIME
	announce_when = ANOMALY_ANNOUNCE_HARMFUL_TIME
	var/area/impact_area
	var/datum/anomaly_placer/placer = new()
	var/obj/effect/anomaly/anomaly_path = /obj/effect/anomaly/flux
	///The admin-chosen spawn location.
	var/turf/spawn_location

/datum/round_event/anomaly/setup()

	if(spawn_location)
		impact_area = get_area(spawn_location)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	else
		impact_area = placer.findValidArea()

/datum/round_event/anomaly/announce(fake)
<<<<<<< HEAD
	priority_announce("Localized energetic flux wave detected on long range scanners. Expected location of impact: [impact_area.name].", "Anomaly Alert")
=======
	priority_announce("Energetic flux wave detected on [ANOMALY_ANNOUNCE_DANGEROUS_TEXT] [impact_area.name].", "Anomaly Alert", ANNOUNCER_ANOMALIES) //SKYRAT EDIT CHANGE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/round_event/anomaly/start()
	var/turf/anomaly_turf

<<<<<<< HEAD
	var/datum/round_event_control/anomaly/anomaly_event = control
	if(anomaly_event.spawn_location)
		anomaly_turf = anomaly_event.spawn_location
=======
	if(spawn_location)
		anomaly_turf = spawn_location
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	else
		anomaly_turf = placer.findValidTurf(impact_area)

	var/newAnomaly
	if(anomaly_turf)
		newAnomaly = new anomaly_path(anomaly_turf)
	if (newAnomaly)
<<<<<<< HEAD
		announce_to_ghosts(newAnomaly)

/datum/round_event/anomaly/end()
	var/datum/round_event_control/anomaly/anomaly_event = control
	anomaly_event.spawn_location = null
=======
		apply_anomaly_properties(newAnomaly)
		announce_to_ghosts(newAnomaly)

/// Make any further post-creation modifications to the anomaly
/datum/round_event/anomaly/proc/apply_anomaly_properties(obj/effect/anomaly/new_anomaly)
	return

/datum/event_admin_setup/set_location/anomaly
	input_text = "Spawn anomaly at your current location?"

/datum/event_admin_setup/set_location/anomaly/apply_to_event(datum/round_event/anomaly/event)
	event.spawn_location = chosen_turf

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
