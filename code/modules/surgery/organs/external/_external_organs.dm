/**
* System for drawing organs with overlays. These overlays are drawn directly on the bodypart, attached to a person or not
* Works in tandem with the /datum/sprite_accessory datum to generate sprites
* Unlike normal organs, we're actually inside a persons limbs at all times
*/
/obj/item/organ/external
	name = "external organ"
	desc = "An external organ that is too external."

	organ_flags = ORGAN_EDIBLE
	visual = TRUE

<<<<<<< HEAD
	///Sometimes we need multiple layers, for like the back, middle and front of the person
	var/layers
	///Convert the bitflag define into the actual layer define
	var/static/list/all_layers = list(EXTERNAL_FRONT, EXTERNAL_ADJACENT, EXTERNAL_BEHIND)

	///Defines what kind of 'organ' we're looking at. Sprites have names like 'm_mothwings_firemoth'. 'mothwings' would then be feature_key
	var/feature_key = ""
	///Similar to feature key, but overrides it in the case you need more fine control over the iconstate, like with Tails.
	var/render_key = ""
	///Stores the dna.features[feature_key], used for external organs that can be surgically removed or inserted.
	var/stored_feature_id = ""
	/// The savefile_key of the preference this relates to. Used for the preferences UI.
	var/preference

	///Sprite datum we use to draw on the bodypart
	var/datum/sprite_accessory/sprite_datum
	///Key of the icon states of all the sprite_datums for easy caching
	var/cache_key = ""
	///Set to EXTERNAL_BEHIND, EXTERNAL_FRONT or EXTERNAL_ADJACENT if you want to draw one of those layers as the object sprite. FALSE to use your own
	var/use_mob_sprite_as_obj_sprite = FALSE

	///With what DNA block do we mutate in mutate_feature() ? For genetics
	var/dna_block

	///Reference to the limb we're inside of
	var/obj/item/bodypart/ownerlimb

	///The color this organ draws with. Updated by bodypart/inherit_color()
	var/draw_color
	///Where does this organ inherit it's color from?
	var/color_source = ORGAN_COLOR_INHERIT

=======
	///The overlay datum that actually draws stuff on the limb
	var/datum/bodypart_overlay/mutant/bodypart_overlay
	///Reference to the limb we're inside of
	var/obj/item/bodypart/ownerlimb
	///If not null, overrides the appearance with this sprite accessory datum
	var/sprite_accessory_override

	/// The savefile_key of the preference this relates to. Used for the preferences UI.
	var/preference
	///With what DNA block do we mutate in mutate_feature() ? For genetics
	var/dna_block

	///Set to EXTERNAL_BEHIND, EXTERNAL_FRONT or EXTERNAL_ADJACENT if you want to draw one of those layers as the object sprite. FALSE to use your own
	///This will not work if it doesn't have a limb to generate it's icon with
	var/use_mob_sprite_as_obj_sprite = FALSE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	///Does this organ have any bodytypes to pass to it's ownerlimb?
	var/external_bodytypes = NONE
	///Which flags does a 'modification tool' need to have to restyle us, if it all possible (located in code/_DEFINES/mobs)
	var/restyle_flags = NONE

/**mob_sprite is optional if you havent set sprite_datums for the object, and is used mostly to generate sprite_datums from a persons DNA
* For _mob_sprite we make a distinction between "Round Snout" and "round". Round Snout is the name of the sprite datum, while "round" would be part of the sprite
* I'm sorry
*/
<<<<<<< HEAD
/obj/item/organ/external/Initialize(mapload, mob_sprite)
	. = ..()

	if(mob_sprite)
		set_sprite(mob_sprite)
=======
/obj/item/organ/external/Initialize(mapload, accessory_type)
	. = ..()

	bodypart_overlay = new bodypart_overlay()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	// cache_key = jointext(generate_icon_cache(), "_") // SKYRAT EDIT - Species stuff that Goofball ported from /tg/, apparently. Commented for now, to see if I can make it work without it.
	// SKYRAT EDIT: we have like 145+ fucking dna blocks lmao
	dna_block = GLOB.dna_mutant_bodypart_blocks[preference]

<<<<<<< HEAD
	if(!(organ_flags & ORGAN_UNREMOVABLE))
		color = "#[random_color()]" //A temporary random color that gets overwritten on insertion.
