/obj/item/organ/internal/eyes
	name = BODY_ZONE_PRECISE_EYES
	icon_state = "eyes"
	desc = "I see you!"
	visual = TRUE
	zone = BODY_ZONE_PRECISE_EYES
	slot = ORGAN_SLOT_EYES
	gender = PLURAL

	healing_factor = STANDARD_ORGAN_HEALING
	decay_factor = STANDARD_ORGAN_DECAY
	maxHealth = 0.5 * STANDARD_ORGAN_THRESHOLD //half the normal health max since we go blind at 30, a permanent blindness at 50 therefore makes sense unless medicine is administered
	high_threshold = 0.3 * STANDARD_ORGAN_THRESHOLD //threshold at 30
	low_threshold = 0.2 * STANDARD_ORGAN_THRESHOLD //threshold at 20

	low_threshold_passed = "<span class='info'>Distant objects become somewhat less tangible.</span>"
	high_threshold_passed = "<span class='info'>Everything starts to look a lot less clear.</span>"
	now_failing = "<span class='warning'>Darkness envelopes you, as your eyes go blind!</span>"
	now_fixed = "<span class='info'>Color and shapes are once again perceivable.</span>"
	high_threshold_cleared = "<span class='info'>Your vision functions passably once more.</span>"
	low_threshold_cleared = "<span class='info'>Your vision is cleared of any ailment.</span>"

<<<<<<< HEAD
	var/sight_flags = 0
	/// changes how the eyes overlay is applied, makes it apply over the lighting layer
	var/overlay_ignore_lighting = FALSE
	var/see_in_dark = 2
	var/tint = 0
=======
	/// Sight flags this eye pair imparts on its user.
	var/sight_flags = NONE
	/// changes how the eyes overlay is applied, makes it apply over the lighting layer
	var/overlay_ignore_lighting = FALSE
	/// How much innate tint these eyes have
	var/tint = 0
	/// How much innare flash protection these eyes have, usually paired with tint
	var/flash_protect = FLASH_PROTECTION_NONE
	/// What level of invisibility these eyes can see
	var/see_invisible = SEE_INVISIBLE_LIVING
	/// How much darkness to cut out of your view (basically, night vision)
	var/lighting_cutoff = null
	/// List of color cutoffs from eyes, or null if not applicable
	var/list/color_cutoffs = null
	/// Are these eyes immune to pepperspray?
	var/pepperspray_protect = FALSE

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	var/eye_color_left = "" //set to a hex code to override a mob's left eye color
	var/eye_color_right = "" //set to a hex code to override a mob's right eye color
	var/eye_icon_state = "eyes"
	var/old_eye_color_left = "fff"
	var/old_eye_color_right = "fff"
<<<<<<< HEAD
	var/flash_protect = FLASH_PROTECTION_NONE
	var/see_invisible = SEE_INVISIBLE_LIVING
	var/lighting_alpha
	var/no_glasses
=======

	/// Glasses cannot be worn over these eyes. Currently unused
	var/no_glasses = FALSE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	/// indication that the eyes are undergoing some negative effect
	var/damaged = FALSE
	/// Native FOV that will be applied if a config is enabled
	var/native_fov = FOV_180_DEGREES //SKYRAT EDIT CHANGE

<<<<<<< HEAD
/obj/item/organ/internal/eyes/Insert(mob/living/carbon/eye_owner, special = FALSE, drop_if_replaced = FALSE, initialising)
	. = ..()
	if(ishuman(eye_owner))
		var/mob/living/carbon/human/human_owner = eye_owner
		// SKYRAT EDIT ADDITION
		if(human_owner.emissive_eyes)
			is_emissive = TRUE
		// SKYRAT EDIT END
		old_eye_color_left = human_owner.eye_color_left
		old_eye_color_right = human_owner.eye_color_right
		if(initial(eye_color_left))
			human_owner.eye_color_left = eye_color_left
		else
			eye_color_left = human_owner.eye_color_left
		if(initial(eye_color_right))
			human_owner.eye_color_right = eye_color_right
		else
			eye_color_right = human_owner.eye_color_right
		if(HAS_TRAIT(human_owner, TRAIT_NIGHT_VISION) && !lighting_alpha)
			lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT
		if(CONFIG_GET(flag/native_fov) && native_fov)
			human_owner.add_fov_trait(type, native_fov)
	eye_owner.update_tint()
	owner.update_sight()
	if(eye_owner.has_dna() && ishuman(eye_owner))
		eye_owner.dna.species.handle_body(eye_owner) //updates eye icon

/obj/item/organ/internal/eyes/proc/refresh(call_update = TRUE)
	if(ishuman(owner))
		var/mob/living/carbon/human/affected_human = owner
		// SKYRAT EDIT ADDITION
		if (affected_human.emissive_eyes)
			is_emissive = TRUE
		// SKYRAT EDIT END
		old_eye_color_left = affected_human.eye_color_left
		old_eye_color_right = affected_human.eye_color_right
		if(initial(eye_color_left))
			affected_human.eye_color_left = eye_color_left
		else
			eye_color_left = affected_human.eye_color_left
		if(initial(eye_color_right))
			affected_human.eye_color_right = eye_color_right
		else
			eye_color_right = affected_human.eye_color_right
		if(HAS_TRAIT(affected_human, TRAIT_NIGHT_VISION) && !lighting_alpha)
			lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT
	owner.update_tint()
	owner.update_sight()
	if(call_update && owner.has_dna() && ishuman(owner))
		var/mob/living/carbon/human/affected_human = owner
		affected_human.dna.species.handle_body(affected_human) //updates eye icon


/obj/item/organ/internal/eyes/Remove(mob/living/carbon/eye_owner, special = 0)
	..()
=======
/obj/item/organ/internal/eyes/Insert(mob/living/carbon/eye_recipient, special = FALSE, drop_if_replaced = FALSE)
	. = ..()
	if(!.)
		return
	eye_recipient.cure_blind(NO_EYES)
	apply_damaged_eye_effects()
	refresh(eye_recipient, inserting = TRUE)

