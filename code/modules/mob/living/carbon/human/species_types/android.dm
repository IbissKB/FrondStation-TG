/datum/species/android
	name = "Android"
	id = SPECIES_ANDROID
<<<<<<< HEAD
	species_traits = list(NOBLOOD, NO_DNA_COPY, NOTRANSSTING, NOSTOMACH)
=======
	species_traits = list(
		NO_DNA_COPY,
		NOTRANSSTING,
		NO_UNDERWEAR,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	inherent_traits = list(
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_GENELESS,
		TRAIT_LIMBATTACHMENT,
		TRAIT_NOBREATH,
		TRAIT_NOCLONELOSS,
		TRAIT_NOFIRE,
		TRAIT_NOHUNGER,
		TRAIT_NOMETABOLISM,
		TRAIT_PIERCEIMMUNE,
		TRAIT_RADIMMUNE,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHEAT,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_TOXIMMUNE,
<<<<<<< HEAD
=======
		TRAIT_NOBLOOD,
		TRAIT_NO_DEBRAIN_OVERLAY,
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	)

	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	meat = null
	mutanttongue = /obj/item/organ/internal/tongue/robot
<<<<<<< HEAD
=======
	mutantstomach = null
	mutantheart = null
	mutantliver = null
	mutantlungs = null
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	species_language_holder = /datum/language_holder/synthetic
	wing_types = list(/obj/item/organ/external/wings/functional/robotic)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT

	bodypart_overrides = list(
<<<<<<< HEAD
		BODY_ZONE_HEAD = /obj/item/bodypart/head/robot,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/robot,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/robot,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/robot,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/robot,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/robot,
=======
		BODY_ZONE_HEAD = /obj/item/bodypart/head/robot/android,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/robot/android,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/robot/android,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/robot/android,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/robot/android,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/robot/android,
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	)
	examine_limb_id = SPECIES_HUMAN

/datum/species/android/on_species_gain(mob/living/carbon/C)
	. = ..()
	// Androids don't eat, hunger or metabolise foods. Let's do some cleanup.
	C.set_safe_hunger_level()
