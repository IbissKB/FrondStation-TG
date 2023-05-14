<<<<<<< HEAD
/******************** Requests Console ********************/
/** Originally written by errorage, updated by: Carn, needs more work though. I just added some security fixes */

GLOBAL_LIST_EMPTY(req_console_assistance)
GLOBAL_LIST_EMPTY(req_console_supplies)
GLOBAL_LIST_EMPTY(req_console_information)
GLOBAL_LIST_EMPTY(allConsoles)
GLOBAL_LIST_EMPTY(req_console_ckey_departments)


#define REQ_SCREEN_MAIN 0
#define REQ_SCREEN_REQ_ASSISTANCE 1
#define REQ_SCREEN_REQ_SUPPLIES 2
#define REQ_SCREEN_RELAY 3
#define REQ_SCREEN_WRITE 4
#define REQ_SCREEN_CHOOSE 5
#define REQ_SCREEN_SENT 6
#define REQ_SCREEN_ERR 7
#define REQ_SCREEN_VIEW_MSGS 8
#define REQ_SCREEN_AUTHENTICATE 9
#define REQ_SCREEN_ANNOUNCE 10

#define REQ_EMERGENCY_SECURITY 1
#define REQ_EMERGENCY_ENGINEERING 2
#define REQ_EMERGENCY_MEDICAL 3
=======
GLOBAL_LIST_EMPTY(req_console_assistance)
GLOBAL_LIST_EMPTY(req_console_supplies)
GLOBAL_LIST_EMPTY(req_console_information)
GLOBAL_LIST_EMPTY(req_console_all)
GLOBAL_LIST_EMPTY(req_console_ckey_departments)

#define REQ_EMERGENCY_SECURITY "Security"
#define REQ_EMERGENCY_ENGINEERING "Engineering"
#define REQ_EMERGENCY_MEDICAL "Medical"

#define ANNOUNCEMENT_COOLDOWN_TIME (30 SECONDS)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/machinery/requests_console
	name = "requests console"
	desc = "A console intended to send requests to different departments on the station."
<<<<<<< HEAD
	icon = 'icons/obj/terminals.dmi' //OVERRIDEN IN SKYRAT AESTHETICS - SEE MODULE
	icon_state = "req_comp_off"
	base_icon_state = "req_comp"
	active_power_usage = BASE_MACHINE_ACTIVE_CONSUMPTION * 0.15
	var/area/area // Reference to our area
	var/areastring = null // Mapper helper to tie an apc to another area
	var/auto_name = FALSE // Autonaming by area on?
	var/department = "" //Department name (Determined from this variable on each unit) Set this to the same thing if you want several consoles in one department
	var/list/messages = list() // List of all messages
	var/departmentType = 0 // bitflag, DEPRECATED. If maps no longer contain this var, delete it. Use the flags. -fippe
		// 0 = none (not listed, can only replied to)
		// assistance = 1
		// supplies = 2
		// info = 4
		// assistance + supplies = 3
		// assistance + info = 5
		// supplies + info = 6
		// assistance + supplies + info = 7
	var/newmessagepriority = REQ_NO_NEW_MESSAGE
	var/screen = REQ_SCREEN_MAIN
		// 0 = main menu,
		// 1 = req. assistance,
		// 2 = req. supplies
		// 3 = relay information
		// 4 = write msg - not used
		// 5 = choose priority - not used
		// 6 = sent successfully
		// 7 = sent unsuccessfully
		// 8 = view messages
		// 9 = authentication before sending
		// 10 = send announcement
	var/silent = FALSE // set to 1 for it not to beep all the time
	var/hackState = FALSE
	var/announcementConsole = FALSE // FALSE = This console cannot be used to send department announcements, TRUE = This console can send department announcements
	var/open = FALSE // TRUE if open
	var/announceAuth = FALSE //Will be set to 1 when you authenticate yourself for announcements
	var/msgVerified = "" //Will contain the name of the person who verified it
	var/msgStamped = "" //If a message is stamped, this will contain the stamp name
	var/message = ""
	var/to_department = "" //the department which will be receiving the message
	var/priority = REQ_NO_NEW_MESSAGE //Priority of the message being sent
	var/obj/item/radio/Radio
	var/emergency //If an emergency has been called by this device. Acts as both a cooldown and lets the responder know where it the emergency was triggered from
	var/receive_ore_updates = FALSE // If ore redemption machines will send an update when it receives new ores.
	var/assistance_requestable = FALSE // Can others request assistance from this terminal?
	var/supplies_requestable = FALSE // Can others request supplies from this terminal?
	var/anon_tips_receiver = FALSE // Can you relay information to this console?
	max_integrity = 300
	armor = list(MELEE = 70, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 0, BIO = 0, FIRE = 90, ACID = 90)
