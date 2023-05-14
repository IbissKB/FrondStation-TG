/obj/item/clothing/glasses	//Code to let you switch the side your eyepatch is on! Woo! Just an explanation, this is added to the base glasses so it works on eyepatch-huds too
	var/can_switch_eye = FALSE	//Having this default to false means that its easy to make sure this doesnt apply to any pre-existing items
<<<<<<< HEAD
	var/current_eye = "_R"	//Added to the end of the icon_state to make this easy code-wise, L and R being the wearer's Left and Right
	/// Stores the current state of the sprite. This is mostly here for reskin compatibility.
	var/current_sprite_state
	/// Stores the current worn state, this like current_sprite_state, this is used for reskin compatibility.
	var/current_worn_state

/obj/item/clothing/glasses/CtrlClick(mob/user)
	. = ..()
	if(.)
		return

	if(!user.canUseTopic(src, be_close = TRUE, no_dexterity = TRUE, floor_okay = !iscyborg(user)))
		return

	switcheye()
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7


/obj/item/clothing/glasses/examine(mob/user)
	. = ..()
	if(can_switch_eye)
<<<<<<< HEAD
		. += "Ctrl-click on [src] to wear it over your [current_eye == "_R" ? "left" : "right"] eye."


/obj/item/clothing/glasses/verb/eyepatch_switcheye()
	set name = "Switch Eyepatch Side"
	set category = null
	set src in usr
	switcheye()


/obj/item/clothing/glasses/proc/switcheye()
	if(!can_use(usr))
		return
	if(!can_switch_eye)
		to_chat(usr, span_warning("You cannot wear this any differently!"))
		return
	eyepatch_do_switch()

	to_chat(usr, span_notice("You adjust the eyepatch to wear it over your [current_eye == "_L" ? "left" : "right"] eye."))

	usr.update_worn_glasses()
	usr.update_overlays()


/obj/item/clothing/glasses/proc/eyepatch_do_switch()
	current_eye = current_eye == "_L" ? "_R" : "_L"

	icon_state = base_icon_state + current_eye

/obj/item/clothing/glasses/Initialize(mapload)
	. = ..()
	current_sprite_state = icon_state //Stores the standard sprite state.


/obj/item/clothing/glasses/alt_click_secondary(mob/user)
	. = ..()

=======
		. += "Use in hands to wear it over your [icon_state == base_icon_state ? "left" : "right"] eye."


>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/* ---------- Items Below ----------*/

/obj/item/clothing/glasses/eyepatch	//Re-defined here for ease with the left/right switch
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
<<<<<<< HEAD
	icon_state = "eyepatch_R"
=======
	icon_state = "eyepatch"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	base_icon_state = "eyepatch"
	can_switch_eye = TRUE

/obj/item/clothing/glasses/eyepatch/wrap
	name = "eye wrap"
	desc = "A glorified bandage. At least this one's actually made for your head..."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
<<<<<<< HEAD
	icon_state = "eyewrap_R"
=======
	icon_state = "eyewrap"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	base_icon_state = "eyewrap"

/obj/item/clothing/glasses/eyepatch/white
	name = "white eyepatch"
	desc = "This is what happens when a pirate gets a PhD."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
<<<<<<< HEAD
	icon_state = "eyepatch_white_R"
=======
	icon_state = "eyepatch_white"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	base_icon_state = "eyepatch_white"

///GLASSSES
/obj/item/clothing/glasses/thin
	name = "thin glasses"
	desc = "Often seen staring down at someone taking a book."
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	icon_state = "glasses_thin"
	inhand_icon_state = "glasses"
<<<<<<< HEAD
	vision_correction = TRUE
=======
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/glasses/betterunshit
	name = "modern glasses"
	desc = "After Nerd. Co went bankrupt for tax evasion and invasion, they were bought out by Dork.Co, who revamped their classic design."
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	icon_state = "glasses_alt"
	inhand_icon_state = "glasses"
<<<<<<< HEAD
	vision_correction = TRUE
=======
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/glasses/kim
	name = "binoclard lenses"
	desc = "Stylish round lenses subtly shaded for your protection and criminal discomfort."
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	icon_state = "binoclard_lenses"
	inhand_icon_state = "glasses"
<<<<<<< HEAD
	vision_correction = TRUE
=======
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/glasses/trickblindfold/hamburg
	name = "thief visor"
	desc = "Perfect for stealing hamburgers from innocent multinational capitalist monopolies."
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	icon_state = "thiefmask"

///GOGGLES
/obj/item/clothing/glasses/biker
	name = "biker goggles"
	desc = "Brown leather riding gear, You can leave, just give us the gas."
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	icon_state = "biker"
	inhand_icon_state = "welding-g"
<<<<<<< HEAD
	vision_correction = TRUE
=======
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

// Like sunglasses, but without any protection
/obj/item/clothing/glasses/fake_sunglasses
	name = "low-UV sunglasses"
	desc = "A cheaper brand of sunglasses rated for much lower UV levels. Offers the user no protection against bright lights."
	icon_state = "sun"
	inhand_icon_state = "sunglasses"
