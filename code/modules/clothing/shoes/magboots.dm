<<<<<<< HEAD
/obj/item/clothing/shoes/magboots
	desc = "Magnetic boots, often used during extravehicular activity to ensure the user remains safely attached to the vehicle."
	name = "magboots"
	icon_state = "magboots0"
	inhand_icon_state = "magboots"
	var/magboot_state = "magboots"
	var/magpulse = FALSE
	var/slowdown_active = 2
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 90, FIRE = 0, ACID = 0)
=======
/datum/armor/shoes_magboots
	bio = 90

/obj/item/clothing/shoes/magboots
	name = "magboots"
	desc = "Magnetic boots, often used during extravehicular activity to ensure the user remains safely attached to the vehicle."
	icon_state = "magboots0"
	base_icon_state = "magboots"
	inhand_icon_state = "magboots"
	armor_type = /datum/armor/shoes_magboots
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	actions_types = list(/datum/action/item_action/toggle)
	strip_delay = 70
	equip_delay_other = 70
	resistance_flags = FIRE_PROOF

<<<<<<< HEAD
/obj/item/clothing/shoes/magboots/equipped(mob/user, slot)
	. = ..()
	if(slot & ITEM_SLOT_FEET)
		update_gravity_trait(user)
	else
		REMOVE_TRAIT(user, TRAIT_NEGATES_GRAVITY, type)

/obj/item/clothing/shoes/magboots/dropped(mob/user)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_NEGATES_GRAVITY, type)
=======
	slowdown = SHOES_SLOWDOWN
	/// Whether the magpulse system is active
	var/magpulse = FALSE
	/// Slowdown applied wwhen magpulse is active. This is added onto existing slowdown
	var/slowdown_active = 2
	/// A list of traits we apply when we get activated
	var/list/active_traits = list(TRAIT_NO_SLIP_WATER, TRAIT_NO_SLIP_ICE, TRAIT_NO_SLIP_SLIDE, TRAIT_NEGATES_GRAVITY)

/obj/item/clothing/shoes/magboots/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	RegisterSignal(src, COMSIG_SPEED_POTION_APPLIED, PROC_REF(on_speed_potioned))

/// Signal handler for [COMSIG_SPEED_POTION_APPLIED]. Speed potion removes the active slowdown
/obj/item/clothing/shoes/magboots/proc/on_speed_potioned(datum/source)
	SIGNAL_HANDLER

	slowdown_active = 0
	// Don't need to touch the actual slowdown here, since the speed potion does it for us
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/shoes/magboots/verb/toggle()
	set name = "Toggle Magboots"
	set category = "Object"
	set src in usr
<<<<<<< HEAD
=======

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(!can_use(usr))
		return
	attack_self(usr)

/obj/item/clothing/shoes/magboots/attack_self(mob/user)
<<<<<<< HEAD
	if(magpulse)
		clothing_flags &= ~NOSLIP
		slowdown = SHOES_SLOWDOWN
	else
		clothing_flags |= NOSLIP
		slowdown = slowdown_active
	magpulse = !magpulse
	icon_state = "[magboot_state][magpulse]"
	to_chat(user, span_notice("You [magpulse ? "enable" : "disable"] the mag-pulse traction system."))
	update_gravity_trait(user)
	user.update_worn_shoes() //so our mob-overlays update
	user.update_gravity(user.has_gravity())
	user.update_equipment_speed_mods() //we want to update our speed so we arent running at max speed in regular magboots
	update_item_action_buttons()
=======
	magpulse = !magpulse
	if(magpulse)
		attach_clothing_traits(active_traits)
		slowdown += slowdown_active
	else
		detach_clothing_traits(active_traits)
		slowdown = max(initial(slowdown), slowdown - slowdown_active) // Just in case, for speed pot shenanigans

	update_appearance()
	balloon_alert(user, "mag-pulse [magpulse ? "enabled" : "disabled"]")
	//we want to update our speed so we arent running at max speed in regular magboots
	user.update_equipment_speed_mods()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/shoes/magboots/examine(mob/user)
	. = ..()
	. += "Its mag-pulse traction system appears to be [magpulse ? "enabled" : "disabled"]."

<<<<<<< HEAD
///Adds/removes the gravity negation trait from the wearer depending on if the magpulse system is turned on.
/obj/item/clothing/shoes/magboots/proc/update_gravity_trait(mob/user)
	if(magpulse)
		ADD_TRAIT(user, TRAIT_NEGATES_GRAVITY, type)
	else
		REMOVE_TRAIT(user, TRAIT_NEGATES_GRAVITY, type)

/obj/item/clothing/shoes/magboots/advance
	desc = "Advanced magnetic boots that have a lighter magnetic pull, placing less burden on the wearer."
	name = "advanced magboots"
	icon_state = "advmag0"
	magboot_state = "advmag"
	slowdown_active = SHOES_SLOWDOWN
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/clothing/shoes/magboots/syndie
	desc = "Reverse-engineered magnetic boots that have a heavy magnetic pull. Property of Gorlex Marauders."
	name = "blood-red magboots"
	icon_state = "syndiemag0"
	magboot_state = "syndiemag"
=======
/obj/item/clothing/shoes/magboots/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state][magpulse]"

/obj/item/clothing/shoes/magboots/advance
	name = "advanced magboots"
	desc = "Advanced magnetic boots that have a lighter magnetic pull, placing less burden on the wearer."
	icon_state = "advmag0"
	base_icon_state = "advmag"
	slowdown_active = SHOES_SLOWDOWN // ZERO active slowdown
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/clothing/shoes/magboots/syndie
	name = "blood-red magboots"
	desc = "Reverse-engineered magnetic boots that have a heavy magnetic pull. Property of Gorlex Marauders."
	icon_state = "syndiemag0"
	base_icon_state = "syndiemag"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
