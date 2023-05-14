
/////////////////////////////////////////
///////////////Bluespace/////////////////
/////////////////////////////////////////

/datum/design/beacon
	name = "Tracking Beacon"
	desc = "A bluespace tracking beacon."
	id = "beacon"
	build_type = PROTOLATHE
<<<<<<< HEAD
	materials = list(/datum/material/iron = 150, /datum/material/glass = 100)
=======
	materials = list(/datum/material/iron = 150, /datum/material/glass =SMALL_MATERIAL_AMOUNT)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	build_path = /obj/item/beacon
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_BLUESPACE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SECURITY

/datum/design/bag_holding
	name = "Inert Bag of Holding"
	desc = "A block of metal ready to be transformed into a bag of holding with a bluespace anomaly core."
	id = "bag_holding"
	build_type = PROTOLATHE
<<<<<<< HEAD
	materials = list(/datum/material/gold = 3000, /datum/material/diamond = 1500, /datum/material/uranium = 250, /datum/material/bluespace = 2000)
=======
	materials = list(/datum/material/gold =SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/diamond =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/uranium = 250, /datum/material/bluespace =SHEET_MATERIAL_AMOUNT)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	build_path = /obj/item/bag_of_holding_inert
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
<<<<<<< HEAD
	dangerous_construction = TRUE
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/bluespace_crystal
	name = "Artificial Bluespace Crystal"
	desc = "A small blue crystal with mystical properties."
	id = "bluespace_crystal"
	build_type = PROTOLATHE | AWAY_LATHE
<<<<<<< HEAD
	materials = list(/datum/material/diamond = 1500, /datum/material/plasma = 1500)
=======
	materials = list(/datum/material/diamond =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/plasma =HALF_SHEET_MATERIAL_AMOUNT * 1.5)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	build_path = /obj/item/stack/ore/bluespace_crystal/artificial
	category = list(
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/telesci_gps
	name = "GPS Device"
	desc = "Little thingie that can track its position at all times."
	id = "telesci_gps"
	build_type = PROTOLATHE
<<<<<<< HEAD
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
=======
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	build_path = /obj/item/gps
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_BLUESPACE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_CARGO
	//autolathe_exportable = FALSE //SKYRAT EDIT REMOVAL

/datum/design/desynchronizer
	name = "Desynchronizer"
	desc = "A device that can desynchronize the user from spacetime."
	id = "desynchronizer"
	build_type = PROTOLATHE
<<<<<<< HEAD
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 500, /datum/material/silver = 1500, /datum/material/bluespace = 1000)
=======
	materials = list(/datum/material/iron =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/glass =SMALL_MATERIAL_AMOUNT*5, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/bluespace =HALF_SHEET_MATERIAL_AMOUNT)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	build_path = /obj/item/desynchronizer
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_BLUESPACE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/miningsatchel_holding
	name = "Mining Satchel of Holding"
	desc = "A mining satchel that can hold an infinite amount of ores."
	id = "minerbag_holding"
	build_type = PROTOLATHE | AWAY_LATHE
<<<<<<< HEAD
	materials = list(/datum/material/gold = 250, /datum/material/uranium = 500) //quite cheap, for more convenience
=======
	materials = list(/datum/material/gold = 250, /datum/material/uranium =SMALL_MATERIAL_AMOUNT*5) //quite cheap, for more convenience
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	build_path = /obj/item/storage/bag/ore/holding
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MINING
	)
	departmental_flags = DEPARTMENT_BITFLAG_CARGO

/datum/design/swapper
	name = "Quantum Spin Inverter"
	desc = "An experimental device that is able to swap the locations of two entities by switching their particles' spin values. Must be linked to another device to function."
	id = "swapper"
	build_type = PROTOLATHE
<<<<<<< HEAD
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000, /datum/material/bluespace = 2000, /datum/material/gold = 1500, /datum/material/silver = 1000)
=======
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT*5, /datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/bluespace =SHEET_MATERIAL_AMOUNT, /datum/material/gold =HALF_SHEET_MATERIAL_AMOUNT * 1.5, /datum/material/silver =HALF_SHEET_MATERIAL_AMOUNT)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	build_path = /obj/item/swapper
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_BLUESPACE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE
