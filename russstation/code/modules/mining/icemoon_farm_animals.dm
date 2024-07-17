/mob/living/basic/cow/icemoon
	name = "\improper icemoon cow"
	desc = "A very rare species of cow, breed by mountain Dwarf's to withstand harsh winters."
	color = "#0087bd"
	mob_biotypes = MOB_BEAST
	habitable_atmos = null
	butcher_results = list(
		/obj/item/food/meat/slab = 6,
		/obj/item/stack/sheet/animalhide/generic = 8,
		/obj/item/organ/internal/heart = 1,
		/obj/item/organ/internal/brain = 1,
		/obj/item/organ/internal/lungs = 1,
		/obj/item/organ/internal/liver = 1,
		/obj/item/organ/internal/eyes = 1,
		/obj/item/stack/sheet/bone = 15,
	)
	minimum_survivable_temperature = 150
	maximum_survivable_temperature = 280

/mob/living/basic/chicken/icemoon
	name = "\improper icemoon chicken"
	desc = "They know when its morning even when buried under 30 meters of snow. This chicken will eat anything that is edible."
	color = "#003f72"
	mob_biotypes = MOB_BEAST
	butcher_results = list(
		/obj/item/food/meat/slab/chicken = 2,
		/obj/item/stack/sheet/animalhide/generic = 2,
		/obj/item/organ/internal/heart = 1,
		/obj/item/organ/internal/eyes = 1,
		/obj/item/stack/sheet/bone = 2,
		/obj/item/food/egg/iceegg = 1
	)
	habitable_atmos = null
	minimum_survivable_temperature = 150
	maximum_survivable_temperature = 280

/mob/living/basic/chicken/icemoon/Initialize(mapload)
	. = ..()
	GLOB.chicken_count++

	AddElement(/datum/element/animal_variety, "chicken", pick("brown","black","white"), TRUE)
	AddComponent(/datum/component/egg_layer,\
		/obj/item/food/egg/iceegg,\
		list(/obj/item/food),\
		feed_messages = list("She clucks happily."),\
		lay_messages = EGG_LAYING_MESSAGES,\
		eggs_left = 0,\
		eggs_added_from_eating = rand(1, 4),\
		max_eggs_held = 8,\
		egg_laid_callback = CALLBACK(src, .proc/egg_laid)\
	)
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)

/mob/living/basic/chick/icemoon
	name = "\improper icemoon chick"
	desc = "Looks like a walking puddle of water, but loud."
	color = "#216399"
	butcher_results = list(
		/obj/item/food/meat/slab/chicken = 1,
		/obj/item/stack/sheet/bone = 1,
	)
	habitable_atmos = null
	minimum_survivable_temperature = 150
	maximum_survivable_temperature = 280
	grow_as = /mob/living/basic/chicken/icemoon
