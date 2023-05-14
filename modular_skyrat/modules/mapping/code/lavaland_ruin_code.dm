//SPAWNERS//
/obj/effect/mob_spawn/ghost_role/human/lavaland_syndicate/shaftminer
<<<<<<< HEAD
	name = "Syndicate Shaft Miner"
	you_are_text = "You are a syndicate shaft miner, employed in a top secret research facility developing biological weapons."
=======
	name = "Interdyne Shaft Miner"
	you_are_text = "You are an Interdyne shaft miner, employed in a top secret research facility developing biological weapons."
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	outfit = /datum/outfit/lavaland_syndicate/shaftminer

/obj/effect/mob_spawn/ghost_role/human/lavaland_syndicate/comms/space
	outfit = /datum/outfit/lavaland_syndicate/comms/space

/obj/effect/mob_spawn/ghost_role/human/lavaland_syndicate/shaftminer/ice
<<<<<<< HEAD
	name = "Syndicate Shaft Miner"
	you_are_text = "You are a syndicate shaft miner, employed in a top secret research facility developing biological weapons."
	outfit = /datum/outfit/lavaland_syndicate/shaftminer/ice

/obj/effect/mob_spawn/ghost_role/human/lavaland_syndicate/ice
	name = "Syndicate Bioweapon Scientist"
	you_are_text = "You are a syndicate science technician, employed in a top secret research facility developing biological weapons."
=======
	name = "Interdyne Shaft Miner"
	you_are_text = "You are an Interdyne shaft miner, employed in a top secret research facility developing biological weapons."
	outfit = /datum/outfit/lavaland_syndicate/shaftminer/ice

/obj/effect/mob_spawn/ghost_role/human/lavaland_syndicate
	name = "Interdyne Bioweapon Scientist"
	you_are_text = "You are an Interdyne science technician, employed in a top secret research facility developing biological weapons."

/obj/effect/mob_spawn/ghost_role/human/lavaland_syndicate/ice
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	outfit = /datum/outfit/lavaland_syndicate/ice

//OUTFITS//
/datum/outfit/lavaland_syndicate
<<<<<<< HEAD
=======
	name = "Interdyne Bioweapon Scientist"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	uniform = /obj/item/clothing/under/rank/rnd/scientist/skyrat/utility/syndicate
	ears = /obj/item/radio/headset/interdyne

/datum/outfit/lavaland_syndicate/post_equip(mob/living/carbon/human/syndicate, visualsOnly = FALSE)
	syndicate.faction |= ROLE_SYNDICATE

	var/obj/item/card/id/id_card = syndicate.wear_id
	if(istype(id_card))
		id_card.registered_name = syndicate.real_name
		id_card.update_label()
		id_card.update_icon()

<<<<<<< HEAD
=======
	handlebank(syndicate)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return ..()

/datum/outfit/lavaland_syndicate/ice
	uniform = /obj/item/clothing/under/syndicate/skyrat/tactical
<<<<<<< HEAD
	suit = /obj/item/clothing/suit/hooded/wintercoat/syndicate
=======
	suit = /obj/item/clothing/suit/hooded/wintercoat/skyrat/syndicate
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	ears = /obj/item/radio/headset/interdyne

/datum/outfit/lavaland_syndicate/comms
	uniform = /obj/item/clothing/under/rank/security/skyrat/utility/redsec/syndicate
	ears = /obj/item/radio/headset/interdyne/comms

/datum/outfit/lavaland_syndicate/comms/space
	ears = /obj/item/radio/headset/syndicate/alt

/datum/outfit/lavaland_syndicate/shaftminer
<<<<<<< HEAD
	name = "Lavaland Syndicate Shaft Miner"
=======
	name = "Interdyne Shaft Miner"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	uniform = /obj/item/clothing/under/rank/cargo/tech/skyrat/utility/syndicate
	suit = null //Subtype moment
	r_pocket = /obj/item/storage/bag/ore
	id_trim = /datum/id_trim/syndicom/skyrat/interdyne
	backpack_contents = list(
		/obj/item/flashlight/seclite=1,\
		/obj/item/knife/combat/survival=1,
		/obj/item/mining_voucher=1,
		/obj/item/t_scanner/adv_mining_scanner/lesser=1,
		/obj/item/gun/energy/recharge/kinetic_accelerator=1,\
		/obj/item/stack/marker_beacon/ten=1)

/datum/outfit/lavaland_syndicate/shaftminer/deckofficer
<<<<<<< HEAD
	name = "Lavaland Syndicate Deck Officer"
=======
	name = "Interdyne Deck Officer"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	uniform = /obj/item/clothing/under/rank/cargo/qm/skyrat/syndie
	neck = /obj/item/clothing/neck/cloak/qm/syndie
	ears = /obj/item/radio/headset/interdyne/command
	id = /obj/item/card/id/advanced/silver/generic
	id_trim = /datum/id_trim/syndicom/skyrat/interdyne/deckofficer

/obj/effect/mob_spawn/ghost_role/human/lavaland_syndicate/deckofficer
<<<<<<< HEAD
	name = "Syndicate Deck Officer"
	you_are_text = "You are a syndicate Deck Officer, employed in a top secret research facility developing biological weapons."
=======
	name = "Interdyne Deck Officer"
	you_are_text = "You are an Interdyne Deck Officer, employed in a top secret research facility developing biological weapons."
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	outfit = /datum/outfit/lavaland_syndicate/shaftminer/deckofficer

/obj/effect/mob_spawn/ghost_role/human/lavaland_syndicate/deckofficer/Destroy()
	new/obj/structure/fluff/empty_sleeper/syndicate/captain(get_turf(src))
	return ..()

/datum/outfit/lavaland_syndicate/shaftminer/ice
<<<<<<< HEAD
	name = "Icemoon Syndicate Shaft Miner"
	uniform = /obj/item/clothing/under/syndicate/skyrat/tactical
	suit = /obj/item/clothing/suit/hooded/wintercoat/syndicate
=======
	name = "Icemoon Interdyne Shaft Miner"
	uniform = /obj/item/clothing/under/syndicate/skyrat/tactical
	suit = /obj/item/clothing/suit/hooded/wintercoat/skyrat/syndicate
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

//ITEMS

/obj/item/radio/headset/interdyne
	name = "interdyne headset"
	desc = "A bowman headset with a large red cross on the earpiece, has a small 'IP' written on the top strap. Protects the ears from flashbangs."
	icon_state = "syndie_headset"
	inhand_icon_state = null
	radiosound = 'modular_skyrat/modules/radiosound/sound/radio/syndie.ogg'
	keyslot = new /obj/item/encryptionkey/headset_syndicate/interdyne

/obj/item/radio/headset/interdyne/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/radio/headset/interdyne/command
	name = "interdyne command headset"
	desc = "A commanding headset to gather your underlings. Protects the ears from flashbangs."
	command = TRUE

/obj/item/radio/headset/interdyne/comms
	keyslot = new /obj/item/encryptionkey/headset_syndicate/interdyne
	keyslot2 = new /obj/item/encryptionkey/syndicate