=======
	accessory_type = accessory_type ? accessory_type : sprite_accessory_override
	var/update_overlays = TRUE
	if(accessory_type)
		bodypart_overlay.set_appearance(accessory_type)
		bodypart_overlay.imprint_on_next_insertion = FALSE
	else if(loc) //we've been spawned into the world, and not in nullspace to be added to a limb (yes its fucking scuffed)
		bodypart_overlay.randomize_appearance()
	else
		update_overlays = FALSE

	if(use_mob_sprite_as_obj_sprite && update_overlays)
		update_appearance(UPDATE_OVERLAYS)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	if(restyle_flags)
		RegisterSignal(src, COMSIG_ATOM_RESTYLE, PROC_REF(on_attempt_feature_restyle))

/obj/item/organ/external/Destroy()
	if(owner)
		Remove(owner, special = TRUE)
	else if(ownerlimb)
		remove_from_limb()

	return ..()

<<<<<<< HEAD
/obj/item/organ/external/Insert(mob/living/carbon/reciever, special, drop_if_replaced)
	var/obj/item/bodypart/limb = reciever.get_bodypart(deprecise_zone(zone))

	if(!limb)
		return FALSE
	. = ..()
	if(!.)
		return

	if(!stored_feature_id) //We only want this set *once*
		stored_feature_id = reciever.dna.features[feature_key]
		// SKYRAT EDIT START - Customization (we use mutant_bodyparts for a lot of things)
		if(!stored_feature_id)
			stored_feature_id = reciever.dna.mutant_bodyparts[feature_key]?["name"]

	reciever.external_organs.Add(src)
	if(slot)
		reciever.external_organs_slot[slot] = src
=======
/obj/item/organ/external/Insert(mob/living/carbon/receiver, special, drop_if_replaced)
	var/obj/item/bodypart/limb = receiver.get_bodypart(deprecise_zone(zone))

	if(!limb)
		return FALSE

	. = ..()

	if(!.)
		return

	if(bodypart_overlay.imprint_on_next_insertion) //We only want this set *once*

		// SKYRAT EDIT - Customization - ORIGINAL: bodypart_overlay.set_appearance_from_name(receiver.dna.features[bodypart_overlay.feature_key])
		if(receiver.dna.features[bodypart_overlay.feature_key])
			bodypart_overlay.set_appearance_from_name(receiver.dna.features[bodypart_overlay.feature_key])

		else
			bodypart_overlay.set_appearance_from_dna(receiver.dna)
		// SKYRAT EDIT END
		bodypart_overlay.imprint_on_next_insertion = FALSE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	ownerlimb = limb
	add_to_limb(ownerlimb)

	if(external_bodytypes)
<<<<<<< HEAD
		limb.synchronize_bodytypes(reciever)

	reciever.update_body_parts()
=======
		limb.synchronize_bodytypes(receiver)

	receiver.update_body_parts()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/organ/external/Remove(mob/living/carbon/organ_owner, special, moving)
	. = ..()

	if(ownerlimb)
		remove_from_limb()
<<<<<<< HEAD

	if(organ_owner)
		if(slot)
			organ_owner.external_organs_slot.Remove(slot)
		organ_owner.external_organs.Remove(src)
=======
		if(!moving && use_mob_sprite_as_obj_sprite) //so we're being taken out and dropped
			update_appearance(UPDATE_OVERLAYS)

	if(organ_owner)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		organ_owner.update_body_parts()

///Transfers the organ to the limb, and to the limb's owner, if it has one.
/obj/item/organ/external/transfer_to_limb(obj/item/bodypart/bodypart, mob/living/carbon/bodypart_owner)
	if(owner)
		Remove(owner, moving = TRUE)
	else if(ownerlimb)
		remove_from_limb()

	if(bodypart_owner)
		Insert(bodypart_owner, TRUE)
	else
		add_to_limb(bodypart)

/obj/item/organ/external/add_to_limb(obj/item/bodypart/bodypart)
<<<<<<< HEAD
	ownerlimb = bodypart
	ownerlimb.external_organs |= src
	inherit_color()
=======
	bodypart.external_organs += src
	ownerlimb = bodypart
	ownerlimb.add_bodypart_overlay(bodypart_overlay)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return ..()

