/**
 * Pitchfork item
 *
 * Essentially spears with different stats and sprites.
 * Also fireproof for some reason.
 */
/obj/item/pitchfork
<<<<<<< HEAD
=======
	icon = 'icons/obj/weapons/spear.dmi'
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon_state = "pitchfork0"
	base_icon_state = "pitchfork"
	lefthand_file = 'icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/polearms_righthand.dmi'
	name = "pitchfork"
	desc = "A simple tool used for moving hay."
	force = 7
	throwforce = 15
	w_class = WEIGHT_CLASS_BULKY
	attack_verb_continuous = list("attacks", "impales", "pierces")
	attack_verb_simple = list("attack", "impale", "pierce")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED
	max_integrity = 200
<<<<<<< HEAD
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 100, ACID = 30)
	resistance_flags = FIRE_PROOF

=======
	armor_type = /datum/armor/item_pitchfork
	resistance_flags = FIRE_PROOF

/datum/armor/item_pitchfork
	fire = 100
	acid = 30

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/pitchfork/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=7, force_wielded=15, icon_wielded="[base_icon_state]1")

/obj/item/pitchfork/update_icon_state()
	icon_state = "[base_icon_state]0"
	return ..()
