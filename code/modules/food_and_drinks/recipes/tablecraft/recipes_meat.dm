// see code/module/crafting/table.dm

////////////////////////////////////////////////KEBABS////////////////////////////////////////////////

/datum/crafting_recipe/food/humankebab
	name = "Human kebab"
	reqs = list(
		/obj/item/stack/rods = 1,
		/obj/item/food/meat/steak/plain/human = 2
	)
	result = /obj/item/food/kebab/human
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/kebab
	name = "Kebab"
	reqs = list(
		/obj/item/stack/rods = 1,
		/obj/item/food/meat/steak = 2
	)
	result = /obj/item/food/kebab/monkey
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/tofukebab
	name = "Tofu kebab"
	reqs = list(
		/obj/item/stack/rods = 1,
		/obj/item/food/tofu = 2
	)
	result = /obj/item/food/kebab/tofu
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/tailkebab
	name = "Lizard tail kebab"
	reqs = list(
		/obj/item/stack/rods = 1,
		/obj/item/organ/external/tail/lizard = 1
	)
	result = /obj/item/food/kebab/tail
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/fiestaskewer
	name = "Fiesta Skewer"
	reqs = list(
		/obj/item/stack/rods = 1,
		/obj/item/food/grown/chili = 1,
		/obj/item/food/meat/cutlet = 1,
		/obj/item/food/grown/corn = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/kebab/fiesta
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

////////////////////////////////////////////////MR SPIDER////////////////////////////////////////////////

/datum/crafting_recipe/food/spidereggsham
	name = "Spider eggs ham"
	reqs = list(
		/datum/reagent/consumable/salt = 1,
		/obj/item/food/spidereggs = 1,
		/obj/item/food/meat/cutlet/spider = 2
	)
	result = /obj/item/food/spidereggsham
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

////////////////////////////////////////////////MISC RECIPE's////////////////////////////////////////////////

/datum/crafting_recipe/food/tempehstarter
	name = "Tempeh starter"
	reqs = list(
		/obj/item/food/grown/soybeans = 5,
		/obj/item/seeds/plump = 1
	)
	result = /obj/item/food/tempehstarter
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/cornedbeef
	name = "Corned beef"
	reqs = list(
		/datum/reagent/consumable/salt = 5,
		/obj/item/food/meat/steak = 1,
		/obj/item/food/grown/cabbage = 2
	)
	result = /obj/item/food/cornedbeef
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/bearsteak
	name = "Filet migrawr"
	reqs = list(
		/datum/reagent/consumable/ethanol/manly_dorf = 5,
		/obj/item/food/meat/steak/bear = 1,
	)
	tool_paths = list(/obj/item/lighter)
	result = /obj/item/food/bearsteak
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/stewedsoymeat
	name = "Stewed soymeat"
	reqs = list(
		/obj/item/food/soydope = 2,
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/stewedsoymeat
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/sausage
	name = "Raw sausage"
	reqs = list(
		/obj/item/food/raw_meatball = 1,
		/obj/item/food/meat/rawcutlet = 2
	)
	result = /obj/item/food/raw_sausage
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/nugget
	name = "Chicken nugget"
	reqs = list(
		/obj/item/food/meat/cutlet = 1
	)
	result = /obj/item/food/nugget
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/rawkhinkali
	name = "Raw Khinkali"
	reqs = list(
		/obj/item/food/doughslice = 1,
		/obj/item/food/grown/garlic = 1,
		/obj/item/food/meatball = 1
	)
	result = /obj/item/food/rawkhinkali
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/meatbun
	name = "Meat bun"
	reqs = list(
		/datum/reagent/consumable/soysauce = 5,
		/obj/item/food/bun = 1,
		/obj/item/food/meatball = 1,
		/obj/item/food/grown/cabbage = 1
	)
	result = /obj/item/food/meatbun
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/pigblanket
	name = "Pig in a Blanket"
	reqs = list(
		/obj/item/food/bun = 1,
		/obj/item/food/butter = 1,
		/obj/item/food/meat/cutlet = 1
	)
	result = /obj/item/food/pigblanket
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/ratkebab
	name = "Rat Kebab"
	reqs = list(
		/obj/item/stack/rods = 1,
		/obj/item/food/deadmouse = 1
	)
	result = /obj/item/food/kebab/rat
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/doubleratkebab
	name = "Double Rat Kebab"
	reqs = list(
		/obj/item/stack/rods = 1,
		/obj/item/food/deadmouse = 2
	)
	result = /obj/item/food/kebab/rat/double
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/ricepork
	name = "Rice and Pork"
	reqs = list(
		/obj/item/reagent_containers/cup/bowl = 1,
		/obj/item/food/boiledrice = 1,
		/obj/item/food/meat/cutlet = 2
	)
	result = /obj/item/food/salad/ricepork
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/ribs
	name = "BBQ Ribs"
	reqs = list(
		/datum/reagent/consumable/bbqsauce = 5,
<<<<<<< HEAD
		/obj/item/food/meat/steak/plain = 2,
		/obj/item/stack/rods = 2
	)
	result = /obj/item/food/bbqribs
	subcategory = CAT_MEAT
=======
		/obj/item/food/meat/steak = 2,
		/obj/item/stack/rods = 2
	)
	result = /obj/item/food/bbqribs
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/meatclown
	name = "Meat Clown"
	reqs = list(
<<<<<<< HEAD
		/obj/item/food/meat/steak/plain = 1,
		/obj/item/food/grown/banana = 1
	)
	result = /obj/item/food/meatclown
	subcategory = CAT_MEAT
=======
		/obj/item/food/meat/steak = 1,
		/obj/item/food/grown/banana = 1
	)
	result = /obj/item/food/meatclown
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/lasagna
	name = "Lasagna"
	reqs = list(
		/obj/item/food/meat/cutlet = 2,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/cheese/wedge = 2,
		/obj/item/food/spaghetti/raw = 1
	)
	result = /obj/item/food/lasagna
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/gumbo
	name = "Black eyed gumbo"
	reqs = list(
		/obj/item/reagent_containers/cup/bowl = 1,
		/obj/item/food/boiledrice = 1,
		/obj/item/food/grown/peas = 1,
		/obj/item/food/grown/chili = 1,
		/obj/item/food/meat/cutlet = 1
	)
	result = /obj/item/food/salad/gumbo
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7


