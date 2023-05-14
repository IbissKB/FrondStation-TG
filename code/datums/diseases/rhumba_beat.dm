/datum/disease/rhumba_beat
	name = "The Rhumba Beat"
	max_stages = 5
	spread_text = "On contact"
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_CONTACT_SKIN | DISEASE_SPREAD_CONTACT_FLUIDS
	cure_text = "Chick Chicky Boom!"
	cures = list("plasma")
	agent = "Unknown"
	viable_mobtypes = list(/mob/living/carbon/human)
	spreading_modifier = 1
	severity = DISEASE_SEVERITY_BIOHAZARD

<<<<<<< HEAD
/datum/disease/rhumba_beat/stage_act(delta_time, times_fired)
=======
/datum/disease/rhumba_beat/stage_act(seconds_per_tick, times_fired)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	if(!.)
		return

	switch(stage)
		if(2)
<<<<<<< HEAD
			if(DT_PROB(26, delta_time))
				affected_mob.adjustFireLoss(5, FALSE)
			if(DT_PROB(0.5, delta_time))
				to_chat(affected_mob, span_danger("You feel strange..."))
		if(3)
			if(DT_PROB(2.5, delta_time))
				to_chat(affected_mob, span_danger("You feel the urge to dance..."))
			else if(DT_PROB(2.5, delta_time))
				affected_mob.emote("gasp")
			else if(DT_PROB(5, delta_time))
				to_chat(affected_mob, span_danger("You feel the need to chick chicky boom..."))
		if(4)
			if(DT_PROB(10, delta_time))
=======
			if(SPT_PROB(26, seconds_per_tick))
				affected_mob.adjustFireLoss(5, FALSE)
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("You feel strange..."))
		if(3)
			if(SPT_PROB(2.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("You feel the urge to dance..."))
			else if(SPT_PROB(2.5, seconds_per_tick))
				affected_mob.emote("gasp")
			else if(SPT_PROB(5, seconds_per_tick))
				to_chat(affected_mob, span_danger("You feel the need to chick chicky boom..."))
		if(4)
			if(SPT_PROB(10, seconds_per_tick))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
				if(prob(50))
					affected_mob.adjust_fire_stacks(2)
					affected_mob.ignite_mob()
				else
					affected_mob.emote("gasp")
					to_chat(affected_mob, span_danger("You feel a burning beat inside..."))
		if(5)
			to_chat(affected_mob, span_danger("Your body is unable to contain the Rhumba Beat..."))
<<<<<<< HEAD
			if(DT_PROB(29, delta_time))
=======
			if(SPT_PROB(29, seconds_per_tick))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
				explosion(affected_mob, devastation_range = -1, light_impact_range = 2, flame_range = 2, flash_range = 3, adminlog = FALSE, explosion_cause = src) // This is equivalent to a lvl 1 fireball
