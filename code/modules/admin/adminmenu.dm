/datum/verbs/menu/Admin/Generate_list(client/C)
	if (C.holder)
		. = ..()

/datum/verbs/menu/Admin/verb/playerpanel()
	set name = "Player Panel"
	set desc = "Player Panel"
	set category = "Admin.Game"
	if(usr.client.holder)
		usr.client.holder.player_panel_new()
<<<<<<< HEAD
		SSblackbox.record_feedback("tally", "admin_verb", 1, "Player Panel New") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
=======
		SSblackbox.record_feedback("tally", "admin_verb", 1, "Player Panel New") // If you are copy-pasting this, ensure the 4th parameter is unique to the new proc!
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
