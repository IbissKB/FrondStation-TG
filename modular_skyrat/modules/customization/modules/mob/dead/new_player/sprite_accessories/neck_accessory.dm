/datum/sprite_accessory/neck_accessory
	icon = 'modular_skyrat/master_files/icons/mob/sprite_accessory/neck_accessory.dmi'
	key = "neck_acc"
	generic = "Neck Accessory"
	relevent_layers = list(BODY_ADJ_LAYER, BODY_FRONT_LAYER)
	genetic = TRUE
<<<<<<< HEAD
=======
	organ_type = /obj/item/organ/external/neck_accessory
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/sprite_accessory/neck_accessory/none
	name = "None"
	icon_state = "none"
	color_src = null
	factual = FALSE

<<<<<<< HEAD
/datum/sprite_accessory/neck_accessory/is_hidden(mob/living/carbon/human/wearer, obj/item/bodypart/HD)
=======
/datum/sprite_accessory/neck_accessory/is_hidden(mob/living/carbon/human/wearer)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(wearer.w_uniform)
		if(key in wearer.try_hide_mutant_parts)
			return TRUE
	return FALSE

/datum/sprite_accessory/neck_accessory/sylveon_bow
	name = "Sylveon Neck Bow"
	icon_state = "sylveon_bow"
	recommended_species = list(SPECIES_MAMMAL, SPECIES_HUMAN, SPECIES_SYNTH, SPECIES_FELINE, SPECIES_HUMANOID)
	relevent_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)
	color_src = USE_MATRIXED_COLORS
	ckey_whitelist = list("whirlsam" = TRUE)
