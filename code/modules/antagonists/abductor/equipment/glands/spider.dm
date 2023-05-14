/obj/item/organ/internal/heart/gland/spiderman
	abductor_hint = "araneae cloister accelerator. The abductee occasionally exhales spider pheromones and will spawn spiderlings."
	cooldown_low = 450
	cooldown_high = 900
	uses = -1
	icon_state = "spider"
	mind_control_uses = 2
	mind_control_duration = 2400

/obj/item/organ/internal/heart/gland/spiderman/activate()
	to_chat(owner, span_warning("You feel something crawling in your skin."))
<<<<<<< HEAD
	owner.faction |= "spiders"
	var/obj/structure/spider/spiderling/S = new(owner.drop_location())
=======
	owner.faction |= FACTION_SPIDER
	var/mob/living/basic/spiderling/S = new(owner.drop_location())
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	S.directive = "Protect your nest inside [owner.real_name]."