/// Refreshes the visuals of the eyes
/// If call_update is TRUE, we also will call update_body
/obj/item/organ/internal/eyes/proc/refresh(mob/living/carbon/eye_owner = owner, inserting = FALSE, call_update = TRUE)
	owner.update_sight()
	owner.update_tint()

	if(!ishuman(eye_owner))
		return

	var/mob/living/carbon/human/affected_human = eye_owner
	if(inserting) // we only want to be setting old_eye_color the one time
		old_eye_color_left = affected_human.eye_color_left
		old_eye_color_right = affected_human.eye_color_right
	if(initial(eye_color_left))
		affected_human.eye_color_left = eye_color_left
	else
		eye_color_left = affected_human.eye_color_left
	if(initial(eye_color_right))
		affected_human.eye_color_right = eye_color_right
	else
		eye_color_right = affected_human.eye_color_right
	if(HAS_TRAIT(affected_human, TRAIT_NIGHT_VISION) && !lighting_cutoff)
		lighting_cutoff = LIGHTING_CUTOFF_REAL_LOW
	if(CONFIG_GET(flag/native_fov) && native_fov)
		affected_human.add_fov_trait(type, native_fov)

	// SKYRAT EDIT ADDITION - EMISSIVES
	if (affected_human.emissive_eyes)
		is_emissive = TRUE
	// SKYRAT EDIT END

	if(call_update)
		affected_human.dna?.species?.handle_body(affected_human) //updates eye icon

/obj/item/organ/internal/eyes/Remove(mob/living/carbon/eye_owner, special = FALSE)
	. = ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(ishuman(eye_owner))
		var/mob/living/carbon/human/human_owner = eye_owner
		if(initial(eye_color_left))
			human_owner.eye_color_left = old_eye_color_left
		if(initial(eye_color_right))
			human_owner.eye_color_right = old_eye_color_right
		human_owner.update_body()
		if(native_fov)
			eye_owner.remove_fov_trait(type)
<<<<<<< HEAD
	eye_owner.cure_blind(EYE_DAMAGE)
	eye_owner.cure_nearsighted(EYE_DAMAGE)
	eye_owner.set_blindness(0)
	eye_owner.set_blurriness(0)
	eye_owner.clear_fullscreen("eye_damage", 0)
=======

	// Cure blindness from eye damage
	eye_owner.cure_blind(EYE_DAMAGE)
	eye_owner.cure_nearsighted(EYE_DAMAGE)
	// Eye blind and temp blind go to, even if this is a bit of cheesy way to clear blindness
	eye_owner.remove_status_effect(/datum/status_effect/eye_blur)
	eye_owner.remove_status_effect(/datum/status_effect/temporary_blindness)
	// Then become blind anyways (if not special)
	if(!special)
		eye_owner.become_blind(NO_EYES)

	eye_owner.update_tint()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	eye_owner.update_sight()
	is_emissive = FALSE // SKYRAT EDIT ADDITION

#define OFFSET_X 1
#define OFFSET_Y 2

/// This proc generates a list of overlays that the eye should be displayed using for the given parent
/obj/item/organ/internal/eyes/proc/generate_body_overlay(mob/living/carbon/human/parent)
<<<<<<< HEAD
	if(!istype(parent) || parent.getorgan(/obj/item/organ/internal/eyes) != src)
		CRASH("Generating a body overlay for [src] targeting an invalid parent '[parent]'.")

=======
	if(!istype(parent) || parent.get_organ_by_type(/obj/item/organ/internal/eyes) != src)
		CRASH("Generating a body overlay for [src] targeting an invalid parent '[parent]'.")

	if(isnull(eye_icon_state))
		return list()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	var/eye_icon = parent.dna?.species.eyes_icon || 'icons/mob/species/human/human_face.dmi' // SKYRAT EDIT ADDITION

	var/mutable_appearance/eye_left = mutable_appearance(eye_icon, "[eye_icon_state]_l", -eyes_layer) // SKYRAT EDIT CHANGE - Customization - ORIGINAL: var/mutable_appearance/eye_left = mutable_appearance('icons/mob/human_face.dmi', "[eye_icon_state]_l", -BODY_LAYER)
	var/mutable_appearance/eye_right = mutable_appearance(eye_icon, "[eye_icon_state]_r", -eyes_layer) // SKYRAT EDIT CHANGE - Customization - ORIGINAL: var/mutable_appearance/eye_right = mutable_appearance('icons/mob/human_face.dmi', "[eye_icon_state]_r", -BODY_LAYER)
	var/list/overlays = list(eye_left, eye_right)

	if(EYECOLOR in parent.dna?.species.species_traits)
		eye_right.color = eye_color_right
		eye_left.color = eye_color_left

	var/obscured = parent.check_obscured_slots(TRUE)
	if(overlay_ignore_lighting && !(obscured & ITEM_SLOT_EYES))
		eye_left.overlays += emissive_appearance(eye_left.icon, eye_left.icon_state, parent, alpha = eye_left.alpha)
		eye_right.overlays += emissive_appearance(eye_right.icon, eye_right.icon_state, parent, alpha = eye_right.alpha)

<<<<<<< HEAD
	// Cry emote overlay
	if (HAS_TRAIT(parent, TRAIT_CRYING)) // Caused by the *cry emote
		var/mutable_appearance/tears_overlay = mutable_appearance('icons/mob/species/human/human_face.dmi', "tears", -BODY_ADJ_LAYER)
		tears_overlay.color = COLOR_DARK_CYAN
		overlays += tears_overlay

	if(OFFSET_FACE in parent.dna?.species.offset_features)
		var/offset = parent.dna.species.offset_features[OFFSET_FACE]
		for(var/mutable_appearance/overlay in overlays)
			overlay.pixel_x += offset[OFFSET_X]
			overlay.pixel_y += offset[OFFSET_Y]
=======
	var/obj/item/bodypart/head/my_head = parent.get_bodypart(BODY_ZONE_HEAD)
	if(my_head?.worn_face_offset)
		for(var/mutable_appearance/overlay in overlays)
			my_head.worn_face_offset.apply_offset(overlay)

	// SKYRAT EDIT START - Customization (darn synths I swear)
	if(eye_icon_state == "None")
		eye_left.alpha = 0
		eye_right.alpha = 0
	// SKYRAT EDIT END
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	return overlays

#undef OFFSET_X
#undef OFFSET_Y

//Gotta reset the eye color, because that persists
/obj/item/organ/internal/eyes/enter_wardrobe()
	. = ..()
	eye_color_left = initial(eye_color_left)
	eye_color_right = initial(eye_color_right)

