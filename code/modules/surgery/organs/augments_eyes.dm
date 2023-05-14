/obj/item/organ/internal/cyberimp/eyes
	name = "cybernetic eye implant"
	desc = "Implants for your eyes."
	icon_state = "eye_implant"
	implant_overlay = "eye_implant_overlay"
	slot = ORGAN_SLOT_EYES
	zone = BODY_ZONE_PRECISE_EYES
	w_class = WEIGHT_CLASS_TINY

// HUD implants
/obj/item/organ/internal/cyberimp/eyes/hud
	name = "HUD implant"
	desc = "These cybernetic eyes will display a HUD over everything you see. Maybe."
	slot = ORGAN_SLOT_HUD
	var/HUD_type = 0
	var/HUD_trait = null

<<<<<<< HEAD
/obj/item/organ/internal/cyberimp/eyes/hud/Insert(mob/living/carbon/eye_owner, special = 0, drop_if_replaced = FALSE)
	. = ..()
=======
/obj/item/organ/internal/cyberimp/eyes/hud/Insert(mob/living/carbon/eye_owner, special = FALSE, drop_if_replaced = TRUE)
	. = ..()
	if(!.)
		return
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(HUD_type)
		var/datum/atom_hud/hud = GLOB.huds[HUD_type]
		hud.show_to(eye_owner)
	if(HUD_trait)
		ADD_TRAIT(eye_owner, HUD_trait, ORGAN_TRAIT)

<<<<<<< HEAD
/obj/item/organ/internal/cyberimp/eyes/hud/Remove(mob/living/carbon/eye_owner, special = 0)
=======
/obj/item/organ/internal/cyberimp/eyes/hud/Remove(mob/living/carbon/eye_owner, special = FALSE)
	. = ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(HUD_type)
		var/datum/atom_hud/hud = GLOB.huds[HUD_type]
		hud.hide_from(eye_owner)
	if(HUD_trait)
		REMOVE_TRAIT(eye_owner, HUD_trait, ORGAN_TRAIT)
<<<<<<< HEAD
	return ..()
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/organ/internal/cyberimp/eyes/hud/medical
	name = "Medical HUD implant"
	desc = "These cybernetic eye implants will display a medical HUD over everything you see."
	HUD_type = DATA_HUD_MEDICAL_ADVANCED
	HUD_trait = TRAIT_MEDICAL_HUD

/obj/item/organ/internal/cyberimp/eyes/hud/security
	name = "Security HUD implant"
	desc = "These cybernetic eye implants will display a security HUD over everything you see."
	HUD_type = DATA_HUD_SECURITY_ADVANCED
	HUD_trait = TRAIT_SECURITY_HUD
<<<<<<< HEAD
=======
	organ_flags = ALL
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/organ/internal/cyberimp/eyes/hud/diagnostic
	name = "Diagnostic HUD implant"
	desc = "These cybernetic eye implants will display a diagnostic HUD over everything you see."
	HUD_type = DATA_HUD_DIAGNOSTIC_ADVANCED

/obj/item/organ/internal/cyberimp/eyes/hud/security/syndicate
	name = "Contraband Security HUD Implant"
	desc = "A Cybersun Industries brand Security HUD Implant. These illicit cybernetic eye implants will display a security HUD over everything you see."
<<<<<<< HEAD
	syndicate_implant = TRUE
=======
	organ_flags = ORGAN_SYNTHETIC | ORGAN_HIDDEN
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