/obj/item/organ/external/remove_from_limb()
	ownerlimb.external_organs -= src
<<<<<<< HEAD
=======
	ownerlimb.remove_bodypart_overlay(bodypart_overlay)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(ownerlimb.owner && external_bodytypes)
		ownerlimb.synchronize_bodytypes(ownerlimb.owner)
	ownerlimb = null
	return ..()

<<<<<<< HEAD
///Add the overlays we need to draw on a person. Called from _bodyparts.dm
/obj/item/organ/external/proc/generate_and_retrieve_overlays(list/overlay_list, image_dir = SOUTH, image_layer, physique)
	set_sprite(stored_feature_id)
	if(!sprite_datum)
		return

	var/gender = (physique == FEMALE) ? "f" : "m"
	var/list/icon_state_builder = list()
	icon_state_builder += sprite_datum.gender_specific ? gender : "m" //Male is default because sprite accessories are so ancient they predate the concept of not hardcoding gender
	icon_state_builder += render_key ? render_key : feature_key
	icon_state_builder += sprite_datum.icon_state
	icon_state_builder += mutant_bodyparts_layertext(image_layer)

	var/finished_icon_state = icon_state_builder.Join("_")

	var/mutable_appearance/appearance = mutable_appearance(sprite_datum.icon, finished_icon_state, layer = -image_layer)
	appearance.dir = image_dir

	///Also give the icon to the obj
	if(use_mob_sprite_as_obj_sprite)
		icon = icon(sprite_datum.icon, finished_icon_state, SOUTH)

	if(sprite_datum.color_src)
		appearance.color = draw_color

	if(sprite_datum.center)
		center_image(appearance, sprite_datum.dimension_x, sprite_datum.dimension_y)

	overlay_list += appearance
=======
///Update our features after something changed our appearance
/obj/item/organ/external/proc/mutate_feature(features, mob/living/carbon/human/human)
	if(!dna_block)
		return

	var/list/feature_list = bodypart_overlay.get_global_feature_list()

	bodypart_overlay.set_appearance_from_name(feature_list[deconstruct_block(get_uni_feature_block(features, dna_block), feature_list.len)])
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

///If you need to change an external_organ for simple one-offs, use this. Pass the accessory type : /datum/accessory/something
/obj/item/organ/external/proc/simple_change_sprite(accessory_type)
	var/datum/sprite_accessory/typed_accessory = accessory_type //we only take types for maintainability

<<<<<<< HEAD
	set_sprite(initial(typed_accessory.name))
=======
	bodypart_overlay.set_appearance(typed_accessory)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	if(owner) //are we in a person?
		owner.update_body_parts()
	else if(ownerlimb) //are we in a limb?
		ownerlimb.update_icon_dropped()
<<<<<<< HEAD
	else if(use_mob_sprite_as_obj_sprite) //are we out in the world, unprotected by flesh?
		generate_and_retrieve_overlays(list(), image_layer = use_mob_sprite_as_obj_sprite) //both fetches and updates our organ sprite, although we only update

///Change our accessory sprite, using the accesssory name. If you need to change the sprite for something, use simple_change_sprite()
/obj/item/organ/external/proc/set_sprite(accessory_name)
	PRIVATE_PROC(TRUE)

	stored_feature_id = accessory_name
	sprite_datum = get_sprite_datum(accessory_name)
	if(!sprite_datum && accessory_name)
		CRASH("External organ attempted to load with an invalid sprite datum. Sprite key: [accessory_name].")
	cache_key = jointext(generate_icon_cache(), "_")

///Generate a unique key based on our sprites. So that if we've aleady drawn these sprites, they can be found in the cache and wont have to be drawn again (blessing and curse)
/obj/item/organ/external/proc/generate_icon_cache()
	. = list()
	. += "[sprite_datum?.icon_state]"
	. += "[render_key ? render_key : feature_key]"
	. += "[draw_color]"
	return .

