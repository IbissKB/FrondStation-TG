<<<<<<< HEAD

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/organ/internal/ears/fox
	name = "fox ears"
	icon = 'icons/obj/clothing/head/costume.dmi'
	worn_icon = 'icons/mob/clothing/head/costume.dmi'
	icon_state = "kitty"
	visual = TRUE
	damage_multiplier = 2

//SKYRAT EDIT REMOVAL BEGIN - CUSTOMIZATION
/*
<<<<<<< HEAD
/obj/item/organ/internal/ears/fox/Insert(mob/living/carbon/human/ear_owner, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(ear_owner))
=======
/obj/item/organ/internal/ears/fox/on_insert(mob/living/carbon/human/ear_owner)
	. = ..()
	if(istype(ear_owner) && ear_owner.dna)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		color = ear_owner.hair_color
		ear_owner.dna.features["ears"] = ear_owner.dna.species.mutant_bodyparts["ears"] = "Fox"
		ear_owner.dna.update_uf_block(DNA_EARS_BLOCK)
		ear_owner.update_body()

<<<<<<< HEAD
/obj/item/organ/internal/ears/fox/Remove(mob/living/carbon/human/ear_owner,  special = 0)
	..()
	if(istype(ear_owner))
=======
/obj/item/organ/internal/ears/fox/on_remove(mob/living/carbon/human/ear_owner)
	. = ..()
	if(istype(ear_owner) && ear_owner.dna)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		color = ear_owner.hair_color
		ear_owner.dna.species.mutant_bodyparts -= "ears"
		ear_owner.update_body()
*/
//SKYRAT EDIT REMOVAL END
