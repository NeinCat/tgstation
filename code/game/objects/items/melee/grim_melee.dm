// CHAINSWORD FOR TEH EMPERHA!!!

/datum/action/item_action/startchainsword
	name = "Activate Chainsword"

/obj/item/melee/grim
	name = "grim future melee"
	desc = "grim future melee"
	lefthand_file = 'icons/mob/inhands/weapons/grimmelee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/grimmelee_righthand.dmi'
	icon = 'icons/obj/grim_melee.dmi'

/obj/item/melee/grim/csword
	name = "chainsword"
	desc = "A Chainsword is a common form of chain weapon, essentially a sword with motorized teeth that run along the blade like those of a chainsaw."
	icon_state = "csword_off"
	force = 10
	var/force_on = 25
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BELT
	throwforce = 13
	throw_speed = 2
	throw_range = 4
	custom_materials = list(/datum/material/iron=13000)
	attack_verb = list("torn", "cut", "chainsawed", "diced")
	hitsound = "swing_hit"
	sharpness = IS_SHARP
	actions_types = list(/datum/action/item_action/startchainsword)
	tool_behaviour = TOOL_SAW
	toolspeed = 0.5
	var/on = FALSE


/obj/item/melee/grim/csword/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 30, 100, 0, 'sound/weapons/chainsawhit.ogg', TRUE)


/obj/item/melee/grim/csword/suicide_act(mob/living/carbon/user)
	if(on)
		user.visible_message("<span class='suicide'>[user] begins to tear [user.p_their()] head off with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
		playsound(src, 'sound/weapons/chainsawhit.ogg', 100, TRUE)
		var/obj/item/bodypart/head/myhead = user.get_bodypart(BODY_ZONE_HEAD)
		if(myhead)
			myhead.dismember()
	else
		user.visible_message("<span class='suicide'>[user] smashes [src] into [user.p_their()] neck, destroying [user.p_their()] esophagus! It looks like [user.p_theyre()] trying to commit suicide!</span>")
		playsound(src, 'sound/weapons/genhit1.ogg', 100, TRUE)
	return(BRUTELOSS)

/obj/item/melee/grim/csword/attack_self(mob/user)
	on = !on
	to_chat(user, "As you pull the starting cord dangling from [src], [on ? "it begins to whirr." : "the chain stops moving."]")
	force = on ? force_on : initial(force)
	throwforce = on ? force_on : initial(force)
	icon_state = "csword_[on ? "on" : "off"]"
	var/datum/component/butchering/butchering = src.GetComponent(/datum/component/butchering)
	butchering.butchering_enabled = on

	if(on)
		hitsound = 'sound/weapons/chainsawhit.ogg'
	else
		hitsound = "swing_hit"

	if(src == user.get_active_held_item()) //update inhands
		user.update_inv_hands()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/melee/grim/csword/knight
	name = "order chainsword"
	desc = "A Order Chainsword is the glorious weapon of the guardian knights."
	icon_state = "knightcsword_off"
	force = 10
	force_on = 35
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BELT
	throwforce = 13
	throw_speed = 2
	throw_range = 4
	custom_materials = list(/datum/material/iron=13000)
	attack_verb = list("torn", "cut", "chainsawed", "diced")
	hitsound = "swing_hit"
	sharpness = IS_SHARP
	actions_types = list(/datum/action/item_action/startchainsword)
	tool_behaviour = TOOL_SAW
	toolspeed = 0.5
	on = FALSE


/obj/item/melee/grim/csword/knight/attack_self(mob/user)
	on = !on
	to_chat(user, "As you pull the starting cord dangling from [src], [on ? "it begins to whirr." : "the chain stops moving."]")
	force = on ? force_on : initial(force)
	throwforce = on ? force_on : initial(force)
	icon_state = "knightcsword_[on ? "on" : "off"]"
	var/datum/component/butchering/butchering = src.GetComponent(/datum/component/butchering)
	butchering.butchering_enabled = on

	if(on)
		hitsound = 'sound/weapons/chainsawhit.ogg'
	else
		hitsound = "swing_hit"

	if(src == user.get_active_held_item()) //update inhands
		user.update_inv_hands()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/melee/grim/csword/grandmaster
	name = "grandmaster chainsword"
	desc = "A Grandmaster Chainsword saw a lot of blood."
	icon_state = "grandcsword_off"
	force = 10
	force_on = 35
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BELT
	throwforce = 13
	throw_speed = 2
	throw_range = 4
	custom_materials = list(/datum/material/iron=13000)
	attack_verb = list("torn", "cut", "chainsawed", "diced")
	hitsound = "swing_hit"
	sharpness = IS_SHARP
	actions_types = list(/datum/action/item_action/startchainsword)
	tool_behaviour = TOOL_SAW
	toolspeed = 0.5
	on = FALSE


/obj/item/melee/grim/csword/grandmaster/attack_self(mob/user)
	on = !on
	to_chat(user, "As you pull the starting cord dangling from [src], [on ? "it begins to whirr." : "the chain stops moving."]")
	force = on ? force_on : initial(force)
	throwforce = on ? force_on : initial(force)
	icon_state = "grandcsword_[on ? "on" : "off"]"
	var/datum/component/butchering/butchering = src.GetComponent(/datum/component/butchering)
	butchering.butchering_enabled = on

	if(on)
		hitsound = 'sound/weapons/chainsawhit.ogg'
	else
		hitsound = "swing_hit"

	if(src == user.get_active_held_item()) //update inhands
		user.update_inv_hands()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()


// PSYCHIC WEAPON

/obj/item/melee/grim/psword
	icon_state = "psword_off"
	name = "force sword"
	desc = "Force weapons are advanced, psychically-attuned close combat weapons."
	armour_penetration = 0
	var/armour_penetration_on = 50
	block_chance = 0
	var/block_chance_on = 30
	force = 15
	throwforce = 15
	var/force_on = 40
	var/throwforce_on = 40
	throw_speed = 4
	sharpness = IS_SHARP
	attack_verb = list("cut", "sliced", "diced")
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	hitsound = 'sound/weapons/bladeslice.ogg'
	var/on = FALSE


/obj/item/melee/grim/psword/attack_self(mob/user)
	on = !on
	to_chat(user, "As you pull the starting cord dangling from [src], [on ? "it begins to whirr." : "the chain stops moving."]")
	force = on ? force_on : initial(force)
	throwforce = on ? force_on : initial(force)
	armour_penetration = on ? armour_penetration_on : initial(armour_penetration)
	block_chance = on ? block_chance_on : initial(block_chance)
	icon_state = "psword_[on ? "on" : "off"]"

	if(src == user.get_active_held_item()) //update inhands
		user.update_inv_hands()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()