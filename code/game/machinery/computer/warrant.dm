<<<<<<< HEAD
/obj/machinery/computer/warrant//TODO:SANITY
	name = "security warrant console"
	desc = "Used to view crewmember security records"
=======
/obj/machinery/computer/warrant
	name = "security warrant console"
	desc = "Used to view outstanding warrants."
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon_screen = "security"
	icon_keyboard = "security_key"
	circuit = /obj/item/circuitboard/computer/warrant
	light_color = COLOR_SOFT_RED
<<<<<<< HEAD
	var/screen = null
	var/datum/data/record/current = null

/obj/machinery/computer/warrant/ui_interact(mob/user)
	. = ..()

	var/list/dat = list("Logged in as: ")
	if(authenticated)
		dat += {"<a href='?src=[REF(src)];choice=Logout'>[authenticated]</a><hr>"}
		if(current)
			var/background
			var/notice = ""
			switch(current.fields["criminal"])
				if("*Arrest*")
					background = "background-color:#990000;"
					notice = "<br>**REPORT TO THE BRIG**"
				if("Incarcerated")
					background = "background-color:#CD6500;"
				if("Suspected")
					background = "background-color:#CD6500;"
				if("Paroled")
					background = "background-color:#CD6500;"
				if("Discharged")
					background = "background-color:#006699;"
				if("None")
					background = "background-color:#4F7529;"
				if("")
					background = "''" //"'background-color:#FFFFFF;'"
			dat += "<font size='4'><b>Warrant Data</b></font>"
			dat += {"<table>
			<tr><td>Name:</td><td>&nbsp;[current.fields["name"]]&nbsp;</td></tr>
			<tr><td>ID:</td><td>&nbsp;[current.fields["id"]]&nbsp;</td></tr>
			</table>"}
			dat += {"Criminal Status:<br>
			<div style='[background] padding: 3px; text-align: center;'>
			<strong>[current.fields["criminal"]][notice]</strong>
			</div>"}

			dat += "<br><br>Citations:"

			dat +={"<table style="text-align:center;" border="1" cellspacing="0" width="100%">
			<tr>
			<th>Crime</th>
			<th>Fine</th>
			<th>Author</th>
			<th>Time Added</th>
			<th>Amount Due</th>
			<th>Make Payment</th>
			</tr>"}
			for(var/datum/data/crime/c in current.fields["citation"])
				var/owed = c.fine - c.paid
				dat += {"<tr><td>[c.crimeName]</td>
				<td>[c.fine] cr</td>
				<td>[c.author]</td>
				<td>[c.time]</td>"}
				if(owed > 0)
					dat += {"<td>[owed] cr</td>
					<td><A href='?src=[REF(src)];choice=Pay;field=citation_pay;cdataid=[c.dataId]'>\[Pay\]</A></td>"}
				else
					dat += "<td colspan='2'>All Paid Off</td>"
				dat += "</tr>"
			dat += "</table>"

			dat += "<br>Crimes:"
			dat +={"<table style="text-align:center;" border="1" cellspacing="0" width="100%">
			<tr>
			<th>Crime</th>
			<th>Details</th>
			<th>Author</th>
			<th>Time Added</th>
			</tr>"}
			for(var/datum/data/crime/c in current.fields["crim"])
				dat += {"<tr><td>[c.crimeName]</td>
				<td>[c.crimeDetails]</td>
				<td>[c.author]</td>
				<td>[c.time]</td>
				</tr>"}
			dat += "</table>"
		else
			dat += {"<span>** No security record found for this ID **</span>"}
	else
		dat += {"<a href='?src=[REF(src)];choice=Login'>------------</a><hr>"}

	var/datum/browser/popup = new(user, "warrant", "Security Warrant Console", 600, 400)
	popup.set_content(dat.Join())
	popup.open()

/obj/machinery/computer/warrant/Topic(href, href_list)
	if(..())
		return
	var/mob/M = usr
	switch(href_list["choice"])
		if("Login")
			if(isliving(M))
				var/mob/living/L = M
				var/obj/item/card/id/scan = L.get_idcard(TRUE)
				if (!scan)
					say("You do not have a registered ID!")
					return
				authenticated = scan.registered_name
				if(authenticated)
					current = find_record("name", authenticated, GLOB.data_core.security)
					playsound(src, 'sound/machines/terminal_on.ogg', 50, FALSE)
		if("Logout")
			current = null
			authenticated = null
			playsound(src, 'sound/machines/terminal_off.ogg', 50, FALSE)

		if("Pay")
			for(var/datum/data/crime/p in current.fields["citation"])
				if(p.dataId == text2num(href_list["cdataid"]))
					var/obj/item/holochip/C = M.is_holding_item_of_type(/obj/item/holochip)
					if(C && istype(C))
						var/pay = C.get_item_credit_value()
						if(!pay)
							to_chat(M, span_warning("[C] doesn't seem to be worth anything!"))
						else
							var/diff = p.fine - p.paid
							GLOB.data_core.payCitation(current.fields["id"], text2num(href_list["cdataid"]), pay)
							to_chat(M, span_notice("You have paid [pay] credit\s towards your fine."))
							if (pay == diff || pay > diff || pay >= diff)
								investigate_log("Citation Paid off: <strong>[p.crimeName]</strong> Fine: [p.fine] | Paid off by [key_name(usr)]", INVESTIGATE_RECORDS)
								to_chat(M, span_notice("The fine has been paid in full."))
							SSblackbox.ReportCitation(text2num(href_list["cdataid"]),"","","","", 0, pay)
							qdel(C)
							playsound(src, SFX_TERMINAL_TYPE, 25, FALSE)
					else
						to_chat(M, span_warning("Fines can only be paid with holochips!"))
	updateUsrDialog()
	add_fingerprint(M)
=======
	/// The state of the printer
	var/printing = FALSE

/obj/machinery/computer/warrant/ui_interact(mob/user, datum/tgui/ui)
	. = ..()
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "WarrantConsole", name)
		ui.set_autoupdate(FALSE)
		ui.open()

/obj/machinery/computer/warrant/ui_data(mob/user)
	var/list/data = list()

	var/list/records = list()

	for(var/datum/record/crew/target in GLOB.manifest.general)
		if(!length(target.citations))
			continue

		var/list/citations = list()

		for(var/datum/crime/citation/warrant as anything in target.citations)
			if(!warrant.valid)
				continue

			var/list/entry = list(list(
				author = warrant.author,
				details = warrant.details,
				fine = warrant.fine,
				fine_name = warrant.name,
				fine_ref = REF(warrant),
				paid = warrant.paid,
				time = warrant.time,
			))

			citations += entry

		var/list/record = list(list(
			citations = citations,
			crew_name = target.name,
			crew_ref = REF(target),
			notes = target.security_note,
			rank = target.rank,
		))

		records += record
	data["records"] = records

	return data

/obj/machinery/computer/warrant/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	if(.)
		return FALSE

	switch(action)
		if("pay")
			pay_fine(usr, params)
			return TRUE

		if("print")
			ui.close()
			print_bounty(usr, params)
			return TRUE

		if("refresh")
			return TRUE

	return FALSE

/// Pays towards a listed fine.
/obj/machinery/computer/warrant/proc/pay_fine(mob/user, list/params)
	var/datum/record/crew/target = locate(params["crew_ref"]) in GLOB.manifest.general
	if(!target)
		return FALSE

	var/datum/crime/citation/warrant = locate(params["fine_ref"]) in target.citations
	if(!warrant)
		return FALSE

	if(!isliving(user) || issilicon(user))
		to_chat(user, span_warning("ACCESS DENIED"))
		playsound(src, 'sound/machines/terminal_error.ogg', 100, TRUE)
		return FALSE

	var/mob/living/player = user
	var/obj/item/card/id/auth = player.get_idcard(TRUE)
	if(!auth)
		to_chat(user, span_warning("ACCESS DENIED: No ID card detected."))
		playsound(src, 'sound/machines/terminal_error.ogg', 100, TRUE)
		return FALSE

	var/datum/bank_account/account = auth.registered_account
	if(!account?.account_holder || account.account_holder == "Unassigned")
		to_chat(user, span_warning("ACCESS DENIED: No account linked to ID."))
		playsound(src, 'sound/machines/terminal_error.ogg', 100, TRUE)
		return FALSE

	var/amount = params["amount"]
	if(!amount || !isnum(amount) || amount > warrant.fine || !account.adjust_money(-amount, "Paid fine for [target.name]"))
		to_chat(user, span_warning("ACCESS DENIED: Invalid amount."))
		playsound(src, 'sound/machines/terminal_error.ogg', 100, TRUE)
		return FALSE

	account.bank_card_talk("You have paid [amount]cr towards [target.name]'s fine of [warrant.fine]cr.")
	log_econ("[amount]cr was transferred from [user]'s transaction to [target.name]'s [warrant.fine]cr fine")
	SSblackbox.record_feedback("amount", "credits_transferred", amount)
	warrant.pay_fine(amount)

	if(amount >= 100 && target?.name != user)
		var/list/titles = list(
			"An anonymous benefactor",
			"A generous citizen",
			"A kind soul",
			"A good samaritan",
			"A friendly face",
			"A helpful stranger",
		)
		warrant.alert_owner(user, src, target.name, "[pick(titles)] has paid [amount]cr towards your fine.")

	var/datum/bank_account/sec_account = SSeconomy.get_dep_account(ACCOUNT_SEC)
	sec_account.adjust_money(amount)

	if(warrant.fine != 0 || target.name == user)
		return TRUE

	warrant.alert_owner(user, src, target.name, "One of your outstanding warrants has been completely paid.")
	return TRUE

/// Finishes printing, resets the printer.
/obj/machinery/computer/warrant/proc/print_finish(obj/item/paper/bounty)
	printing = FALSE
	playsound(src, 'sound/machines/terminal_eject.ogg', 100, TRUE)
	bounty.forceMove(loc)

	return TRUE

/// Prints a bounty for a listed fine.
/obj/machinery/computer/warrant/proc/print_bounty(mob/user, list/params)
	if(printing)
		balloon_alert(user, "printer busy")
		playsound(src, 'sound/machines/terminal_error.ogg', 100, TRUE)
		return FALSE

	var/datum/record/crew/target = locate(params["crew_ref"]) in GLOB.manifest.general
	if(!target)
		return FALSE

	var/datum/crime/citation/warrant = locate(params["fine_ref"]) in target.citations
	if(!warrant?.fine)
		return FALSE

	var/bounty_text = "<center><h2><b>Bounty for [target.name]</b><h2></center><BR>"
	bounty_text += "<center>Wanted for [warrant.name]</h2></center><br><br>"
	bounty_text += "<b>Details:</b><br>[warrant.details]<br>"
	bounty_text += "<b>Issued to:</b><br>[usr]<br>"
	bounty_text += "<b>Issued on:</b><br>[warrant.time]<br>"
	bounty_text += "<b>Comments:</b><br>[!target.security_note ? "None." : target.security_note]<br><br>"
	bounty_text += "<center><b>FINE:</b> [warrant.fine] credits</center>"

	printing = TRUE
	balloon_alert(user, "printing")
	playsound(src, 'sound/machines/printer.ogg', 100, TRUE)

	var/obj/item/paper/bounty = new(null)
	bounty.name = "Bounty for [target.name]"
	bounty.desc = "A [warrant.fine]cr bounty for [target.name]."
	bounty.add_raw_text(bounty_text)
	bounty.update_icon()

	addtimer(CALLBACK(src, PROC_REF(print_finish), bounty), 2 SECONDS)

	return TRUE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