=======
	icon = 'icons/obj/terminals.dmi'
	icon_state = "req_comp_off"
	base_icon_state = "req_comp"
	active_power_usage = BASE_MACHINE_ACTIVE_CONSUMPTION * 0.15
	max_integrity = 300
	armor_type = /datum/armor/machinery_requests_console
	/// Reference to our area
	var/area/area
	/// Is autonaming by area on?
	var/auto_name = FALSE
	/// Department name (Determined from this variable on each unit) Set this to the same thing if you want several consoles in one department
	var/department = ""
	/// List of all messages
	var/list/messages = list()
	/// Priority of the latest message
	var/new_message_priority = REQ_NO_NEW_MESSAGE
	// Is the console silent? Set to TRUE for it not to beep all the time
	var/silent = FALSE
	// Is the console hacked? Enables EXTREME priority if TRUE
	var/hack_state = FALSE
	/// FALSE = This console cannot be used to send department announcements, TRUE = This console can send department announcements
	var/can_send_announcements = FALSE
	// TRUE if maintenance panel is open
	var/open = FALSE
	/// Will be set to TRUE when you authenticate yourself for announcements
	var/announcement_authenticated = FALSE
	/// Will contain the name of the person who verified it
	var/message_verified_by = ""
	/// If a message is stamped, this will contain the stamp name
	var/message_stamped_by = ""
	/// Reference to the internal radio
	var/obj/item/radio/radio
	///If an emergency has been called by this device. Acts as both a cooldown and lets the responder know where it the emergency was triggered from
	var/emergency
	/// If ore redemption machines will send an update when it receives new ores.
	var/receive_ore_updates = FALSE
	/// Can others request assistance from this terminal?
	var/assistance_requestable = FALSE
	/// Can others request supplies from this terminal?
	var/supplies_requestable = FALSE
	/// Can you relay information to this console?
	var/anon_tips_receiver = FALSE
	/// Did we error in the last mail?
	var/has_mail_send_error = FALSE
	/// Cooldown to prevent announcement spam
	COOLDOWN_DECLARE(announcement_cooldown)

/datum/armor/machinery_requests_console
	melee = 70
	bullet = 30
	laser = 30
	energy = 30
	fire = 90
	acid = 90
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/machinery/requests_console/update_appearance(updates=ALL)
	. = ..()
	if(machine_stat & NOPOWER)
		set_light(0)
		return
<<<<<<< HEAD
	set_light(1.4,0.7,"#34D352")//green light

/obj/machinery/requests_console/update_icon_state()
	if(open)
		icon_state = "[base_icon_state]_[hackState ? "rewired" : "open"]"
		return ..()
	icon_state = "[base_icon_state]_off"
	return ..()
=======
	set_light(1.5, 0.7, "#34D352")//green light

/obj/machinery/requests_console/examine(mob/user)
	. = ..()
	if(!open)
		. += span_notice("It looks like you can pry open the panel with <b>a crowbar</b>.")
	else
		. += span_warning("The panel was pried open, you can close it with <b>a crowbar</b>.")

	if(hack_state)
		. += span_warning("The console seems to have been tampered with!")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/machinery/requests_console/update_overlays()
	. = ..()

<<<<<<< HEAD
=======
	if(open)
		. += mutable_appearance(icon, "req_comp_open")

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(open || (machine_stat & NOPOWER))
		return

	var/screen_state

<<<<<<< HEAD
	if(emergency || (newmessagepriority == REQ_EXTREME_MESSAGE_PRIORITY))
		screen_state = "[base_icon_state]3"
	else if(newmessagepriority == REQ_HIGH_MESSAGE_PRIORITY)
		screen_state = "[base_icon_state]2"
	else if(newmessagepriority == REQ_NORMAL_MESSAGE_PRIORITY)
=======
	if(emergency || (new_message_priority == REQ_EXTREME_MESSAGE_PRIORITY))
		screen_state = "[base_icon_state]3"
	else if(new_message_priority == REQ_HIGH_MESSAGE_PRIORITY)
		screen_state = "[base_icon_state]2"
	else if(new_message_priority == REQ_NORMAL_MESSAGE_PRIORITY)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		screen_state = "[base_icon_state]1"
	else
		screen_state = "[base_icon_state]0"

	. += mutable_appearance(icon, screen_state)
	. += emissive_appearance(icon, screen_state, src, alpha = src.alpha)

/obj/machinery/requests_console/Initialize(mapload)
	. = ..()

	// Init by checking our area, stolen from APC code
	area = get_area(loc)

	// Naming and department sets
	if(auto_name) // If autonaming, just pick department and name from the area code.
		department = "[get_area_name(area, TRUE)]"
		name = "\improper [department] requests console"
	else
		if(!(department) && (name != "requests console")) // if we have a map-set name, let's default that for the department.
			department = name
		else if(!(department)) // if we have no department and no name, we'll have to be Unknown.
			department = "Unknown"
			name = "\improper [department] requests console"
		else
			name = "\improper [department] requests console" // and if we have a 'department', our name should reflect that.

