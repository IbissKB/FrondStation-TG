/obj/item/wallframe/light_fixture
	name = "light fixture frame"
	desc = "Used for building lights."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "tube-construct-item"
	result_path = /obj/structure/light_construct
	wall_external = TRUE

/obj/item/wallframe/light_fixture/small
	name = "small light fixture frame"
	icon_state = "bulb-construct-item"
	result_path = /obj/structure/light_construct/small
<<<<<<< HEAD
	custom_materials = list(/datum/material/iron=MINERAL_MATERIAL_AMOUNT)
=======
	custom_materials = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/wallframe/light_fixture/try_build(turf/on_wall, user)
	if(!..())
		return
	var/area/local_area = get_area(user)
	if(!local_area.static_lighting)
		to_chat(user, span_warning("You cannot place [src] in this area!"))
		return
	return TRUE
