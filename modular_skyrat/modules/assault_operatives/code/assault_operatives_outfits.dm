<<<<<<< HEAD


//KITS
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/datum/outfit/assaultops
	name = "Assault Ops - Default"

	uniform = /obj/item/clothing/under/syndicate/sniper
	shoes = /obj/item/clothing/shoes/jackboots
	gloves =  /obj/item/clothing/gloves/combat
	back = /obj/item/storage/backpack/chameleon
	ears = /obj/item/radio/headset/syndicate/alt
<<<<<<< HEAD
	id = /obj/item/card/id/advanced/chameleon
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	glasses = /obj/item/clothing/glasses/sunglasses
	mask = /obj/item/clothing/mask/gas/sechailer/syndicate

	l_pocket = /obj/item/switchblade
	r_pocket = /obj/item/armament_points_card/assaultops

<<<<<<< HEAD
=======
	id = /obj/item/card/id/advanced/chameleon
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	id_trim = /datum/id_trim/chameleon/operative

/datum/outfit/assaultops/post_equip(mob/living/carbon/human/equipping_human)
	var/obj/item/radio/radio = equipping_human.ears
	radio.set_frequency(FREQ_SYNDICATE)
	radio.freqlock = TRUE
	radio.command = TRUE

	var/obj/item/implant/weapons_auth/weapons_authorisation = new/obj/item/implant/weapons_auth(equipping_human)
	weapons_authorisation.implant(equipping_human)

	equipping_human.faction |= ROLE_SYNDICATE

	equipping_human.update_icons()
<<<<<<< HEAD
=======

// ICONS FOR PREVIEW USE ONLY

/datum/outfit/assaultops_preview
	name = "Assault Ops - Preview ONLY"

	uniform = /obj/item/clothing/under/syndicate/sniper
	shoes = /obj/item/clothing/shoes/jackboots
	gloves =  /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/syndicate/alt
	glasses = /obj/item/clothing/glasses/sunglasses

/datum/outfit/assaultops_preview/background
	name = "Assault Ops - Background Dudes - Preview ONLY"

	mask = /obj/item/clothing/mask/gas/sechailer/syndicate
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
