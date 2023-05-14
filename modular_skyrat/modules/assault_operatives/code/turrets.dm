//TURRETS

/obj/machinery/porta_turret/syndicate/assaultops
	use_power = IDLE_POWER_USE
	req_access = list(ACCESS_SYNDICATE)
	faction = list(ROLE_SYNDICATE)
<<<<<<< HEAD
	mode = TURRET_STUN
=======
	mode = 0
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	max_integrity = 200

//Exterior ship turrets
/obj/machinery/porta_turret/syndicate/assaultops/shuttle
	scan_range = 9
	lethal_projectile = /obj/projectile/bullet/a357
	lethal_projectile_sound = 'modular_skyrat/modules/aesthetics/guns/sound/sniperrifle.ogg'
	stun_projectile = /obj/projectile/energy/electrode
	stun_projectile_sound = 'sound/weapons/taser.ogg'
	max_integrity = 600
<<<<<<< HEAD
	armor = list(MELEE = 50, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 80, BIO = 0, FIRE = 90, ACID = 90)

//Internal ship and base turrets
=======
	armor_type = /datum/armor/assaultops_shuttle

//Internal ship and base turrets

/datum/armor/assaultops_shuttle
	melee = 50
	bullet = 30
	laser = 30
	energy = 30
	bomb = 80
	fire = 90
	acid = 90

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/machinery/porta_turret/syndicate/assaultops/internal
	always_up = FALSE
	has_cover = TRUE
	desc = "An energy blaster auto-turret."
	icon_state = "standard_stun"
	base_icon_state = "standard"
	stun_projectile = /obj/projectile/energy/electrode
	stun_projectile_sound = 'sound/weapons/taser.ogg'
	lethal_projectile = /obj/projectile/beam/laser/heavylaser
	lethal_projectile_sound = 'sound/weapons/lasercannonfire.ogg'
