/datum/design/cybernetic_tongue
	name = "Cybernetic Tongue"
	desc = "A cybernetic tongue."
	id = "cybernetic_tongue"
	build_type = PROTOLATHE | AWAY_LATHE | MECHFAB
	construction_time = 4 SECONDS
	materials = list(/datum/material/iron = 250, /datum/material/glass = 300, /datum/material/silver = 250)
	build_path = /obj/item/organ/internal/tongue/cybernetic
	category = list(
<<<<<<< HEAD
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS
=======
		RND_CATEGORY_CYBERNETICS + RND_SUBCATEGORY_CYBERNETICS_ORGANS_1
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL
