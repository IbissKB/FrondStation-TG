<<<<<<< HEAD
#define ADD_STEAL_ITEM(Source, Type) GLOB.steal_item_handler.objectives_by_path[Type] += Source

//Contains the target item datums for Steal objectives.
/datum/objective_item
	var/name = "A silly bike horn! Honk!"
	var/targetitem = /obj/item/bikehorn
	var/list/valid_containers = list() // Valid containers that the target item can be in.
	var/difficulty = 9001 //vaguely how hard it is to do this objective
	var/list/excludefromjob = list() //If you don't want a job to get a certain objective (no captain stealing his own medal, etcetc)
	var/list/altitems = list() //Items which can serve as an alternative to the objective (darn you blueprints)
	var/list/special_equipment = list()
=======
/proc/add_item_to_steal(source, type)
	GLOB.steal_item_handler.objectives_by_path[type] += source
	return type

//Contains the target item datums for Steal objectives.
/datum/objective_item
	/// How the item is described in the objective
	var/name = "A silly bike horn! Honk!"
	/// Typepath of item
	var/targetitem = /obj/item/bikehorn
	/// Valid containers that the target item can be in.
	var/list/valid_containers = list()
	/// Who CARES if this item goes missing (no stealing unguarded items), often similar but not identical to the next list
	var/list/item_owner = list()
	/// Jobs which cannot generate this objective (no stealing your own stuff)
	var/list/excludefromjob = list()
	/// List of additional items which also count, for things like blueprints
	var/list/altitems = list()
	/// Items to provide to people in order to allow them to acquire the target
	var/list/special_equipment = list()
	/// Defines in which contexts the item can be given as an objective
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	var/objective_type = OBJECTIVE_ITEM_TYPE_NORMAL
	/// Whether this item exists on the station map at the start of a round.
	var/exists_on_map = FALSE

<<<<<<< HEAD
/datum/objective_item/proc/check_special_completion() //for objectives with special checks (is that slime extract unused? does that intellicard have an ai in it? etcetc)
	return 1

/datum/objective_item/proc/TargetExists()
	return TRUE

/datum/objective_item/steal/New()
	..()
	if(TargetExists())
=======
/// For objectives with special checks (does that intellicard have an ai in it? etcetc)
/datum/objective_item/proc/check_special_completion()
	return TRUE

/// Takes a list of minds and returns true if this is a valid objective to give to a team of these minds
/datum/objective_item/proc/valid_objective_for(list/potential_thieves, require_owner = FALSE)
	if(!target_exists() || (require_owner && !owner_exists()))
		return FALSE
	for (var/datum/mind/possible_thief as anything in potential_thieves)
		var/datum/job/role = possible_thief.assigned_role
		if(role.title in excludefromjob)
			return FALSE
	return TRUE

/// Returns true if the target item exists
/datum/objective_item/proc/target_exists()
	return (exists_on_map) ? length(GLOB.steal_item_handler.objectives_by_path[targetitem]) : TRUE

/// Returns true if one of the item's owners exists somewhere
/datum/objective_item/proc/owner_exists()
	if (!length(item_owner))
		return TRUE
	for (var/mob/living/player as anything in GLOB.player_list)
		if ((player.mind?.assigned_role.title in item_owner) && player.stat != DEAD && !is_centcom_level(player.z))
			return TRUE
	return FALSE

/datum/objective_item/steal/New()
	. = ..()
	if(target_exists())
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		GLOB.possible_items += src
	else
		qdel(src)

/datum/objective_item/steal/Destroy()
	GLOB.possible_items -= src
	return ..()

// Low risk steal objectives
<<<<<<< HEAD
/datum/objective_item/steal/low_risk
	objective_type = OBJECTIVE_ITEM_TYPE_TRAITOR

/datum/objective_item/steal/low_risk/aicard
	targetitem = /obj/item/aicard
	name = "an intelliCard"
	excludefromjob = list(
		JOB_CAPTAIN,
		JOB_CHIEF_ENGINEER,
		JOB_RESEARCH_DIRECTOR,
		JOB_CHIEF_MEDICAL_OFFICER,
		JOB_HEAD_OF_SECURITY,
		JOB_STATION_ENGINEER,
		JOB_SCIENTIST,
		JOB_ATMOSPHERIC_TECHNICIAN,
	)
	exists_on_map = TRUE