/**This exists so sprite accessories can still be per-layer without having to include that layer's
*  number in their sprite name, which causes issues when those numbers change.
*/
/obj/item/organ/external/proc/mutant_bodyparts_layertext(layer)
	switch(layer)
		if(BODY_BEHIND_LAYER)
			return "BEHIND"
		if(BODY_ADJ_LAYER)
			return "ADJ"
		if(BODY_FRONT_LAYER)
			return "FRONT"
		//SKYRAT EDIT ADDITION BEGIN
		if(BODY_FRONT_UNDER_CLOTHES)
			return "FRONT_UNDER"
		if(ABOVE_BODY_FRONT_HEAD_LAYER)
			return "FRONT_OVER"
		//SKYRAT EDIT ADDITION END

///Converts a bitflag to the right layer. I'd love to make this a static index list, but byond made an attempt on my life when i did
/obj/item/organ/external/proc/bitflag_to_layer(layer)
	switch(layer)
		if(EXTERNAL_BEHIND)
			return BODY_BEHIND_LAYER
		if(EXTERNAL_ADJACENT)
			return BODY_ADJ_LAYER
		if(EXTERNAL_FRONT)
			return BODY_FRONT_LAYER

///Because all the preferences have names like "Beautiful Sharp Snout" we need to get the sprite datum with the actual important info
/obj/item/organ/external/proc/get_sprite_datum(sprite)
	var/list/feature_list = get_global_feature_list()
	return feature_list[sprite]

///Return a dumb glob list for this specific feature (called from parse_sprite)
/obj/item/organ/external/proc/get_global_feature_list()
	CRASH("External organ has no feature list, it will render invisible")

///Check whether we can draw the overlays. You generally don't want lizard snouts to draw over an EVA suit
/obj/item/organ/external/proc/can_draw_on_bodypart(mob/living/carbon/human/human)
	return TRUE

///Update our features after something changed our appearance
/obj/item/organ/external/proc/mutate_feature(features, mob/living/carbon/human/human)
	if(!dna_block || !get_global_feature_list())
		return

	var/list/feature_list = get_global_feature_list()

	set_sprite(feature_list[deconstruct_block(get_uni_feature_block(features, dna_block), feature_list.len)])

///Give the organ it's color. Force will override the existing one.
/obj/item/organ/external/proc/inherit_color(force)
	if(draw_color && !force)
		return
	switch(color_source)
		if(ORGAN_COLOR_OVERRIDE)
			draw_color = override_color(ownerlimb.draw_color)
		if(ORGAN_COLOR_INHERIT)
			draw_color = ownerlimb.draw_color
		if(ORGAN_COLOR_HAIR)
			if(!ishuman(ownerlimb.owner))
				return
			var/mob/living/carbon/human/human_owner = ownerlimb.owner
			draw_color = human_owner.hair_color
	color = draw_color
	return TRUE

///Colorizes the limb it's inserted to, if required.
/obj/item/organ/external/proc/override_color(rgb_value)
	CRASH("External organ color set to override with no override proc.")
=======
	//else if(use_mob_sprite_as_obj_sprite) //are we out in the world, unprotected by flesh?

/obj/item/organ/external/on_life(seconds_per_tick, times_fired)
	return

/obj/item/organ/external/update_overlays()
	. = ..()

	if(!use_mob_sprite_as_obj_sprite)
		return

	//Build the mob sprite and use it as our overlay
	for(var/external_layer in bodypart_overlay.all_layers)
		if(bodypart_overlay.layers & external_layer)
			. += bodypart_overlay.get_overlay(external_layer, ownerlimb)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

///The horns of a lizard!
/obj/item/organ/external/horns
	name = "horns"
	desc = "Why do lizards even have horns? Well, this one obviously doesn't."
	icon_state = "horns"

	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_HORNS
<<<<<<< HEAD
	layers = EXTERNAL_ADJACENT

	feature_key = "horns"
	preference = "feature_lizard_horns"

	//dna_block = DNA_HORNS_BLOCK // SKYRAT EDIT REMOVAL - Customization - We have our own system to handle DNA.
	restyle_flags = EXTERNAL_RESTYLE_ENAMEL

/obj/item/organ/external/horns/can_draw_on_bodypart(mob/living/carbon/human/human)
	return TRUE

/obj/item/organ/external/horns/get_global_feature_list()
	return GLOB.sprite_accessories["horns"] // SKYRAT EDIT - Goof's port of species stuff from a missed upstream PR
