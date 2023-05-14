/mob/living/simple_animal/hostile/jungle
	vision_range = 5
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
<<<<<<< HEAD
	faction = list("jungle")
=======
	faction = list(FACTION_JUNGLE)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	obj_damage = 30
	environment_smash = ENVIRONMENT_SMASH_WALLS
	minbodytemp = 0
	maxbodytemp = 450
	response_harm_continuous = "strikes"
	response_harm_simple = "strike"
	status_flags = NONE
	combat_mode = TRUE
<<<<<<< HEAD
	see_in_dark = 4
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
=======
	// Let's do a blue, since they'll be on green turfs if this shit is ever finished
	lighting_cutoff_red = 5
	lighting_cutoff_green = 20
	lighting_cutoff_blue = 25
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	mob_size = MOB_SIZE_LARGE
