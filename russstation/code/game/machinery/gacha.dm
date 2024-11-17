/obj/machinery/gacha
	name = "Gacha machine"
	desc = "The capsules seem oddly translucent... Perhaps it's best to find a different machine."
	icon = 'russstation/icons/obj/machines/gacha_machine.dmi'
	icon_state = "gacha_machine"
	base_icon_state = "gacha_machine"
	layer = BELOW_OBJ_LAYER // So dispensed capsules don't end up underneath the machine
	density = TRUE

	// Health/armor is set up similar to that of a vending machine
	max_integrity = 300
	integrity_failure = 0.33
	armor_type = /datum/armor/machinery_vending

	light_power = 1
	light_range = MINIMUM_USEFUL_LIGHT_RANGE
	can_atmos_pass = ATMOS_PASS_NO

	var/list/prize_pool = list()
	var/obj/item/coin/stuck_coin = null
	var/stuck_coin_chance = 5
	var/stuck_coin_eject_chance = 25

/obj/machinery/gacha/attackby(obj/item/weapon, mob/living/user, params)
	. = ..()
	spit_out_stuck_coin(user, (machine_stat & BROKEN))

/obj/machinery/gacha/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	..()

	// Gacha machines take coins rather than credits to give coins a purpose.
	// One coin = one capsule regardless of the coin's type for now.
	if (!istype(tool, /obj/item/coin))
		return NONE

	// Broken machines can't dispense capsules
	if (machine_stat & BROKEN)
		to_chat(user, span_notice("The machine is broken."))
		return ITEM_INTERACT_BLOCKING

	// Machines with a coin stuck in them should be bonked a few times first
	if (stuck_coin)
		to_chat(user, span_notice("The coin slot seems to be blocked..."))
		return ITEM_INTERACT_BLOCKING

	// There's a chance the coin gets stuck inside the machine
	if(rand(1, 100) <= stuck_coin_chance)
		var/mob/owner = tool.loc
		owner.transferItemToLoc(tool, src, TRUE)
		stuck_coin = tool
		to_chat(user, span_notice("The machine takes [tool] and... it gets stuck!"))
		return ITEM_INTERACT_SUCCESS

	qdel(tool)
	dispense_gacha_capsule(user)
	return ITEM_INTERACT_SUCCESS

/obj/machinery/gacha/examine_more(mob/user)
	. = ..()

	if (stuck_coin)
		. += span_notice("Upon closer inspection... there seems to be a coin stuck inside the machine!")

/obj/machinery/gacha/proc/dispense_gacha_capsule(mob/living/user)
	var/obj/item/gacha_capsule/gacha_capsule = new /obj/item/gacha_capsule(get_turf(src))
	gacha_capsule.prize = pick_weight(fill_with_ones(src.prize_pool))
	balloon_alert(user, "ka-chunk!")
	playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
	visible_message(span_notice("[src] dispenses [gacha_capsule]!"), span_notice("You hear a chime and a clunk."))

/obj/machinery/gacha/proc/spit_out_stuck_coin(mob/living/user, force = FALSE)
	if (!stuck_coin)
		return

	if (!force && rand(1, 100) > stuck_coin_eject_chance)
		return

	stuck_coin.forceMove(get_turf(src))
	balloon_alert(user, "clink-clink-thunk!")
	playsound(src, 'sound/machines/coindrop.ogg', 50, TRUE, extrarange = -3)
	to_chat(user, span_notice("The machine spits out [stuck_coin] that was stuck."))
	stuck_coin = null

// Plushies!
/obj/machinery/gacha/plush
	name = "Plushie gacha machine"
	desc = "The next capsule will contain that plushie you've always wanted, guaranteed!"

	prize_pool = list(
		/obj/item/toy/plush/carpplushie,
		/obj/item/toy/plush/bubbleplush,
		/obj/item/toy/plush/ratplush,
		/obj/item/toy/plush/narplush,
		/obj/item/toy/plush/lizard_plushie,
		/obj/item/toy/plush/snakeplushie,
		/obj/item/toy/plush/nukeplushie,
		/obj/item/toy/plush/plasmamanplushie,
		/obj/item/toy/plush/slimeplushie,
		/obj/item/toy/plush/awakenedplushie,
		/obj/item/toy/plush/whiny_plushie,
		/obj/item/toy/plush/beeplushie,
		/obj/item/toy/plush/goatplushie,
		/obj/item/toy/plush/moth,
		/obj/item/toy/plush/pkplush,
		/obj/item/toy/plush/rouny,
		/obj/item/toy/plush/abductor,
		/obj/item/toy/plush/abductor/agent,
		/obj/item/toy/plush/shark,
		/obj/item/toy/plush/donkpocket,
		/obj/item/toy/plush/ducky
	)

/obj/machinery/gacha/update_appearance(updates=ALL)
	. = ..()

	set_light((!(machine_stat & BROKEN) && powered()) ? MINIMUM_USEFUL_LIGHT_RANGE : 0)

/obj/machinery/gacha/update_icon_state()
	icon_state = "[base_icon_state]"
	if(machine_stat & BROKEN)
		icon_state += "_broken"
	return ..()

/obj/machinery/gacha/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	switch(damage_type)
		if(BRUTE)
			playsound(src.loc, 'sound/effects/glass/glasshit.ogg', 75, TRUE)
		if(BURN)
			playsound(src.loc, 'sound/items/tools/welder.ogg', 100, TRUE)

/obj/machinery/gacha/atom_break(damage_flag)
	playsound(src, SFX_SHATTER, 50, TRUE)
	return ..()