/obj/item/aicard/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/aicard)

// Unique-ish low risk objectives
/datum/objective_item/steal/low_risk/bartender_shotgun
	name = "the bartender's shotgun"
	targetitem = /obj/item/gun/ballistic/shotgun/doublebarrel
	excludefromjob = list(JOB_BARTENDER)
	exists_on_map = TRUE

/obj/item/gun/ballistic/shotgun/doublebarrel/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/gun/ballistic/shotgun/doublebarrel)

/datum/objective_item/steal/low_risk/fireaxe
	name = "a fire axe"
	targetitem = /obj/item/fireaxe
	excludefromjob = list(JOB_CHIEF_ENGINEER,JOB_STATION_ENGINEER,JOB_ATMOSPHERIC_TECHNICIAN)
	exists_on_map = TRUE

/obj/item/fireaxe/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/fireaxe)

/datum/objective_item/steal/low_risk/nullrod
	name = "the chaplain's null rod"
	targetitem = /obj/item/nullrod
	excludefromjob = list(JOB_CHAPLAIN)
	exists_on_map = TRUE

/obj/item/nullrod/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/nullrod)

/datum/objective_item/steal/low_risk/clown_shoes
	name = "the clown's shoes"
	targetitem = /obj/item/clothing/shoes/clown_shoes
	excludefromjob = list(JOB_CLOWN, JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER)

/datum/objective_item/steal/low_risk/clown_shoes/TargetExists()
	for(var/mob/player as anything in GLOB.player_list)
		if(player.stat == DEAD)
			continue
		if(player.job != JOB_CLOWN)
			continue
		if(is_centcom_level(player.z))
			continue
		return TRUE
	return FALSE

/datum/objective_item/steal/low_risk/cargo_budget
	name = "cargo's departmental budget"
	targetitem = /obj/item/card/id/departmental_budget/car
	excludefromjob = list(JOB_QUARTERMASTER, JOB_CARGO_TECHNICIAN)
	exists_on_map = TRUE

/obj/item/card/id/departmental_budget/car/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/card/id/departmental_budget/car)

// High risk steal objectives
/datum/objective_item/steal/caplaser
	name = "the captain's antique laser gun"
	targetitem = /obj/item/gun/energy/laser/captain
	difficulty = 5
=======
/datum/objective_item/steal/traitor
	objective_type = OBJECTIVE_ITEM_TYPE_TRAITOR

// Unique-ish low risk objectives
/datum/objective_item/steal/traitor/bartender_shotgun
	name = "the bartender's shotgun"
	targetitem = /obj/item/gun/ballistic/shotgun/doublebarrel
	excludefromjob = list(JOB_BARTENDER)
	item_owner = list(JOB_BARTENDER)
	exists_on_map = TRUE

/obj/item/gun/ballistic/shotgun/doublebarrel/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/gun/ballistic/shotgun/doublebarrel)

/datum/objective_item/steal/traitor/fireaxe
	name = "a fire axe"
	targetitem = /obj/item/fireaxe
	excludefromjob = list(
		JOB_ATMOSPHERIC_TECHNICIAN,
		JOB_CAPTAIN,
		JOB_CHIEF_ENGINEER,
		JOB_CHIEF_MEDICAL_OFFICER,
		JOB_HEAD_OF_PERSONNEL,
		JOB_HEAD_OF_SECURITY,
		JOB_QUARTERMASTER,
		JOB_RESEARCH_DIRECTOR,
		JOB_STATION_ENGINEER,
	)
	exists_on_map = TRUE

/obj/item/fireaxe/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/fireaxe)

/datum/objective_item/steal/traitor/big_crowbar
	name = "a mech removal tool"
	targetitem = /obj/item/crowbar/mechremoval
	excludefromjob = list(
		JOB_RESEARCH_DIRECTOR,
		JOB_SCIENTIST,
		JOB_ROBOTICIST,
	)
	item_owner = list(JOB_ROBOTICIST)
	exists_on_map = TRUE