=======

	preference = "feature_lizard_horns"
	//dna_block = DNA_HORNS_BLOCK // SKYRAT EDIT REMOVAL - Customization - We have our own system to handle DNA.
	restyle_flags = EXTERNAL_RESTYLE_ENAMEL

	bodypart_overlay = /datum/bodypart_overlay/mutant/horns

/datum/bodypart_overlay/mutant/horns
	layers = EXTERNAL_ADJACENT
	feature_key = "horns"

/datum/bodypart_overlay/mutant/horns/can_draw_on_bodypart(mob/living/carbon/human/human)
	if((human.head?.flags_inv & HIDEHAIR) || (human.wear_mask?.flags_inv & HIDEHAIR))
		return FALSE

	return TRUE

/datum/bodypart_overlay/mutant/horns/get_global_feature_list()
	return GLOB.sprite_accessories["horns"] // SKYRAT EDIT - Customization - ORIGINAL: return GLOB.horns_list
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

///The frills of a lizard (like weird fin ears)
/obj/item/organ/external/frills
	name = "frills"
	desc = "Ear-like external organs often seen on aquatic reptillians."
	icon_state = "frills"

	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_FRILLS
<<<<<<< HEAD
	layers = EXTERNAL_ADJACENT

	feature_key = "frills"
	preference = "feature_lizard_frills"

	//dna_block = DNA_FRILLS_BLOCK // SKYRAT EDIT REMOVAL - Customization - We have our own system to handle DNA.
	restyle_flags = EXTERNAL_RESTYLE_FLESH

/obj/item/organ/external/frills/can_draw_on_bodypart(mob/living/carbon/human/human)
=======

	preference = "feature_lizard_frills"
	//dna_block = DNA_FRILLS_BLOCK // SKYRAT EDIT REMOVAL - Customization - We have our own system to handle DNA.
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/frills

/datum/bodypart_overlay/mutant/frills
	layers = EXTERNAL_ADJACENT
	feature_key = "frills"

/datum/bodypart_overlay/mutant/frills/can_draw_on_bodypart(mob/living/carbon/human/human)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(!(human.head?.flags_inv & HIDEEARS))
		return TRUE
	return FALSE

<<<<<<< HEAD

/obj/item/organ/external/frills/get_global_feature_list()
	return GLOB.sprite_accessories["frills"] // SKYRAT EDIT - Goof's port of species stuff from a missed upstream PR
=======
/datum/bodypart_overlay/mutant/frills/get_global_feature_list()
	return GLOB.sprite_accessories["frills"] // SKYRAT EDIT - Customization - ORIGINAL: return GLOB.frills_list
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

///Guess what part of the lizard this is?
/obj/item/organ/external/snout
	name = "snout" // SKYRAT EDIT - ORIGINAL: name = "lizard snout"
	desc = "Take a closer look at that snout!"
	icon_state = "snout"

	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_SNOUT
<<<<<<< HEAD
	layers = EXTERNAL_ADJACENT

	feature_key = "snout"
=======

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	preference = "feature_lizard_snout"
	external_bodytypes = BODYTYPE_SNOUTED

	//dna_block = DNA_SNOUT_BLOCK // SKYRAT EDIT REMOVAL - Customization - We have our own system to handle DNA.
	restyle_flags = EXTERNAL_RESTYLE_FLESH

<<<<<<< HEAD
/obj/item/organ/external/snout/can_draw_on_bodypart(mob/living/carbon/human/human)
=======
	bodypart_overlay = /datum/bodypart_overlay/mutant/snout

/datum/bodypart_overlay/mutant/snout
	layers = EXTERNAL_ADJACENT
	feature_key = "snout"

/datum/bodypart_overlay/mutant/snout/can_draw_on_bodypart(mob/living/carbon/human/human)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(!(human.wear_mask?.flags_inv & HIDESNOUT) && !(human.head?.flags_inv & HIDESNOUT))
		return TRUE
	return FALSE

<<<<<<< HEAD
/obj/item/organ/external/snout/get_global_feature_list()
	return GLOB.sprite_accessories["snout"] // SKYRAT EDIT - Customization
=======
/datum/bodypart_overlay/mutant/snout/get_global_feature_list()
	return GLOB.sprite_accessories["snout"] // SKYRAT EDIT - Customization - ORIGINAL : return GLOB.snouts_list
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

