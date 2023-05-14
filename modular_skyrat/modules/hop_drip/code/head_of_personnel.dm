/obj/item/storage/backpack/head_of_personnel
	name = "head of personnel backpack"
	desc = "A exclusive backpack issued to Nanotrasen's finest second."
<<<<<<< HEAD
	icon = 'modular_skyrat/modules/hop_drip/icons/hop_packs.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_skyrat/modules/hop_drip/icons/backpack_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/hop_drip/icons/backpack_righthand.dmi'
	icon_state = "hop_pack"
	inhand_icon_state = "hop_pack"
=======
	icon = 'modular_skyrat/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_skyrat/master_files/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_skyrat/master_files/icons/mob/inhands/clothing/backpack_righthand.dmi'
	icon_state = "backpack_hop"
	inhand_icon_state = "backpack_hop"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/storage/backpack/satchel/head_of_personnel
	name = "head of personnel satchel"
	desc = "A exclusive satchel issued to Nanotrasen's finest second."
<<<<<<< HEAD
	icon = 'modular_skyrat/modules/hop_drip/icons/hop_packs.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_skyrat/modules/hop_drip/icons/backpack_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/hop_drip/icons/backpack_righthand.dmi'
=======
	icon = 'modular_skyrat/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_skyrat/master_files/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_skyrat/master_files/icons/mob/inhands/clothing/backpack_righthand.dmi'
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon_state = "satchel_hop"
	inhand_icon_state = "satchel_hop"

/obj/item/storage/backpack/duffelbag/head_of_personnel
	name = "head of personnel duffelbag"
	desc = "A robust duffelbag issued to Nanotrasen's finest second."
<<<<<<< HEAD
	icon = 'modular_skyrat/modules/hop_drip/icons/hop_packs.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_skyrat/modules/hop_drip/icons/backpack_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/hop_drip/icons/backpack_righthand.dmi'
=======
	icon = 'modular_skyrat/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_skyrat/master_files/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_skyrat/master_files/icons/mob/inhands/clothing/backpack_righthand.dmi'
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon_state = "duffel_hop"
	inhand_icon_state = "duffel_hop"

/obj/item/radio/headset/heads/hop/alt
	name = "\proper the head of personnel's bowman headset"
	desc = "The headset of the second. Protects ears from flashbangs."
	icon_state = "com_headset_alt"

/obj/item/radio/headset/heads/hop/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))
