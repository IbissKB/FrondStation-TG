/mob/living/simple_animal/hostile/zombie
	var/no_corpse = FALSE
<<<<<<< HEAD
	var/list/possible_jobs = list(
		JOB_ASSISTANT,
		JOB_STATION_ENGINEER,
		JOB_COOK,
		JOB_BARTENDER,
		JOB_CHEMIST,
		JOB_MEDICAL_DOCTOR,
		JOB_VIROLOGIST,
		JOB_CLOWN,
		JOB_MIME,
		JOB_SCIENTIST,
		JOB_CARGO_TECHNICIAN,
		JOB_SECURITY_OFFICER,
		JOB_SECURITY_MEDIC,
		JOB_GENETICIST,
		JOB_BOTANIST,
	)
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/mob/living/simple_animal/hostile/zombie/nocorpse
	no_corpse = TRUE

<<<<<<< HEAD
/mob/living/simple_animal/hostile/zombie/proc/setup_visuals()
	var/picked_job = pick(possible_jobs)
	var/datum/job/zombie_job = SSjob.GetJob(picked_job)
	var/datum/outfit/zombie_outfit
	if(zombie_job.outfit)
		zombie_outfit = new zombie_job.outfit
		// They have claws now.
		zombie_outfit.r_hand = null
		zombie_outfit.l_hand = null

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/mob/living/simple_animal/hostile/zombie/cheesezombie
	name = "Cheese Zombie"
	desc = "Oh God it stinks!!"
	icon = 'modular_skyrat/master_files/icons/mob/newmobs.dmi'
	icon_state = "cheesezomb"
	icon_living = "cheesezomb"
	maxHealth = 100
	health = 100
	del_on_death = 1
	loot = list(/obj/effect/gibspawner/human)

