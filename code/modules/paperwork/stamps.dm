/obj/item/stamp
	name = "\improper GRANTED rubber stamp"
	desc = "A rubber stamp for stamping important documents."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "stamp-ok"
	inhand_icon_state = "stamp"
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
<<<<<<< HEAD
	custom_materials = list(/datum/material/iron=60)
=======
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.6)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	pressure_resistance = 2
	attack_verb_continuous = list("stamps")
	attack_verb_simple = list("stamp")

/obj/item/stamp/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] stamps 'VOID' on [user.p_their()] forehead, then promptly falls over, dead."))
<<<<<<< HEAD
=======
	playsound(src, 'sound/items/handling/standard_stamp.ogg', 50, vary = TRUE)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return OXYLOSS

/obj/item/stamp/get_writing_implement_details()
	var/datum/asset/spritesheet/sheet = get_asset_datum(/datum/asset/spritesheet/simple/paper)
	return list(
		interaction_mode = MODE_STAMPING,
		stamp_icon_state = icon_state,
		stamp_class = sheet.icon_class_name(icon_state)
	)

<<<<<<< HEAD
/obj/item/stamp/qm
	name = "quartermaster's rubber stamp"
	icon_state = "stamp-qm"
	dye_color = DYE_QM

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/stamp/law
	name = "law office's rubber stamp"
	icon_state = "stamp-law"
	dye_color = DYE_LAW

<<<<<<< HEAD
/obj/item/stamp/captain
=======
/obj/item/stamp/head

/obj/item/stamp/head/Initialize(mapload)
	. = ..()
	// All maps should have at least 1 of each head of staff stamp
	REGISTER_REQUIRED_MAP_ITEM(1, INFINITY)

/obj/item/stamp/head/captain
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	name = "captain's rubber stamp"
	icon_state = "stamp-cap"
	dye_color = DYE_CAPTAIN

<<<<<<< HEAD
/obj/item/stamp/hop
=======
/obj/item/stamp/head/hop
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	name = "head of personnel's rubber stamp"
	icon_state = "stamp-hop"
	dye_color = DYE_HOP

<<<<<<< HEAD
/obj/item/stamp/hos
=======
/obj/item/stamp/head/hos
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	name = "head of security's rubber stamp"
	icon_state = "stamp-hos"
	dye_color = DYE_HOS

<<<<<<< HEAD
/obj/item/stamp/ce
=======
/obj/item/stamp/head/ce
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	name = "chief engineer's rubber stamp"
	icon_state = "stamp-ce"
	dye_color = DYE_CE

<<<<<<< HEAD
/obj/item/stamp/rd
=======
/obj/item/stamp/head/rd
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	name = "research director's rubber stamp"
	icon_state = "stamp-rd"
	dye_color = DYE_RD

<<<<<<< HEAD
/obj/item/stamp/cmo
=======
/obj/item/stamp/head/cmo
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	name = "chief medical officer's rubber stamp"
	icon_state = "stamp-cmo"
	dye_color = DYE_CMO

<<<<<<< HEAD
=======
/obj/item/stamp/head/qm
	name = "quartermaster's rubber stamp"
	icon_state = "stamp-qm"
	dye_color = DYE_QM

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/stamp/denied
	name = "\improper DENIED rubber stamp"
	icon_state = "stamp-deny"
	dye_color = DYE_REDCOAT

/obj/item/stamp/void
	name = "VOID rubber stamp"
	icon_state = "stamp-void"

/obj/item/stamp/clown
	name = "clown's rubber stamp"
	icon_state = "stamp-clown"
	dye_color = DYE_CLOWN

/obj/item/stamp/mime
	name = "mime's rubber stamp"
	icon_state = "stamp-mime"
	dye_color = DYE_MIME

/obj/item/stamp/chap
	name = "chaplain's rubber stamp"
	icon_state = "stamp-chap"
	dye_color = DYE_CHAP

/obj/item/stamp/centcom
	name = "CentCom rubber stamp"
	icon_state = "stamp-centcom"
	dye_color = DYE_CENTCOM

/obj/item/stamp/syndicate
	name = "Syndicate rubber stamp"
	icon_state = "stamp-syndicate"
	dye_color = DYE_SYNDICATE

/obj/item/stamp/attack_paw(mob/user, list/modifiers)
	return attack_hand(user, modifiers)