<<<<<<< HEAD
	GLOB.allConsoles += src

	if(departmentType) // Do we have department type flags? Old, deletable once all req consoles are cleaned
		if((departmentType & REQ_DEP_TYPE_ASSISTANCE) && !(department in GLOB.req_console_assistance))
			assistance_requestable = TRUE

		if((departmentType & REQ_DEP_TYPE_SUPPLIES) && !(department in GLOB.req_console_supplies))
			supplies_requestable = TRUE

		if((departmentType & REQ_DEP_TYPE_INFORMATION) && !(department in GLOB.req_console_information))
			anon_tips_receiver = TRUE
	// once all request consoles on every map are cleaned, this section above can be deleted

	if((assistance_requestable) && !(department in GLOB.req_console_assistance)) // adding to assistance list if not already present
		GLOB.req_console_assistance += department

	if((supplies_requestable) && !(department in GLOB.req_console_supplies)) // supplier list
		GLOB.req_console_supplies += department

	if((anon_tips_receiver) && !(department in GLOB.req_console_information)) // tips lists
		GLOB.req_console_information += department

	GLOB.req_console_ckey_departments[ckey(department)] = department // and then we set ourselves a listed name

	Radio = new /obj/item/radio(src)
	Radio.set_listening(FALSE)

/obj/machinery/requests_console/Destroy()
	QDEL_NULL(Radio)
	GLOB.allConsoles -= src
	return ..()

/obj/machinery/requests_console/ui_interact(mob/user)
	. = ..()
	var/dat = ""
	if(!open)
		switch(screen)
			if(REQ_SCREEN_MAIN)
				announceAuth = FALSE
				if (newmessagepriority == REQ_NORMAL_MESSAGE_PRIORITY)
					dat += "<div class='notice'>There are new messages</div><BR>"
				else if (newmessagepriority == REQ_HIGH_MESSAGE_PRIORITY)
					dat += "<div class='notice'>There are new <b>PRIORITY</b> messages</div><BR>"
				else if (newmessagepriority == REQ_EXTREME_MESSAGE_PRIORITY)
					dat += "<div class='notice'>There are new <b>EXTREME PRIORITY</b> messages</div><BR>"
				dat += "<A href='?src=[REF(src)];setScreen=[REQ_SCREEN_VIEW_MSGS]'>View Messages</A><BR><BR>"

				dat += "<A href='?src=[REF(src)];setScreen=[REQ_SCREEN_REQ_ASSISTANCE]'>Request Assistance</A><BR>"
				dat += "<A href='?src=[REF(src)];setScreen=[REQ_SCREEN_REQ_SUPPLIES]'>Request Supplies</A><BR>"
				dat += "<A href='?src=[REF(src)];setScreen=[REQ_SCREEN_RELAY]'>Relay Anonymous Information</A><BR><BR>"

				if(!emergency)
					dat += "<A href='?src=[REF(src)];emergency=[REQ_EMERGENCY_SECURITY]'>Emergency: Security</A><BR>"
					dat += "<A href='?src=[REF(src)];emergency=[REQ_EMERGENCY_ENGINEERING]'>Emergency: Engineering</A><BR>"
					dat += "<A href='?src=[REF(src)];emergency=[REQ_EMERGENCY_MEDICAL]'>Emergency: Medical</A><BR><BR>"
				else
					dat += "<B><font color='red'>[emergency] has been dispatched to this location.</font></B><BR><BR>"

				if(announcementConsole)
					dat += "<A href='?src=[REF(src)];setScreen=[REQ_SCREEN_ANNOUNCE]'>Send Station-wide Announcement</A><BR><BR>"
				if (silent)
					dat += "Speaker <A href='?src=[REF(src)];setSilent=0'>OFF</A>"
				else
					dat += "Speaker <A href='?src=[REF(src)];setSilent=1'>ON</A>"
			if(REQ_SCREEN_REQ_ASSISTANCE)
				dat += "Which department do you need assistance from?<BR><BR>"
				dat += departments_table(GLOB.req_console_assistance)

			if(REQ_SCREEN_REQ_SUPPLIES)
				dat += "Which department do you need supplies from?<BR><BR>"
				dat += departments_table(GLOB.req_console_supplies)

			if(REQ_SCREEN_RELAY)
				dat += "Which department would you like to send information to?<BR><BR>"
				dat += departments_table(GLOB.req_console_information)

			if(REQ_SCREEN_SENT)
				dat += "<span class='good'>Message sent.</span><BR><BR>"
				dat += "<A href='?src=[REF(src)];setScreen=[REQ_SCREEN_MAIN]'><< Back</A><BR>"

			if(REQ_SCREEN_ERR)
				dat += "<span class='bad'>An error occurred.</span><BR><BR>"
				dat += "<A href='?src=[REF(src)];setScreen=[REQ_SCREEN_MAIN]'><< Back</A><BR>"

			if(REQ_SCREEN_VIEW_MSGS)
				for (var/obj/machinery/requests_console/Console in GLOB.allConsoles)
					if (Console.department == department)
						Console.newmessagepriority = REQ_NO_NEW_MESSAGE
						Console.update_appearance()

				newmessagepriority = REQ_NO_NEW_MESSAGE
				update_appearance()
				var/messageComposite = ""
				for(var/msg in messages) // This puts more recent messages at the *top*, where they belong.
					messageComposite = "<div class='block'>[msg]</div>" + messageComposite
				dat += messageComposite
				dat += "<BR><A href='?src=[REF(src)];setScreen=[REQ_SCREEN_MAIN]'><< Back to Main Menu</A><BR>"

			if(REQ_SCREEN_AUTHENTICATE)
				dat += "<B>Message Authentication</B><BR><BR>"
				dat += "<b>Message for [to_department]: </b>[message]<BR><BR>"
				dat += "<div class='notice'>You may authenticate your message now by scanning your ID or your stamp</div><BR>"
				dat += "<b>Validated by:</b> [msgVerified ? msgVerified : "<i>Not Validated</i>"]<br>"
				dat += "<b>Stamped by:</b> [msgStamped ? msgStamped : "<i>Not Stamped</i>"]<br><br>"
				dat += "<A href='?src=[REF(src)];send=[TRUE]'>Send Message</A><BR>"
				dat += "<BR><A href='?src=[REF(src)];setScreen=[REQ_SCREEN_MAIN]'><< Discard Message</A><BR>"

			if(REQ_SCREEN_ANNOUNCE)
				dat += "<h3>Station-wide Announcement</h3>"
				if(announceAuth)
					dat += "<div class='notice'>Authentication accepted</div><BR>"
				else
					dat += "<div class='notice'>Swipe your card to authenticate yourself</div><BR>"
				dat += "<b>Message: </b>[message ? message : "<i>No Message</i>"]<BR>"
				dat += "<A href='?src=[REF(src)];writeAnnouncement=1'>[message ? "Edit" : "Write"] Message</A><BR><BR>"
				if ((announceAuth || isAdminGhostAI(user)) && message)
					dat += "<A href='?src=[REF(src)];sendAnnouncement=1'>Announce Message</A><BR>"
				else
					dat += "<span class='linkOff'>Announce Message</span><BR>"
				dat += "<BR><A href='?src=[REF(src)];setScreen=[REQ_SCREEN_MAIN]'><< Back</A><BR>"

		if(!dat)
			CRASH("No UI for src. Screen var is: [screen]")
		var/datum/browser/popup = new(user, "req_console", "[name]", 450, 440)
		popup.set_content(dat)
		popup.open()
	return

