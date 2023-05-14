<<<<<<< HEAD

GLOBAL_LIST_EMPTY(parasites) //all currently existing/living guardians

#define GUARDIAN_HANDS_LAYER 1
#define GUARDIAN_TOTAL_LAYERS 1

=======
GLOBAL_LIST_EMPTY(parasites) //all currently existing/living guardians

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/mob/living/simple_animal/hostile/guardian
	name = "Guardian Spirit"
	real_name = "Guardian Spirit"
	desc = "A mysterious being that stands by its charge, ever vigilant."
	speak_emote = list("hisses")
	gender = NEUTER
	mob_biotypes = NONE
	bubble_icon = "guardian"
	response_help_continuous = "passes through"
	response_help_simple = "pass through"
	response_disarm_continuous = "flails at"
	response_disarm_simple = "flail at"
	response_harm_continuous = "punches"
	response_harm_simple = "punch"
	icon = 'icons/mob/nonhuman-player/guardian.dmi'
	icon_state = "magicbase"
	icon_living = "magicbase"
	icon_dead = "magicbase"
	speed = 0
	combat_mode = TRUE
	stop_automated_movement = 1
	attack_sound = 'sound/weapons/punch1.ogg'
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = INFINITY
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	maxHealth = INFINITY //The spirit itself is invincible
	health = INFINITY
	healable = FALSE //don't brusepack the guardian
<<<<<<< HEAD
	damage_coeff = list(BRUTE = 0.5, BURN = 0.5, TOX = 0.5, CLONE = 0.5, STAMINA = 0, OXY = 0.5) //how much damage from each damage type we transfer to the owner
=======
	damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 1, CLONE = 1, STAMINA = 0, OXY = 1) //how much damage from each damage type we transfer to the owner
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	obj_damage = 40
	melee_damage_lower = 15
	melee_damage_upper = 15
<<<<<<< HEAD
	butcher_results = list(/obj/item/ectoplasm = 1)
	AIStatus = AI_OFF
=======
	del_on_death = TRUE
	loot = list(/obj/effect/temp_visual/guardian/phase/out)
	AIStatus = AI_OFF
	can_have_ai = FALSE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	light_system = MOVABLE_LIGHT
	light_range = 3
	light_on = FALSE
	hud_type = /datum/hud/guardian
	dextrous_hud_type = /datum/hud/dextrous/guardian //if we're set to dextrous, account for it.
<<<<<<< HEAD
	var/mutable_appearance/cooloverlay
	var/guardiancolor
	var/recolorentiresprite
	var/theme
	var/list/guardian_overlays[GUARDIAN_TOTAL_LAYERS]
	var/reset = 0 //if the summoner has reset the guardian already
	var/cooldown = 0
	var/mob/living/summoner
	var/range = 10 //how far from the user the spirit can be
	var/toggle_button_type = /atom/movable/screen/guardian/toggle_mode/inactive //what sort of toggle button the hud uses
	var/playstyle_string = "<span class='holoparasite bold'>You are a Guardian without any type. You shouldn't exist!</span>"
	var/magic_fluff_string = "<span class='holoparasite'>You draw the Coder, symbolizing bugs and errors. This shouldn't happen! Submit a bug report!</span>"
	var/tech_fluff_string = "<span class='holoparasite'>BOOT SEQUENCE COMPLETE. ERROR MODULE LOADED. THIS SHOULDN'T HAPPEN. Submit a bug report!</span>"
	var/carp_fluff_string = "<span class='holoparasite'>CARP CARP CARP SOME SORT OF HORRIFIC BUG BLAME THE CODERS CARP CARP CARP</span>"
	var/miner_fluff_string = "<span class='holoparasite'>You encounter... Mythril, it shouldn't exist... Submit a bug report!</span>"
	///Are we forced to not be able to manifest/recall?
	var/locked = FALSE

/mob/living/simple_animal/hostile/guardian/Initialize(mapload, theme)
	GLOB.parasites += src
	updatetheme(theme)
	AddElement(/datum/element/simple_flying)
	return ..()

/// Setter for our summoner mob.
/mob/living/simple_animal/hostile/guardian/proc/set_summoner(mob/to_who)
	if(summoner)
		UnregisterSignal(summoner, list(COMSIG_LIVING_ON_WABBAJACKED, COMSIG_LIVING_SHAPESHIFTED, COMSIG_LIVING_UNSHAPESHIFTED))

	summoner = to_who
	Recall(TRUE)
	RegisterSignal(to_who, COMSIG_LIVING_ON_WABBAJACKED, PROC_REF(on_owner_wabbajacked))
	RegisterSignal(to_who, COMSIG_LIVING_SHAPESHIFTED, PROC_REF(on_owner_shapeshifted))
	RegisterSignal(to_who, COMSIG_LIVING_UNSHAPESHIFTED, PROC_REF(on_owner_unshapeshifted))

/// Signal proc for [COMSIG_LIVING_ON_WABBAJACKED], when our summoner is wabbajacked we should be alerted.
/mob/living/simple_animal/hostile/guardian/proc/on_owner_wabbajacked(mob/living/source, mob/living/new_mob)
=======
	faction = list()

	/// The guardian's color, used for their sprite, chat, and some effects made by it.
	var/guardian_color
	/// List of overlays we use.
	var/list/guardian_overlays[GUARDIAN_TOTAL_LAYERS]

	/// The summoner of the guardian, the one it's intended to guard!
	var/mob/living/summoner
	/// How far from the summoner the guardian can be.
	var/range = 10

	/// Which toggle button the HUD uses.
	var/toggle_button_type = /atom/movable/screen/guardian/toggle_mode/inactive
	/// Name used by the guardian creator.
	var/creator_name = "Error"
	/// Description used by the guardian creator.
	var/creator_desc = "This shouldn't be here! Report it on GitHub!"
	/// Icon used by the guardian creator.
	var/creator_icon = "fuck"

	/// A string explaining to the guardian what they can do.
	var/playstyle_string = span_boldholoparasite("You are a Guardian without any type. You shouldn't exist!")
	/// The fluff string we actually use.
	var/used_fluff_string
	/// Fluff string from tarot cards.
	var/magic_fluff_string = span_holoparasite("You draw the Coder, symbolizing bugs and errors. This shouldn't happen! Submit a bug report!")
	/// Fluff string from holoparasite injectors.
	var/tech_fluff_string = span_holoparasite("BOOT SEQUENCE COMPLETE. ERROR MODULE LOADED. THIS SHOULDN'T HAPPEN. Submit a bug report!")
	/// Fluff string from holocarp fishsticks.
	var/carp_fluff_string = span_holoparasite("CARP CARP CARP SOME SORT OF HORRIFIC BUG BLAME THE CODERS CARP CARP CARP")
	/// Fluff string from the dusty shard.
	var/miner_fluff_string = span_holoparasite("You encounter... Mythril, it shouldn't exist... Submit a bug report!")

	/// Are we forced to not be able to manifest/recall?
	var/locked = FALSE
	/// Cooldown between manifests/recalls.
	COOLDOWN_DECLARE(manifest_cooldown)
	/// Cooldown between the summoner resetting the guardian's client.
	COOLDOWN_DECLARE(resetting_cooldown)

/mob/living/simple_animal/hostile/guardian/Initialize(mapload, theme)
	. = ..()
	GLOB.parasites += src
	update_theme(theme)
	AddElement(/datum/element/simple_flying)
	manifest_effects()

/mob/living/simple_animal/hostile/guardian/Destroy() //if deleted by admins or something random, cut from the summoner
	if(is_deployed())
		recall_effects()
	if(!QDELETED(summoner))
		cut_summoner(different_person = TRUE)
	return ..()