<<<<<<< HEAD
/obj/item/organ/internal/eyes/on_life(delta_time, times_fired)
	. = ..()
	var/mob/living/carbon/eye_owner = owner
	//various degrees of "oh fuck my eyes", from "point a laser at your eye" to "staring at the Sun" intensities
	if(damage > 20)
		damaged = TRUE
		if((organ_flags & ORGAN_FAILING))
			eye_owner.become_blind(EYE_DAMAGE)
			return

		var/obj/item/clothing/glasses/eyewear = eye_owner.glasses
		var/has_prescription_glasses = istype(eyewear) && eyewear.vision_correction

		if(has_prescription_glasses)
			return

		var/severity = damage > 30 ? 2 : 1
		eye_owner.overlay_fullscreen("eye_damage", /atom/movable/screen/fullscreen/impaired, severity)
		return

	//called once since we don't want to keep clearing the screen of eye damage for people who are below 20 damage
	if(damaged)
		damaged = FALSE
		eye_owner.clear_fullscreen("eye_damage")
		eye_owner.cure_blind(EYE_DAMAGE)

/obj/item/organ/internal/eyes/night_vision
	see_in_dark = NIGHTVISION_FOV_RANGE
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	actions_types = list(/datum/action/item_action/organ_action/use)
	var/night_vision = TRUE