/obj/item/crowbar/mechremoval/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/crowbar/mechremoval)

/datum/objective_item/steal/traitor/nullrod
	name = "the chaplain's null rod"
	targetitem = /obj/item/nullrod
	excludefromjob = list(JOB_CHAPLAIN)
	item_owner = list(JOB_CHAPLAIN)
	exists_on_map = TRUE

/obj/item/nullrod/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/nullrod)

/datum/objective_item/steal/traitor/clown_shoes
	name = "the clown's shoes"
	targetitem = /obj/item/clothing/shoes/clown_shoes
	excludefromjob = list(JOB_CLOWN, JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER)
	item_owner = list(JOB_CLOWN)

/datum/objective_item/steal/traitor/det_revolver
	name = "detective's revolver"
	targetitem = /obj/item/gun/ballistic/revolver/c38/detective
	excludefromjob = list(JOB_DETECTIVE)
	exists_on_map = TRUE

/obj/item/gun/ballistic/revolver/c38/detective/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/gun/ballistic/revolver/c38/detective)

/datum/objective_item/steal/traitor/chief_engineer_belt
	name = "the chief engineer's belt"
	targetitem = /obj/item/storage/belt/utility/chief
	excludefromjob = list(JOB_CHIEF_ENGINEER)
	exists_on_map = TRUE

/obj/item/storage/belt/utility/chief/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/storage/belt/utility/chief)

/datum/objective_item/steal/traitor/telebaton
	name = "a head of staff's telescopic baton"
	targetitem = /obj/item/melee/baton/telescopic
	excludefromjob = list(
		JOB_RESEARCH_DIRECTOR,
		JOB_CAPTAIN,
		JOB_HEAD_OF_SECURITY,
		JOB_HEAD_OF_PERSONNEL,
		JOB_CHIEF_ENGINEER,
		JOB_CHIEF_MEDICAL_OFFICER
	)
	exists_on_map = TRUE

/obj/item/melee/baton/telescopic/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/melee/baton/telescopic)

/datum/objective_item/steal/traitor/cargo_budget
	name = "cargo's departmental budget"
	targetitem = /obj/item/card/id/departmental_budget/car
	excludefromjob = list(JOB_QUARTERMASTER, JOB_CARGO_TECHNICIAN)
	item_owner = list(JOB_QUARTERMASTER)
	exists_on_map = TRUE

/obj/item/card/id/departmental_budget/car/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/card/id/departmental_budget/car)

/datum/objective_item/steal/traitor/captain_modsuit
	name = "the captain's magnate MOD control unit"
	targetitem = /obj/item/mod/control/pre_equipped/magnate
	excludefromjob = list(JOB_CAPTAIN)
	exists_on_map = TRUE

/obj/item/mod/control/pre_equipped/magnate/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/mod/control/pre_equipped/magnate)

/datum/objective_item/steal/traitor/captain_spare
	name = "the captain's spare ID"
	targetitem = /obj/item/card/id/advanced/gold/captains_spare
	excludefromjob = list(
		JOB_RESEARCH_DIRECTOR,
		JOB_CAPTAIN,
		JOB_HEAD_OF_SECURITY,
		JOB_HEAD_OF_PERSONNEL,
		JOB_CHIEF_ENGINEER,
		JOB_CHIEF_MEDICAL_OFFICER
	)
	exists_on_map = TRUE

/obj/item/card/id/advanced/gold/captains_spare/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/card/id/advanced/gold/captains_spare)

// High risk steal objectives

// Will always generate even with no Captain due to its security and temptation to use it
/datum/objective_item/steal/caplaser
	name = "the captain's antique laser gun"
	targetitem = /obj/item/gun/energy/laser/captain
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	excludefromjob = list(JOB_CAPTAIN)
	exists_on_map = TRUE

/obj/item/gun/energy/laser/captain/add_stealing_item_objective()
<<<<<<< HEAD
	ADD_STEAL_ITEM(src, /obj/item/gun/energy/laser/captain)
=======
	return add_item_to_steal(src, /obj/item/gun/energy/laser/captain)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/hoslaser
	name = "the head of security's personal laser gun"
	targetitem = /obj/item/gun/energy/e_gun/hos
