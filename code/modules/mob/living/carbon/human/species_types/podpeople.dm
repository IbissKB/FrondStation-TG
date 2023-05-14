/datum/species/pod
	// A mutation caused by a human being ressurected in a revival pod. These regain health in light, and begin to wither in darkness.
	name = "\improper Podperson"
	plural_form = "Podpeople"
	id = SPECIES_PODPERSON
<<<<<<< HEAD
	species_traits = list(MUTCOLORS, EYECOLOR, HAS_FLESH, HAS_BONE)
=======
	species_traits = list(
		MUTCOLORS,
		EYECOLOR,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	inherent_traits = list(
		TRAIT_PLANT_SAFE,
	)
	external_organs = list(
<<<<<<< HEAD
		/obj/item/organ/external/pod_hair = "None",
	)
	inherent_biotypes = MOB_ORGANIC | MOB_HUMANOID | MOB_PLANT
	inherent_factions = list("plants", "vines")
=======
		// /obj/item/organ/external/pod_hair = "None", // SKYRAT EDIT REMOVAL - Customization (it messes up unit tests.)
	)
	inherent_biotypes = MOB_ORGANIC | MOB_HUMANOID | MOB_PLANT
	inherent_factions = list(FACTION_PLANTS, FACTION_VINES)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	burnmod = 1.25
	heatmod = 1.5
	payday_modifier = 0.75
	meat = /obj/item/food/meat/slab/human/mutant/plant
	exotic_blood = /datum/reagent/water
	disliked_food = MEAT | DAIRY | SEAFOOD | BUGS
	liked_food = VEGETABLES | FRUIT | GRAIN
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/plant

	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/pod,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/pod,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/pod,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/pod,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/pod,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/pod,
	)

	ass_image = 'icons/ass/asspodperson.png'

<<<<<<< HEAD
/datum/species/pod/spec_life(mob/living/carbon/human/H, delta_time, times_fired)
=======
/datum/species/pod/on_species_gain(mob/living/carbon/new_podperson, datum/species/old_species, pref_load)
	. = ..()
	if(ishuman(new_podperson))
		update_mail_goodies(new_podperson)

/datum/species/pod/update_quirk_mail_goodies(mob/living/carbon/human/recipient, datum/quirk/quirk, list/mail_goodies = list())
	if(istype(quirk, /datum/quirk/blooddeficiency))
		mail_goodies += list(
			/obj/item/reagent_containers/blood/podperson
		)
	return ..()

/datum/species/pod/spec_life(mob/living/carbon/human/H, seconds_per_tick, times_fired)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(H.stat == DEAD)
		return

	var/light_amount = 0 //how much light there is in the place, affects receiving nutrition and healing
	if(isturf(H.loc)) //else, there's considered to be no light
		var/turf/T = H.loc
		light_amount = min(1, T.get_lumcount()) - 0.5
<<<<<<< HEAD
		H.adjust_nutrition(5 * light_amount * delta_time)
		if(light_amount > 0.2) //if there's enough light, heal
			H.heal_overall_damage(0.5 * delta_time, 0.5 * delta_time, BODYTYPE_ORGANIC)
			H.adjustToxLoss(-0.5 * delta_time)
			H.adjustOxyLoss(-0.5 * delta_time)
=======
		H.adjust_nutrition(5 * light_amount * seconds_per_tick)
		if(light_amount > 0.2) //if there's enough light, heal
			H.heal_overall_damage(brute = 0.5 * seconds_per_tick, burn = 0.5 * seconds_per_tick, required_bodytype = BODYTYPE_ORGANIC)
			H.adjustToxLoss(-0.5 * seconds_per_tick)
			H.adjustOxyLoss(-0.5 * seconds_per_tick)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	if(H.nutrition > NUTRITION_LEVEL_ALMOST_FULL) //don't make podpeople fat because they stood in the sun for too long
		H.set_nutrition(NUTRITION_LEVEL_ALMOST_FULL)

	if(H.nutrition < NUTRITION_LEVEL_STARVING + 50)
<<<<<<< HEAD
		H.take_overall_damage(1 * delta_time, 0)
	..()

/datum/species/pod/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H, delta_time, times_fired)
	if(chem.type == /datum/reagent/toxin/plantbgone)
		H.adjustToxLoss(3 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
		H.reagents.remove_reagent(chem.type, REAGENTS_METABOLISM * delta_time)
		return TRUE
=======
		H.take_overall_damage(brute = 1 * seconds_per_tick, required_bodytype = BODYTYPE_ORGANIC)
	..()

/datum/species/pod/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H, seconds_per_tick, times_fired)
	if(chem.type == /datum/reagent/toxin/plantbgone)
		H.adjustToxLoss(3 * REM * seconds_per_tick)
		H.reagents.remove_reagent(chem.type, REAGENTS_METABOLISM * seconds_per_tick)
		return TRUE
	return ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

// SKYRAT EDIT ADDITION
/datum/species/pod/get_species_description()
	return "Plant lore!"

/datum/species/pod/get_species_lore()
	return list("You're a plant!")
// SKYRAT EDIT END

/datum/species/pod/randomize_features(mob/living/carbon/human_mob)
	randomize_external_organs(human_mob)
