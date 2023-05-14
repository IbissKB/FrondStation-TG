/datum/computer_file/program/alarm_monitor
	filename = "alarmmonitor"
	filedesc = "Canary"
	category = PROGRAM_CATEGORY_ENGI
	ui_header = "alarm_green.gif"
	program_icon_state = "alert-green"
	extended_desc = "This program provides visual interface for a station's alarm system."
	requires_ntnet = 1
	size = 4
	tgui_id = "NtosStationAlertConsole"
	program_icon = "bell"
	/// If there is any station alert
	var/has_alert = FALSE
	/// Station alert datum for showing alerts UI
	var/datum/station_alert/alert_control

<<<<<<< HEAD
/datum/computer_file/program/alarm_monitor/New()
=======
/datum/computer_file/program/alarm_monitor/on_install()
	. = ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	//We want to send an alarm if we're in one of the mining home areas
	//Or if we're on station. Otherwise, die.
	var/list/allowed_areas = GLOB.the_station_areas + typesof(/area/mine)
	alert_control = new(computer, list(ALARM_ATMOS, ALARM_FIRE, ALARM_POWER), listener_areas = allowed_areas)
	RegisterSignals(alert_control.listener, list(COMSIG_ALARM_LISTENER_TRIGGERED, COMSIG_ALARM_LISTENER_CLEARED), PROC_REF(update_alarm_display))
<<<<<<< HEAD
	return ..()
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/computer_file/program/alarm_monitor/Destroy()
	QDEL_NULL(alert_control)
	return ..()

<<<<<<< HEAD
/datum/computer_file/program/alarm_monitor/process_tick(delta_time)
	..()

	if(has_alert)
		program_icon_state = "alert-red"
		ui_header = "alarm_red.gif"
		update_computer_icon()
	else
		if(!has_alert)
			program_icon_state = "alert-green"
			ui_header = "alarm_green.gif"
			update_computer_icon()
	return 1

/datum/computer_file/program/alarm_monitor/ui_data(mob/user)
	var/list/data = get_header_data()
=======
/datum/computer_file/program/alarm_monitor/ui_data(mob/user)
	var/list/data = list()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	data += alert_control.ui_data(user)
	return data

/datum/computer_file/program/alarm_monitor/proc/update_alarm_display()
	SIGNAL_HANDLER
<<<<<<< HEAD
	has_alert = FALSE
	if(length(alert_control.listener.alarms))
		has_alert = TRUE
=======
	// has_alert is true if there are any active alarms in our listener.
	has_alert = (length(alert_control.listener.alarms) > 0)

	if(!has_alert)
		program_icon_state = "alert-green"
		ui_header = "alarm_green.gif"
	else
		// If we don't know the status, assume the worst.
		// Technically we should never have anything other than a truthy or falsy value
		// but this will allow for unknown values to fall through to be an actual alert.
		program_icon_state = "alert-red"
		ui_header = "alarm_red.gif"
	update_computer_icon() // Always update the icon after we check our conditional because we might've changed it
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/computer_file/program/alarm_monitor/on_start(mob/user)
	. = ..(user)
	GLOB.alarmdisplay += src

<<<<<<< HEAD
/datum/computer_file/program/alarm_monitor/kill_program(forced = FALSE)
=======
/datum/computer_file/program/alarm_monitor/kill_program()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	GLOB.alarmdisplay -= src
	return ..()
