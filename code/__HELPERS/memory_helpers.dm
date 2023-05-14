<<<<<<< HEAD

///Adds a memory to people that can see this happening, only use this for impactful or rare events to reduce overhead.
/proc/add_memory_in_range(atom/source, range, memory_type, extra_info, story_value, memory_flags, protagonist_memory_flags)
	var/list/memorizers = hearers(range, source)
	if(!isnull(protagonist_memory_flags))
		var/mob/living/carbon/protagonist = extra_info[DETAIL_PROTAGONIST]
		if(istype(protagonist))
			memorizers -= protagonist
			protagonist.mind?.add_memory(memory_type, extra_info, story_value, protagonist_memory_flags)
	for(var/mob/living/carbon/memorizer in memorizers)
		memorizer.mind?.add_memory(memory_type, extra_info, story_value, memory_flags)

/**
 * add_memory
 *
 * Adds a memory to a mob's mind if conditions are met, called wherever the memory takes place (memory for catching on fire in mob's fire code, for example)
 * Argument:
 * * memory_type: defined string in memory_defines.dm, shows the memories.json file which story parts to use (and generally what type it is)
 * * extra_info: the contents of the story. You're gonna want at least the protagonist for who is the main character in the story (Any non basic type will be converted to a string on insertion)
 * * story_value: the quality of the memory, make easy or roundstart memories have a low value so they don't flood persistence
 * * memory_flags: special specifications for skipping parts of the memory like moods for stories where showing moods doesn't make sense
 * Returns the datum memory created, null otherwise.
 */
/datum/mind/proc/add_memory(memory_type, extra_info, story_value, memory_flags)
	if(current)
		if(!(memory_flags & MEMORY_SKIP_UNCONSCIOUS) && current.stat >= UNCONSCIOUS)
			return
		var/is_blind = FALSE
		if(memory_flags & MEMORY_CHECK_BLINDNESS && current.is_blind())
			if(!(memory_flags & MEMORY_CHECK_DEAFNESS)) // Only check for blindness
				return
			is_blind = TRUE // Otherwise check if the mob is both blind and deaf
		if(memory_flags & MEMORY_CHECK_DEAFNESS && HAS_TRAIT(current, TRAIT_DEAF) && (!(memory_flags & MEMORY_CHECK_BLINDNESS) || is_blind))
			return

	var/story_mood = MOODLESS_MEMORY
	var/victim_mood = MOODLESS_MEMORY

	extra_info[DETAIL_PROTAGONIST] = extra_info[DETAIL_PROTAGONIST] || current //If no victim is supplied, assume it happend to the memorizer.
	var/atom/victim = extra_info[DETAIL_PROTAGONIST]
	if(!(memory_flags & MEMORY_FLAG_NOLOCATION))
		extra_info[DETAIL_WHERE] = get_area(victim)

	if(!(memory_flags & MEMORY_FLAG_NOMOOD))
		if (current.mob_mood)
			victim_mood = current.mob_mood.mood_level

		if(victim == current)
			story_mood = victim_mood
		else if(current.mob_mood)
			story_mood = current.mob_mood.mood_level

	extra_info[DETAIL_PROTAGONIST_MOOD] = victim_mood
=======
/**
 * Adds a memory to all carbon mobs in a certain range of a certain atom.
 *
 * The third argument should be a typepath of a /datum/memory.
 *
 * Two things of note when using this:
 * * If the source atom is a mob, it will be added to that mob if possible.
 * * The protagonist of the memory is set to the memorizer by default. If sourced from a mob, you need to set the protagonist manually.
 *
 * Beyond that, can be supplied with named arguments pertaining to your memory type.
 * Common arguments include:
 * * protagonist: The main subject of the memory
 * * deuteragonist: The side subject of the memory. Doesn't necessarily have to be a mob!
 * * antagonist: The main villain of the memory. Also doesn't necessarily have to be a mob!
 */
#define add_memory_in_range(source, range, arguments...) _add_memory_in_range(source, range, list(##arguments))

/// Unless you need to use this for an explicit reason, use the add_memory_in_range macro wrapper.
/proc/_add_memory_in_range(atom/source, range = 7, list/memory_args)
	for(var/mob/living/carbon/memorizer in hearers(range, source))
		memorizer.mind?._add_memory(memory_args.Copy()) // One copy for each memory, since it mutates the list

/**
 * Adds a memory to the target mob.
 *
 * The first argument should be a typepath of a /datum/memory.
 *
 * If the mob already has a memory of that type, it will be deleted.
 *
 * Beyond that, can be supplied with named arguments pertaining to your memory type.
 * Common arguments include:
 * * protagonist: The main subject of the memory
 * * deuteragonist: The side subject of the memory. Doesn't necessarily have to be a mob!
 * * antagonist: The main villain of the memory. Also doesn't necessarily have to be a mob!
 *
 * Returns the datum memory created, or null otherwise.
 */
#define add_mob_memory(arguments...) mind?._add_memory(list(##arguments))