/obj/machinery/requests_console/proc/departments_table(list/req_consoles)
	var/dat = ""
	dat += "<table width='100%'>"
	for(var/req_dpt in req_consoles)
		if (req_dpt != department)
			dat += "<tr>"
			dat += "<td width='55%'>[req_dpt]</td>"
			dat += "<td width='45%'><A href='?src=[REF(src)];write=[ckey(req_dpt)];priority=[REQ_NORMAL_MESSAGE_PRIORITY]'>Normal</A> <A href='?src=[REF(src)];write=[ckey(req_dpt)];priority=[REQ_HIGH_MESSAGE_PRIORITY]'>High</A>"
			if(hackState)
				dat += "<A href='?src=[REF(src)];write=[ckey(req_dpt)];priority=[REQ_EXTREME_MESSAGE_PRIORITY]'>EXTREME</A>"
			dat += "</td>"
			dat += "</tr>"
	dat += "</table>"
	dat += "<BR><A href='?src=[REF(src)];setScreen=[REQ_SCREEN_MAIN]'><< Back</A><BR>"
	return dat

/obj/machinery/requests_console/Topic(href, href_list)
	if(..())
		return
	usr.set_machine(src)
	add_fingerprint(usr)

	if(href_list["write"])
		to_department = ckey(reject_bad_text(href_list["write"])) //write contains the string of the receiving department's name

		var/new_message = (to_department in GLOB.req_console_ckey_departments) && tgui_input_text(usr, "Write your message", "Awaiting Input")
		if(new_message)
			to_department = GLOB.req_console_ckey_departments[to_department]
			message = new_message
			screen = REQ_SCREEN_AUTHENTICATE
			priority = clamp(text2num(href_list["priority"]), REQ_NORMAL_MESSAGE_PRIORITY, REQ_EXTREME_MESSAGE_PRIORITY)

	if(href_list["writeAnnouncement"])
		var/new_message = reject_bad_text(tgui_input_text(usr, "Write your message", "Awaiting Input"))
		if(new_message)
			message = new_message
			priority = clamp(text2num(href_list["priority"]) || REQ_NORMAL_MESSAGE_PRIORITY, REQ_NORMAL_MESSAGE_PRIORITY, REQ_EXTREME_MESSAGE_PRIORITY)
		else
			message = ""
			announceAuth = FALSE
			screen = REQ_SCREEN_MAIN

	if(href_list["sendAnnouncement"])
		if(!announcementConsole)
			return
		if(!(announceAuth || isAdminGhostAI(usr)))
			return
		if(isliving(usr))
			var/mob/living/L = usr
			message = L.treat_message(message)
		minor_announce(message, "[department] Announcement:", html_encode = FALSE)
		GLOB.news_network.submit_article(message, department, "Station Announcements", null)
		usr.log_talk(message, LOG_SAY, tag="station announcement from [src]")
		message_admins("[ADMIN_LOOKUPFLW(usr)] has made a station announcement from [src] at [AREACOORD(usr)].")
		deadchat_broadcast(" made a station announcement from [span_name("[get_area_name(usr, TRUE)]")].", span_name("[usr.real_name]"), usr, message_type=DEADCHAT_ANNOUNCEMENT)
		announceAuth = FALSE
		message = ""
		screen = REQ_SCREEN_MAIN

	if(href_list["emergency"])
		if(!emergency)
			var/radio_freq
			switch(text2num(href_list["emergency"]))
				if(REQ_EMERGENCY_SECURITY) //Security
					radio_freq = FREQ_SECURITY
					emergency = "Security"
				if(REQ_EMERGENCY_ENGINEERING) //Engineering
					radio_freq = FREQ_ENGINEERING
					emergency = "Engineering"
				if(REQ_EMERGENCY_MEDICAL) //Medical
					radio_freq = FREQ_MEDICAL
					emergency = "Medical"
			if(radio_freq)
				Radio.set_frequency(radio_freq)
				Radio.talk_into(src,"[emergency] emergency in [department]!!",radio_freq)
				update_appearance()
				addtimer(CALLBACK(src, PROC_REF(clear_emergency)), 5 MINUTES)

	if(href_list["send"] && message && to_department && priority)

		var/radio_freq
		switch(ckey(to_department))
			if("bridge")
				radio_freq = FREQ_COMMAND
			if("medbay")
				radio_freq = FREQ_MEDICAL
			if("science")
				radio_freq = FREQ_SCIENCE
			if("engineering")
				radio_freq = FREQ_ENGINEERING
			if("security")
				radio_freq = FREQ_SECURITY
			if("cargobay", "mining")
				radio_freq = FREQ_SUPPLY

		var/datum/signal/subspace/messaging/rc/signal = new(src, list(
			"sender" = department,
			"rec_dpt" = to_department,
			"send_dpt" = department,
			"message" = message,
			"verified" = msgVerified,
			"stamped" = msgStamped,
			"priority" = priority,
			"notify_freq" = radio_freq
		))
		signal.send_to_receivers()

		screen = signal.data["done"] ? REQ_SCREEN_SENT : REQ_SCREEN_ERR

	//Handle screen switching
	if(href_list["setScreen"])
		var/set_screen = clamp(text2num(href_list["setScreen"]) || 0, REQ_SCREEN_MAIN, REQ_SCREEN_ANNOUNCE)
		switch(set_screen)
			if(REQ_SCREEN_MAIN)
				to_department = ""
				msgVerified = ""
				msgStamped = ""
				message = ""
				priority = -1
			if(REQ_SCREEN_ANNOUNCE)
				if(!announcementConsole)
					return
		screen = set_screen

	//Handle silencing the console
	if(href_list["setSilent"])
		silent = text2num(href_list["setSilent"]) ? TRUE : FALSE

	updateUsrDialog()