<<<<<<< HEAD
	difficulty = 10
	excludefromjob = list(JOB_HEAD_OF_SECURITY)
	exists_on_map = TRUE

/obj/item/gun/energy/e_gun/hos/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/gun/energy/e_gun/hos)
=======
	excludefromjob = list(JOB_HEAD_OF_SECURITY)
	item_owner = list(JOB_HEAD_OF_SECURITY)
	exists_on_map = TRUE

/obj/item/gun/energy/e_gun/hos/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/gun/energy/e_gun/hos)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/handtele
	name = "a hand teleporter"
	targetitem = /obj/item/hand_tele
<<<<<<< HEAD
	difficulty = 5
	excludefromjob = list(JOB_CAPTAIN, JOB_RESEARCH_DIRECTOR, JOB_HEAD_OF_PERSONNEL)
	exists_on_map = TRUE

/obj/item/hand_tele/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/hand_tele)
=======
	excludefromjob = list(JOB_CAPTAIN, JOB_RESEARCH_DIRECTOR, JOB_HEAD_OF_PERSONNEL)
	item_owner = list(JOB_CAPTAIN, JOB_RESEARCH_DIRECTOR)
	exists_on_map = TRUE

/obj/item/hand_tele/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/hand_tele)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/jetpack
	name = "the Captain's jetpack"
	targetitem = /obj/item/tank/jetpack/oxygen/captain
<<<<<<< HEAD
	difficulty = 5
	excludefromjob = list(JOB_CAPTAIN)
	exists_on_map = TRUE

/obj/item/tank/jetpack/oxygen/captain/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/tank/jetpack/oxygen/captain)
=======
	excludefromjob = list(JOB_CAPTAIN)
	item_owner = list(JOB_CAPTAIN)
	exists_on_map = TRUE

/obj/item/tank/jetpack/oxygen/captain/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/tank/jetpack/oxygen/captain)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/magboots
	name = "the chief engineer's advanced magnetic boots"
	targetitem = /obj/item/clothing/shoes/magboots/advance
<<<<<<< HEAD
	difficulty = 5
	excludefromjob = list(JOB_CHIEF_ENGINEER)
	exists_on_map = TRUE

/obj/item/clothing/shoes/magboots/advance/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/clothing/shoes/magboots/advance)
=======
	excludefromjob = list(JOB_CHIEF_ENGINEER)
	item_owner = list(JOB_CHIEF_ENGINEER)
	exists_on_map = TRUE

/obj/item/clothing/shoes/magboots/advance/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/clothing/shoes/magboots/advance)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/capmedal
	name = "the medal of captaincy"
	targetitem = /obj/item/clothing/accessory/medal/gold/captain
<<<<<<< HEAD
	difficulty = 5
	excludefromjob = list(JOB_CAPTAIN)
	exists_on_map = TRUE

/obj/item/clothing/accessory/medal/gold/captain/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/clothing/accessory/medal/gold/captain)
=======
	excludefromjob = list(JOB_CAPTAIN)
	item_owner = list(JOB_CAPTAIN)
	exists_on_map = TRUE

/obj/item/clothing/accessory/medal/gold/captain/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/clothing/accessory/medal/gold/captain)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/hypo
	//name = "the hypospray" // ORIGINAL
	name = "the Chief Medical Officer's hypospray" // SKYRAT EDIT CHANGE
	//targetitem = /obj/item/reagent_containers/hypospray/cmo // ORIGINAL
	targetitem = /obj/item/hypospray/mkii/cmo // SKYRAT EDIT CHANGE
<<<<<<< HEAD
	difficulty = 5
	excludefromjob = list(JOB_CHIEF_MEDICAL_OFFICER)
	exists_on_map = TRUE

///obj/item/reagent_containers/hypospray/cmo/add_stealing_item_objective() // ORIGINAL
/obj/item/hypospray/mkii/cmo/add_stealing_item_objective() // SKYRAT EDIT CHANGE
	//ADD_STEAL_ITEM(src, /obj/item/reagent_containers/hypospray/cmo) // ORIGINAL
	ADD_STEAL_ITEM(src, /obj/item/hypospray/mkii/cmo) // SKYRAT EDIT CHANGE