// Wrapper for _add_memory so we can used named arguments.
/**
 * Adds a memory to the target mind.
 *
 * The first argument should be a typepath of a /datum/memory.
 *
 * If the mob already has a memory of that type, it will be deleted.
 *
 * Beyond that, can be supplied with named arguments pertaining to your memory type.
 * Common arguments include:
 * * protagonist: The main subject of the memory
 * * deuteragonist: The side subject of the memory. Doesn't necessarily have to be a mob!
 * * antagonist: The main villain of the memory. Also doesn't necessarily have to be a mob!
 *
 * Returns the datum memory created, or null otherwise.
 */
#define add_memory(arguments...) _add_memory(list(##arguments))

/// Unless you need to use this for an explicit reason, use the add_memory, add_mob_memory, or add_memory_in_range macro wrappers.
/datum/mind/proc/_add_memory(list/memory_args)
	RETURN_TYPE(/datum/memory)
	var/datum/memory/memory_type = memory_args[1]
	if(!ispath(memory_type))
		CRASH("add_memory called with an invalid memory type. (Got: [memory_type || "null"])")

	if(current)
		var/new_memory_flags = initial(memory_type.memory_flags)
		if(!(new_memory_flags & MEMORY_SKIP_UNCONSCIOUS) && current.stat >= UNCONSCIOUS)
			return
		if(new_memory_flags & MEMORY_CHECK_BLINDNESS && current.is_blind())
			return
		if(new_memory_flags & MEMORY_CHECK_DEAFNESS && HAS_TRAIT(current, TRAIT_DEAF))
			return
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	var/datum/memory/replaced_memory = memories[memory_type]
	if(replaced_memory)
		qdel(replaced_memory)

<<<<<<< HEAD
	var/extra_info_parsed = list()

	for(var/key in extra_info)
		var/detail = extra_info[key]
		extra_info_parsed[key] = build_story_detail(detail)

	memories[memory_type] = new /datum/memory(src, build_story_mob(current), memory_type, extra_info_parsed, story_mood, story_value, memory_flags)
	return memories[memory_type]

///returns the story name of a mob
/datum/mind/proc/build_story_mob(mob/living/target)
	if(isanimal(target))
		return "\the [target]"
	if(target.mind?.assigned_role)
		return  "\the [lowertext(initial(target.mind?.assigned_role.title))]"
	return target

///returns the story name of anything
/datum/mind/proc/build_story_detail(detail)
	if(!isatom(detail))
		return detail //Its either text or deserves to runtime.
	var/atom/target = detail
	if(isliving(target))
		return build_story_mob(target)
	return lowertext(initial(target.name))

///sane proc for giving a mob with a mind the option to select one of their memories, returns the memory selected (null otherwise)
/datum/mind/proc/select_memory(verbage)

=======
	memory_args[1] = src
	var/datum/memory/created_memory = new memory_type(arglist(memory_args))

	memories[memory_type] = created_memory
	return created_memory

/**
 * Simple / sane proc for giving a mob the option to select one of their memories
 * that do not have the flags [MEMORY_FLAG_ALREADY_USED] or [MEMORY_NO_STORY].
 *
 * Arguments
 * * verbage: This is used in the tgui selection menu, explains what they're selecting a memory to do.
 *
 * Returns the memory selected, or null otherwise.
 */
/datum/mind/proc/select_memory(verbage = "use")
	RETURN_TYPE(/datum/memory)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	var/list/choice_list = list()

	for(var/key in memories)
		var/datum/memory/memory_iter = memories[key]
<<<<<<< HEAD
		if(memory_iter.memory_flags & MEMORY_FLAG_ALREADY_USED) //Can't use memories multiple times
=======
		if(memory_iter.memory_flags & (MEMORY_FLAG_ALREADY_USED|MEMORY_NO_STORY)) //Can't use memories multiple times
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			continue
		choice_list[memory_iter.name] = memory_iter

	var/choice = tgui_input_list(usr, "Select a memory to [verbage]", "Memory Selection?", choice_list)
	if(isnull(choice))
		return FALSE
	if(isnull(choice_list[choice]))
		return FALSE
	var/datum/memory/memory_choice = choice_list[choice]

	return memory_choice

<<<<<<< HEAD
///small helper to clean out memories
/datum/mind/proc/wipe_memory()
	QDEL_LIST_ASSOC_VAL(memories)
=======
/// Small helper to clean out memories.
/datum/mind/proc/wipe_memory()
	QDEL_LIST_ASSOC_VAL(memories)

/// Helper to create quick copies of all of our memories
/// Quick copies aren't full copies - just basic copies containing necessities.
/// They cannot be used in stories.
/datum/mind/proc/quick_copy_all_memories(datum/mind/new_memorizer)
	for(var/memory_path in memories)
		var/datum/memory/prime_memory = memories[memory_path]
		new_memorizer.memories[memory_path] = prime_memory.quick_copy_memory(new_memorizer)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
