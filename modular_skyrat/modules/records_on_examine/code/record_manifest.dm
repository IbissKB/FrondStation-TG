<<<<<<< HEAD
/datum/record_manifest

/datum/datacore/proc/get_exploitable_manifest()
	var/list/exp_manifest_out = list()
	for(var/datum/job_department/department as anything in SSjob.joinable_departments)
		exp_manifest_out[department.department_name] = list()
	exp_manifest_out[DEPARTMENT_UNASSIGNED] = list()

	var/list/departments_by_type = SSjob.joinable_departments_by_type
	for(var/datum/data/record/general_record in GLOB.data_core.general)
		var/exploitables = general_record.fields["exploitable_records"]
		var/exploitables_empty = ((length(exploitables) < 1) || ((exploitables) == EXPLOITABLE_DEFAULT_TEXT))
		if (exploitables_empty)
			continue
		var/name = general_record.fields["name"]
		var/rank = general_record.fields["rank"]
//		var/truerank = general_record.fields["truerank"]
		var/datum/job/job = SSjob.GetJob(rank)
=======
/// A datum that's mainly used to get exploitables for antagonists.
/datum/record_manifest

/// Proc that returns a list of all the exploitables there is currently.
/datum/manifest/proc/get_exploitable_manifest()
	var/list/exp_manifest_out = list()
	for(var/datum/job_department/department as anything in SSjob.joinable_departments)
		exp_manifest_out[department.department_name] = list()

	exp_manifest_out[DEPARTMENT_UNASSIGNED] = list()

	var/list/departments_by_type = SSjob.joinable_departments_by_type

	for(var/datum/record/crew/crew_record in GLOB.manifest.general)
		var/exploitables = crew_record.exploitable_information

		var/exploitables_empty = ((length(exploitables) < 1) || ((exploitables) == EXPLOITABLE_DEFAULT_TEXT))

		if (exploitables_empty)
			continue

		var/name = crew_record.name
		var/rank = crew_record.rank
//		var/truerank = crew_record.truerank
		var/datum/job/job = SSjob.GetJob(rank)

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		if(!job || !(job.job_flags & JOB_CREW_MANIFEST) || !LAZYLEN(job.departments_list) && (!exploitables_empty)) // In case an unlawful custom rank is added.
			var/list/exp_misc_list = exp_manifest_out[DEPARTMENT_UNASSIGNED]
			exp_misc_list[++exp_misc_list.len] = list(
				"name" = name,
				"rank" = rank,
//				"truerank" = truerank,
<<<<<<< HEAD
				"exploitable_records" = exploitables,
				)
			continue
		for(var/department_type as anything in job.departments_list)
			var/datum/job_department/department = departments_by_type[department_type]
			if(!department)
				stack_trace("get_exploitable_manifest() failed to get job department for [department_type] of [job.type]")
				continue
=======
				"exploitable_information" = exploitables,
			)
			continue

		for(var/department_type as anything in job.departments_list)
			var/datum/job_department/department = departments_by_type[department_type]

			if(!department)
				stack_trace("get_exploitable_manifest() failed to get job department for [department_type] of [job.type]")
				continue

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			var/list/exp_entry = list(
				"name" = name,
				"rank" = rank,
//				"truerank" = truerank,
<<<<<<< HEAD
				"exploitable_records" = exploitables,
				)
			var/list/exp_department_list = exp_manifest_out[department.department_name]
=======
				"exploitable_information" = exploitables,
			)

			var/list/exp_department_list = exp_manifest_out[department.department_name]

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			if(istype(job, department.department_head))
				exp_department_list.Insert(1, null)
				exp_department_list[1] = exp_entry
			else
<<<<<<< HEAD
				exp_department_list[++exp_department_list.len] = exp_entry
=======
				exp_department_list[length(exp_department_list) + 1] = exp_entry
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	// Trim the empty categories.
	for (var/department in exp_manifest_out)
		if(!length(exp_manifest_out[department]))
			exp_manifest_out -= department

	return exp_manifest_out

<<<<<<< HEAD
=======

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/datum/record_manifest/ui_state(mob/user)
	return GLOB.always_state

/datum/record_manifest/ui_status(mob/user, datum/ui_state/state)
	return ((user.mind.can_see_exploitables) || (user.mind.has_exploitables_override)) ? UI_INTERACTIVE : UI_CLOSE

/datum/record_manifest/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "RecordManifest")
		ui.open()

/datum/record_manifest/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
<<<<<<< HEAD
	if(action == "show_exploitables")
		var/exploitable_id = params["exploitable_id"]
		var/datum/data/record/general_record = find_record("name", exploitable_id, GLOB.data_core.general)
		to_chat(usr, "<b>Exploitable information:</b> [general_record.fields["exploitable_records"]]")
	else if(action == "show_background")
		var/background_id = params["background_id"]
		var/datum/data/record/general_record = find_record("name", background_id, GLOB.data_core.general)
		to_chat(usr, "<b>Background information:</b> [general_record.fields["background_records"]]")

/datum/record_manifest/ui_data(mob/user)
	var/list/positions = list()
	for(var/datum/job_department/department as anything in SSjob.joinable_departments)
		var/list/exceptions = list()
=======

	if(action == "show_exploitables")
		var/exploitable_id = params["exploitable_id"]
		var/datum/record/crew/target_record = find_record(exploitable_id)
		to_chat(usr, "<b>Exploitable information:</b> [target_record.exploitable_information]")

	else if(action == "show_background")
		var/background_id = params["background_id"]
		var/datum/record/crew/target_record = find_record(background_id)
		to_chat(usr, "<b>Background information:</b> [target_record.background_information]")


/datum/record_manifest/ui_data(mob/user)
	var/list/positions = list()

	for(var/datum/job_department/department as anything in SSjob.joinable_departments)
		var/list/exceptions = list()

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		for(var/datum/job/job as anything in department.department_jobs)
			if(job.total_positions == -1)
				exceptions += job.title
				continue
<<<<<<< HEAD
		positions[department.department_name] = list("exceptions" = exceptions)

	return list(
		"manifest" = GLOB.data_core.get_exploitable_manifest(),
=======

		positions[department.department_name] = list("exceptions" = exceptions)

	return list(
		"manifest" = GLOB.manifest.get_exploitable_manifest(),
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		"positions" = positions
	)
