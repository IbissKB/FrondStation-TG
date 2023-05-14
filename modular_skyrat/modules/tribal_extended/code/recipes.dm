/datum/crafting_recipe/silkstring
	name = "Silk String"
	result = /obj/item/weaponcrafting/silkstring
	reqs = list(/obj/item/stack/sheet/cloth = 1)
<<<<<<< HEAD
	time = 50
=======
	time = 5 SECONDS
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	category = CAT_MISC

/datum/crafting_recipe/wood_bow
	name = "Wooden Bow"
	result = /obj/item/gun/ballistic/tribalbow
	reqs = list(
		/obj/item/stack/sheet/mineral/wood = 25,
		/obj/item/weaponcrafting/silkstring = 2,
	)
<<<<<<< HEAD
	time = 300
	category = CAT_PRIMAL
=======
	time = 30 SECONDS
	category = CAT_WEAPON_RANGED
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/pipebow
	name = "Pipe Bow"
	result = /obj/item/gun/ballistic/tribalbow/pipe
	reqs = list(
		/obj/item/pipe = 5,
		/obj/item/stack/sheet/plastic = 5,
		/obj/item/weaponcrafting/silkstring = 2,
	)
<<<<<<< HEAD
	time = 450
	category = CAT_PRIMAL
=======
	time = 45 SECONDS
	category = CAT_WEAPON_RANGED
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/arrow
	name = "Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/wood
	reqs = list(
		/obj/item/stack/sheet/mineral/wood = 1,
		/obj/item/stack/sheet/cloth= 1,
		/obj/item/stack/rods = 1,
	)
<<<<<<< HEAD
	time = 15
	category = CAT_PRIMAL
=======
	time = 1.5 SECONDS
	category = CAT_WEAPON_AMMO
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/bone_arrow
	name = "Bone Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/bone
	reqs = list(
		/obj/item/stack/sheet/bone = 1,
		/obj/item/ammo_casing/caseless/arrow/ash = 1,
	)
<<<<<<< HEAD
	time = 15
	category = CAT_PRIMAL
=======
	time = 1.5 SECONDS
	category = CAT_WEAPON_AMMO
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/ashen_arrow
	name = "Ashen Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/ash
	reqs = list(
		/obj/item/stack/rods = 2,
		/obj/item/stack/sheet/sinew = 1,
		/obj/item/stack/ore/glass/basalt = 10,
	)
<<<<<<< HEAD
	time = 15
	category = CAT_PRIMAL
=======
	time = 1.5 SECONDS
	category = CAT_WEAPON_AMMO
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/bronze_arrow
	name = "Bronze arrow"
	result = /obj/item/ammo_casing/caseless/arrow/bronze
	reqs = list(
		/obj/item/ammo_casing/caseless/arrow/ash = 1,
		/obj/item/stack/tile/bronze = 1,
	)
<<<<<<< HEAD
	time = 15
	category = CAT_PRIMAL
=======
	time = 1.5 SECONDS
	category = CAT_WEAPON_AMMO
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/goliathshield
	name = "Goliath shield"
	result = /obj/item/shield/goliath
	reqs = list(
		/obj/item/stack/sheet/bone = 4,
		/obj/item/stack/sheet/animalhide/goliath_hide = 3,
	)
<<<<<<< HEAD
	time = 60
	category = CAT_PRIMAL
=======
	time = 6 SECONDS
	category = CAT_EQUIPMENT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/bonesword
	name = "Bone Sword"
	result = /obj/item/claymore/bone
	reqs = list(
		/obj/item/stack/sheet/bone = 2,
		/obj/item/stack/sheet/sinew = 2,
	)
<<<<<<< HEAD
	time = 40
	always_available = FALSE
	category = CAT_PRIMAL
=======
	time = 4 SECONDS
	always_available = FALSE
	category = CAT_WEAPON_MELEE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/quiver
	name = "Quiver"
	result = /obj/item/storage/belt/quiver
	reqs = list(
		/obj/item/stack/sheet/leather = 2,
		/obj/item/stack/sheet/sinew = 4,
	)
<<<<<<< HEAD
	time = 80
	category = CAT_PRIMAL
=======
	time = 8 SECONDS
	category = CAT_WEAPON_AMMO
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/bone_bow
	name = "Bone Bow"
	result = /obj/item/gun/ballistic/tribalbow/ashen
	reqs = list(
		/obj/item/stack/sheet/bone = 4,
		/obj/item/stack/sheet/sinew = 4,
	)
<<<<<<< HEAD
	time = 200
	category = CAT_PRIMAL
=======
	time = 20 SECONDS
	category = CAT_WEAPON_RANGED
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