///A moth's antennae
/obj/item/organ/external/antennae
	name = "moth antennae"
	desc = "A moths antennae. What is it telling them? What are they sensing?"
	icon_state = "antennae"

	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_ANTENNAE
<<<<<<< HEAD
	layers = EXTERNAL_FRONT | EXTERNAL_BEHIND

	feature_key = "moth_antennae"
	preference = "feature_moth_antennae"

	//dna_block = DNA_MOTH_ANTENNAE_BLOCK // SKYRAT EDIT REMOVAL - Customization - We have our own system to handle DNA.
	restyle_flags = EXTERNAL_RESTYLE_FLESH

=======

	preference = "feature_moth_antennae"
	//dna_block = DNA_MOTH_ANTENNAE_BLOCK // SKYRAT EDIT REMOVAL - Customization - We have our own system to handle DNA.
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/antennae

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	///Are we burned?
	var/burnt = FALSE
	///Store our old datum here for if our antennae are healed
	var/original_sprite_datum

<<<<<<< HEAD
/obj/item/organ/external/antennae/Insert(mob/living/carbon/reciever, special, drop_if_replaced)
	. = ..()

	RegisterSignal(reciever, COMSIG_HUMAN_BURNING, PROC_REF(try_burn_antennae))
	RegisterSignal(reciever, COMSIG_LIVING_POST_FULLY_HEAL, PROC_REF(heal_antennae))

/obj/item/organ/external/antennae/Remove(mob/living/carbon/organ_owner, special, moving)
	. = ..()

	UnregisterSignal(organ_owner, list(COMSIG_HUMAN_BURNING, COMSIG_LIVING_POST_FULLY_HEAL))

/obj/item/organ/external/antennae/get_global_feature_list()
	return GLOB.sprite_accessories["moth_antennae"] // SKYRAT EDIT - Goof's port of species stuff from a missed upstream PR

/obj/item/organ/external/antennae/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(!(human.head?.flags_inv & HIDEHAIR) || (human.wear_mask?.flags_inv & HIDEHAIR))
		return TRUE
	return FALSE

=======
/obj/item/organ/external/antennae/Insert(mob/living/carbon/receiver, special, drop_if_replaced)
	. = ..()
	if(!.)
		return
	RegisterSignal(receiver, COMSIG_HUMAN_BURNING, PROC_REF(try_burn_antennae))
	RegisterSignal(receiver, COMSIG_LIVING_POST_FULLY_HEAL, PROC_REF(heal_antennae))

/obj/item/organ/external/antennae/Remove(mob/living/carbon/organ_owner, special, moving)
	. = ..()
	UnregisterSignal(organ_owner, list(COMSIG_HUMAN_BURNING, COMSIG_LIVING_POST_FULLY_HEAL))

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
///check if our antennae can burn off ;_;
/obj/item/organ/external/antennae/proc/try_burn_antennae(mob/living/carbon/human/human)
	SIGNAL_HANDLER

	if(!burnt && human.bodytemperature >= 800 && human.fire_stacks > 0) //do not go into the extremely hot light. you will not survive
		to_chat(human, span_danger("Your precious antennae burn to a crisp!"))

		burn_antennae()
		human.update_body_parts()

<<<<<<< HEAD
/obj/item/organ/external/antennae/proc/burn_antennae()
	burnt = TRUE
	original_sprite_datum = sprite_datum.name
	simple_change_sprite(/datum/sprite_accessory/moth_antennae/burnt_off)
=======
///Burn our antennae off ;_;
/obj/item/organ/external/antennae/proc/burn_antennae()
	var/datum/bodypart_overlay/mutant/antennae/antennae = bodypart_overlay
	antennae.burnt = TRUE
	burnt = TRUE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

///heal our antennae back up!!
/obj/item/organ/external/antennae/proc/heal_antennae(datum/source, heal_flags)
	SIGNAL_HANDLER

	if(!burnt)
		return

	if(heal_flags & (HEAL_LIMBS|HEAL_ORGANS))
<<<<<<< HEAD
		burnt = FALSE
		simple_change_sprite(original_sprite_datum)
