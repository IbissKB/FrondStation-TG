
// see code/module/crafting/table.dm

////////////////////////////////////////////////CAKE////////////////////////////////////////////////

/datum/crafting_recipe/food/carrotcake
	name = "Carrot cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/carrot = 2
	)
	result = /obj/item/food/cake/carrot
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/cheesecake
	name = "Cheese cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/cheese/wedge = 2
	)
	result = /obj/item/food/cake/cheese
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/applecake
	name = "Apple cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/apple = 2
	)
	result = /obj/item/food/cake/apple
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/orangecake
	name = "Orange cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/citrus/orange = 2
	)
	result = /obj/item/food/cake/orange
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/limecake
	name = "Lime cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/citrus/lime = 2
	)
	result = /obj/item/food/cake/lime
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/lemoncake
	name = "Lemon cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/citrus/lemon = 2
	)
	result = /obj/item/food/cake/lemon
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/chocolatecake
	name = "Chocolate cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/chocolatebar = 2
	)
	result = /obj/item/food/cake/chocolate
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/birthdaycake
	name = "Birthday cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
<<<<<<< HEAD
		/obj/item/candle = 1,
=======
		/obj/item/flashlight/flare/candle = 1,
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		/datum/reagent/consumable/sugar = 5,
		/datum/reagent/consumable/caramel = 2
	)
	result = /obj/item/food/cake/birthday
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/energycake
	name = "Energy cake"
	reqs = list(
		/obj/item/food/cake/birthday = 1,
		/obj/item/melee/energy/sword = 1,
	)
	blacklist = list(/obj/item/food/cake/birthday/energy)
	result = /obj/item/food/cake/birthday/energy
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/braincake
	name = "Brain cake"
	reqs = list(
		/obj/item/organ/internal/brain = 1,
		/obj/item/food/cake/plain = 1
	)
	result = /obj/item/food/cake/brain
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/slimecake
	name = "Slime cake"
	reqs = list(
		/obj/item/slime_extract = 1,
		/obj/item/food/cake/plain = 1
	)
	result = /obj/item/food/cake/slimecake
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/pumpkinspicecake
	name = "Pumpkin spice cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/pumpkin = 2
	)
	result = /obj/item/food/cake/pumpkinspice
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/holycake
	name = "Angel food cake"
	reqs = list(
		/datum/reagent/water/holywater = 15,
		/obj/item/food/cake/plain = 1
	)
	result = /obj/item/food/cake/holy_cake
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/poundcake
	name = "Pound cake"
	reqs = list(
		/obj/item/food/cake/plain = 4
	)
	result = /obj/item/food/cake/pound_cake
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/hardwarecake
	name = "Hardware cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/circuitboard = 2,
		/datum/reagent/toxin/acid = 5
	)
	result = /obj/item/food/cake/hardware_cake
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/bscccake
	name = "blackberry and strawberry chocolate cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/chocolatebar = 2,
		/obj/item/food/grown/berries = 5
	)
	result = /obj/item/food/cake/bscc
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/pavlovacream
	name = "Pavlova with cream"
	reqs = list(
		/datum/reagent/consumable/eggwhite = 12,
		/datum/reagent/consumable/sugar = 15,
		/datum/reagent/consumable/whipped_cream = 10,
		/obj/item/food/grown/berries = 5
	)
	result = /obj/item/food/cake/pavlova
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/pavlovakorta
	name = "Pavlova with korta cream"
	reqs = list(
		/datum/reagent/consumable/eggwhite = 12,
		/datum/reagent/consumable/sugar = 15,
		/datum/reagent/consumable/korta_milk = 10,
		/obj/item/food/grown/berries = 5
	)
	result = /obj/item/food/cake/pavlova/nuts
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/bscvcake
	name = "blackberry and strawberry vanilla cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/berries = 5
	)
	result = /obj/item/food/cake/bsvc
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/clowncake
	name = "clown cake"
	always_available = FALSE
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/sundae = 2,
		/obj/item/food/grown/banana = 5
	)
	result = /obj/item/food/cake/clown_cake
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/vanillacake
	name = "vanilla cake"
	always_available = FALSE
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/vanillapod = 2
	)
	result = /obj/item/food/cake/vanilla_cake
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/trumpetcake
	name = "Spaceman's Cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/trumpet = 2,
		/datum/reagent/consumable/cream = 5,
		/datum/reagent/consumable/berryjuice = 5
	)
	result = /obj/item/food/cake/trumpet
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7


/datum/crafting_recipe/food/cak
	name = "Living cat/cake hybrid"
	reqs = list(
		/obj/item/organ/internal/brain = 1,
		/obj/item/organ/internal/heart = 1,
		/obj/item/food/cake/birthday = 1,
		/obj/item/food/meat/slab = 3,
		/datum/reagent/blood = 30,
		/datum/reagent/consumable/sprinkles = 5,
		/datum/reagent/teslium = 1 //To shock the whole thing into life
	)
	result = /mob/living/simple_animal/pet/cat/cak
<<<<<<< HEAD
	subcategory = CAT_CAKE //Cat! Haha, get it? CAT? GET IT? We get it - Love Felines
=======
	category = CAT_CAKE //Cat! Haha, get it? CAT? GET IT? We get it - Love Felines
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/fruitcake
	name = "english fruitcake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/no_raisin = 1,
		/obj/item/food/grown/cherries = 1,
		/datum/reagent/consumable/ethanol/rum = 5
	)
	result = /obj/item/food/cake/fruit
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/food/plumcake
	name = "Plum cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/plum = 2
	)
	result = /obj/item/food/cake/plum
<<<<<<< HEAD
	subcategory = CAT_CAKE
=======
	category = CAT_CAKE

/datum/crafting_recipe/food/weddingcake
	name = "Wedding cake"
	reqs = list(
		/obj/item/food/cake/plain = 4,
		/datum/reagent/consumable/sugar = 120,
	)
	result = /obj/item/food/cake/wedding
	category = CAT_CAKE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
