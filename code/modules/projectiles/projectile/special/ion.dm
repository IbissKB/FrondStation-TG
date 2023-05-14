/obj/projectile/ion
	name = "ion bolt"
	icon_state = "ion"
	damage = 0
	damage_type = BURN
<<<<<<< HEAD
	nodamage = TRUE
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	armor_flag = ENERGY
	impact_effect_type = /obj/effect/temp_visual/impact_effect/ion
	var/emp_radius = 1

/obj/projectile/ion/on_hit(atom/target, blocked = FALSE)
	..()
	empulse(target, emp_radius, emp_radius)
	return BULLET_ACT_HIT

/obj/projectile/ion/weak
	emp_radius = 0