=======
	GLOB.req_console_all += src

	if((assistance_requestable)) // adding to assistance list if not already present
		GLOB.req_console_assistance |= department

	if((supplies_requestable)) // supplier list
		GLOB.req_console_supplies |= department

	if((anon_tips_receiver)) // tips lists
		GLOB.req_console_information |= department

	GLOB.req_console_ckey_departments[ckey(department)] = department // and then we set ourselves a listed name

	radio = new /obj/item/radio(src)
	radio.set_listening(FALSE)

/obj/machinery/requests_console/Destroy()
	QDEL_NULL(radio)
	QDEL_LIST(messages)
	GLOB.req_console_all -= src
	return ..()

/obj/machinery/requests_console/ui_interact(mob/user, datum/tgui/ui)
	if(open)
		return
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "RequestsConsole")
		ui.set_autoupdate(FALSE)
		ui.open()

/obj/machinery/requests_console/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		if("clear_message_status")
			has_mail_send_error = FALSE
			for (var/obj/machinery/requests_console/console in GLOB.req_console_all)
				if (console.department == department)
					console.new_message_priority = REQ_NO_NEW_MESSAGE
					console.update_appearance()
			return TRUE
		if("clear_authentication")
			message_stamped_by = ""
			message_verified_by = ""
			announcement_authenticated = FALSE
			return TRUE
		if("toggle_silent")
			silent = !silent
			return TRUE
		if("set_emergency")
			if(emergency)
				return
			var/radio_freq
			switch(params["emergency"])
				if(REQ_EMERGENCY_SECURITY) //Security
					radio_freq = FREQ_SECURITY
				if(REQ_EMERGENCY_ENGINEERING) //Engineering
					radio_freq = FREQ_ENGINEERING
				if(REQ_EMERGENCY_MEDICAL) //Medical
					radio_freq = FREQ_MEDICAL
			if(radio_freq)
				emergency = params["emergency"]
				radio.set_frequency(radio_freq)
				radio.talk_into(src,"[emergency] emergency in [department]!!",radio_freq)
				update_appearance()
				addtimer(CALLBACK(src, PROC_REF(clear_emergency)), 5 MINUTES)
			return TRUE
		if("send_announcement")
			if(!COOLDOWN_FINISHED(src, announcement_cooldown))
				to_chat(usr, span_alert("Intercomms recharging. Please stand by."))
				return
			if(!can_send_announcements)
				return
			if(!(announcement_authenticated || isAdminGhostAI(usr)))
				return

			var/message = reject_bad_text(params["message"], ascii_only = FALSE)
			if(!message)
				to_chat(usr, span_alert("Invalid message."))
				return
			if(isliving(usr))
				var/mob/living/L = usr
				message = L.treat_message(message)
			minor_announce(message, "[department] Announcement:", html_encode = FALSE)
			GLOB.news_network.submit_article(message, department, "Station Announcements", null)
			usr.log_talk(message, LOG_SAY, tag="station announcement from [src]")
			message_admins("[ADMIN_LOOKUPFLW(usr)] has made a station announcement from [src] at [AREACOORD(usr)].")
			deadchat_broadcast(" made a station announcement from [span_name("[get_area_name(usr, TRUE)]")].", span_name("[usr.real_name]"), usr, message_type=DEADCHAT_ANNOUNCEMENT)

			COOLDOWN_START(src, announcement_cooldown, ANNOUNCEMENT_COOLDOWN_TIME)
			announcement_authenticated = FALSE
			return TRUE
		if("quick_reply")
			var/recipient = params["reply_recipient"]

			var/reply_message = reject_bad_text(tgui_input_text(usr, "Write a quick reply to [recipient]", "Awaiting Input"), ascii_only = FALSE)

			if(!reply_message)
				has_mail_send_error = TRUE
				playsound(src, 'sound/machines/buzz-two.ogg', 50, TRUE)
				return TRUE

			send_message(recipient, reply_message, REQ_NORMAL_MESSAGE_PRIORITY, REPLY_REQUEST)
			return TRUE
		if("send_message")
			var/recipient = params["recipient"]
			if(!recipient)
				return
			var/priority = params["priority"]
			if(!priority)
				return
			var/message = reject_bad_text(params["message"], ascii_only = FALSE)
			if(!message)
				to_chat(usr, span_alert("Invalid message."))
				has_mail_send_error = TRUE
				return TRUE
			var/request_type = params["request_type"]
			if(!request_type)
				return
			send_message(recipient, message, priority, request_type)
			return TRUE

