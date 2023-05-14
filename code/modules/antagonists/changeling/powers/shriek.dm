/datum/action/changeling/resonant_shriek
	name = "Resonant Shriek"
	desc = "Our lungs and vocal cords shift, allowing us to briefly emit a noise that deafens and confuses the weak-minded. Costs 20 chemicals."
	helptext = "Emits a high-frequency sound that confuses and deafens humans, blows out nearby lights and overloads cyborg sensors."
	button_icon_state = "resonant_shriek"
	chemical_cost = 20
	dna_cost = 1
	req_human = TRUE

//A flashy ability, good for crowd control and sowing chaos.
/datum/action/changeling/resonant_shriek/sting_action(mob/user)
	..()
<<<<<<< HEAD
=======
	if(user.movement_type & VENTCRAWLING)
		user.balloon_alert(user, "can't shriek in pipes!")
		return FALSE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	for(var/mob/living/M in get_hearers_in_view(4, user))
		if(iscarbon(M))
			var/mob/living/carbon/C = M
			if(!C.mind || !C.mind.has_antag_datum(/datum/antagonist/changeling))
<<<<<<< HEAD
				var/obj/item/organ/internal/ears/ears = C.getorganslot(ORGAN_SLOT_EARS)
=======
				var/obj/item/organ/internal/ears/ears = C.get_organ_slot(ORGAN_SLOT_EARS)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
				if(ears)
					ears.adjustEarDamage(0, 30)
				C.adjust_confusion(25 SECONDS)
				C.set_jitter_if_lower(100 SECONDS)
			else
				SEND_SOUND(C, sound('sound/effects/screech.ogg'))

		if(issilicon(M))
			SEND_SOUND(M, sound('sound/weapons/flash.ogg'))
			M.Paralyze(rand(100,200))

	for(var/obj/machinery/light/L in range(4, user))
		L.on = TRUE
		L.break_light_tube()
		stoplag()
	return TRUE

/datum/action/changeling/dissonant_shriek
	name = "Dissonant Shriek"
	desc = "We shift our vocal cords to release a high-frequency sound that overloads nearby electronics. Costs 20 chemicals."
	button_icon_state = "dissonant_shriek"
	chemical_cost = 20
	dna_cost = 1

/datum/action/changeling/dissonant_shriek/sting_action(mob/user)
	..()
<<<<<<< HEAD
=======
	if(user.movement_type & VENTCRAWLING)
		user.balloon_alert(user, "can't shriek in pipes!")
		return FALSE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	empulse(get_turf(user), 2, 5, 1)
	for(var/obj/machinery/light/L in range(5, usr))
		L.on = TRUE
		L.break_light_tube()
		stoplag()

	return TRUE
