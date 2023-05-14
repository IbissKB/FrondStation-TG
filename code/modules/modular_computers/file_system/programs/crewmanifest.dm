/datum/computer_file/program/crew_manifest
	filename = "plexagoncrew"
	filedesc = "Plexagon Crew List"
	category = PROGRAM_CATEGORY_CREW
	program_icon_state = "id"
	extended_desc = "Program for viewing and printing the current crew manifest"
	transfer_access = list(ACCESS_COMMAND)
	requires_ntnet = TRUE
	size = 4
	tgui_id = "NtosCrewManifest"
	program_icon = "clipboard-list"
	detomatix_resistance = DETOMATIX_RESIST_MAJOR

/datum/computer_file/program/crew_manifest/ui_static_data(mob/user)
<<<<<<< HEAD
	var/list/data = get_header_data()
	data["manifest"] = GLOB.data_core.get_manifest()
	return data

/datum/computer_file/program/crew_manifest/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return

=======
	var/list/data = list()
	data["manifest"] = GLOB.manifest.get_manifest()
	return data

/datum/computer_file/program/crew_manifest/ui_act(action, params, datum/tgui/ui)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	switch(action)
		if("PRG_print")
			if(computer) //This option should never be called if there is no printer
				var/contents = {"<h4>Crew Manifest</h4>
								<br>
<<<<<<< HEAD
								[GLOB.data_core ? GLOB.data_core.get_manifest_html(0) : ""]
=======
								[GLOB.manifest ? GLOB.manifest.get_html(0) : ""]
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
								"}
				if(!computer.print_text(contents,text("crew manifest ([])", station_time_timestamp())))
					to_chat(usr, span_notice("Printer is out of paper."))
					return
				else
					computer.visible_message(span_notice("\The [computer] prints out a paper."))
