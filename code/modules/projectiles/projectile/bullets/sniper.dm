<<<<<<< HEAD
// .50 (Sniper)

/obj/projectile/bullet/p50    /////OVERRIDEN IN MODULAR > BULLETREBALANCE
	name =".50 bullet"
	speed = 0.2 //SKYRAT EDIT: Original value (0.4)
=======
// .50 BMG (Sniper)

/obj/projectile/bullet/p50
	name =".50 BMG bullet"
	speed = 0.4
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	range = 400 // Enough to travel from one corner of the Z to the opposite corner and then some.
	damage = 70
	paralyze = 100
	dismemberment = 50
<<<<<<< HEAD
	armour_penetration = 50
	var/breakthings = TRUE

/obj/projectile/bullet/p50/on_hit(atom/target, blocked = 0)
	if(isobj(target) && (blocked != 100) && breakthings)
		var/obj/O = target
		O.take_damage(80, BRUTE, BULLET, FALSE)
	return ..()

/obj/projectile/bullet/p50/soporific
	name =".50 soporific bullet"
	armour_penetration = 0
	damage = 0
	dismemberment = 0
	paralyze = 0
	breakthings = FALSE

/obj/projectile/bullet/p50/soporific/on_hit(atom/target, blocked = FALSE)
	if((blocked != 100) && isliving(target))
		var/mob/living/L = target
		L.Sleeping(400)
	return ..()

/obj/projectile/bullet/p50/penetrator
	name = "penetrator round"
=======
	catastropic_dismemberment = TRUE
	armour_penetration = 50
	///Determines object damage.
	var/object_damage = 80
	///Determines how much additional damage the round does to mechs.
	var/mecha_damage = 10

/obj/projectile/bullet/p50/on_hit(atom/target, blocked = 0)
	if(isobj(target) && (blocked != 100))
		var/obj/thing_to_break = target
		var/damage_to_deal = object_damage
		if(ismecha(thing_to_break) && mecha_damage)
			damage_to_deal += mecha_damage
		if(damage_to_deal)
			thing_to_break.take_damage(damage_to_deal, BRUTE, BULLET, FALSE)
	return ..()

/obj/projectile/bullet/p50/surplus
	name =".50 BMG surplus bullet"
	armour_penetration = 0
	paralyze = 0
	dismemberment = 0
	catastropic_dismemberment = FALSE

/obj/projectile/bullet/p50/disruptor
	name =".50 BMG disruptor bullet"
	damage_type = STAMINA
	paralyze = 0
	dismemberment = 0
	catastropic_dismemberment = FALSE
	object_damage = 0
	mecha_damage = 100
	var/emp_radius = 2

/obj/projectile/bullet/p50/disruptor/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if((blocked != 100) && isliving(target))
		var/mob/living/living_guy = target
		living_guy.Sleeping(40 SECONDS) //Yes, its really 40 seconds of sleep, I hope you had your morning coffee.
	if(issilicon(target)) //also especially good against borgs
		var/mob/living/silicon/borg_boy = target
		borg_boy.apply_damage(damage, BRUTE)
	empulse(target, emp_radius, emp_radius)

/obj/projectile/bullet/p50/incendiary
	name =".50 BMG incendiary bullet"
	damage_type = BURN
	paralyze = 0
	dismemberment = 0
	catastropic_dismemberment = FALSE
	object_damage = 30
	mecha_damage = 0

/obj/projectile/bullet/p50/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/poor_burning_dork = target
		poor_burning_dork.adjust_fire_stacks(20)
		poor_burning_dork.ignite_mob()
	for(var/turf/nearby_turf as anything in RANGE_TURFS(2, target))
		new /obj/effect/hotspot(nearby_turf)

/obj/projectile/bullet/p50/penetrator
	name = ".50 BMG penetrator round"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon_state = "gauss"
	damage = 60
	range = 50
	projectile_piercing = PASSMOB|PASSVEHICLE
	projectile_phasing = ~(PASSMOB|PASSVEHICLE)
	phasing_ignore_direct_target = TRUE
	dismemberment = 0 //It goes through you cleanly.
<<<<<<< HEAD
	paralyze = 0
	breakthings = FALSE

/obj/projectile/bullet/p50/penetrator/shuttle //Nukeop Shuttle Variety
=======
	catastropic_dismemberment = FALSE
	paralyze = 0
	object_damage = 0

/obj/projectile/bullet/p50/penetrator/shuttle //Nukeop Shuttle Variety
	name = ".50 BMG aggression dissuasion round"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon_state = "gaussstrong"
	damage = 25
	speed = 0.3
	range = 16

/obj/projectile/bullet/p50/marksman
<<<<<<< HEAD
	name = ".50 marksman round"
	damage = 50
=======
	name = ".50 BMG marksman round"
	damage = 50
	range = 50
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	paralyze = 0
	tracer_type = /obj/effect/projectile/tracer/sniper
	impact_type = /obj/effect/projectile/impact/sniper
	muzzle_type = /obj/effect/projectile/muzzle/sniper
	hitscan = TRUE
	impact_effect_type = null
	hitscan_light_intensity = 3
	hitscan_light_range = 0.75
<<<<<<< HEAD
	hitscan_light_color_override = LIGHT_COLOR_YELLOW
	muzzle_flash_intensity = 5
	muzzle_flash_range = 1
	muzzle_flash_color_override = LIGHT_COLOR_YELLOW
	impact_light_intensity = 5
	impact_light_range = 1
	impact_light_color_override = LIGHT_COLOR_YELLOW
=======
	hitscan_light_color_override = LIGHT_COLOR_DIM_YELLOW
	muzzle_flash_intensity = 5
	muzzle_flash_range = 1
	muzzle_flash_color_override = LIGHT_COLOR_DIM_YELLOW
	impact_light_intensity = 5
	impact_light_range = 1
	impact_light_color_override = LIGHT_COLOR_DIM_YELLOW
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ricochets_max = 1
	ricochet_chance = 100
	ricochet_auto_aim_angle = 45
	ricochet_auto_aim_range = 15
	ricochet_incidence_leeway = 90
	ricochet_decay_damage = 1
	ricochet_shoots_firer = FALSE
