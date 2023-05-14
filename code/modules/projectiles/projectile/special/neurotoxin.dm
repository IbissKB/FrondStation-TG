/obj/projectile/neurotoxin
	name = "neurotoxin spit"
	icon_state = "neurotoxin"
	damage = 5
	damage_type = TOX
<<<<<<< HEAD
	nodamage = FALSE
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	paralyze = 10 SECONDS
	armor_flag = BIO
	impact_effect_type = /obj/effect/temp_visual/impact_effect/neurotoxin

/obj/projectile/neurotoxin/on_hit(atom/target, blocked = FALSE)
	if(isalien(target))
<<<<<<< HEAD
		paralyze = 0
		nodamage = TRUE
=======
		paralyze = 0 SECONDS
		damage = 0
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return ..()

/obj/projectile/neurotoxin/damaging //for ai controlled aliums
	damage = 30
	paralyze = 0 SECONDS
