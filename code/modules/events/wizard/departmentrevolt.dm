<<<<<<< HEAD
=======

#define RANDOM_DEPARTMENT "Random Department"

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/datum/round_event_control/wizard/deprevolt //stationwide!
	name = "Departmental Uprising"
	weight = 0 //An order that requires order in a round of chaos was maybe not the best idea. Requiescat in pace departmental uprising August 2014 - March 2015 //hello motherfucker i fixed your shit in 2021
	typepath = /datum/round_event/wizard/deprevolt
	max_occurrences = 1
	earliest_start = 0 MINUTES
	description = "A department is turned into an independent state."
<<<<<<< HEAD

	///manual choice of what department to revolt for admins to pick
	var/datum/job_department/picked_department
	///admin choice on whether to announce the department
	var/announce = FALSE
	///admin choice on whether this nation will have objectives to attack other nations, default true for !fun!
	var/dangerous_nation = TRUE

/datum/round_event_control/wizard/deprevolt/admin_setup(mob/admin)
	if(!check_rights(R_FUN))
		return

	var/list/options = list()
	var/list/pickable_departments = subtypesof(/datum/job_department)
	for(var/datum/job_department/dep as anything in pickable_departments)
		options[initial(dep.department_name)] = dep
	picked_department = options[(input(usr,"Which department should revolt? Select none for a random department.","Select a department") as null|anything in options)]
	if(!picked_department)
		return //eh just random they dont care

	var/announce_question = tgui_alert(usr, "Announce This New Independent State?", "Secession", list("Announce", "No Announcement"))
	if(announce_question == "Announce")
		announce = TRUE

	var/dangerous_question = tgui_alert(usr, "Dangerous Nation? This means they will fight other nations.", "Conquest", list("Yes", "No"))
	if(dangerous_question == "No")
		dangerous_nation = FALSE

/datum/round_event/wizard/deprevolt/start()
	var/datum/round_event_control/wizard/deprevolt/event_control = control
	create_separatist_nation(event_control.picked_department, event_control.announce, event_control.dangerous_nation)
=======
	admin_setup = list(
		/datum/event_admin_setup/listed_options/departmental_revolt,
		/datum/event_admin_setup/question/departmental_revolt_annouce,
		/datum/event_admin_setup/question/departmental_revolt_dangerous
	)

/datum/round_event/wizard/deprevolt
	///which department is revolting?
	var/datum/job_department/picked_department
	/// Announce the separatist nation to the round?
	var/announce = FALSE
	/// Is it going to try fighting other nations?
	var/dangerous_nation = TRUE

/datum/round_event/wizard/deprevolt/start()
	// no setup needed, this proc handles empty values. God i'm good (i wrote all of this)
	create_separatist_nation(picked_department, announce, dangerous_nation)

///which department is revolting?
/datum/event_admin_setup/listed_options/departmental_revolt
	input_text = "Which department should revolt?"
	normal_run_option = "Random"

/datum/event_admin_setup/listed_options/departmental_revolt/get_list()
	return subtypesof(/datum/job_department)
	
/datum/event_admin_setup/listed_options/departmental_revolt/apply_to_event(datum/round_event/wizard/deprevolt/event)
	event.picked_department = chosen

/// Announce the separatist nation to the round?
/datum/event_admin_setup/question/departmental_revolt_annouce
	input_text = "Announce This New Independent State?"

/datum/event_admin_setup/question/departmental_revolt_annouce/apply_to_event(datum/round_event/wizard/deprevolt/event)
	event.announce = chosen

/// Is it going to try fighting other nations?
/datum/event_admin_setup/question/departmental_revolt_dangerous
	input_text = "Dangerous Nation? This means they will fight other nations."

/datum/event_admin_setup/question/departmental_revolt_dangerous/apply_to_event(datum/round_event/wizard/deprevolt/event)
	event.dangerous_nation = chosen

#undef RANDOM_DEPARTMENT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