=======
	excludefromjob = list(JOB_CHIEF_MEDICAL_OFFICER)
	item_owner = list(JOB_CHIEF_MEDICAL_OFFICER)
	exists_on_map = TRUE

/obj/item/hypospray/mkii/cmo/add_stealing_item_objective() // SKYRAT EDIT CHANGE
	return add_item_to_steal(src, /obj/item/hypospray/mkii/cmo) // SKYRAT EDIT CHANGE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/nukedisc
	name = "the nuclear authentication disk"
	targetitem = /obj/item/disk/nuclear
<<<<<<< HEAD
	difficulty = 5
	excludefromjob = list(JOB_CAPTAIN)

=======
	excludefromjob = list(JOB_CAPTAIN)

/obj/item/disk/nuclear/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/disk/nuclear)

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/datum/objective_item/steal/nukedisc/check_special_completion(obj/item/disk/nuclear/N)
	return !N.fake

/datum/objective_item/steal/reflector
	name = "a reflector trenchcoat"
	targetitem = /obj/item/clothing/suit/hooded/ablative
<<<<<<< HEAD
	difficulty = 3
	excludefromjob = list(JOB_HEAD_OF_SECURITY, JOB_WARDEN)
	exists_on_map = TRUE

/obj/item/clothing/suit/hooded/ablative/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/clothing/suit/hooded/ablative)
=======
	excludefromjob = list(JOB_HEAD_OF_SECURITY, JOB_WARDEN)
	item_owner = list(JOB_HEAD_OF_SECURITY)
	exists_on_map = TRUE

/obj/item/clothing/suit/hooded/ablative/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/clothing/suit/hooded/ablative)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/reactive
	name = "the reactive teleport armor"
	targetitem = /obj/item/clothing/suit/armor/reactive/teleport
<<<<<<< HEAD
	difficulty = 5
	excludefromjob = list(JOB_RESEARCH_DIRECTOR)
	exists_on_map = TRUE

/obj/item/clothing/suit/armor/reactive/teleport/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/clothing/suit/armor/reactive/teleport)
=======
	excludefromjob = list(JOB_RESEARCH_DIRECTOR)
	item_owner = list(JOB_RESEARCH_DIRECTOR)
	exists_on_map = TRUE

/obj/item/clothing/suit/armor/reactive/teleport/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/clothing/suit/armor/reactive/teleport)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/documents
	name = "any set of secret documents of any organization"
	targetitem = /obj/item/documents
<<<<<<< HEAD
	difficulty = 5
	exists_on_map = TRUE

/obj/item/documents/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/documents) //Any set of secret documents. Doesn't have to be NT's
=======
	exists_on_map = TRUE

/obj/item/documents/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/documents) //Any set of secret documents. Doesn't have to be NT's
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/nuke_core
	name = "the heavily radioactive plutonium core from the onboard self-destruct"
	valid_containers = list(/obj/item/nuke_core_container)
	targetitem = /obj/item/nuke_core
<<<<<<< HEAD
	difficulty = 15
	exists_on_map = TRUE

/obj/item/nuke_core/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/nuke_core)
=======
	exists_on_map = TRUE

/obj/item/nuke_core/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/nuke_core)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/nuke_core/New()
	special_equipment += /obj/item/storage/box/syndie_kit/nuke
	..()

/datum/objective_item/steal/hdd_extraction
	name = "the source code for Project Goon from the master R&D server mainframe"
	targetitem = /obj/item/computer_disk/hdd_theft
<<<<<<< HEAD
	difficulty = 10
	excludefromjob = list(JOB_RESEARCH_DIRECTOR, JOB_SCIENTIST, JOB_ROBOTICIST, JOB_GENETICIST)
	exists_on_map = TRUE

/obj/item/computer_disk/hdd_theft/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/computer_disk/hdd_theft)
=======
	excludefromjob = list(JOB_RESEARCH_DIRECTOR, JOB_SCIENTIST, JOB_ROBOTICIST, JOB_GENETICIST)
	item_owner = list(JOB_RESEARCH_DIRECTOR, JOB_SCIENTIST)
	exists_on_map = TRUE

