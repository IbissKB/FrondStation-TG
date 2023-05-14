/datum/disease/cold
	name = "The Cold"
	desc = "If left untreated the subject will contract the flu."
	max_stages = 3
	cure_text = "Rest & Spaceacillin"
	cures = list(/datum/reagent/medicine/spaceacillin)
	agent = "XY-rhinovirus"
	viable_mobtypes = list(/mob/living/carbon/human)
	spreading_modifier = 0.5
	spread_text = "Airborne"
	severity = DISEASE_SEVERITY_NONTHREAT


<<<<<<< HEAD
/datum/disease/cold/stage_act(delta_time, times_fired)
=======
/datum/disease/cold/stage_act(seconds_per_tick, times_fired)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	if(!.)
		return

	switch(stage)
		if(2)
<<<<<<< HEAD
			if(DT_PROB(0.5, delta_time))
				affected_mob.emote("sneeze")
			if(DT_PROB(0.5, delta_time))
				affected_mob.emote("cough")
			if(DT_PROB(0.5, delta_time))
				to_chat(affected_mob, span_danger("Your throat feels sore."))
			if(DT_PROB(0.5, delta_time))
				to_chat(affected_mob, span_danger("Mucous runs down the back of your throat."))
			if((affected_mob.body_position == LYING_DOWN && DT_PROB(23, delta_time)) || DT_PROB(0.025, delta_time))  //changed FROM prob(10) until sleeping is fixed // Has sleeping been fixed yet?
=======
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("sneeze")
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("cough")
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Your throat feels sore."))
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Mucous runs down the back of your throat."))
			if((affected_mob.body_position == LYING_DOWN && SPT_PROB(23, seconds_per_tick)) || SPT_PROB(0.025, seconds_per_tick))  //changed FROM prob(10) until sleeping is fixed // Has sleeping been fixed yet?
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
				to_chat(affected_mob, span_notice("You feel better."))
				cure()
				return FALSE
		if(3)
<<<<<<< HEAD
			if(DT_PROB(0.5, delta_time))
				affected_mob.emote("sneeze")
			if(DT_PROB(0.5, delta_time))
				affected_mob.emote("cough")
			if(DT_PROB(0.5, delta_time))
				to_chat(affected_mob, span_danger("Your throat feels sore."))
			if(DT_PROB(0.5, delta_time))
				to_chat(affected_mob, span_danger("Mucous runs down the back of your throat."))
			if(DT_PROB(0.25, delta_time) && !LAZYFIND(affected_mob.disease_resistances, /datum/disease/flu))
=======
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("sneeze")
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("cough")
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Your throat feels sore."))
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Mucous runs down the back of your throat."))
			if(SPT_PROB(0.25, seconds_per_tick) && !LAZYFIND(affected_mob.disease_resistances, /datum/disease/flu))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
				var/datum/disease/Flu = new /datum/disease/flu()
				affected_mob.ForceContractDisease(Flu, FALSE, TRUE)
				cure()
				return FALSE
<<<<<<< HEAD
			if((affected_mob.body_position == LYING_DOWN && DT_PROB(12.5, delta_time)) || DT_PROB(0.005, delta_time))  //changed FROM prob(5) until sleeping is fixed
=======
			if((affected_mob.body_position == LYING_DOWN && SPT_PROB(12.5, seconds_per_tick)) || SPT_PROB(0.005, seconds_per_tick))  //changed FROM prob(5) until sleeping is fixed
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
				to_chat(affected_mob, span_notice("You feel better."))
				cure()
				return FALSE
