/obj/machinery/computer/shuttle/pod/advanced
	icon = 'modular_skyrat/modules/advanced_shuttles/icons/computer.dmi'
	icon_state = "intercom"
<<<<<<< HEAD
=======
	icon_screen = "null"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	layer = ABOVE_OBJ_LAYER

	connectable = FALSE //connecting_computer change: since icon_state is not a typical console, it cannot be connectable.

<<<<<<< HEAD
=======
/obj/machinery/computer/shuttle/pod/advanced/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	obj_flags |= EMAGGED
	locked = FALSE
	to_chat(user, span_warning("You fry the pod's alert level checking system."))

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/machinery/computer/emergency_shuttle/advanced
	icon = 'modular_skyrat/modules/advanced_shuttles/icons/computer.dmi'
	icon_state = "computer"
	icon_keyboard = ""
	icon_screen = ""

	connectable = FALSE //connecting_computer change: since icon_state is not a typical console, it cannot be connectable.

/obj/machinery/computer/crew/shuttle
	icon = 'modular_skyrat/modules/advanced_shuttles/icons/computer.dmi'
	icon_state = "computer_left"
	icon_keyboard = ""
	icon_screen = ""

	connectable = FALSE //connecting_computer change: since icon_state is not a typical console, it cannot be connectable.

/obj/machinery/computer/security/shuttle
	icon = 'modular_skyrat/modules/advanced_shuttles/icons/computer.dmi'
	icon_state = "computer_right"
	icon_keyboard = ""
	icon_screen = ""

	connectable = FALSE //connecting_computer change: since icon_state is not a typical console, it cannot be connectable.

/obj/machinery/computer/shuttle/ferry/shuttle
	icon = 'modular_skyrat/modules/advanced_shuttles/icons/computer.dmi'
	icon_state = "computer"
	icon_keyboard = ""
	icon_screen = ""

	connectable = FALSE //connecting_computer change: since icon_state is not a typical console, it cannot be connectable.