/obj/item/organ/internal/eyes/night_vision/ui_action_click()
	sight_flags = initial(sight_flags)
	switch(lighting_alpha)
		if (LIGHTING_PLANE_ALPHA_VISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
		if (LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
		if (LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_INVISIBLE
		else
			lighting_alpha = LIGHTING_PLANE_ALPHA_VISIBLE
	owner.update_sight()

/obj/item/organ/internal/eyes/night_vision/alien
	name = "alien eyes"
	desc = "It turned out they had them after all!"
	sight_flags = SEE_MOBS

/obj/item/organ/internal/eyes/night_vision/zombie
	name = "undead eyes"
	desc = "Somewhat counterintuitively, these half-rotten eyes actually have superior vision to those of a living human."
=======
/obj/item/organ/internal/eyes/apply_organ_damage(damage_amount, maximum, required_organtype)
	. = ..()
	if(!owner)
		return
	apply_damaged_eye_effects()

/// Applies effects to our owner based on how damaged our eyes are
/obj/item/organ/internal/eyes/proc/apply_damaged_eye_effects()
	// we're in healthy threshold, either try to heal (if damaged) or do nothing
	if(damage <= low_threshold)
		if(damaged)
			damaged = FALSE
			// clear nearsightedness from damage
			owner.cure_nearsighted(EYE_DAMAGE)
			// if we're still nearsighted, reset its severity
			// this is kinda icky, ideally we'd track severity to source but that's way more complex
			var/datum/status_effect/grouped/nearsighted/nearsightedness = owner.is_nearsighted()
			nearsightedness?.set_nearsighted_severity(1)
			// and cure blindness from damage
			owner.cure_blind(EYE_DAMAGE)
		return

	//various degrees of "oh fuck my eyes", from "point a laser at your eye" to "staring at the Sun" intensities
	// 50 - blind
	// 49-31 - nearsighted (2 severity)
	// 30-20 - nearsighted (1 severity)
	if(organ_flags & ORGAN_FAILING)
		// become blind from damage
		owner.become_blind(EYE_DAMAGE)

	else
		// become nearsighted from damage
		owner.become_nearsighted(EYE_DAMAGE)
		// update the severity of our nearsightedness based on our eye damage
		var/datum/status_effect/grouped/nearsighted/nearsightedness = owner.is_nearsighted()
		nearsightedness.set_nearsighted_severity(damage > high_threshold ? 2 : 1)

	damaged = TRUE

#define NIGHTVISION_LIGHT_OFF 0
#define NIGHTVISION_LIGHT_LOW 1
#define NIGHTVISION_LIGHT_MID 2
#define NIGHTVISION_LIGHT_HIG 3

/obj/item/organ/internal/eyes/night_vision
	actions_types = list(/datum/action/item_action/organ_action/use)

	// These lists are used as the color cutoff for the eye
	// They need to be filled out for subtypes
	var/list/low_light_cutoff
	var/list/medium_light_cutoff
	var/list/high_light_cutoff
	var/light_level = NIGHTVISION_LIGHT_OFF

/obj/item/organ/internal/eyes/night_vision/Initialize(mapload)
	. = ..()
	if (PERFORM_ALL_TESTS(focus_only/nightvision_color_cutoffs) && type != /obj/item/organ/internal/eyes/night_vision)
		if(length(low_light_cutoff) != 3 || length(medium_light_cutoff) != 3 || length(high_light_cutoff) != 3)
			stack_trace("[type] did not have fully filled out color cutoff lists")
	if(low_light_cutoff)
		color_cutoffs = low_light_cutoff.Copy()
	light_level = NIGHTVISION_LIGHT_LOW

/obj/item/organ/internal/eyes/night_vision/ui_action_click()
	sight_flags = initial(sight_flags)
	switch(light_level)
		if (NIGHTVISION_LIGHT_OFF)
			color_cutoffs = low_light_cutoff.Copy()
			light_level = NIGHTVISION_LIGHT_LOW
		if (NIGHTVISION_LIGHT_LOW)
			color_cutoffs = medium_light_cutoff.Copy()
			light_level = NIGHTVISION_LIGHT_MID
		if (NIGHTVISION_LIGHT_MID)
			color_cutoffs = high_light_cutoff.Copy()
			light_level = NIGHTVISION_LIGHT_HIG
		else
			color_cutoffs = list()
			light_level = NIGHTVISION_LIGHT_OFF
	owner.update_sight()

#undef NIGHTVISION_LIGHT_OFF
#undef NIGHTVISION_LIGHT_LOW
#undef NIGHTVISION_LIGHT_MID
#undef NIGHTVISION_LIGHT_HIG
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/organ/internal/eyes/night_vision/mushroom
	name = "fung-eye"
	desc = "While on the outside they look inert and dead, the eyes of mushroom people are actually very advanced."
<<<<<<< HEAD
=======
	low_light_cutoff = list(0, 15, 20)
	medium_light_cutoff = list(0, 20, 35)
	high_light_cutoff = list(0, 40, 50)

/obj/item/organ/internal/eyes/zombie
	name = "undead eyes"
	desc = "Somewhat counterintuitively, these half-rotten eyes actually have superior vision to those of a living human."
	color_cutoffs = list(25, 35, 5)

/obj/item/organ/internal/eyes/alien
	name = "alien eyes"
	desc = "It turned out they had them after all!"
	sight_flags = SEE_MOBS
	color_cutoffs = list(25, 5, 42)

/obj/item/organ/internal/eyes/golem
	name = "resonating crystal"
	icon_state = "adamantine_cords"
	eye_icon_state = null
	desc = "Golems somehow measure external light levels and detect nearby ore using this sensitive mineral lattice."
	color = COLOR_GOLEM_GRAY
	visual = FALSE
	status = ORGAN_MINERAL
	color_cutoffs = list(10, 15, 5)
	actions_types = list(/datum/action/cooldown/golem_ore_sight)

/// Send an ore detection pulse on a cooldown
/datum/action/cooldown/golem_ore_sight
	name = "Ore Resonance"
	desc = "Causes nearby ores to vibrate, revealing their location."
	button_icon = 'icons/obj/device.dmi'
	button_icon_state = "manual_mining"
	check_flags = AB_CHECK_CONSCIOUS
	cooldown_time = 10 SECONDS

/datum/action/cooldown/golem_ore_sight/Activate(atom/target)
	. = ..()
	mineral_scan_pulse(get_turf(target))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

///Robotic

/obj/item/organ/internal/eyes/robotic
	name = "robotic eyes"
	icon_state = "cybernetic_eyeballs"
	desc = "Your vision is augmented."
	status = ORGAN_ROBOTIC
	organ_flags = ORGAN_SYNTHETIC

/obj/item/organ/internal/eyes/robotic/emp_act(severity)
	. = ..()
	if(!owner || . & EMP_PROTECT_SELF)
		return
	if(prob(10 * severity))
		return
	to_chat(owner, span_warning("Static obfuscates your vision!"))
	owner.flash_act(visual = 1)

/obj/item/organ/internal/eyes/robotic/basic
	name = "basic robotic eyes"
	desc = "A pair of basic cybernetic eyes that restore vision, but at some vulnerability to light."
	eye_color_left = "5500ff"
	eye_color_right = "5500ff"
	flash_protect = FLASH_PROTECTION_SENSITIVE

/obj/item/organ/internal/eyes/robotic/basic/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	if(prob(10 * severity))
<<<<<<< HEAD
		applyOrganDamage(20 * severity)
=======
		apply_organ_damage(20 * severity)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		to_chat(owner, span_warning("Your eyes start to fizzle in their sockets!"))
		do_sparks(2, TRUE, owner)
		owner.emote("scream")

/obj/item/organ/internal/eyes/robotic/xray
	name = "\improper X-ray eyes"
	desc = "These cybernetic eyes will give you X-ray vision. Blinking is futile."
	eye_color_left = "000"
	eye_color_right = "000"
<<<<<<< HEAD
	see_in_dark = NIGHTVISION_FOV_RANGE
	sight_flags = SEE_MOBS | SEE_OBJS | SEE_TURFS

/obj/item/organ/internal/eyes/robotic/xray/Insert(mob/living/carbon/eye_owner, special = FALSE, drop_if_replaced = TRUE)
	. = ..()
	ADD_TRAIT(eye_owner, TRAIT_XRAY_VISION, ORGAN_TRAIT)

/obj/item/organ/internal/eyes/robotic/xray/Remove(mob/living/carbon/eye_owner, special = FALSE)
	REMOVE_TRAIT(eye_owner, TRAIT_XRAY_VISION, ORGAN_TRAIT)
	return ..()
=======
	sight_flags = SEE_MOBS | SEE_OBJS | SEE_TURFS

/obj/item/organ/internal/eyes/robotic/xray/on_insert(mob/living/carbon/eye_owner)
	. = ..()
	ADD_TRAIT(eye_owner, TRAIT_XRAY_VISION, ORGAN_TRAIT)

/obj/item/organ/internal/eyes/robotic/xray/on_remove(mob/living/carbon/eye_owner)
	. = ..()
	REMOVE_TRAIT(eye_owner, TRAIT_XRAY_VISION, ORGAN_TRAIT)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/organ/internal/eyes/robotic/thermals
	name = "thermal eyes"
	desc = "These cybernetic eye implants will give you thermal vision. Vertical slit pupil included."
	eye_color_left = "FC0"
	eye_color_right = "FC0"
<<<<<<< HEAD
	sight_flags = SEE_MOBS
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	flash_protect = FLASH_PROTECTION_SENSITIVE
	see_in_dark = NIGHTVISION_FOV_RANGE
=======
	// We're gonna downshift green and blue a bit so darkness looks yellow
	color_cutoffs = list(25, 8, 5)
	sight_flags = SEE_MOBS
	flash_protect = FLASH_PROTECTION_SENSITIVE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/organ/internal/eyes/robotic/flashlight
	name = "flashlight eyes"
	desc = "It's two flashlights rigged together with some wire. Why would you put these in someone's head?"
	eye_color_left ="fee5a3"
	eye_color_right ="fee5a3"
	icon = 'icons/obj/lighting.dmi'
	icon_state = "flashlight_eyes"
	flash_protect = FLASH_PROTECTION_WELDER
	tint = INFINITY
	var/obj/item/flashlight/eyelight/eye

/obj/item/organ/internal/eyes/robotic/flashlight/emp_act(severity)
	return

<<<<<<< HEAD
/obj/item/organ/internal/eyes/robotic/flashlight/Insert(mob/living/carbon/victim, special = FALSE, drop_if_replaced = FALSE)
	..()
=======
/obj/item/organ/internal/eyes/robotic/flashlight/on_insert(mob/living/carbon/victim)
	. = ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(!eye)
		eye = new /obj/item/flashlight/eyelight()
	eye.on = TRUE
	eye.forceMove(victim)
	eye.update_brightness(victim)
	victim.become_blind(FLASHLIGHT_EYES)

<<<<<<< HEAD

/obj/item/organ/internal/eyes/robotic/flashlight/Remove(mob/living/carbon/victim, special = 0)
=======
/obj/item/organ/internal/eyes/robotic/flashlight/on_remove(mob/living/carbon/victim)
	. = ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	eye.on = FALSE
	eye.update_brightness(victim)
	eye.forceMove(src)
	victim.cure_blind(FLASHLIGHT_EYES)
<<<<<<< HEAD
	..()
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

// Welding shield implant
/obj/item/organ/internal/eyes/robotic/shield
	name = "shielded robotic eyes"
	desc = "These reactive micro-shields will protect you from welders and flashes without obscuring your vision."
	flash_protect = FLASH_PROTECTION_WELDER

/obj/item/organ/internal/eyes/robotic/shield/emp_act(severity)
	return

<<<<<<< HEAD
#define RGB2EYECOLORSTRING(definitionvar) ("[copytext_char(definitionvar, 2, 3)][copytext_char(definitionvar, 4, 5)][copytext_char(definitionvar, 6, 7)]")
=======
#define MATCH_LIGHT_COLOR 1
#define USE_CUSTOM_COLOR 0
#define UPDATE_LIGHT 0
#define UPDATE_EYES_LEFT 1
#define UPDATE_EYES_RIGHT 2
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/organ/internal/eyes/robotic/glow
	name = "High Luminosity Eyes"
	desc = "Special glowing eyes, used by snowflakes who want to be special."
	eye_color_left = "000"
	eye_color_right = "000"
	actions_types = list(/datum/action/item_action/organ_action/use, /datum/action/item_action/organ_action/toggle)
<<<<<<< HEAD
	var/current_color_string = "#ffffff"
	var/active = FALSE
	var/max_light_beam_distance = 5
	var/light_beam_distance = 5
	var/light_object_range = 2
	var/light_object_power = 2
	var/list/obj/effect/abstract/eye_lighting/eye_lighting
	var/obj/effect/abstract/eye_lighting/on_mob
	var/image/mob_overlay
	var/datum/component/mobhook

/obj/item/organ/internal/eyes/robotic/glow/Initialize(mapload)
	. = ..()
	mob_overlay = image('modular_skyrat/master_files/icons/mob/human_face.dmi', "eyes_glow_gs") //SKURAT EDIT CHANGE

/obj/item/organ/internal/eyes/robotic/glow/Destroy()
	terminate_effects()
	. = ..()

/obj/item/organ/internal/eyes/robotic/glow/Remove(mob/living/carbon/eye_owner, special = FALSE)
	terminate_effects()
	. = ..()

/obj/item/organ/internal/eyes/robotic/glow/proc/terminate_effects()
	if(owner && active)
		deactivate()
	remove_mob_overlay() //SKYRAT EDIT ADDITION
	active = FALSE
	clear_visuals(TRUE)
	STOP_PROCESSING(SSfastprocess, src)

/obj/item/organ/internal/eyes/robotic/glow/ui_action_click(owner, action)
	if(istype(action, /datum/action/item_action/organ_action/toggle))
		toggle_active()
	else if(istype(action, /datum/action/item_action/organ_action/use))
		prompt_for_controls(owner)

/obj/item/organ/internal/eyes/robotic/glow/proc/toggle_active()
	if(active)
=======
	var/max_light_beam_distance = 5
	var/obj/item/flashlight/eyelight/glow/eye
	/// The overlay that is used when both eyes are set to match the light color
	var/mutable_appearance/eyes_overlay
	/// The overlay that is used when custom color selection is enabled, for the left eye
	var/mutable_appearance/eyes_overlay_left
	/// The overlay that is used when custom color selection is enabled, for the right eye
	var/mutable_appearance/eyes_overlay_right
	/// Whether or not to match the eye color to the light or use a custom selection
	var/eye_color_mode = MATCH_LIGHT_COLOR
	/// The selected color for the light beam itself
	var/current_color_string = "#ffffff"
	/// The custom selected eye color for the left eye. Defaults to the mob's natural eye color
	var/current_left_color_string
	/// The custom selected eye color for the right eye. Defaults to the mob's natural eye color
	var/current_right_color_string

/obj/item/organ/internal/eyes/robotic/glow/Initialize(mapload)
	. = ..()
	eye = new /obj/item/flashlight/eyelight/glow

/obj/item/organ/internal/eyes/robotic/glow/Destroy()
	. = ..()
	deactivate(close_ui = TRUE)
	QDEL_NULL(eye)

/obj/item/organ/internal/eyes/robotic/glow/emp_act()
	. = ..()
	if(!eye.on || . & EMP_PROTECT_SELF)
		return
	deactivate(close_ui = TRUE)

/// We have to do this here because on_insert gets called before refresh(), which we need to have been called for old_eye_color vars to be set
/obj/item/organ/internal/eyes/robotic/glow/Insert(mob/living/carbon/eye_recipient, special = FALSE, drop_if_replaced = FALSE)
	. = ..()
	current_left_color_string = old_eye_color_left
	current_right_color_string = old_eye_color_right

/obj/item/organ/internal/eyes/robotic/glow/on_insert(mob/living/carbon/eye_recipient)
	. = ..()
	deactivate(close_ui = TRUE)
	eye.forceMove(eye_recipient)

/obj/item/organ/internal/eyes/robotic/glow/on_remove(mob/living/carbon/eye_owner)
	deactivate(eye_owner, close_ui = TRUE)
	QDEL_NULL(eyes_overlay)
	QDEL_NULL(eyes_overlay_left)
	QDEL_NULL(eyes_overlay_right)
	eye.forceMove(src)
	return ..()

/obj/item/organ/internal/eyes/robotic/glow/ui_state(mob/user)
	return GLOB.default_state

/obj/item/organ/internal/eyes/robotic/glow/ui_status(mob/user)
	if(!QDELETED(owner))
		if(owner == user)
			return min(
				ui_status_user_is_abled(user, src),
				ui_status_only_living(user),
			)
		else return UI_CLOSE
	return ..()

/obj/item/organ/internal/eyes/robotic/glow/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "HighLuminosityEyesMenu")
		ui.autoupdate = FALSE
		ui.open()

/obj/item/organ/internal/eyes/robotic/glow/ui_data(mob/user)
	var/list/data = list()

	data["eyeColor"] = list(
		mode = eye_color_mode,
		hasOwner = owner ? TRUE : FALSE,
		left = current_left_color_string,
		right = current_right_color_string,
	)
	data["lightColor"] = current_color_string
	data["range"] = eye.light_range

	return data

/obj/item/organ/internal/eyes/robotic/glow/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	if(.)
		return

	switch(action)
		if("set_range")
			var/new_range = params["new_range"]
			set_beam_range(new_range)
			return TRUE
		if("pick_color")
			var/new_color = input(
				usr,
				"Choose eye color color:",
				"High Luminosity Eyes Menu",
				current_color_string
			) as color|null
			if(new_color)
				var/to_update = params["to_update"]
				set_beam_color(new_color, to_update)
				return TRUE
		if("enter_color")
			var/new_color = lowertext(params["new_color"])
			var/to_update = params["to_update"]
			set_beam_color(new_color, to_update, sanitize = TRUE)
			return TRUE
		if("random_color")
			var/to_update = params["to_update"]
			randomize_color(to_update)
			return TRUE
		if("toggle_eye_color")
			toggle_eye_color_mode()
			return TRUE

/obj/item/organ/internal/eyes/robotic/glow/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/organ_action/toggle))
		toggle_active()
	else if(istype(action, /datum/action/item_action/organ_action/use))
		ui_interact(user)

