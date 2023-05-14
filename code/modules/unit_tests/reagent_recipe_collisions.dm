<<<<<<< HEAD


=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/datum/unit_test/reagent_recipe_collisions

/datum/unit_test/reagent_recipe_collisions/Run()
	build_chemical_reactions_lists()
<<<<<<< HEAD
	var/list/reactions = list()
	for(var/V in GLOB.chemical_reactions_list_reactant_index)
		reactions += GLOB.chemical_reactions_list_reactant_index[V]
	for(var/i in 1 to (reactions.len-1))
		for(var/i2 in (i+1) to reactions.len)
			var/datum/chemical_reaction/r1 = reactions[i]
			var/datum/chemical_reaction/r2 = reactions[i2]
			if(chem_recipes_do_conflict(r1, r2))
				TEST_FAIL("Chemical recipe conflict between [r1.type] and [r2.type]")
=======

	// Exclude soup from this test, they all have the same "reagents" just about
	var/list/reactions_sans_soup = GLOB.chemical_reactions_list - subtypesof(/datum/chemical_reaction/food/soup)

	for(var/reaction_type_a as anything in reactions_sans_soup)
		for(var/reaction_type_b as anything in reactions_sans_soup)
			if(reaction_type_a == reaction_type_b)
				continue
			var/datum/chemical_reaction/reaction_a = reactions_sans_soup[reaction_type_a]
			var/datum/chemical_reaction/reaction_b = reactions_sans_soup[reaction_type_b]
			if(chem_recipes_do_conflict(reaction_a, reaction_b))
				TEST_FAIL("Chemical recipe conflict between [reaction_type_a] and [reaction_type_b]")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
