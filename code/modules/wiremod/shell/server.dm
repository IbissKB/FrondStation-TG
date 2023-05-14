/**
 * # Server
 *
 * Immobile (but not dense) shells that can interact with
 * world.
 */
/obj/structure/server
	name = "server"
	icon = 'icons/obj/wiremod.dmi'
	icon_state = "setup_stationary"

	density = TRUE
	light_system = MOVABLE_LIGHT
	light_on = FALSE

/obj/structure/server/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/shell, null, SHELL_CAPACITY_VERY_LARGE, SHELL_FLAG_REQUIRE_ANCHOR|SHELL_FLAG_USB_PORT)

/obj/structure/server/wrench_act(mob/living/user, obj/item/tool)
	set_anchored(!anchored)
	tool.play_tool_sound(src)
<<<<<<< HEAD
	balloon_alert(user, "You [anchored?"secure":"unsecure"] [src].")
=======
	balloon_alert(user, anchored ? "secured" : "unsecured")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return TRUE