/**
 * Activates the light
 *
 * Turns on the attached flashlight object, updates the mob overlay to be added.
 */
/obj/item/organ/internal/eyes/robotic/glow/proc/activate()
	eye.on = TRUE
	if(eye.light_range) // at range 0 we are just going to make the eyes glow emissively, no light overlay
		eye.set_light_on(TRUE)
	update_mob_eyes_overlay()

/**
 * Deactivates the light
 *
 * Turns off the attached flashlight object, closes UIs, updates the mob overlay to be removed.
 * Arguments:
 * * mob/living/carbon/eye_owner - the mob who the eyes belong to, for passing to update_mob_eyes_overlay
 * * close_ui - whether or not to close the ui
 */
/obj/item/organ/internal/eyes/robotic/glow/proc/deactivate(mob/living/carbon/eye_owner = owner, close_ui = FALSE)
	if(close_ui)
		SStgui.close_uis(src)
	eye.on = FALSE
	eye.set_light_on(FALSE)
	update_mob_eyes_overlay(eye_owner)

/**
 * Randomizes the light color
 *
 * Picks a random color and sets the beam color to that
 * Arguments:
 * * to_update - whether we are setting the color for the light beam itself, or the individual eyes
 */
/obj/item/organ/internal/eyes/robotic/glow/proc/randomize_color(to_update = UPDATE_LIGHT)
	var/new_color = "#"
	for(var/i in 1 to 3)
		new_color += num2hex(rand(0, 255), 2)
	set_beam_color(new_color, to_update)

