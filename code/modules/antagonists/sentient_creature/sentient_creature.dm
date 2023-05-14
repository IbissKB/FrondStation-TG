/datum/antagonist/sentient_creature
	name = "\improper Sentient Creature"
	show_in_antagpanel = FALSE
	show_in_roundend = FALSE
	count_against_dynamic_roll_chance = FALSE
	ui_name = "AntagInfoSentient"

/datum/antagonist/sentient_creature/get_preview_icon()
	var/icon/final_icon = icon('icons/mob/simple/pets.dmi', "corgi")

<<<<<<< HEAD
	var/icon/broodmother = icon('icons/mob/simple/lavaland/lavaland_elites.dmi', "broodmother")
	broodmother.Blend(rgb(128, 128, 128, 128), ICON_MULTIPLY)
	final_icon.Blend(broodmother, ICON_UNDERLAY, -world.icon_size / 4, 0)
=======
	var/icon/pandora = icon('icons/mob/simple/lavaland/lavaland_elites.dmi', "pandora")
	pandora.Blend(rgb(128, 128, 128, 128), ICON_MULTIPLY)
	final_icon.Blend(pandora, ICON_UNDERLAY, -world.icon_size / 4, 0)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	var/icon/rat = icon('icons/mob/simple/animal.dmi', "regalrat")
	rat.Blend(rgb(128, 128, 128, 128), ICON_MULTIPLY)
	final_icon.Blend(rat, ICON_UNDERLAY, world.icon_size / 4, 0)

	final_icon.Scale(ANTAGONIST_PREVIEW_ICON_SIZE, ANTAGONIST_PREVIEW_ICON_SIZE)
	return final_icon

/datum/antagonist/sentient_creature/on_gain()
<<<<<<< HEAD
	if(owner.enslaved_to)
		owner.current.copy_languages(owner.enslaved_to, LANGUAGE_MASTER)
=======
	var/mob/living/master = owner.enslaved_to?.resolve()
	if(master)
		owner.current.copy_languages(master, LANGUAGE_MASTER)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		owner.current.update_atom_languages()
	. = ..()

/datum/antagonist/sentient_creature/ui_static_data(mob/user)
	var/list/data = list()
<<<<<<< HEAD
	if(owner.enslaved_to)
		data["enslaved_to"] = owner.enslaved_to.real_name
		data["p_them"] = owner.enslaved_to.p_them()
		data["p_their"] = owner.enslaved_to.p_their()
	data["holographic"] = owner.current.flags_1 & HOLOGRAM_1
	return data


=======
	var/mob/living/master = owner.enslaved_to?.resolve()
	if(master)
		data["enslaved_to"] = master.real_name
		data["p_them"] = master.p_them()
		data["p_their"] = master.p_their()
	data["holographic"] = owner.current.flags_1 & HOLOGRAM_1
	return data
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
