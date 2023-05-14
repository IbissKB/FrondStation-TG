/// Verb for opening the requests manager panel
/client/proc/requests()
	set name = "Requests Manager"
	set desc = "Open the request manager panel to view all requests during this round"
	set category = "Admin.Game"
<<<<<<< HEAD
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Request Manager") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
=======
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Request Manager") // If you are copy-pasting this, ensure the 4th parameter is unique to the new proc!
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	GLOB.requests.ui_interact(usr)