/datum/crafting_recipe/food/fried_chicken
	name = "Fried Chicken"
	reqs = list(
		/obj/item/food/meat/slab/chicken = 1,
		/datum/reagent/consumable/flour = 5,
		/datum/reagent/consumable/corn_starch = 5,
	)
	result = /obj/item/food/fried_chicken
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/beef_stroganoff
	name = "Beef Stroganoff"
	reqs = list(
		/datum/reagent/consumable/flour = 5,
		/datum/reagent/consumable/milk = 5,
<<<<<<< HEAD
		/datum/reagent/consumable/salt = 5,
		/datum/reagent/consumable/blackpepper = 5,
=======
		/datum/reagent/consumable/salt = 2,
		/datum/reagent/consumable/blackpepper = 2,
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		/obj/item/food/grown/mushroom = 2,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/meat/steak = 1,
	)
	result = /obj/item/food/beef_stroganoff
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/beef_wellington
	name = "Beef Wellington"
	reqs = list(
		/obj/item/food/meat/steak = 1,
		/obj/item/food/grown/mushroom = 1,
		/obj/item/food/grown/garlic = 1,
		/obj/item/food/meat/bacon = 1,
		/obj/item/food/flatdough = 1,
		/datum/reagent/consumable/cream = 5,
		/datum/reagent/consumable/salt = 2,
		/datum/reagent/consumable/blackpepper = 2
	)
	result = /obj/item/food/beef_wellington
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/full_english
	name = "Full English Breakfast"
	reqs = list(
		/obj/item/food/sausage = 1,
		/obj/item/food/friedegg = 2,
		/obj/item/food/meat/bacon = 1,
		/obj/item/food/grown/mushroom = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/canned/beans = 1,
		/obj/item/food/butteredtoast = 1
	)
	result = /obj/item/food/full_english
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/envirochow
	name = "Envirochow"
	reqs = list(
		/obj/item/food/meat/slab/corgi = 2,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	result = /obj/item/food/canned/envirochow
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/meatloaf
	name = "Meatloaf"
	reqs = list(
<<<<<<< HEAD
		/obj/item/food/meat/slab = 3,
=======
		/obj/item/food/meat/slab = 2,
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		/obj/item/food/grown/onion = 1,
		/obj/item/food/grown/garlic = 1,
		/datum/reagent/consumable/ketchup = 10,
	)
	result = /obj/item/food/raw_meatloaf
<<<<<<< HEAD
	subcategory = CAT_MEAT
=======
	category = CAT_MEAT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
