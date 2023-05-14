/obj/item/botpad_remote
	name = "Bot pad controller"
<<<<<<< HEAD
	desc = "Use this device to control the connected bot pad. Left-click for launch, right-click for recall."
=======
	desc = "Use this device to control the connected bot pad."
	desc_controls = "Left-click for launch, right-click for recall."
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon = 'icons/obj/device.dmi'
	icon_state = "botpad_controller"
	w_class = WEIGHT_CLASS_SMALL
	// ID of the remote, used for linking up
	var/id = "botlauncher"
	var/obj/machinery/botpad/connected_botpad

/obj/item/botpad_remote/Destroy()
	if(connected_botpad)
		connected_botpad.connected_remote = null
		connected_botpad = null
	return ..()

/obj/item/botpad_remote/attack_self(mob/living/user)
	playsound(src, get_sfx(SFX_TERMINAL_TYPE), 25, FALSE)
	try_launch(user)
	return

/obj/item/botpad_remote/attack_self_secondary(mob/living/user)
	playsound(src, get_sfx(SFX_TERMINAL_TYPE), 25, FALSE)
	if(connected_botpad)
		connected_botpad.recall(user)
		return
<<<<<<< HEAD
	user?.balloon_alert(user, "Controller has no connected pad!")
=======
	user?.balloon_alert(user, "no connected pad!")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return

/obj/item/botpad_remote/multitool_act(mob/living/user, obj/item/tool)
	if(!multitool_check_buffer(user, tool))
		return
	var/obj/item/multitool/multitool = tool
	if(istype(multitool.buffer, /obj/machinery/botpad))
		var/obj/machinery/botpad/buffered_remote = multitool.buffer
		if(buffered_remote == connected_botpad)
			to_chat(user, span_warning("Controller cannot connect to its own botpad!"))
		else if(!connected_botpad && istype(buffered_remote, /obj/machinery/botpad))
			connected_botpad = buffered_remote
			connected_botpad.connected_remote = src
			connected_botpad.id = id
			multitool.buffer = null
			to_chat(user, span_notice("You connect the controller to the pad with data from the [multitool.name]'s buffer."))
		else
			to_chat(user, span_warning("Unable to upload!"))

/obj/item/botpad_remote/proc/try_launch(mob/living/user)
	if(!connected_botpad)
<<<<<<< HEAD
		user?.balloon_alert(user, "Controller has no connected pad!")
		return
	if(connected_botpad.panel_open)
		user?.balloon_alert(user, "Connected pad has its panel open! It won't work!")
		return
	if(!(locate(/mob/living/simple_animal/bot) in get_turf(connected_botpad)))
		user?.balloon_alert(user, "No bots detected on the pad!")
=======
		user?.balloon_alert(user, "no connected pad!")
		return
	if(connected_botpad.panel_open)
		user?.balloon_alert(user, "close the panel!")
		return
	if(!(locate(/mob/living/simple_animal/bot) in get_turf(connected_botpad)))
		user?.balloon_alert(user, "no bots detected on the pad!")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		return
	connected_botpad.launch(user)
