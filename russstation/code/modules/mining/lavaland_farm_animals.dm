/mob/living/basic/cow/lavaland
	name = "\improper lavaland cow"
	desc = "Milk em or tip em. We don't judge here."
	color = "#CC9900"
	mob_biotypes = MOB_BEAST
	habitable_atmos = null
	butcher_results = list(
		/obj/item/food/meat/slab = 6,
		/obj/item/stack/sheet/animalhide/generic = 8,
		/obj/item/organ/heart = 1,
		/obj/item/organ/brain = 1,
		/obj/item/organ/lungs = 1,
		/obj/item/organ/liver = 1,
		/obj/item/organ/eyes = 1,
		/obj/item/stack/sheet/bone = 15,
	)
	minimum_survivable_temperature = 255
	maximum_survivable_temperature = 360

/mob/living/basic/chicken/lavaland
	name = "\improper lavaland chicken"
	desc = "Hopefully the eggs are good this season. Looks like you could feed it anything edible."
	color = "#444444"
	mob_biotypes = MOB_BEAST
	butcher_results = list(
		/obj/item/food/meat/slab/chicken = 2,
		/obj/item/stack/sheet/animalhide/generic = 2,
		/obj/item/organ/heart = 1,
		/obj/item/organ/eyes = 1,
		/obj/item/stack/sheet/bone = 2,
		/obj/item/food/egg/lavaegg = 1
	)
	habitable_atmos = null
	minimum_survivable_temperature = 255
	maximum_survivable_temperature = 360

/mob/living/basic/chicken/lavaland/Initialize(mapload)
	. = ..()
	GLOB.chicken_count++
	AddElement(/datum/element/animal_variety, "chicken", pick("brown","black","white"), TRUE)
	AddComponent(/datum/component/egg_layer,\
		/obj/item/food/egg/lavaegg,\
		list(/obj/item/food),\
		feed_messages = list("She clucks happily."),\
		lay_messages = EGG_LAYING_MESSAGES,\
		eggs_left = 0,\
		eggs_added_from_eating = rand(1, 4),\
		max_eggs_held = 8,\
		egg_laid_callback = CALLBACK(src, .proc/egg_laid)\
	)
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)

/mob/living/basic/chick/lavaland
	name = "\improper lavaland chick"
	desc = "Looks like a walking puddle of water, but loud."
	color = "#992121"
	butcher_results = list(
		/obj/item/food/meat/slab/chicken = 1,
		/obj/item/stack/sheet/bone = 1,
	)
	habitable_atmos = null
	minimum_survivable_temperature = 255
	maximum_survivable_temperature = 360
	grow_as = /mob/living/basic/chicken/lavaland