/// Setter for our summoner mob.
/mob/living/simple_animal/hostile/guardian/proc/set_summoner(mob/living/to_who, different_person = FALSE)
	if(QDELETED(to_who))
		qdel(src) //no gettin off scot-free pal.........
		return
	if(summoner)
		cut_summoner(different_person)
	summoner = to_who
	update_health_hud()
	med_hud_set_health()
	med_hud_set_status()
	add_verb(to_who, list(
		/mob/living/proc/guardian_comm,
		/mob/living/proc/guardian_recall,
		/mob/living/proc/guardian_reset,
	))
	if(different_person)
		if(mind)
			mind.enslave_mind_to_creator(to_who)
		else //mindless guardian, manually give them factions
			faction += summoner.faction
			summoner.faction += "[REF(src)]"
	remove_all_languages(LANGUAGE_MASTER)
	copy_languages(to_who, LANGUAGE_MASTER) // make sure holoparasites speak same language as master
	update_atom_languages()
	RegisterSignal(to_who, COMSIG_MOVABLE_MOVED, PROC_REF(check_distance))
	RegisterSignal(to_who, COMSIG_PARENT_QDELETING, PROC_REF(on_summoner_deletion))
	RegisterSignal(to_who, COMSIG_LIVING_DEATH, PROC_REF(on_summoner_death))
	RegisterSignal(to_who, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(on_summoner_health_update))
	RegisterSignal(to_who, COMSIG_LIVING_ON_WABBAJACKED, PROC_REF(on_summoner_wabbajacked))
	RegisterSignal(to_who, COMSIG_LIVING_SHAPESHIFTED, PROC_REF(on_summoner_shapeshifted))
	RegisterSignal(to_who, COMSIG_LIVING_UNSHAPESHIFTED, PROC_REF(on_summoner_unshapeshifted))
	recall(forced = TRUE)
	if(to_who.stat == DEAD)
		on_summoner_death(to_who)

/mob/living/simple_animal/hostile/guardian/proc/cut_summoner(different_person = FALSE)
	if(is_deployed())
		recall_effects()
	forceMove(get_turf(src))
	UnregisterSignal(summoner, list(COMSIG_MOVABLE_MOVED, COMSIG_PARENT_QDELETING, COMSIG_LIVING_DEATH, COMSIG_LIVING_HEALTH_UPDATE, COMSIG_LIVING_ON_WABBAJACKED, COMSIG_LIVING_SHAPESHIFTED, COMSIG_LIVING_UNSHAPESHIFTED))
	if(different_person)
		summoner.faction -= "[REF(src)]"
		faction -= summoner.faction
		mind?.remove_all_antag_datums()
	if(!length(summoner.get_all_linked_holoparasites() - src))
		remove_verb(summoner, list(
			/mob/living/proc/guardian_comm,
			/mob/living/proc/guardian_recall,
			/mob/living/proc/guardian_reset,
		))
	summoner = null

/// Signal proc for [COMSIG_LIVING_ON_WABBAJACKED], when our summoner is wabbajacked we should be alerted.
/mob/living/simple_animal/hostile/guardian/proc/on_summoner_wabbajacked(mob/living/source, mob/living/new_mob)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	SIGNAL_HANDLER

	set_summoner(new_mob)
	to_chat(src, span_holoparasite("Your summoner has changed form!"))

/// Signal proc for [COMSIG_LIVING_SHAPESHIFTED], when our summoner is shapeshifted we should change to the new mob
<<<<<<< HEAD
/mob/living/simple_animal/hostile/guardian/proc/on_owner_shapeshifted(mob/living/source, mob/living/new_shape)
=======
/mob/living/simple_animal/hostile/guardian/proc/on_summoner_shapeshifted(mob/living/source, mob/living/new_shape)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	SIGNAL_HANDLER

	set_summoner(new_shape)
	to_chat(src, span_holoparasite("Your summoner has shapeshifted into that of a [new_shape]!"))

/// Signal proc for [COMSIG_LIVING_UNSHAPESHIFTED], when our summoner unshapeshifts go back to that mob
<<<<<<< HEAD
/mob/living/simple_animal/hostile/guardian/proc/on_owner_unshapeshifted(mob/living/source, mob/living/old_summoner)
=======
/mob/living/simple_animal/hostile/guardian/proc/on_summoner_unshapeshifted(mob/living/source, mob/living/old_summoner)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	SIGNAL_HANDLER

	set_summoner(old_summoner)
	to_chat(src, span_holoparasite("Your summoner has shapeshifted back into their normal form!"))

// Ha, no
/mob/living/simple_animal/hostile/guardian/wabbajack(what_to_randomize, change_flags = WABBAJACK)
	visible_message(span_warning("[src] resists the polymorph!"))

<<<<<<< HEAD
/mob/living/simple_animal/hostile/guardian/med_hud_set_health()
	if(summoner)
		var/image/holder = hud_list[HEALTH_HUD]
		holder.icon_state = "hud[RoundHealth(summoner)]"

/mob/living/simple_animal/hostile/guardian/med_hud_set_status()
	if(summoner)
		var/image/holder = hud_list[STATUS_HUD]
		var/icon/I = icon(icon, icon_state, dir)
		holder.pixel_y = I.Height() - world.icon_size
		if(summoner.stat == DEAD)
			holder.icon_state = "huddead"
		else
			holder.icon_state = "hudhealthy"
=======
/mob/living/simple_animal/hostile/guardian/proc/on_summoner_health_update(mob/living/source)
	SIGNAL_HANDLER

	update_health_hud()
	med_hud_set_health()
	med_hud_set_status()

/mob/living/simple_animal/hostile/guardian/med_hud_set_health()
	var/image/holder = hud_list?[HEALTH_HUD]
	if(isnull(holder))
		return
	holder.icon_state = "hud[RoundHealth(summoner || src)]"
	var/icon/size_check = icon(icon, icon_state, dir)
	holder.pixel_y = size_check.Height() - world.icon_size

/mob/living/simple_animal/hostile/guardian/med_hud_set_status()
	var/image/holder = hud_list?[STATUS_HUD]
	if(isnull(holder))
		return
	var/icon/size_check = icon(icon, icon_state, dir)
	holder.pixel_y = size_check.Height() - world.icon_size
	var/mob/living/checking_mob = summoner || src
	if(checking_mob.stat == DEAD || HAS_TRAIT(checking_mob, TRAIT_FAKEDEATH))
		holder.icon_state = "huddead"
	else
		holder.icon_state = "hudhealthy"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/mob/living/simple_animal/hostile/guardian/Destroy()
	GLOB.parasites -= src
	return ..()

<<<<<<< HEAD
/mob/living/simple_animal/hostile/guardian/proc/updatetheme(theme) //update the guardian's theme
	if(!theme)
		theme = pick("magic", "tech", "carp", "miner")
	switch(theme)//should make it easier to create new stand designs in the future if anyone likes that
		if("magic")
=======
/mob/living/simple_animal/hostile/guardian/proc/update_theme(theme) //update the guardian's theme
	if(!theme)
		theme = pick(GUARDIAN_THEME_MAGIC, GUARDIAN_THEME_TECH, GUARDIAN_THEME_CARP, GUARDIAN_THEME_MINER)
	switch(theme)//should make it easier to create new stand designs in the future if anyone likes that
		if(GUARDIAN_THEME_MAGIC)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			name = "Guardian Spirit"
			real_name = "Guardian Spirit"
			bubble_icon = "guardian"
			icon_state = "magicbase"
			icon_living = "magicbase"
			icon_dead = "magicbase"
<<<<<<< HEAD
		if("tech")
=======
			used_fluff_string = magic_fluff_string
		if(GUARDIAN_THEME_TECH)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			name = "Holoparasite"
			real_name = "Holoparasite"
			bubble_icon = "holo"
			icon_state = "techbase"
			icon_living = "techbase"
			icon_dead = "techbase"
<<<<<<< HEAD
		if("miner")
=======
			used_fluff_string = tech_fluff_string
		if(GUARDIAN_THEME_MINER)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			name = "Power Miner"
			real_name = "Power Miner"
			bubble_icon = "guardian"
			icon_state = "minerbase"
			icon_living = "minerbase"
			icon_dead = "minerbase"
<<<<<<< HEAD
		if("carp")
			name = "Holocarp"
			real_name = "Holocarp"
			bubble_icon = "holo"
			icon_state = "holocarp"
			icon_living = "holocarp"
			icon_dead = "holocarp"
=======
			used_fluff_string = miner_fluff_string
		if(GUARDIAN_THEME_CARP)
			name = "Holocarp"
			real_name = "Holocarp"
			bubble_icon = "holo"
			icon_state = null //entirely handled by overlays
			icon_living = null
			icon_dead = null
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			speak_emote = string_list(list("gnashes"))
			desc = "A mysterious fish that stands by its charge, ever vigilant."
			attack_verb_continuous = "bites"
			attack_verb_simple = "bite"
			attack_sound = 'sound/weapons/bite.ogg'
			attack_vis_effect = ATTACK_EFFECT_BITE
<<<<<<< HEAD
			recolorentiresprite = TRUE
	if(!recolorentiresprite) //we want this to proc before stand logs in, so the overlay isn't gone for some reason
		cooloverlay = mutable_appearance(icon, theme)
		add_overlay(cooloverlay)
=======
			used_fluff_string = carp_fluff_string
	guardian_overlays[GUARDIAN_COLOR_LAYER] = mutable_appearance(icon, theme)
	apply_overlay(GUARDIAN_COLOR_LAYER)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/mob/living/simple_animal/hostile/guardian/Login() //if we have a mind, set its name to ours when it logs in
	. = ..()
	if(!. || !client)
		return FALSE
<<<<<<< HEAD
	if(mind)
		mind.name = "[real_name]"
	if(!summoner)
		to_chat(src, "<span class='holoparasite bold'>For some reason, somehow, you have no summoner. Please report this bug immediately.</span>")
		return
	to_chat(src, span_holoparasite("You are a <b>[real_name]</b>, bound to serve [summoner.real_name]."))
	to_chat(src, span_holoparasite("You are capable of manifesting or recalling to your master with the buttons on your HUD. You will also find a button to communicate with [summoner.p_them()] privately there."))
	to_chat(src, span_holoparasite("While personally invincible, you will die if [summoner.real_name] does, and any damage dealt to you will have a portion passed on to [summoner.p_them()] as you feed upon [summoner.p_them()] to sustain yourself."))
	to_chat(src, playstyle_string)
	if(!guardiancolor)
		guardianrename()
		guardianrecolor()

/mob/living/simple_animal/hostile/guardian/proc/guardianrecolor()
	guardiancolor = input(src,"What would you like your color to be?","Choose Your Color","#ffffff") as color|null
	if(!guardiancolor) //redo proc until we get a color
		to_chat(src, span_warning("Not a valid color, please try again."))
		guardianrecolor()
		return
	if(!recolorentiresprite)
		cooloverlay.color = guardiancolor
		cut_overlay(cooloverlay) //we need to get our new color
		add_overlay(cooloverlay)
	else
		add_atom_colour(guardiancolor, FIXED_COLOUR_PRIORITY)

/mob/living/simple_animal/hostile/guardian/proc/guardianrename()
	var/new_name = sanitize_name(reject_bad_text(tgui_input_text(src, "What would you like your name to be?", "Choose Your Name", real_name, MAX_NAME_LEN)))
	if(!new_name) //redo proc until we get a good name
		to_chat(src, span_warning("Not a valid name, please try again."))
		guardianrename()
=======
	if(!summoner)
		to_chat(src, span_boldholoparasite("For some reason, somehow, you have no summoner. Please report this bug immediately."))
	else
		to_chat(src, span_holoparasite("You are a <b>[real_name]</b>, bound to serve [summoner.real_name]."))
		to_chat(src, span_holoparasite("You are capable of manifesting or recalling to your master with the buttons on your HUD. You will also find a button to communicate with [summoner.p_them()] privately there."))
		to_chat(src, span_holoparasite("While personally invincible, you will die if [summoner.real_name] does, and any damage dealt to you will have a portion passed on to [summoner.p_them()] as you feed upon [summoner.p_them()] to sustain yourself."))
	to_chat(src, playstyle_string)
	if(!guardian_color)
		locked = TRUE
		guardian_rename()
		guardian_recolor()
		locked = FALSE

/mob/living/simple_animal/hostile/guardian/mind_initialize()
	. = ..()
	if(!summoner)
		to_chat(src, span_boldholoparasite("For some reason, somehow, you have no summoner. Please report this bug immediately."))
		return
	mind.enslave_mind_to_creator(summoner) //once our mind is created, we become enslaved to our summoner. cant be done in the first run of set_summoner, because by then we dont have a mind yet.

/mob/living/simple_animal/hostile/guardian/proc/guardian_recolor()
	if(!client)
		return
	var/chosen_guardian_color = input(src, "What would you like your color to be?","Choose Your Color","#ffffff") as color|null
	if(!chosen_guardian_color) //redo proc until we get a color
		to_chat(src, span_warning("Not a valid color, please try again."))
		guardian_recolor()
		return
	set_guardian_color(chosen_guardian_color)

/mob/living/simple_animal/hostile/guardian/proc/set_guardian_color(colour)
	guardian_color = colour
	set_light_color(guardian_color)
	var/mutable_appearance/guardian_color_overlay = guardian_overlays[GUARDIAN_COLOR_LAYER]
	remove_overlay(GUARDIAN_COLOR_LAYER)
	guardian_color_overlay.color = guardian_color
	guardian_overlays[GUARDIAN_COLOR_LAYER] = guardian_color_overlay
	apply_overlay(GUARDIAN_COLOR_LAYER)

/mob/living/simple_animal/hostile/guardian/proc/guardian_rename()
	if(!client)
		return
	var/new_name = sanitize_name(reject_bad_text(tgui_input_text(src, "What would you like your name to be?", "Choose Your Name", real_name, MAX_NAME_LEN)))
	if(!new_name) //redo proc until we get a good name
		to_chat(src, span_warning("Not a valid name, please try again."))
		guardian_rename()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		return
	to_chat(src, span_notice("Your new name [span_name("[new_name]")] anchors itself in your mind."))
	fully_replace_character_name(null, new_name)

<<<<<<< HEAD
/mob/living/simple_animal/hostile/guardian/Life(delta_time = SSMOBS_DT, times_fired) //Dies if the summoner dies
	. = ..()
	update_health_hud() //we need to update all of our health displays to match our summoner and we can't practically give the summoner a hook to do it
	med_hud_set_health()
	med_hud_set_status()
	if(!QDELETED(summoner))
		if(summoner.stat == DEAD)
			forceMove(summoner.loc)
			to_chat(src, span_danger("Your summoner has died!"))
			visible_message(span_danger("<B>\The [src] dies along with its user!</B>"))
			summoner.visible_message(span_danger("<B>[summoner]'s body is completely consumed by the strain of sustaining [src]!</B>"))
			for(var/obj/item/W in summoner)
				if(!summoner.dropItemToGround(W))
					qdel(W)
			summoner.dust()
			death(TRUE)
			qdel(src)
	else
		to_chat(src, span_danger("Your summoner has died!"))
		visible_message(span_danger("<B>[src] dies along with its user!</B>"))
		death(TRUE)
		qdel(src)
	snapback()
=======
/mob/living/simple_animal/hostile/guardian/proc/on_summoner_death(mob/living/source)
	SIGNAL_HANDLER

	cut_summoner()
	forceMove(source.loc)
	to_chat(src, span_danger("Your summoner has died!"))
	visible_message(span_bolddanger("\The [src] dies along with its user!"))
	source.visible_message(span_bolddanger("[source]'s body is completely consumed by the strain of sustaining [src]!"))
	source.dust(drop_items = TRUE)
	death(TRUE)

/mob/living/simple_animal/hostile/guardian/proc/on_summoner_deletion(mob/living/source)
	SIGNAL_HANDLER

	cut_summoner()
	to_chat(src, span_danger("Your summoner is gone!"))
	qdel(src)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/mob/living/simple_animal/hostile/guardian/get_status_tab_items()
	. += ..()
	if(summoner)
<<<<<<< HEAD
		var/resulthealth
		if(iscarbon(summoner))
			resulthealth = round((abs(HEALTH_THRESHOLD_DEAD - summoner.health) / abs(HEALTH_THRESHOLD_DEAD - summoner.maxHealth)) * 100)
		else
			resulthealth = round((summoner.health / summoner.maxHealth) * 100, 0.5)
		. += "Summoner Health: [resulthealth]%"
	if(cooldown >= world.time)
		. += "Manifest/Recall Cooldown Remaining: [DisplayTimeText(cooldown - world.time)]"

/mob/living/simple_animal/hostile/guardian/Move() //Returns to summoner if they move out of range
	. = ..()
	snapback()

/mob/living/simple_animal/hostile/guardian/proc/snapback()
	if(summoner)
		if(get_dist(get_turf(summoner),get_turf(src)) <= range)
			return
		else
			to_chat(src, span_holoparasite("You moved out of range, and were pulled back! You can only move [range] meters from [summoner.real_name]!"))
			visible_message(span_danger("\The [src] jumps back to its user."))
			if(istype(summoner.loc, /obj/effect))
				Recall(TRUE)
			else
				new /obj/effect/temp_visual/guardian/phase/out(loc)
				forceMove(summoner.loc)
				new /obj/effect/temp_visual/guardian/phase(loc)

/mob/living/simple_animal/hostile/guardian/canSuicide()
	return FALSE

/mob/living/simple_animal/hostile/guardian/proc/is_deployed()
	return loc != summoner

/mob/living/simple_animal/hostile/guardian/AttackingTarget()
	if(!is_deployed())
		to_chat(src, "[span_danger("<B>You must be manifested to attack!")]</B>")
=======
		var/healthpercent = health_percentage(summoner)
		. += "Summoner Health: [round(healthpercent, 0.5)]%"
	if(!COOLDOWN_FINISHED(src, manifest_cooldown))
		. += "Manifest/Recall Cooldown Remaining: [DisplayTimeText(COOLDOWN_TIMELEFT(src, manifest_cooldown))]"

/mob/living/simple_animal/hostile/guardian/Move() //Returns to summoner if they move out of range
	. = ..()
	check_distance()

/mob/living/simple_animal/hostile/guardian/proc/check_distance()
	SIGNAL_HANDLER

	if(!summoner)
		return
	if(get_dist(get_turf(summoner), get_turf(src)) <= range)
		return
	to_chat(src, span_holoparasite("You moved out of range, and were pulled back! You can only move [range] meters from [summoner.real_name]!"))
	visible_message(span_danger("\The [src] jumps back to its user."))
	if(istype(summoner.loc, /obj/effect))
		recall(forced = TRUE)
	else
		new /obj/effect/temp_visual/guardian/phase/out(loc)
		forceMove(summoner.loc)
		new /obj/effect/temp_visual/guardian/phase(loc)

/mob/living/simple_animal/hostile/guardian/can_suicide()
	return FALSE

/mob/living/simple_animal/hostile/guardian/proc/is_deployed()
	return loc != summoner || !summoner

/mob/living/simple_animal/hostile/guardian/AttackingTarget(atom/attacked_target)
	if(!is_deployed())
		to_chat(src, span_bolddanger("You must be manifested to attack!"))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		return FALSE
	else
		return ..()

<<<<<<< HEAD
/mob/living/simple_animal/hostile/guardian/death()
	drop_all_held_items()
	..()
	if(summoner)
		to_chat(summoner, "[span_danger("<B>Your [name] died somehow!")]</B>")
		summoner.dust()

/mob/living/simple_animal/hostile/guardian/update_health_hud()
	if(summoner && hud_used?.healths)
		var/resulthealth
		if(iscarbon(summoner))
			resulthealth = round((abs(HEALTH_THRESHOLD_DEAD - summoner.health) / abs(HEALTH_THRESHOLD_DEAD - summoner.maxHealth)) * 100)
		else
			resulthealth = round((summoner.health / summoner.maxHealth) * 100, 0.5)
		hud_used.healths.maptext = MAPTEXT("<div align='center' valign='middle' style='position:relative; top:0px; left:6px'><font color='#efeeef'>[resulthealth]%</font></div>")

/mob/living/simple_animal/hostile/guardian/adjustHealth(amount, updating_health = TRUE, forced = FALSE) //The spirit is invincible, but passes on damage to the summoner
	. = amount
	if(summoner)
		if(loc == summoner)
			return FALSE
		summoner.adjustBruteLoss(amount)
		if(amount > 0)
			to_chat(summoner, "[span_danger("<B>Your [name] is under attack! You take damage!")]</B>")
			summoner.visible_message(span_danger("<B>Blood sprays from [summoner] as [src] takes damage!</B>"))
			switch(summoner.stat)
				if(UNCONSCIOUS, HARD_CRIT)
					to_chat(summoner, "[span_danger("<B>Your body can't take the strain of sustaining [src] in this condition, it begins to fall apart!")]</B>")
					summoner.adjustCloneLoss(amount * 0.5) //dying hosts take 50% bonus damage as cloneloss
		update_health_hud()
=======
/mob/living/simple_animal/hostile/guardian/death(gibbed)
	. = ..()
	if(!QDELETED(summoner))
		to_chat(summoner, span_bolddanger("Your [name] died somehow!"))
		summoner.dust()

/mob/living/simple_animal/hostile/guardian/update_health_hud()
	var/severity = 0
	var/healthpercent = health_percentage(summoner || src)
	switch(healthpercent)
		if(100 to INFINITY)
			severity = 0
		if(85 to 100)
			severity = 1
		if(70 to 85)
			severity = 2
		if(55 to 70)
			severity = 3
		if(40 to 55)
			severity = 4
		if(25 to 40)
			severity = 5
		else
			severity = 6
	if(severity > 0)
		overlay_fullscreen("brute", /atom/movable/screen/fullscreen/brute, severity)
	else
		clear_fullscreen("brute")
	if(hud_used?.healths)
		hud_used.healths.maptext = MAPTEXT("<div align='center' valign='middle' style='position:relative; top:0px; left:6px'><font color='#efeeef'>[round(healthpercent, 0.5)]%</font></div>")

/mob/living/simple_animal/hostile/guardian/adjustHealth(amount, updating_health = TRUE, forced = FALSE) //The spirit is invincible, but passes on damage to the summoner
	. = amount
	if(!summoner)
		return ..()
	if(!is_deployed())
		return FALSE
	summoner.adjustBruteLoss(amount)
	if(amount < 0 || QDELETED(summoner))
		return
	to_chat(summoner, span_bolddanger("Your [name] is under attack! You take damage!"))
	summoner.visible_message(span_bolddanger("Blood sprays from [summoner] as [src] takes damage!"))
	switch(summoner.stat)
		if(UNCONSCIOUS, HARD_CRIT)
			to_chat(summoner, span_bolddanger("Your body can't take the strain of sustaining [src] in this condition, it begins to fall apart!"))
			summoner.adjustCloneLoss(amount * 0.5) //dying hosts take 50% bonus damage as cloneloss
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/mob/living/simple_animal/hostile/guardian/ex_act(severity, target)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			investigate_log("has been gibbed by an explosion.", INVESTIGATE_DEATHS)
			gib()
			return TRUE
		if(EXPLODE_HEAVY)
			adjustBruteLoss(60)
		if(EXPLODE_LIGHT)
			adjustBruteLoss(30)

<<<<<<< HEAD
/mob/living/simple_animal/hostile/guardian/gib()
	if(summoner)
		to_chat(summoner, "[span_danger("<B>Your [src] was blown up!")]</B>")
		summoner.investigate_log("has been gibbed by an explosion.", INVESTIGATE_DEATHS)
		summoner.gib()
	ghostize()
	qdel(src)

//HAND HANDLING

/mob/living/simple_animal/hostile/guardian/equip_to_slot(obj/item/I, slot)
	if(!slot)
		return FALSE
	if(!istype(I))
		return FALSE

	. = TRUE
	var/index = get_held_index_of_item(I)
=======
	return TRUE

/mob/living/simple_animal/hostile/guardian/gib()
	death(TRUE)

/mob/living/simple_animal/hostile/guardian/dust(just_ash, drop_items, force)
	death(TRUE)

//HAND HANDLING

/mob/living/simple_animal/hostile/guardian/equip_to_slot(obj/item/equipped_item, slot)
	if(!slot)
		return FALSE
	if(!istype(equipped_item))
		return FALSE

	. = TRUE
	var/index = get_held_index_of_item(equipped_item)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(index)
		held_items[index] = null
		update_held_items()

<<<<<<< HEAD
	if(I.pulledby)
		I.pulledby.stop_pulling()

	I.screen_loc = null // will get moved if inventory is visible
	I.forceMove(src)
	I.equipped(src, slot)
	SET_PLANE_EXPLICIT(I, ABOVE_HUD_PLANE, src)
=======
	if(equipped_item.pulledby)
		equipped_item.pulledby.stop_pulling()

	equipped_item.screen_loc = null // will get moved if inventory is visible
	equipped_item.forceMove(src)
	equipped_item.equipped(src, slot)
	SET_PLANE_EXPLICIT(equipped_item, ABOVE_HUD_PLANE, src)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/mob/living/simple_animal/hostile/guardian/proc/apply_overlay(cache_index)
	if((. = guardian_overlays[cache_index]))
		add_overlay(.)

/mob/living/simple_animal/hostile/guardian/proc/remove_overlay(cache_index)
<<<<<<< HEAD
	var/I = guardian_overlays[cache_index]
	if(I)
		cut_overlay(I)
=======
	var/overlay = guardian_overlays[cache_index]
	if(overlay)
		cut_overlay(overlay)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		guardian_overlays[cache_index] = null

/mob/living/simple_animal/hostile/guardian/update_held_items()
	remove_overlay(GUARDIAN_HANDS_LAYER)
	var/list/hands_overlays = list()
	var/obj/item/l_hand = get_item_for_held_index(1)
	var/obj/item/r_hand = get_item_for_held_index(2)

	if(r_hand)
		hands_overlays += r_hand.build_worn_icon(default_layer = GUARDIAN_HANDS_LAYER, default_icon_file = r_hand.righthand_file, isinhands = TRUE)

		if(client && hud_used && hud_used.hud_version != HUD_STYLE_NOHUD)
			SET_PLANE_EXPLICIT(r_hand, ABOVE_HUD_PLANE, src)
			r_hand.screen_loc = ui_hand_position(get_held_index_of_item(r_hand))
			client.screen |= r_hand

	if(l_hand)
		hands_overlays += l_hand.build_worn_icon(default_layer = GUARDIAN_HANDS_LAYER, default_icon_file = l_hand.lefthand_file, isinhands = TRUE)

		if(client && hud_used && hud_used.hud_version != HUD_STYLE_NOHUD)
			SET_PLANE_EXPLICIT(l_hand, ABOVE_HUD_PLANE, src)
			l_hand.screen_loc = ui_hand_position(get_held_index_of_item(l_hand))
			client.screen |= l_hand

	if(length(hands_overlays))
		guardian_overlays[GUARDIAN_HANDS_LAYER] = hands_overlays
	apply_overlay(GUARDIAN_HANDS_LAYER)

/mob/living/simple_animal/hostile/guardian/regenerate_icons()
	update_held_items()

//MANIFEST, RECALL, TOGGLE MODE/LIGHT, SHOW TYPE

<<<<<<< HEAD
/mob/living/simple_animal/hostile/guardian/proc/Manifest(forced)
	if(istype(summoner.loc, /obj/effect) || (cooldown > world.time && !forced) || locked)
		return FALSE
	if(loc == summoner)
		forceMove(summoner.loc)
		new /obj/effect/temp_visual/guardian/phase(loc)
		cooldown = world.time + 10
		reset_perspective()
		return TRUE
	return FALSE

/mob/living/simple_animal/hostile/guardian/proc/Recall(forced)
	if(!summoner || loc == summoner || (cooldown > world.time && !forced) || locked)
		return FALSE
	new /obj/effect/temp_visual/guardian/phase/out(loc)

	forceMove(summoner)
	cooldown = world.time + 10
	return TRUE

/mob/living/simple_animal/hostile/guardian/proc/ToggleMode()
	to_chat(src, "[span_danger("<B>You don't have another mode!")]</B>")


/mob/living/simple_animal/hostile/guardian/proc/ToggleLight()
=======
/mob/living/simple_animal/hostile/guardian/proc/manifest(forced)
	if(is_deployed() || istype(summoner.loc, /obj/effect) || (!COOLDOWN_FINISHED(src, manifest_cooldown) && !forced) || locked)
		return FALSE
	forceMove(summoner.loc)
	new /obj/effect/temp_visual/guardian/phase(loc)
	COOLDOWN_START(src, manifest_cooldown, 1 SECONDS)
	reset_perspective()
	manifest_effects()
	return TRUE

/mob/living/simple_animal/hostile/guardian/proc/recall(forced)
	if(!is_deployed() || !summoner || (!COOLDOWN_FINISHED(src, manifest_cooldown) && !forced) || locked)
		return FALSE
	new /obj/effect/temp_visual/guardian/phase/out(loc)
	forceMove(summoner)
	COOLDOWN_START(src, manifest_cooldown, 1 SECONDS)
	recall_effects()
	return TRUE

/mob/living/simple_animal/hostile/guardian/proc/manifest_effects()
	return

/mob/living/simple_animal/hostile/guardian/proc/recall_effects()
	return

/mob/living/simple_animal/hostile/guardian/proc/toggle_modes()
	to_chat(src, span_bolddanger("You don't have another mode!"))

/mob/living/simple_animal/hostile/guardian/proc/toggle_light()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(!light_on)
		to_chat(src, span_notice("You activate your light."))
		set_light_on(TRUE)
	else
		to_chat(src, span_notice("You deactivate your light."))
		set_light_on(FALSE)


<<<<<<< HEAD
/mob/living/simple_animal/hostile/guardian/verb/ShowType()
=======
/mob/living/simple_animal/hostile/guardian/verb/check_type()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	set name = "Check Guardian Type"
	set category = "Guardian"
	set desc = "Check what type you are."
	to_chat(src, playstyle_string)

//COMMUNICATION

<<<<<<< HEAD
/mob/living/simple_animal/hostile/guardian/proc/Communicate()
	if(summoner)
		var/sender_key = key
		var/input = tgui_input_text(src, "Enter a message to tell your summoner", "Guardian")
		if(sender_key != key || !input) //guardian got reset, or did not enter anything
			return

		var/preliminary_message = "<span class='holoparasite bold'>[input]</span>" //apply basic color/bolding
		var/my_message = "<font color=\"[guardiancolor]\"><b><i>[src]:</i></b></font> [preliminary_message]" //add source, color source with the guardian's color

		to_chat(summoner, "<span class='say'>[my_message]</span>")
		var/list/guardians = summoner.get_all_linked_holoparasites()
		for(var/para in guardians)
			to_chat(para, "<span class='say'>[my_message]</span>")
		for(var/M in GLOB.dead_mob_list)
			var/link = FOLLOW_LINK(M, src)
			to_chat(M, "<span class='say'>[link] [my_message]</span>")

		src.log_talk(input, LOG_SAY, tag="guardian")
=======
/mob/living/simple_animal/hostile/guardian/proc/communicate()
	if(!summoner)
		return
	var/sender_key = key
	var/input = tgui_input_text(src, "Enter a message to tell your summoner", "Guardian")
	if(sender_key != key || !input) //guardian got reset, or did not enter anything
		return

	var/preliminary_message = span_boldholoparasite("[input]") //apply basic color/bolding
	var/my_message = "<font color=\"[guardian_color]\"><b><i>[src]:</i></b></font> [preliminary_message]" //add source, color source with the guardian's color

	to_chat(summoner, "<span class='say'>[my_message]</span>")
	var/list/guardians = summoner.get_all_linked_holoparasites()
	for(var/guardian in guardians)
		to_chat(guardian, "<span class='say'>[my_message]</span>")
	for(var/dead_mob in GLOB.dead_mob_list)
		var/link = FOLLOW_LINK(dead_mob, src)
		to_chat(dead_mob, "<span class='say'>[link] [my_message]</span>")

	src.log_talk(input, LOG_SAY, tag="guardian")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/mob/living/proc/guardian_comm()
	set name = "Communicate"
	set category = "Guardian"
	set desc = "Communicate telepathically with your guardian."
	var/input = tgui_input_text(src, "Enter a message to tell your guardian", "Message")
	if(!input)
		return

<<<<<<< HEAD
	var/preliminary_message = "<span class='holoparasite bold'>[input]</span>" //apply basic color/bolding
	var/my_message = "<span class='holoparasite bold'><i>[src]:</i> [preliminary_message]</span>" //add source, color source with default grey...

	to_chat(src, "<span class='say'>[my_message]</span>")
	var/list/guardians = get_all_linked_holoparasites()
	for(var/para in guardians)
		var/mob/living/simple_animal/hostile/guardian/G = para
		to_chat(G, "<span class='say'><font color=\"[G.guardiancolor]\"><b><i>[src]:</i></b></font> [preliminary_message]</span>" )
	for(var/M in GLOB.dead_mob_list)
		var/link = FOLLOW_LINK(M, src)
		to_chat(M, "<span class='say'>[link] [my_message]</span>")
=======
	var/preliminary_message = span_boldholoparasite("[input]") //apply basic color/bolding
	var/my_message = span_boldholoparasite("<i>[src]:</i> [preliminary_message]") //add source, color source with default grey...

	to_chat(src, "<span class='say'>[my_message]</span>")
	var/list/guardians = get_all_linked_holoparasites()
	for(var/mob/living/simple_animal/hostile/guardian/guardian as anything in guardians)
		to_chat(guardian, "<span class='say'><font color=\"[guardian.guardian_color]\"><b><i>[src]:</i></b></font> [preliminary_message]</span>" )
	for(var/dead_mob in GLOB.dead_mob_list)
		var/link = FOLLOW_LINK(dead_mob, src)
		to_chat(dead_mob, "<span class='say'>[link] [my_message]</span>")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	src.log_talk(input, LOG_SAY, tag="guardian")

//FORCE RECALL/RESET

/mob/living/proc/guardian_recall()
	set name = "Recall Guardian"
	set category = "Guardian"
	set desc = "Forcibly recall your guardian."
	var/list/guardians = get_all_linked_holoparasites()
<<<<<<< HEAD
	for(var/para in guardians)
		var/mob/living/simple_animal/hostile/guardian/G = para
		G.Recall()

/mob/living/proc/guardian_reset()
	set name = "Reset Guardian Player (One Use)"
	set category = "Guardian"
	set desc = "Re-rolls which ghost will control your Guardian. One use per Guardian."

	var/list/guardians = get_all_linked_holoparasites()
	for(var/para in guardians)
		var/mob/living/simple_animal/hostile/guardian/P = para
		if(P.reset)
			guardians -= P //clear out guardians that are already reset
	if(!length(guardians))
		remove_verb(src, /mob/living/proc/guardian_reset)
		return
=======
	for(var/mob/living/simple_animal/hostile/guardian/guardian in guardians)
		guardian.recall()

/mob/living/proc/guardian_reset()
	set name = "Reset Guardian Player (5 Minute Cooldown)"
	set category = "Guardian"
	set desc = "Re-rolls which ghost will control your Guardian. Can be used once per 5 minutes."

	var/list/guardians = get_all_linked_holoparasites()
	for(var/mob/living/simple_animal/hostile/guardian/resetting_guardian as anything in guardians)
		if(!COOLDOWN_FINISHED(resetting_guardian, resetting_cooldown))
			guardians -= resetting_guardian //clear out guardians that are already reset
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	var/mob/living/simple_animal/hostile/guardian/chosen_guardian = tgui_input_list(src, "Pick the guardian you wish to reset", "Guardian Reset", sort_names(guardians))
	if(isnull(chosen_guardian))
		to_chat(src, span_holoparasite("You decide not to reset [length(guardians) > 1 ? "any of your guardians":"your guardian"]."))
		return

<<<<<<< HEAD
	to_chat(src, span_holoparasite("You attempt to reset <font color=\"[chosen_guardian.guardiancolor]\"><b>[chosen_guardian.real_name]</b></font>'s personality..."))
	var/list/mob/dead/observer/ghost_candidates = poll_ghost_candidates("Do you want to play as [src.real_name]'s [chosen_guardian.real_name]?", ROLE_PAI, FALSE, 100)
	if(!LAZYLEN(ghost_candidates))
		to_chat(src, span_holoparasite("There were no ghosts willing to take control of <font color=\"[chosen_guardian.guardiancolor]\"><b>[chosen_guardian.real_name]</b></font>. Looks like you're stuck with it for now."))
=======
	to_chat(src, span_holoparasite("You attempt to reset <font color=\"[chosen_guardian.guardian_color]\"><b>[chosen_guardian.real_name]</b></font>'s personality..."))
	var/list/mob/dead/observer/ghost_candidates = poll_ghost_candidates("Do you want to play as [src.real_name]'s Guardian Spirit?", ROLE_PAI, FALSE, 100)
	if(!LAZYLEN(ghost_candidates))
		to_chat(src, span_holoparasite("There were no ghosts willing to take control of <font color=\"[chosen_guardian.guardian_color]\"><b>[chosen_guardian.real_name]</b></font>. Looks like you're stuck with it for now."))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		return

	var/mob/dead/observer/candidate = pick(ghost_candidates)
	to_chat(chosen_guardian, span_holoparasite("Your user reset you, and your body was taken over by a ghost. Looks like they weren't happy with your performance."))
<<<<<<< HEAD
	to_chat(src, "<span class='holoparasite bold'>Your <font color=\"[chosen_guardian.guardiancolor]\">[chosen_guardian.real_name]</font> has been successfully reset.</span>")
	message_admins("[key_name_admin(candidate)] has taken control of ([ADMIN_LOOKUPFLW(chosen_guardian)])")
	chosen_guardian.ghostize(FALSE)
	chosen_guardian.guardianrecolor()
	chosen_guardian.guardianrename() //give it a new color and name, to show it's a new person
	chosen_guardian.key = candidate.key
	chosen_guardian.reset = 1
	switch(chosen_guardian.theme)
		if("tech")
			to_chat(src, span_holoparasite("<font color=\"[chosen_guardian.guardiancolor]\"><b>[chosen_guardian.real_name]</b></font> is now online!"))
		if("magic")
			to_chat(src, span_holoparasite("<font color=\"[chosen_guardian.guardiancolor]\"><b>[chosen_guardian.real_name]</b></font> has been summoned!"))
		if("carp")
			to_chat(src, span_holoparasite("<font color=\"[chosen_guardian.guardiancolor]\"><b>[chosen_guardian.real_name]</b></font> has been caught!"))
		if("miner")
			to_chat(src, span_holoparasite("<font color=\"[chosen_guardian.guardiancolor]\"><b>[chosen_guardian.real_name]</b></font> has appeared!"))
	guardians -= chosen_guardian
	if(!length(guardians))
		remove_verb(src, /mob/living/proc/guardian_reset)
=======
	to_chat(src, span_boldholoparasite("Your <font color=\"[chosen_guardian.guardian_color]\">[chosen_guardian.real_name]</font> has been successfully reset."))
	message_admins("[key_name_admin(candidate)] has taken control of ([ADMIN_LOOKUPFLW(chosen_guardian)])")
	chosen_guardian.ghostize(FALSE)
	chosen_guardian.key = candidate.key
	COOLDOWN_START(chosen_guardian, resetting_cooldown, 5 MINUTES)
	chosen_guardian.guardian_rename() //give it a new color and name, to show it's a new person
	chosen_guardian.guardian_recolor()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

////////parasite tracking/finding procs

/// Returns a list of all holoparasites that has this mob as a summoner.
/mob/living/proc/get_all_linked_holoparasites()
	RETURN_TYPE(/list)
	var/list/all_parasites = list()
	for(var/mob/living/simple_animal/hostile/guardian/stand as anything in GLOB.parasites)
		if(stand.summoner != src)
			continue
		all_parasites += stand
	return all_parasites

/// Returns true if this holoparasite has the same summoner as the passed holoparasite.
/mob/living/simple_animal/hostile/guardian/proc/hasmatchingsummoner(mob/living/simple_animal/hostile/guardian/other_guardian)
	return istype(other_guardian) && other_guardian.summoner == summoner
<<<<<<< HEAD

////////Creation

/obj/item/guardiancreator
	name = "enchanted deck of tarot cards"
	desc = "An enchanted deck of tarot cards, rumored to be a source of unimaginable power."
	icon = 'icons/obj/toys/playing_cards.dmi'
	icon_state = "deck_tarot_full"
	var/used = FALSE
	var/theme = "magic"
	var/mob_name = "Guardian Spirit"
	var/use_message = "<span class='holoparasite'>You shuffle the deck...</span>"
	var/used_message = "<span class='holoparasite'>All the cards seem to be blank now.</span>"
	var/failure_message = "<span class='holoparasite bold'>..And draw a card! It's...blank? Maybe you should try again later.</span>"
	var/ling_failure = "<span class='holoparasite bold'>The deck refuses to respond to a souless creature such as you.</span>"
	var/list/possible_guardians = list("Assassin", "Chaos", "Charger", "Explosive", "Lightning", "Protector", "Ranged", "Standard", "Support", "Gravitokinetic")
	var/random = TRUE
	var/allowmultiple = FALSE
	var/allowling = TRUE
	var/allowguardian = FALSE
	var/datum/antagonist/antag_datum_to_give

/obj/item/guardiancreator/attack_self(mob/living/user)
	if(isguardian(user) && !allowguardian)
		to_chat(user, span_holoparasite("[mob_name] chains are not allowed."))
		return
	var/list/guardians = user.get_all_linked_holoparasites()
	if(length(guardians) && !allowmultiple)
		to_chat(user, span_holoparasite("You already have a [mob_name]!"))
		return
	if(user.mind && user.mind.has_antag_datum(/datum/antagonist/changeling) && !allowling)
		to_chat(user, "[ling_failure]")
		return
	if(used == TRUE)
		to_chat(user, "[used_message]")
		return
	used = TRUE
	to_chat(user, "[use_message]")
	var/list/mob/dead/observer/candidates = poll_ghost_candidates("Do you want to play as the [mob_name] of [user.real_name]?", ROLE_PAI, FALSE, 100, POLL_IGNORE_HOLOPARASITE)

	if(LAZYLEN(candidates))
		var/mob/dead/observer/candidate = pick(candidates)
		spawn_guardian(user, candidate)
	else
		to_chat(user, "[failure_message]")
		used = FALSE


/obj/item/guardiancreator/proc/spawn_guardian(mob/living/user, mob/dead/candidate)
	var/guardiantype = "Standard"
	if(random)
		guardiantype = pick(possible_guardians)
	else
		guardiantype = tgui_input_list(user, "Pick the type of [mob_name]", "Guardian Creation", sort_list(possible_guardians))
		if(isnull(guardiantype) || !candidate.client)
			to_chat(user, "[failure_message]" )
			used = FALSE
			return
	var/pickedtype = /mob/living/simple_animal/hostile/guardian/punch
	switch(guardiantype)

		if("Chaos")
			pickedtype = /mob/living/simple_animal/hostile/guardian/fire

		if("Standard")
			pickedtype = /mob/living/simple_animal/hostile/guardian/punch

		if("Ranged")
			pickedtype = /mob/living/simple_animal/hostile/guardian/ranged

		if("Support")
			pickedtype = /mob/living/simple_animal/hostile/guardian/healer

		if("Explosive")
			pickedtype = /mob/living/simple_animal/hostile/guardian/bomb

		if("Lightning")
			pickedtype = /mob/living/simple_animal/hostile/guardian/beam

		if("Protector")
			pickedtype = /mob/living/simple_animal/hostile/guardian/protector

		if("Charger")
			pickedtype = /mob/living/simple_animal/hostile/guardian/charger

		if("Assassin")
			pickedtype = /mob/living/simple_animal/hostile/guardian/assassin

		if("Dextrous")
			pickedtype = /mob/living/simple_animal/hostile/guardian/dextrous

		if("Gravitokinetic")
			pickedtype = /mob/living/simple_animal/hostile/guardian/gravitokinetic

	var/list/guardians = user.get_all_linked_holoparasites()
	if(length(guardians) && !allowmultiple)
		to_chat(user, span_holoparasite("You already have a [mob_name]!") )
		used = FALSE
		return
	var/mob/living/simple_animal/hostile/guardian/G = new pickedtype(user, theme)
	G.name = mob_name
	G.set_summoner(user)
	G.key = candidate.key
	G.mind.enslave_mind_to_creator(user)
	G.copy_languages(user, LANGUAGE_MASTER) // make sure holoparasites speak same language as master
	G.update_atom_languages()
	user.log_message("has summoned [key_name(G)], a [guardiantype] holoparasite.", LOG_GAME)
	G.log_message("was summoned as a [guardiantype] holoparsite.", LOG_GAME)
	switch(theme)
		if("tech")
			to_chat(user, "[G.tech_fluff_string]")
			to_chat(user, span_holoparasite("<b>[G.real_name]</b> is now online!"))
		if("magic")
			to_chat(user, "[G.magic_fluff_string]")
			to_chat(user, span_holoparasite("<b>[G.real_name]</b> has been summoned!"))
		if("carp")
			to_chat(user, "[G.carp_fluff_string]")
			to_chat(user, span_holoparasite("<b>[G.real_name]</b> has been caught!"))
		if("miner")
			to_chat(user, "[G.miner_fluff_string]")
			to_chat(user, span_holoparasite("<b>[G.real_name]</b> has appeared!"))
	add_verb(user, list(/mob/living/proc/guardian_comm, \
						/mob/living/proc/guardian_recall, \
						/mob/living/proc/guardian_reset))
	G?.client.init_verbs()
	return G

/obj/item/guardiancreator/choose
	random = FALSE

/obj/item/guardiancreator/choose/dextrous
	possible_guardians = list("Assassin", "Chaos", "Charger", "Dextrous", "Explosive", "Lightning", "Protector", "Ranged", "Standard", "Support", "Gravitokinetic")

/obj/item/guardiancreator/choose/wizard
	possible_guardians = list("Assassin", "Chaos", "Charger", "Dextrous", "Explosive", "Lightning", "Protector", "Ranged", "Standard", "Gravitokinetic")
	allowmultiple = TRUE

/obj/item/guardiancreator/choose/wizard/spawn_guardian(mob/living/user, mob/dead/candidate)
	. = ..()
	var/mob/guardian = .
	if(!guardian)
		return

	var/datum/antagonist/wizard/antag_datum = user.mind.has_antag_datum(/datum/antagonist/wizard)
	if(antag_datum)
		if(!antag_datum.wiz_team)
			antag_datum.create_wiz_team()
		guardian.mind.add_antag_datum(/datum/antagonist/wizard_minion, antag_datum.wiz_team)

/obj/item/guardiancreator/tech
	name = "holoparasite injector"
	desc = "It contains an alien nanoswarm of unknown origin. Though capable of near sorcerous feats via use of hardlight holograms and nanomachines, it requires an organic host as a home base and source of fuel."
	icon = 'icons/obj/medical/syringe.dmi'
	icon_state = "combat_hypo"
	theme = "tech"
	mob_name = "Holoparasite"
	use_message = "<span class='holoparasite'>You start to power on the injector...</span>"
	used_message = "<span class='holoparasite'>The injector has already been used.</span>"
	failure_message = "<span class='holoparasite bold'>...ERROR. BOOT SEQUENCE ABORTED. AI FAILED TO INTIALIZE. PLEASE CONTACT SUPPORT OR TRY AGAIN LATER.</span>"
	ling_failure = "<span class='holoparasite bold'>The holoparasites recoil in horror. They want nothing to do with a creature like you.</span>"

/obj/item/guardiancreator/tech/choose/traitor
	possible_guardians = list("Assassin", "Chaos", "Charger", "Explosive", "Lightning", "Protector", "Ranged", "Standard", "Support", "Gravitokinetic")
	allowling = FALSE

/obj/item/guardiancreator/tech/choose
	random = FALSE

/obj/item/guardiancreator/tech/choose/dextrous
	possible_guardians = list("Assassin", "Chaos", "Charger", "Dextrous", "Explosive", "Lightning", "Protector", "Ranged", "Standard", "Support", "Gravitokinetic")

/obj/item/paper/guides/antag/guardian
	name = "Holoparasite Guide"
	default_raw_text = {"<b>A list of Holoparasite Types</b><br>

<br>
<b>Assassin</b>: Does medium damage and takes full damage, but can enter stealth, causing its next attack to do massive damage and ignore armor. However, it becomes briefly unable to recall after attacking from stealth.<br>
<br>
<b>Chaos</b>: Ignites enemies on touch and causes them to hallucinate all nearby people as the parasite. Automatically extinguishes the user if they catch on fire.<br>
<br>
<b>Charger</b>: Moves extremely fast, does medium damage on attack, and can charge at targets, damaging the first target hit and forcing them to drop any items they are holding.<br>
<br>
<b>Explosive</b>: High damage resist and medium power attack that may explosively teleport targets. Can turn any object, including objects too large to pick up, into a bomb, dealing explosive damage to the next person to touch it. The object will return to normal after the trap is triggered or after a delay.<br>
<br>
<b>Lightning</b>: Attacks apply lightning chains to targets. Has a lightning chain to the user. Lightning chains shock everything near them, doing constant damage.<br>
<br>
<b>Protector</b>: Causes you to teleport to it when out of range, unlike other parasites. Has two modes; Combat, where it does and takes medium damage, and Protection, where it does and takes almost no damage but moves slightly slower.<br>
<br>
<b>Ranged</b>: Has two modes. Ranged; which fires a constant stream of weak, armor-ignoring projectiles. Scout; Cannot attack, but can move through walls and is quite hard to see. Can lay surveillance snares, which alert it when crossed, in either mode.<br>
<br>
<b>Standard</b>: Devastating close combat attacks and high damage resist. Can smash through weak walls.<br>
<br>
<b>Gravitokinetic</b>: Attacks will apply crushing gravity to the target. Can target the ground as well to slow targets advancing on you, but this will affect the user.<br>
<br>
"}

/obj/item/paper/guides/antag/guardian/wizard
	name = "Guardian Guide"
	default_raw_text = {"<b>A list of Guardian Types</b><br>

<br>
<b>Assassin</b>: Does medium damage and takes full damage, but can enter stealth, causing its next attack to do massive damage and ignore armor. However, it becomes briefly unable to recall after attacking from stealth.<br>
<br>
<b>Chaos</b>: Ignites enemies on touch and causes them to hallucinate all nearby people as the guardian. Automatically extinguishes the user if they catch on fire.<br>
<br>
<b>Charger</b>: Moves extremely fast, does medium damage on attack, and can charge at targets, damaging the first target hit and forcing them to drop any items they are holding.<br>
<br>
<b>Dexterous</b>: Does low damage on attack, but is capable of holding items and storing a single item within it. It will drop items held in its hands when it recalls, but it will retain the stored item.<br>
<br>
<b>Explosive</b>: High damage resist and medium power attack that may explosively teleport targets. Can turn any object, including objects too large to pick up, into a bomb, dealing explosive damage to the next person to touch it. The object will return to normal after the trap is triggered or after a delay.<br>
<br>
<b>Lightning</b>: Attacks apply lightning chains to targets. Has a lightning chain to the user. Lightning chains shock everything near them, doing constant damage.<br>
<br>
<b>Protector</b>: Causes you to teleport to it when out of range, unlike other parasites. Has two modes; Combat, where it does and takes medium damage, and Protection, where it does and takes almost no damage but moves slightly slower.<br>
<br>
<b>Ranged</b>: Has two modes. Ranged; which fires a constant stream of weak, armor-ignoring projectiles. Scout; Cannot attack, but can move through walls and is quite hard to see. Can lay surveillance snares, which alert it when crossed, in either mode.<br>
<br>
<b>Standard</b>: Devastating close combat attacks and high damage resist. Can smash through weak walls.<br>
<br>
<b>Gravitokinetic</b>: Attacks will apply crushing gravity to the target. Can target the ground as well to slow targets advancing on you, but this will affect the user.<br>
<br>
"}


/obj/item/storage/box/syndie_kit/guardian
	name = "holoparasite injector kit"

/obj/item/storage/box/syndie_kit/guardian/PopulateContents()
	new /obj/item/guardiancreator/tech/choose/traitor(src)
	new /obj/item/paper/guides/antag/guardian(src)

/obj/item/guardiancreator/carp
	name = "holocarp fishsticks"
	desc = "Using the power of Carp'sie, you can catch a carp from byond the veil of Carpthulu, and bind it to your fleshy flesh form."
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "fishfingers"
	theme = "carp"
	mob_name = "Holocarp"
	use_message = "<span class='holoparasite'>You put the fishsticks in your mouth...</span>"
	used_message = "<span class='holoparasite'>Someone's already taken a bite out of these fishsticks! Ew.</span>"
	failure_message = "<span class='holoparasite bold'>You couldn't catch any carp spirits from the seas of Lake Carp. Maybe there are none, maybe you fucked up.</span>"
	ling_failure = "<span class='holoparasite bold'>Carp'sie seems to not have taken you as the chosen one. Maybe it's because of your horrifying origin.</span>"
	allowmultiple = TRUE

/obj/item/guardiancreator/carp/choose
	random = FALSE

/obj/item/guardiancreator/miner
	name = "dusty shard"
	desc = "Seems to be a very old rock, may have originated from a strange meteor."
	icon = 'icons/obj/lavaland/artefacts.dmi'
	icon_state = "dustyshard"
	theme = "miner"
	mob_name = "Power Miner"
	use_message = "<span class='holoparasite'>You pierce your skin with the shard...</span>"
	used_message = "<span class='holoparasite'>This shard seems to have lost all its' power...</span>"
	failure_message = "<span class='holoparasite bold'>The shard hasn't reacted at all. Maybe try again later...</span>"
	ling_failure = "<span class='holoparasite bold'>The power of the shard seems to not react with your horrifying, mutated body.</span>"
	possible_guardians = list("Charger", "Protector", "Ranged", "Standard", "Support")

/obj/item/guardiancreator/miner/choose
	random = FALSE
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