=======
		var/datum/bodypart_overlay/mutant/antennae/antennae = bodypart_overlay
		antennae.burnt = FALSE
		burnt = FALSE

///Moth antennae datum, with full burning functionality
/datum/bodypart_overlay/mutant/antennae
	layers = EXTERNAL_FRONT | EXTERNAL_BEHIND
	feature_key = "moth_antennae"
	///Accessory datum of the burn sprite
	var/datum/sprite_accessory/burn_datum = /datum/sprite_accessory/moth_antennae/burnt_off
	///Are we burned? If so we draw differently
	var/burnt = FALSE

/datum/bodypart_overlay/mutant/antennae/New()
	. = ..()

	burn_datum = fetch_sprite_datum(burn_datum) //turn the path into the singleton instance

/datum/bodypart_overlay/mutant/antennae/get_global_feature_list()
	return GLOB.sprite_accessories["moth_antennae"] // SKYRAT EDIT - Customization - ORIGINAL: return GLOB.moth_antennae_list

/datum/bodypart_overlay/mutant/antennae/get_base_icon_state()
	return burnt ? burn_datum.icon_state : sprite_datum.icon_state
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

///The leafy hair of a podperson
/obj/item/organ/external/pod_hair
	name = "podperson hair"
	desc = "Base for many-o-salads."

	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_POD_HAIR
<<<<<<< HEAD
	layers = EXTERNAL_FRONT|EXTERNAL_ADJACENT

	feature_key = "pod_hair"
	preference = "feature_pod_hair"
	use_mob_sprite_as_obj_sprite = BODY_ADJ_LAYER
=======

	preference = "feature_pod_hair"
	use_mob_sprite_as_obj_sprite = TRUE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	dna_block = DNA_POD_HAIR_BLOCK
	restyle_flags = EXTERNAL_RESTYLE_PLANT

<<<<<<< HEAD
	color_source = ORGAN_COLOR_OVERRIDE

/obj/item/organ/external/pod_hair/get_global_feature_list()
	return GLOB.pod_hair_list

/obj/item/organ/external/pod_hair/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(!(human.head?.flags_inv & HIDEHAIR) || (human.wear_mask?.flags_inv & HIDEHAIR))
		return TRUE
	return FALSE

/obj/item/organ/external/pod_hair/get_global_feature_list()
	return GLOB.pod_hair_list

/obj/item/organ/external/pod_hair/override_color(rgb_value)
	// SKYRAT EDIT START - I hate non-sensical errors sometimes.
	if(!findtext(rgb_value, "#", 1, 2))
		rgb_value = "#[rgb_value]"
	// SKYRAT EDIT END
	var/list/rgb_list = rgb2num(rgb_value)
	return rgb(255 - rgb_list[1], 255 - rgb_list[2], 255 - rgb_list[3])
=======
	bodypart_overlay = /datum/bodypart_overlay/mutant/pod_hair

///Podperson bodypart overlay, with special coloring functionality to render the flowers in the inverse color
/datum/bodypart_overlay/mutant/pod_hair
	layers = EXTERNAL_FRONT|EXTERNAL_ADJACENT
	feature_key = "pod_hair"

	///This layer will be colored differently than the rest of the organ. So we can get differently colored flowers or something
	var/color_swapped_layer = EXTERNAL_FRONT
	///The individual rgb colors are subtracted from this to get the color shifted layer
	var/color_inverse_base = 255

/datum/bodypart_overlay/mutant/pod_hair/get_global_feature_list()
	return GLOB.pod_hair_list

/datum/bodypart_overlay/mutant/pod_hair/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(draw_layer != bitflag_to_layer(color_swapped_layer))
		return ..()

	if(draw_color) // can someone explain to me why draw_color is allowed to EVER BE AN EMPTY STRING
		var/list/rgb_list = rgb2num(draw_color)
		overlay.color = rgb(color_inverse_base - rgb_list[1], color_inverse_base - rgb_list[2], color_inverse_base - rgb_list[3]) //inversa da color
	else
		overlay.color = null

/datum/bodypart_overlay/mutant/pod_hair/can_draw_on_bodypart(mob/living/carbon/human/human)
	if((human.head?.flags_inv & HIDEHAIR) || (human.wear_mask?.flags_inv & HIDEHAIR))
		return FALSE

	return TRUE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