/obj/item/computer_disk/hdd_theft/add_stealing_item_objective()
	return add_item_to_steal(src, /obj/item/computer_disk/hdd_theft)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/hdd_extraction/New()
	special_equipment += /obj/item/paper/guides/antag/hdd_extraction
	return ..()


/datum/objective_item/steal/supermatter
	name = "a sliver of a supermatter crystal"
	targetitem = /obj/item/nuke_core/supermatter_sliver
	valid_containers = list(/obj/item/nuke_core_container/supermatter)
<<<<<<< HEAD
	difficulty = 15
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/supermatter/New()
	special_equipment += /obj/item/storage/box/syndie_kit/supermatter
	..()

<<<<<<< HEAD
/datum/objective_item/steal/supermatter/TargetExists()
	return GLOB.main_supermatter_engine != null

//Items with special checks!
/datum/objective_item/steal/plasma
	name = "28 moles of plasma (full tank)"
	targetitem = /obj/item/tank
	difficulty = 3
	excludefromjob = list(
		JOB_CHIEF_ENGINEER, JOB_STATION_ENGINEER, JOB_ATMOSPHERIC_TECHNICIAN,
		JOB_RESEARCH_DIRECTOR, JOB_SCIENTIST, JOB_ROBOTICIST,
	)

/datum/objective_item/steal/plasma/check_special_completion(obj/item/tank/T)
	var/target_amount = text2num(name)
	var/found_amount = 0
	var/datum/gas_mixture/mix = T.return_air()
	found_amount += mix.gases[/datum/gas/plasma] ? mix.gases[/datum/gas/plasma][MOLES] : 0
	return found_amount>=target_amount


/datum/objective_item/steal/functionalai
	name = "a functional AI"
	targetitem = /obj/item/aicard
	difficulty = 20 //beyond the impossible

/datum/objective_item/steal/functionalai/check_special_completion(obj/item/aicard/C)
	for(var/mob/living/silicon/ai/A in C)
		if(isAI(A) && A.stat != DEAD) //See if any AI's are alive inside that card.
			return TRUE
=======
/datum/objective_item/steal/supermatter/target_exists()
	return GLOB.main_supermatter_engine != null

// Doesn't need item_owner = (JOB_AI) because this handily functions as a murder objective if there isn't one
/datum/objective_item/steal/functionalai
	name = "a functional AI"
	targetitem = /obj/item/aicard

/datum/objective_item/steal/functionalai/New()
	. = ..()
	altitems += typesof(/obj/item/mod/control) // only here so we can account for AIs tucked away in a MODsuit.

/datum/objective_item/steal/functionalai/check_special_completion(obj/item/potential_storage)
	var/mob/living/silicon/ai/being

	if(istype(potential_storage, /obj/item/aicard))
		var/obj/item/aicard/card = potential_storage
		being = card.AI // why is this one capitalized and the other one not? i wish i knew.
	// SKYRAT REMOVAL START - MOD PAI
	/*else if(istype(potential_storage, /obj/item/mod/control))
		var/obj/item/mod/control/suit = potential_storage
		being = suit.ai
	*/ // SKYRAT REMOVAL END
	else
		stack_trace("check_special_completion() called on [src] with [potential_storage] ([potential_storage.type])! That's not supposed to happen!")
		return FALSE

	if(isAI(being) && being.stat != DEAD)
		return TRUE

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return FALSE

/datum/objective_item/steal/blueprints
	name = "the station blueprints"
	targetitem = /obj/item/areaeditor/blueprints
<<<<<<< HEAD
	difficulty = 10
	excludefromjob = list(JOB_CHIEF_ENGINEER)
=======
	excludefromjob = list(JOB_CHIEF_ENGINEER)
	item_owner = list(JOB_CHIEF_ENGINEER)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	altitems = list(/obj/item/photo)
	exists_on_map = TRUE

/obj/item/areaeditor/blueprints/add_stealing_item_objective()
<<<<<<< HEAD
	ADD_STEAL_ITEM(src, /obj/item/areaeditor/blueprints)
