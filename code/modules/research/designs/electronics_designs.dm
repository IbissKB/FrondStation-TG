
///////////////////////////////////
/////Non-Board Computer Stuff//////
///////////////////////////////////

/datum/design/intellicard
	name = "Intellicard AI Transportation System"
	desc = "Allows for the construction of an intellicard."
	id = "intellicard"
	build_type = PROTOLATHE | AWAY_LATHE
<<<<<<< HEAD
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 200)
	build_path = /obj/item/aicard
	category = list(RND_CATEGORY_AI)
=======
	materials = list(/datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/gold =SMALL_MATERIAL_AMOUNT * 2)
	build_path = /obj/item/aicard
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_MISC
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/paicard
	name = "Personal Artificial Intelligence Card"
	desc = "Allows for the construction of a pAI Card."
	id = "paicard"
	build_type = PROTOLATHE | AWAY_LATHE
<<<<<<< HEAD
	materials = list(/datum/material/glass = 500, /datum/material/iron = 500)
	build_path = /obj/item/pai_card
	category = list(RND_CATEGORY_AI)
=======
	materials = list(/datum/material/glass =SMALL_MATERIAL_AMOUNT*5, /datum/material/iron =SMALL_MATERIAL_AMOUNT*5)
	build_path = /obj/item/pai_card
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_MISC
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SERVICE

/datum/design/ai_cam_upgrade
	name = "AI Surveillance Software Update"
	desc = "A software package that will allow an artificial intelligence to 'hear' from its cameras via lip reading."
	id = "ai_cam_upgrade"
	build_type = PROTOLATHE | AWAY_LATHE
<<<<<<< HEAD
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 5000, /datum/material/gold = 15000, /datum/material/silver = 15000, /datum/material/diamond = 20000, /datum/material/plasma = 10000)
	build_path = /obj/item/surveillance_upgrade
	category = list(RND_CATEGORY_AI)
=======
	materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/glass =SHEET_MATERIAL_AMOUNT * 2.5, /datum/material/gold = 15000, /datum/material/silver = 15000, /datum/material/diamond = 20000, /datum/material/plasma = 10000)
	build_path = /obj/item/surveillance_upgrade
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_UPGRADES
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

////////////////////////////////////////
//////////Disk Construction Disks///////
////////////////////////////////////////
<<<<<<< HEAD
/datum/design/design_disk
	name = "Design Storage Disk"
	desc = "Produce additional disks for storing device designs."
	id = "design_disk"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100)
	build_path = /obj/item/disk/design_disk
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/design_disk_adv
	name = "Advanced Design Storage Disk"
	desc = "Produce additional disks for storing device designs."
	id = "design_disk_adv"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100, /datum/material/silver=50)
	build_path = /obj/item/disk/design_disk/adv
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/datum/design/tech_disk
	name = "Technology Data Storage Disk"
	desc = "Produce additional disks for storing technology data."
	id = "tech_disk"
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
<<<<<<< HEAD
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100)
=======
	materials = list(/datum/material/iron =SMALL_MATERIAL_AMOUNT * 3, /datum/material/glass =SMALL_MATERIAL_AMOUNT)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	build_path = /obj/item/disk/tech_disk
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE
