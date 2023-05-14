/obj/item/clothing/head/helmet/space/pirate
	name = "modified EVA helmet"
	desc = "A modified helmet to allow space pirates to intimidate their customers whilst staying safe from the void. Comes with some additional protection."
	icon_state = "spacepirate"
	inhand_icon_state = "space_pirate_helmet"
<<<<<<< HEAD
	armor = list(MELEE = 30, BULLET = 50, LASER = 30,ENERGY = 40, BOMB = 30, BIO = 30, FIRE = 60, ACID = 75)
	strip_delay = 40
	equip_delay_other = 20

=======
	armor_type = /datum/armor/space_pirate
	strip_delay = 40
	equip_delay_other = 20

/datum/armor/space_pirate
	melee = 30
	bullet = 50
	laser = 30
	energy = 40
	bomb = 30
	bio = 30
	fire = 60
	acid = 75

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/clothing/head/helmet/space/pirate/bandana
	icon_state = "spacebandana"
	inhand_icon_state = "space_bandana_helmet"

/obj/item/clothing/suit/space/pirate
	name = "modified EVA suit"
<<<<<<< HEAD
	desc = "A modified suit to allow space pirates to board shuttles and stations while avoiding the maw of the void. Comes with additional protection, and is lighter to move in."
=======
	desc = "A modified suit to allow space pirates to board shuttles and stations while avoiding the maw of the void. Comes with additional protection and is lighter to move in."
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon_state = "spacepirate"
	w_class = WEIGHT_CLASS_NORMAL
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/tank/internals, /obj/item/melee/energy/sword/pirate, /obj/item/clothing/glasses/eyepatch, /obj/item/reagent_containers/cup/glass/bottle/rum)
	slowdown = 0
<<<<<<< HEAD
	armor = list(MELEE = 30, BULLET = 50, LASER = 30,ENERGY = 40, BOMB = 30, BIO = 30, FIRE = 60, ACID = 75)
=======
	armor_type = /datum/armor/space_pirate
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	strip_delay = 40
	equip_delay_other = 20