/**
 * Setter function for the light's range
 *
 * Sets the light range of the attached flashlight object
 * Includes some 'unique' logic to accomodate for some quirks of the lighting system
 * Arguments:
 * * new_range - the new range to set
 */
/obj/item/organ/internal/eyes/robotic/glow/proc/set_beam_range(new_range)
	var/old_light_range = eye.light_range
	if(old_light_range == 0 && new_range > 0 && eye.on) // turn bring back the light overlay if we were previously at 0 (aka emissive eyes only)
		eye.light_on = FALSE // this is stupid, but this has to be FALSE for set_light_on() to work.
		eye.set_light_on(TRUE)
	eye.set_light_range(clamp(new_range, 0, max_light_beam_distance))

/**
 * Setter function for the light's color
 *
 * Sets the light color of the attached flashlight object. Sets the eye color vars of this eye organ as well and then updates the mob's eye color.
 * Arguments:
 * * newcolor - the new color hex string to set
 * * to_update - whether we are setting the color for the light beam itself, or the individual eyes
 * * sanitize - whether the hex string should be sanitized
 */
/obj/item/organ/internal/eyes/robotic/glow/proc/set_beam_color(newcolor, to_update = UPDATE_LIGHT, sanitize = FALSE)
	var/newcolor_string
	if(sanitize)
		newcolor_string = sanitize_hexcolor(newcolor)
	else
		newcolor_string = newcolor
	switch(to_update)
		if(UPDATE_LIGHT)
			current_color_string = newcolor_string
			eye.set_light_color(newcolor_string)
		if(UPDATE_EYES_LEFT)
			current_left_color_string = newcolor_string
		if(UPDATE_EYES_RIGHT)
			current_right_color_string = newcolor_string

	update_mob_eye_color()

/**
 * Toggle the attached flashlight object on or off
 */
/obj/item/organ/internal/eyes/robotic/glow/proc/toggle_active()
	if(eye.on)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		deactivate()
	else
		activate()

<<<<<<< HEAD
/obj/item/organ/internal/eyes/robotic/glow/proc/prompt_for_controls(mob/user)
	var/color = input(owner, "Select Color", "Select color", current_color_string) as color|null // SKYRAT EDIT CHANGE
	if(!color || QDELETED(src) || QDELETED(user) || QDELETED(owner) || owner != user)
		return
	var/range = input(user, "Enter range (0 - [max_light_beam_distance])", "Range Select", 0) as null|num
	var/old_active = active // Get old active because set_distance() -> clear_visuals()  will set it to FALSE.
	set_distance(clamp(range, 0, max_light_beam_distance))
	assume_rgb(color)
	// Reactivate if eyes were already active for real time colour swapping!
	if(old_active)
		activate(FALSE)

/obj/item/organ/internal/eyes/robotic/glow/proc/assume_rgb(newcolor)
	current_color_string = newcolor
	eye_color_left = RGB2EYECOLORSTRING(current_color_string)
	eye_color_right = eye_color_left
	if(!QDELETED(owner) && ishuman(owner)) //Other carbon mobs don't have eye color.
		owner.dna.species.handle_body(owner)

/obj/item/organ/internal/eyes/robotic/glow/proc/cycle_mob_overlay()
	remove_mob_overlay()
	mob_overlay.color = current_color_string
	add_mob_overlay()

/obj/item/organ/internal/eyes/robotic/glow/proc/add_mob_overlay()
	if(!QDELETED(owner))
		owner.add_overlay(mob_overlay)

/obj/item/organ/internal/eyes/robotic/glow/proc/remove_mob_overlay()
	if(!QDELETED(owner))
		owner.cut_overlay(mob_overlay)

/obj/item/organ/internal/eyes/robotic/glow/emp_act()
	. = ..()
	if(!active || . & EMP_PROTECT_SELF)
		return
	deactivate(silent = TRUE)

