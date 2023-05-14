/obj/structure/closet/secure_closet
	name = "secure locker"
	desc = "It's a card-locked storage unit."
	locked = TRUE
	icon_state = "secure"
	max_integrity = 250
<<<<<<< HEAD
	armor = list(MELEE = 30, BULLET = 50, LASER = 50, ENERGY = 100, BOMB = 0, BIO = 0, FIRE = 80, ACID = 80)
	secure = TRUE
	damage_deflection = 20
=======
	armor_type = /datum/armor/closet_secure_closet
	secure = TRUE
	damage_deflection = 20
	material_drop_amount = 5

/datum/armor/closet_secure_closet
	melee = 30
	bullet = 50
	laser = 50
	energy = 100
	fire = 80
	acid = 80
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/structure/closet/secure_closet/Initialize(mapload)
	. = ..()
	RegisterSignal(SSdcs, COMSIG_GLOB_GREY_TIDE, PROC_REF(grey_tide))

/obj/structure/closet/secure_closet/proc/grey_tide(datum/source, list/grey_tide_areas)
	SIGNAL_HANDLER

	if(!is_station_level(z))
		return

	for(var/area_type in grey_tide_areas)
		if(!istype(get_area(src), area_type))
			continue
		locked = FALSE
		update_appearance(UPDATE_ICON)