///Sends the message from the request console
/obj/machinery/requests_console/proc/send_message(recipient, message, priority, request_type)
	var/radio_freq
	switch(ckey(recipient))
		if("bridge")
			radio_freq = FREQ_COMMAND
		if("medbay")
			radio_freq = FREQ_MEDICAL
		if("science")
			radio_freq = FREQ_SCIENCE
		if("engineering")
			radio_freq = FREQ_ENGINEERING
		if("security")
			radio_freq = FREQ_SECURITY
		if("cargobay", "mining")
			radio_freq = FREQ_SUPPLY

	var/datum/signal/subspace/messaging/rc/signal = new(src, list(
		"sender_department" = department,
		"recipient_department" = recipient,
		"message" = message,
		"verified" = message_verified_by,
		"stamped" = message_stamped_by,
		"priority" = priority,
		"notify_freq" = radio_freq,
		"request_type" = request_type,
	))
	signal.send_to_receivers()

	has_mail_send_error = !signal.data["done"]

	if(!silent)
		if(has_mail_send_error)
			playsound(src, 'sound/machines/buzz-two.ogg', 50, TRUE)
		else
			playsound(src, 'sound/machines/twobeep.ogg', 50, TRUE)

	message_stamped_by = ""
	message_verified_by = ""

/obj/machinery/requests_console/ui_data(mob/user)
	var/list/data = list()
	data["is_admin_ghost_ai"] = isAdminGhostAI()
	data["can_send_announcements"] = can_send_announcements
	data["department"] = department
	data["emergency"] = emergency
	data["hack_state"] = hack_state
	data["new_message_priority"] = new_message_priority
	data["silent"] = silent
	data["has_mail_send_error"] = has_mail_send_error
	data["authentication_data"] = list(
		"message_verified_by" = message_verified_by,
		"message_stamped_by" = message_stamped_by,
		"announcement_authenticated" = announcement_authenticated,
	)
	data["messages"] = list()
	for (var/datum/request_message/message in messages)
		data["messages"] += list(message.message_ui_data())
	return data


/obj/machinery/requests_console/ui_static_data(mob/user)
	var/list/data = list()

	data["assistance_consoles"] = GLOB.req_console_assistance - department
	data["supply_consoles"] = GLOB.req_console_supplies - department
	data["information_consoles"] = GLOB.req_console_information - department

	return data
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/machinery/requests_console/say_mod(input, list/message_mods = list())
	if(spantext_char(input, "!", -3))
		return "blares"
	else
		. = ..()

<<<<<<< HEAD
=======
/// Turns the emergency console back to its normal sprite once the emergency has timed out
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/machinery/requests_console/proc/clear_emergency()
	emergency = null
	update_appearance()

<<<<<<< HEAD
//from message_server.dm: Console.createmessage(data["sender"], data["send_dpt"], data["message"], data["verified"], data["stamped"], data["priority"], data["notify_freq"])
/obj/machinery/requests_console/proc/createmessage(source, source_department, message, msgVerified, msgStamped, priority, radio_freq)
	var/linkedsender

	var/sending = "[message]<br>"
	if(msgVerified)
		sending = "[sending][msgVerified]<br>"
	if(msgStamped)
		sending = "[sending][msgStamped]<br>"

	linkedsender = source_department ? "<a href='?src=[REF(src)];write=[ckey(source_department)]'>[source_department]</a>" : (source || "unknown")

	var/authentic = (msgVerified || msgStamped) && " (Authenticated)"
	var/alert = "Message from [source][authentic]"
	var/silenced = silent
	var/header = "<b>From:</b> [linkedsender] Received: [station_time_timestamp()]<BR>"

	switch(priority)
		if(REQ_NORMAL_MESSAGE_PRIORITY)
			if(newmessagepriority < REQ_NORMAL_MESSAGE_PRIORITY)
				newmessagepriority = REQ_NORMAL_MESSAGE_PRIORITY
				update_appearance()

		if(REQ_HIGH_MESSAGE_PRIORITY)
			header = "<span class='bad'>High Priority</span><BR>[header]"
			alert = "PRIORITY Alert from [source][authentic]"
			if(newmessagepriority < REQ_HIGH_MESSAGE_PRIORITY)
				newmessagepriority = REQ_HIGH_MESSAGE_PRIORITY
				update_appearance()

		if(REQ_EXTREME_MESSAGE_PRIORITY)
			header = "<span class='bad'>!!!Extreme Priority!!!</span><BR>[header]"
			alert = "EXTREME PRIORITY Alert from [source][authentic]"
			silenced = FALSE
			if(newmessagepriority < REQ_EXTREME_MESSAGE_PRIORITY)
				newmessagepriority = REQ_EXTREME_MESSAGE_PRIORITY
				update_appearance()

	messages += "[header][sending]"

	if(!silenced)
		playsound(src, 'sound/machines/twobeep_high.ogg', 50, TRUE)
		say(alert)

	if(radio_freq)
		Radio.set_frequency(radio_freq)
		Radio.talk_into(src, "[alert]: <i>[message]</i>", radio_freq)

/obj/machinery/requests_console/crowbar_act(mob/living/user, obj/item/tool)