/obj/item/organ/internal/eyes/robotic/glow/Insert(mob/living/carbon/eye_owner, special = FALSE, drop_if_replaced = FALSE)
	. = ..()
	RegisterSignal(eye_owner, COMSIG_ATOM_DIR_CHANGE, PROC_REF(update_visuals))
	//SKYRAT EDIT ADDITION
	var/eye_color = owner.client?.prefs?.read_preference(/datum/preference/color/eye_color)
	mob_overlay.color = eye_color
	current_color_string = eye_color
	add_mob_overlay()
	//SKYRAT EDIT END

/obj/item/organ/internal/eyes/robotic/glow/Remove(mob/living/carbon/eye_owner, special = FALSE)
	. = ..()
	UnregisterSignal(eye_owner, COMSIG_ATOM_DIR_CHANGE)

/obj/item/organ/internal/eyes/robotic/glow/Destroy()
	QDEL_NULL(mobhook) // mobhook is not our component
	return ..()

/obj/item/organ/internal/eyes/robotic/glow/proc/activate(silent = FALSE)
	start_visuals()
	if(!silent)
		to_chat(owner, span_warning("Your [src] clicks and makes a whining noise, before shooting out a beam of light!"))
	cycle_mob_overlay()

/obj/item/organ/internal/eyes/robotic/glow/proc/deactivate(silent = FALSE)
	clear_visuals()
	if(!silent)
		to_chat(owner, span_warning("Your [src] shuts off!"))
	//remove_mob_overlay() SKYRAT EDIT REMOVAL

/obj/item/organ/internal/eyes/robotic/glow/proc/update_visuals(datum/source, olddir, newdir)
	SIGNAL_HANDLER
	if(!active)
		return // Don't update if we're not active!
	if((LAZYLEN(eye_lighting) < light_beam_distance) || !on_mob)
		regenerate_light_effects()
	var/turf/scanfrom = get_turf(owner)
	var/scandir = owner.dir
	if (newdir && scandir != newdir) // COMSIG_ATOM_DIR_CHANGE happens before the dir change, but with a reference to the new direction.
		scandir = newdir
	if(!istype(scanfrom))
		clear_visuals()
	var/turf/scanning = scanfrom
	var/stop = FALSE
	on_mob.set_light_flags(on_mob.light_flags & ~LIGHT_ATTACHED)
	on_mob.forceMove(scanning)
	for(var/i in 1 to light_beam_distance)
		scanning = get_step(scanning, scandir)
		if(IS_OPAQUE_TURF(scanning))
			stop = TRUE
		var/obj/effect/abstract/eye_lighting/lighting = LAZYACCESS(eye_lighting, i)
		if(stop)
			lighting.forceMove(src)
		else
			lighting.forceMove(scanning)

/obj/item/organ/internal/eyes/robotic/glow/proc/clear_visuals(delete_everything = FALSE)
	if(delete_everything)
		QDEL_LIST(eye_lighting)
		QDEL_NULL(on_mob)
	else
		for(var/obj/effect/abstract/eye_lighting/lighting as anything in eye_lighting)
			lighting.forceMove(src)
		if(!QDELETED(on_mob))
			on_mob.set_light_flags(on_mob.light_flags | LIGHT_ATTACHED)
			on_mob.forceMove(src)
	active = FALSE

/obj/item/organ/internal/eyes/robotic/glow/proc/start_visuals()
	if(!islist(eye_lighting))
		eye_lighting = list()
		regenerate_light_effects()
	if((eye_lighting.len < light_beam_distance) || !on_mob)
		regenerate_light_effects()
	sync_light_effects()
	active = TRUE
	update_visuals()

/obj/item/organ/internal/eyes/robotic/glow/proc/set_distance(dist)
	light_beam_distance = dist
	regenerate_light_effects()

/obj/item/organ/internal/eyes/robotic/glow/proc/regenerate_light_effects()
	clear_visuals(TRUE)
	on_mob = new (src, light_object_range, light_object_power, current_color_string, LIGHT_ATTACHED)
	for(var/i in 1 to light_beam_distance)
		LAZYADD(eye_lighting, new /obj/effect/abstract/eye_lighting(src, light_object_range, light_object_power, current_color_string))
	sync_light_effects()


/obj/item/organ/internal/eyes/robotic/glow/proc/sync_light_effects()
	for(var/obj/effect/abstract/eye_lighting/eye_lighting as anything in eye_lighting)
		eye_lighting.set_light_color(current_color_string)
	on_mob?.set_light_color(current_color_string)


/obj/effect/abstract/eye_lighting
	light_system = MOVABLE_LIGHT
	var/obj/item/organ/internal/eyes/robotic/glow/parent


/obj/effect/abstract/eye_lighting/Initialize(mapload, light_object_range, light_object_power, current_color_string, light_flags)
	. = ..()
	parent = loc
	if(!istype(parent))
		stack_trace("/obj/effect/abstract/eye_lighting added to improper parent ([loc]). Deleting.")
		return INITIALIZE_HINT_QDEL
	if(!isnull(light_object_range))
		set_light_range(light_object_range)
	if(!isnull(light_object_power))
		set_light_power(light_object_power)
	if(!isnull(current_color_string))
		set_light_color(current_color_string)
	if(!isnull(light_flags))
		set_light_flags(light_flags)

=======
/**
 * Toggles for the eye color mode
 *
 * Toggles the eye color mode on or off and then calls an update on the mob's eye color
 */
/obj/item/organ/internal/eyes/robotic/glow/proc/toggle_eye_color_mode()
	eye_color_mode = !eye_color_mode
	update_mob_eye_color()

/**
 * Updates the mob eye color
 *
 * Updates the eye color to reflect on the mob's body if it's possible to do so
 * Arguments:
 * * mob/living/carbon/eye_owner - the mob to update the eye color appearance of
 */
/obj/item/organ/internal/eyes/robotic/glow/proc/update_mob_eye_color(mob/living/carbon/eye_owner = owner)
	switch(eye_color_mode)
		if(MATCH_LIGHT_COLOR)
			eye_color_left = current_color_string
			eye_color_right = current_color_string
		if(USE_CUSTOM_COLOR)
			eye_color_left = current_left_color_string
			eye_color_right = current_right_color_string

	if(QDELETED(eye_owner) || !ishuman(eye_owner)) //Other carbon mobs don't have eye color.
		return

	eye_owner.dna.species.handle_body(eye_owner)
	update_mob_eyes_overlay()

