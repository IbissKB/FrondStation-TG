/datum/computer_file/program/notepad
	filename = "notepad"
	filedesc = "Notepad"
	category = PROGRAM_CATEGORY_MISC
	program_icon_state = "generic"
	extended_desc = "Jot down your work-safe thoughts and what not."
	size = 2
	tgui_id = "NtosNotepad"
	program_icon = "book"
	usage_flags = PROGRAM_TABLET

	var/written_note = "Congratulations on your station upgrading to the new NtOS and Thinktronic based collaboration effort, \
		bringing you the best in electronics and software since 2467!"

/datum/computer_file/program/notepad/ui_act(action, list/params, datum/tgui/ui)
<<<<<<< HEAD
	. = ..()
	if(.)
		return

	switch(action)
		if("UpdateNote")
			written_note = params["newnote"]
			return UI_UPDATE

/datum/computer_file/program/notepad/ui_data(mob/user)
	var/list/data = get_header_data()
=======
	switch(action)
		if("UpdateNote")
			written_note = params["newnote"]
			return TRUE

/datum/computer_file/program/notepad/ui_data(mob/user)
	var/list/data = list()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	data["note"] = written_note

	return data
