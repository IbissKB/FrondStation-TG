/datum/mutation/human/radioactive
	name = "Radioactivity"
	desc = "A volatile mutation that causes the host to sent out deadly beta radiation. This affects both the hosts and their surroundings."
	quality = NEGATIVE
	text_gain_indication = "<span class='warning'>You can feel it in your bones!</span>"
	instability = 5
	difficulty = 8
	power_coeff = 1
<<<<<<< HEAD

	COOLDOWN_DECLARE(last_radioactive_pulse)

/datum/mutation/human/radioactive/on_life(delta_time, times_fired)
	if (!COOLDOWN_FINISHED(src, last_radioactive_pulse))
		return

	COOLDOWN_START(src, last_radioactive_pulse, 5 SECONDS)
	radiation_pulse(
		owner,
		max_range = 1 * (GET_MUTATION_POWER(src) * 2),
		threshold = RAD_MEDIUM_INSULATION,
	)

/datum/mutation/human/radioactive/New(class_ = MUT_OTHER, timer, datum/mutation/human/copymut)
	..()
=======
	/// Weakref to our radiation emitter component
	var/datum/weakref/radioactivity_source_ref

/datum/mutation/human/radioactive/New(class_ = MUT_OTHER, timer, datum/mutation/human/copymut)
	. = ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(!(type in visual_indicators))
		visual_indicators[type] = list(mutable_appearance('icons/effects/genetics.dmi', "radiation", -MUTATIONS_LAYER))

/datum/mutation/human/radioactive/get_visual_indicator()
	return visual_indicators[type][1]
<<<<<<< HEAD
=======

/datum/mutation/human/radioactive/on_acquiring(mob/living/carbon/human/acquirer)
	. = ..()
	var/datum/component/radioactive_emitter/radioactivity_source = make_radioactive(acquirer)
	radioactivity_source_ref = WEAKREF(radioactivity_source)

/datum/mutation/human/radioactive/modify()
	. = ..()
	make_radioactive(owner)

/**
 * Makes the passed mob radioactive, or if they're already radioactive,
 * update their radioactivity to the newly set values
 */
/datum/mutation/human/radioactive/proc/make_radioactive(mob/living/carbon/human/who)
	return who.AddComponent(
		/datum/component/radioactive_emitter, \
		cooldown_time = 5 SECONDS, \
		range = 1 * (GET_MUTATION_POWER(src) * 2), \
		threshold = RAD_MEDIUM_INSULATION, \
	)

/datum/mutation/human/radioactive/on_losing(mob/living/carbon/human/owner)
	QDEL_NULL(radioactivity_source_ref)
	return ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