/**
 * Updates the emissive mob eye overlay
 *
 * When the light is on, the overlay(s) are added. When it is disabled, they are cut.
 * Adds one or two overlays depending on what the eye_color_mode toggle is set to.
 * Arguments:
 * * mob/living/carbon/eye_owner - the mob to add the overlay to
 */
/obj/item/organ/internal/eyes/robotic/glow/proc/update_mob_eyes_overlay(mob/living/carbon/eye_owner = owner)
	if(QDELETED(eye_owner))
		return

	if(!ishuman(eye_owner))
		return

	eye_owner.cut_overlay(eyes_overlay)
	eye_owner.cut_overlay(eyes_overlay_left)
	eye_owner.cut_overlay(eyes_overlay_right)

	if(!eye.on)
		return

	switch(eye_color_mode)
		if(MATCH_LIGHT_COLOR)
			eyes_overlay = emissive_appearance('icons/mob/species/human/human_face.dmi', "eyes_glow_gs", eye_owner, layer = -BODY_LAYER, alpha = owner.alpha)
			eyes_overlay.color = current_color_string
			eye_owner.add_overlay(eyes_overlay)
		if(USE_CUSTOM_COLOR)
			eyes_overlay_left = emissive_appearance('icons/mob/species/human/human_face.dmi', "eyes_glow_gs_left", eye_owner, layer = -BODY_LAYER, alpha = owner.alpha)
			eyes_overlay_right = emissive_appearance('icons/mob/species/human/human_face.dmi', "eyes_glow_gs_right", eye_owner, layer = -BODY_LAYER, alpha = owner.alpha)
			eyes_overlay_left.color = eye_color_left
			eyes_overlay_right.color = eye_color_right
			eye_owner.add_overlay(eyes_overlay_left)
			eye_owner.add_overlay(eyes_overlay_right)

#undef MATCH_LIGHT_COLOR
#undef USE_CUSTOM_COLOR
#undef UPDATE_LIGHT
#undef UPDATE_EYES_LEFT
#undef UPDATE_EYES_RIGHT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/organ/internal/eyes/moth
	name = "moth eyes"
	desc = "These eyes seem to have increased sensitivity to bright light, with no improvement to low light vision."
	eye_icon_state = "motheyes"
	icon_state = "eyeballs-moth"
	flash_protect = FLASH_PROTECTION_SENSITIVE

/obj/item/organ/internal/eyes/snail
	name = "snail eyes"
	desc = "These eyes seem to have a large range, but might be cumbersome with glasses."
	eye_icon_state = "snail_eyes"
	icon_state = "snail_eyeballs"
	eyes_layer = ABOVE_BODY_FRONT_HEAD_LAYER //SKYRAT EDIT - Roundstart Snails

<<<<<<< HEAD
=======
/obj/item/organ/internal/eyes/jelly
	name = "jelly eyes"
	desc = "These eyes are made of a soft jelly. Unlike all other eyes, though, there are three of them."
	eye_icon_state = "jelleyes"
	icon_state = "eyeballs-jelly"

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/organ/internal/eyes/night_vision/maintenance_adapted
	name = "adapted eyes"
	desc = "These red eyes look like two foggy marbles. They give off a particularly worrying glow in the dark."
	flash_protect = FLASH_PROTECTION_HYPER_SENSITIVE
	eye_color_left = "f00"
	eye_color_right = "f00"
	icon_state = "adapted_eyes"
	eye_icon_state = "eyes_glow"
	overlay_ignore_lighting = TRUE
<<<<<<< HEAD
	var/obj/item/flashlight/eyelight/adapted/adapt_light

/obj/item/organ/internal/eyes/night_vision/maintenance_adapted/Insert(mob/living/carbon/adapted, special = FALSE, drop_if_replaced = TRUE)
=======
	low_light_cutoff = list(5, 12, 20)
	medium_light_cutoff = list(15, 20, 30)
	high_light_cutoff = list(30, 35, 50)
	var/obj/item/flashlight/eyelight/adapted/adapt_light

/obj/item/organ/internal/eyes/night_vision/maintenance_adapted/on_insert(mob/living/carbon/eye_owner)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	//add lighting
	if(!adapt_light)
		adapt_light = new /obj/item/flashlight/eyelight/adapted()
	adapt_light.on = TRUE
<<<<<<< HEAD
	adapt_light.forceMove(adapted)
	adapt_light.update_brightness(adapted)
	ADD_TRAIT(adapted, TRAIT_UNNATURAL_RED_GLOWY_EYES, ORGAN_TRAIT)

/obj/item/organ/internal/eyes/night_vision/maintenance_adapted/on_life(delta_time, times_fired)
	var/turf/owner_turf = get_turf(owner)
	var/lums = owner_turf.get_lumcount()
	if(lums > 0.5) //we allow a little more than usual so we can produce light from the adapted eyes
		to_chat(owner, span_danger("Your eyes! They burn in the light!"))
		applyOrganDamage(10) //blind quickly
		playsound(owner, 'sound/machines/grill/grillsizzle.ogg', 50)
	else
		applyOrganDamage(-10) //heal quickly
=======
	adapt_light.forceMove(eye_owner)
	adapt_light.update_brightness(eye_owner)
	ADD_TRAIT(eye_owner, TRAIT_UNNATURAL_RED_GLOWY_EYES, ORGAN_TRAIT)

/obj/item/organ/internal/eyes/night_vision/maintenance_adapted/on_life(seconds_per_tick, times_fired)
	if(!owner.is_blind() && isturf(owner.loc) && owner.has_light_nearby(light_amount=0.5)) //we allow a little more than usual so we can produce light from the adapted eyes
		to_chat(owner, span_danger("Your eyes! They burn in the light!"))
		apply_organ_damage(10) //blind quickly
		playsound(owner, 'sound/machines/grill/grillsizzle.ogg', 50)
	else
		apply_organ_damage(-10) //heal quickly
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()

/obj/item/organ/internal/eyes/night_vision/maintenance_adapted/Remove(mob/living/carbon/unadapted, special = FALSE)
	//remove lighting
	adapt_light.on = FALSE
	adapt_light.update_brightness(unadapted)
	adapt_light.forceMove(src)
	REMOVE_TRAIT(unadapted, TRAIT_UNNATURAL_RED_GLOWY_EYES, ORGAN_TRAIT)
	return ..()
