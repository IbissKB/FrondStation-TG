<<<<<<< HEAD
/obj/item/organ/internal/brain/on_life(delta_time, times_fired) //All your horny is here *points to the head*
=======
/obj/item/organ/internal/brain/on_life(seconds_per_tick, times_fired) //All your horny is here *points to the head*
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	var/mob/living/carbon/human/brain_owner = owner
	if(istype(brain_owner, /mob/living/carbon/human) && brain_owner.client?.prefs?.read_preference(/datum/preference/toggle/erp/sex_toy))
		if(!(organ_flags & ORGAN_FAILING))
<<<<<<< HEAD
			brain_owner.dna.species.handle_arousal(brain_owner, delta_time, times_fired)
=======
			brain_owner.dna.species.handle_arousal(brain_owner, seconds_per_tick, times_fired)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
