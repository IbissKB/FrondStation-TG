/obj/machinery/button
	icon = 'modular_skyrat/modules/aesthetics/buttons/icons/buttons.dmi'
<<<<<<< HEAD
	var/light_mask = "button-light-mask"

/obj/machinery/button/door/update_overlays()
	. = ..()
	if(!light_mask)
		return

	if(!(machine_stat & (NOPOWER|BROKEN)) && !panel_open)
		. += emissive_appearance(icon, light_mask, src, alpha = alpha)
=======
	light_mask = "button-light-mask"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