=======
	return add_item_to_steal(src, /obj/item/areaeditor/blueprints)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/objective_item/steal/blueprints/check_special_completion(obj/item/I)
	if(istype(I, /obj/item/areaeditor/blueprints))
		return TRUE
	if(istype(I, /obj/item/photo))
		var/obj/item/photo/P = I
		if(P.picture.has_blueprints) //if the blueprints are in frame
			return TRUE
	return FALSE

<<<<<<< HEAD
/datum/objective_item/steal/slime
	name = "an unused sample of slime extract"
	targetitem = /obj/item/slime_extract
	difficulty = 3
	excludefromjob = list(JOB_RESEARCH_DIRECTOR, JOB_SCIENTIST)

/datum/objective_item/steal/slime/check_special_completion(obj/item/slime_extract/E)
	if(E.Uses > 0)
		return 1
	return 0

/datum/objective_item/steal/blackbox
	name = "the Blackbox"
	targetitem = /obj/item/blackbox
	difficulty = 10
=======
/datum/objective_item/steal/blackbox
	name = "the Blackbox"
	targetitem = /obj/item/blackbox
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	excludefromjob = list(JOB_CHIEF_ENGINEER, JOB_STATION_ENGINEER, JOB_ATMOSPHERIC_TECHNICIAN)
	exists_on_map = TRUE

/obj/item/blackbox/add_stealing_item_objective()
<<<<<<< HEAD
	ADD_STEAL_ITEM(src, /obj/item/blackbox)

//Unique Objectives
/datum/objective_item/special/New()
	..()
	if(TargetExists())
		GLOB.possible_items_special += src
	else
		qdel(src)

/datum/objective_item/special/Destroy()
	GLOB.possible_items_special -= src
	return ..()

//Old ninja objectives.
/datum/objective_item/special/pinpointer
	name = "the captain's pinpointer"
	targetitem = /obj/item/pinpointer/nuke
	difficulty = 10
	exists_on_map = TRUE

/obj/item/pinpointer/nuke/add_stealing_item_objective()
	ADD_STEAL_ITEM(src, /obj/item/pinpointer/nuke)

/datum/objective_item/special/aegun
	name = "an advanced energy gun"
	targetitem = /obj/item/gun/energy/e_gun/nuclear
	difficulty = 10

/datum/objective_item/special/ddrill
	name = "a diamond drill"
	targetitem = /obj/item/pickaxe/drill/diamonddrill
	difficulty = 10

/datum/objective_item/special/boh
	name = "a bag of holding"
	targetitem = /obj/item/storage/backpack/holding
	difficulty = 10

/datum/objective_item/special/hypercell
	name = "a hyper-capacity power cell"
	targetitem = /obj/item/stock_parts/cell/hyper
	difficulty = 5

/datum/objective_item/special/laserpointer
	name = "a laser pointer"
	targetitem = /obj/item/laser_pointer
	difficulty = 5

/datum/objective_item/special/corgimeat
	name = "a piece of corgi meat"
	targetitem = /obj/item/food/meat/slab/corgi
	difficulty = 5

/datum/objective_item/stack/New()
	..()
	if(TargetExists())
		GLOB.possible_items_special += src
	else
		qdel(src)

/datum/objective_item/stack/Destroy()
	GLOB.possible_items_special -= src
	return ..()

//Stack objectives get their own subtype
/datum/objective_item/stack
	name = "5 cardboard"
	targetitem = /obj/item/stack/sheet/cardboard
	difficulty = 9001


/datum/objective_item/stack/check_special_completion(obj/item/stack/S)
	var/target_amount = text2num(name)
	var/found_amount = 0

	if(istype(S, targetitem))
		found_amount = S.amount
	return found_amount>=target_amount

/datum/objective_item/stack/diamond
	name = "10 diamonds"
	targetitem = /obj/item/stack/sheet/mineral/diamond
	difficulty = 10

/datum/objective_item/stack/gold
	name = "50 gold bars"
	targetitem = /obj/item/stack/sheet/mineral/gold
	difficulty = 15

/datum/objective_item/stack/uranium
	name = "25 refined uranium bars"
	targetitem = /obj/item/stack/sheet/mineral/uranium
	difficulty = 10

#undef ADD_STEAL_ITEM
=======
	return add_item_to_steal(src, /obj/item/blackbox)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
