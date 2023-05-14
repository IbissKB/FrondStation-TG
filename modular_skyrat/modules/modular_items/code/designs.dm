/*
* Designs
*/

/datum/design/health_hud_aviator
	name = "Medical HUD Aviators"
	desc = "A heads-up display that scans the humanoids in view and provides accurate data about their health status. This HUD has been fitted inside of a pair of sunglasses."
	id = "health_hud_aviator"
<<<<<<< HEAD
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/gold = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/aviator/health
	category = list(RND_CATEGORY_EQUIPMENT)
=======
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/gold = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/aviator/health
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/security_hud_aviator
	name = "Security HUD Aviators"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their ID status. This HUD has been fitted inside of a pair of sunglasses."
	id = "security_hud_aviator"
<<<<<<< HEAD
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/gold = 350, /datum/material/silver = 200,)
	build_path = /obj/item/clothing/glasses/hud/ar/aviator/security
	category = list(RND_CATEGORY_EQUIPMENT)
=======
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/gold = 350, /datum/material/silver = 200,)
	build_path = /obj/item/clothing/glasses/hud/ar/aviator/security
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/diagnostic_hud_aviator
	name = "Diagnostic HUD Aviators"
	desc = "A heads-up display used to analyze and determine faults within robotic machinery. This HUD has been fitted inside of a pair of sunglasses."
	id = "diagnostic_hud_aviator"
<<<<<<< HEAD
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/gold = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/aviator/diagnostic
	category = list(RND_CATEGORY_EQUIPMENT)
=======
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/gold = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/aviator/diagnostic
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/meson_hud_aviator
	name = "Meson HUD Aviators"
	desc = "A heads-up display used by engineering and mining staff to see basic structural and terrain layouts through walls, regardless of lighting condition. This HUD has been fitted inside of a pair of sunglasses."
	id = "meson_hud_aviator"
<<<<<<< HEAD
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/gold = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/aviator/meson
	category = list(RND_CATEGORY_EQUIPMENT)
=======
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/gold = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/aviator/meson
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/science_hud_aviator
	name = "Science Aviators"
	desc = "A pair of tacky purple aviator sunglasses that allow the wearer to recognize various chemical compounds with only a glance."
	id = "science_hud_aviator"
<<<<<<< HEAD
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/gold = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/aviator/science
	category = list(RND_CATEGORY_EQUIPMENT)
=======
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/gold = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/aviator/science
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/health_hud_projector
	name = "Retinal Projector Medical HUD"
	desc = "A headset equipped with a scanning lens and mounted retinal projector. It doesn't provide any eye protection, but it's less obtrusive than goggles."
	id = "health_hud_projector"
<<<<<<< HEAD
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/silver = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/projector/health
	category = list(RND_CATEGORY_EQUIPMENT)
=======
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/silver = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/projector/health
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/security_hud_projector
	name = "Retinal Projector Security HUD"
	desc = "A headset equipped with a scanning lens and mounted retinal projector. It doesn't provide any eye protection, but it's less obtrusive than goggles."
	id = "security_hud_projector"
<<<<<<< HEAD
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/silver = 350, /datum/material/silver = 200,)
	build_path = /obj/item/clothing/glasses/hud/ar/projector/security
	category = list(RND_CATEGORY_EQUIPMENT)
=======
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/silver = 350, /datum/material/silver = 200,)
	build_path = /obj/item/clothing/glasses/hud/ar/projector/security
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/diagnostic_hud_projector
	name = "Retinal Projector Diagnostic HUD"
	desc = "A headset equipped with a scanning lens and mounted retinal projector. It doesn't provide any eye protection, but it's less obtrusive than goggles."
	id = "diagnostic_hud_projector"
<<<<<<< HEAD
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/silver = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/projector/diagnostic
	category = list(RND_CATEGORY_EQUIPMENT)
=======
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/silver = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/projector/diagnostic
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/meson_hud_projector
	name = "Retinal Projector Meson HUD"
	desc = "A headset equipped with a scanning lens and mounted retinal projector. It doesn't provide any eye protection, but it's less obtrusive than goggles."
	id = "meson_hud_projector"
<<<<<<< HEAD
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/silver = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/projector/meson
	category = list(RND_CATEGORY_EQUIPMENT)
=======
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/silver = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/projector/meson
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	departmental_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/science_hud_projector
	name = "Science Retinal Projector"
	desc = "A headset equipped with a scanning lens and mounted retinal projector. It doesn't provide any eye protection, but it's less obtrusive than goggles."
	id = "science_hud_projector"
<<<<<<< HEAD
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/silver = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/projector/science
	category = list(RND_CATEGORY_EQUIPMENT)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE
=======
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 700, /datum/material/glass = 800, /datum/material/silver = 350)
	build_path = /obj/item/clothing/glasses/hud/ar/projector/science
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_MEDICAL
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