=======
/// From message_server.dm: Console.create_message(data)
/obj/machinery/requests_console/proc/create_message(data)

	var/datum/request_message/new_message = new(data)

	switch(new_message.priority)
		if(REQ_NORMAL_MESSAGE_PRIORITY)
			if(new_message_priority < REQ_NORMAL_MESSAGE_PRIORITY)
				new_message_priority = REQ_NORMAL_MESSAGE_PRIORITY
				update_appearance()

		if(REQ_HIGH_MESSAGE_PRIORITY)
			if(new_message_priority < REQ_HIGH_MESSAGE_PRIORITY)
				new_message_priority = REQ_HIGH_MESSAGE_PRIORITY
				update_appearance()

		if(REQ_EXTREME_MESSAGE_PRIORITY)
			silent = FALSE
			if(new_message_priority < REQ_EXTREME_MESSAGE_PRIORITY)
				new_message_priority = REQ_EXTREME_MESSAGE_PRIORITY
				update_appearance()

	messages.Insert(1, new_message) //reverse order

	SStgui.update_uis(src)

	var/alert = new_message.get_alert()

	if(!silent)
		playsound(src, 'sound/machines/twobeep_high.ogg', 50, TRUE)
		say(alert)

	if(new_message.radio_freq)
		radio.set_frequency(new_message.radio_freq)
		radio.talk_into(src, "[alert]: <i>[new_message.content]</i>", new_message.radio_freq)

/obj/machinery/requests_console/crowbar_act(mob/living/user, obj/item/tool)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	tool.play_tool_sound(src, 50)
	if(open)
		to_chat(user, span_notice("You close the maintenance panel."))
		open = FALSE
	else
		to_chat(user, span_notice("You open the maintenance panel."))
		open = TRUE
	update_appearance()
	return TRUE

/obj/machinery/requests_console/screwdriver_act(mob/living/user, obj/item/tool)
	if(open)
<<<<<<< HEAD
		hackState = !hackState
		if(hackState)
=======
		hack_state = !hack_state
		if(hack_state)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			to_chat(user, span_notice("You modify the wiring."))
		else
			to_chat(user, span_notice("You reset the wiring."))
		update_appearance()
		tool.play_tool_sound(src, 50)
	else
		to_chat(user, span_warning("You must open the maintenance panel first!"))
	return TRUE

<<<<<<< HEAD
/obj/machinery/requests_console/attackby(obj/item/O, mob/user, params)
	var/obj/item/card/id/ID = O.GetID()
	if(ID)
		if(screen == REQ_SCREEN_AUTHENTICATE)
			msgVerified = "<font color='green'><b>Verified by [ID.registered_name] ([ID.assignment])</b></font>"
			updateUsrDialog()
		if(screen == REQ_SCREEN_ANNOUNCE)
			if (ACCESS_RC_ANNOUNCE in ID.access)
				announceAuth = TRUE
			else
				announceAuth = FALSE
				to_chat(user, span_warning("You are not authorized to send announcements!"))
			updateUsrDialog()
		return
	if (istype(O, /obj/item/stamp))
		if(screen == REQ_SCREEN_AUTHENTICATE)
			var/obj/item/stamp/T = O
			msgStamped = span_boldnotice("Stamped with the [T.name]")
			updateUsrDialog()
		return
	return ..()

=======
/obj/machinery/requests_console/attackby(obj/item/attacking_item, mob/user, params)
	var/obj/item/card/id/ID = attacking_item.GetID()
	if(ID)
		message_verified_by = "[ID.registered_name] ([ID.assignment])"
		announcement_authenticated = (ACCESS_RC_ANNOUNCE in ID.access)
		SStgui.update_uis(src)
		return
	if (istype(attacking_item, /obj/item/stamp))
		var/obj/item/stamp/attacking_stamp = attacking_item
		message_stamped_by = attacking_stamp.name
		SStgui.update_uis(src)
		return
	return ..()

/obj/machinery/requests_console/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/wallframe/requests_console(loc)
	qdel(src)

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/machinery/requests_console/auto_name // Register an autoname variant and then make the directional helpers before undefing all the magic bits
	auto_name = TRUE

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/requests_console, 30)
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/requests_console/auto_name, 30)

<<<<<<< HEAD
=======
/obj/item/wallframe/requests_console
	name = "requests console"
	desc = "An unmounted requests console. Attach it to a wall to use."
	icon = 'icons/obj/terminals.dmi'
	icon_state = "req_comp_off"
	result_path = /obj/machinery/requests_console/auto_name
	pixel_shift = 30

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
#undef REQ_EMERGENCY_SECURITY
#undef REQ_EMERGENCY_ENGINEERING
#undef REQ_EMERGENCY_MEDICAL

<<<<<<< HEAD
#undef REQ_SCREEN_MAIN
#undef REQ_SCREEN_REQ_ASSISTANCE
#undef REQ_SCREEN_REQ_SUPPLIES
#undef REQ_SCREEN_RELAY
#undef REQ_SCREEN_WRITE
#undef REQ_SCREEN_CHOOSE
#undef REQ_SCREEN_SENT
#undef REQ_SCREEN_ERR
#undef REQ_SCREEN_VIEW_MSGS
#undef REQ_SCREEN_AUTHENTICATE
#undef REQ_SCREEN_ANNOUNCE
=======
#undef ANNOUNCEMENT_COOLDOWN_TIME
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
