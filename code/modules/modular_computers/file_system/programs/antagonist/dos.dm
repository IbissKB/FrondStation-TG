/datum/computer_file/program/ntnet_dos
	filename = "ntn_dos"
	filedesc = "DoS Traffic Generator"
	category = PROGRAM_CATEGORY_MISC
	program_icon_state = "hostile"
	extended_desc = "This advanced script can perform denial of service attacks against NTNet quantum relays. The system administrator will probably notice this. Multiple devices can run this program together against same relay for increased effect"
	size = 20
	requires_ntnet = TRUE
	available_on_ntnet = FALSE
	available_on_syndinet = TRUE
	tgui_id = "NtosNetDos"
	program_icon = "satellite-dish"

	var/obj/machinery/ntnet_relay/target = null
	var/dos_speed = 0
	var/error = ""
	var/executed = 0

<<<<<<< HEAD
/datum/computer_file/program/ntnet_dos/process_tick(delta_time)
=======
/datum/computer_file/program/ntnet_dos/process_tick(seconds_per_tick)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	dos_speed = 0
	switch(ntnet_status)
		if(1)
			dos_speed = NTNETSPEED_LOWSIGNAL * 10
		if(2)
			dos_speed = NTNETSPEED_HIGHSIGNAL * 10
		if(3)
			dos_speed = NTNETSPEED_ETHERNET * 10
	if(target && executed)
		target.dos_overload += dos_speed
		if(!target.is_operational)
			target.dos_sources.Remove(src)
			target = null
			error = "Connection to destination relay lost."

<<<<<<< HEAD
/datum/computer_file/program/ntnet_dos/kill_program(forced = FALSE)
=======
/datum/computer_file/program/ntnet_dos/kill_program()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(target)
		target.dos_sources.Remove(src)
	target = null
	executed = FALSE
<<<<<<< HEAD

	..()

/datum/computer_file/program/ntnet_dos/ui_act(action, params)
	. = ..()
	if(.)
		return
	switch(action)
		if("PRG_target_relay")
			for(var/obj/machinery/ntnet_relay/relays as anything in SSmodular_computers.ntnet_relays)
=======
	return ..()

/datum/computer_file/program/ntnet_dos/ui_act(action, params, datum/tgui/ui, datum/ui_state/state)
	switch(action)
		if("PRG_target_relay")
			for(var/obj/machinery/ntnet_relay/relays as anything in GLOB.ntnet_relays)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
				if(relays.uid == params["targid"])
					target = relays
					break
			return TRUE
		if("PRG_reset")
			if(target)
				target.dos_sources.Remove(src)
				target = null
			executed = FALSE
			error = ""
			return TRUE
		if("PRG_execute")
			if(target)
				executed = TRUE
				target.dos_sources.Add(src)
				if(SSmodular_computers.intrusion_detection_enabled)
<<<<<<< HEAD
					SSnetworks.add_log("IDS WARNING - Excess traffic flood targeting relay [target.uid] detected from device: [computer.name]")
=======
					SSmodular_computers.add_log("IDS WARNING - Excess traffic flood targeting relay [target.uid] detected from device: [computer.name]")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
					SSmodular_computers.intrusion_detection_alarm = TRUE
			return TRUE

/datum/computer_file/program/ntnet_dos/ui_data(mob/user)
<<<<<<< HEAD
	var/list/data = get_header_data()
=======
	var/list/data = list()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	data["error"] = error
	if(target && executed)
		data["target"] = TRUE
		data["speed"] = dos_speed

		data["overload"] = target.dos_overload
		data["capacity"] = target.dos_capacity
	else
		data["target"] = FALSE
		data["relays"] = list()
<<<<<<< HEAD
		for(var/obj/machinery/ntnet_relay/relays as anything in SSmodular_computers.ntnet_relays)
=======
		for(var/obj/machinery/ntnet_relay/relays as anything in GLOB.ntnet_relays)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			data["relays"] += list(list("id" = relays.uid))
		data["focus"] = target ? target.uid : null

	return data
