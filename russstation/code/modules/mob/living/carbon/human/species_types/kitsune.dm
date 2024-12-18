/datum/species/human/kitsune
	name = "Kitsune"
	id = SPECIES_KITSUNE
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_LITERATE,
		TRAIT_NATURALTACKLER,
	)
	mutanttongue = /obj/item/organ/tongue/kitsune // ehhhh sure, tongue handles taste and they're both the same
	mutantears = /obj/item/organ/ears/kitsune
	mutant_organs = list(
		/obj/item/organ/tail/kitsune = "Kitsune",
	)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/kitsune
	payday_modifier = 0.75
	family_heirlooms = list(/obj/item/food/egg, /obj/item/gohei)
	examine_limb_id = SPECIES_HUMAN
	meat = /obj/item/food/meat/slab/human/mutant/kitsune
	skinned_type = /obj/item/stack/sheet/animalhide/kitsune



/datum/species/human/kitsune/prepare_human_for_preview(mob/living/carbon/human/human)
	human.hairstyle = "Long Bedhead"
	human.hair_color = "#ffb004" // ORANG
	human.update_hair()

	var/obj/item/organ/ears/kitsune/fox_ears = human.get_organ_by_type(/obj/item/organ/ears/kitsune)
	if (fox_ears)
		fox_ears.color = human.hair_color
		human.update_body()

/datum/species/human/kitsune/on_species_gain(mob/living/carbon/carbon_being, datum/species/old_species, pref_load)
	if(ishuman(carbon_being))
		var/mob/living/carbon/human/target_human = carbon_being
		if(!pref_load)
			target_human.dna.features["tail_kitsune"] = "Kitsune"
			if(target_human.dna.features["ears"] == "None")
				target_human.dna.features["ears"] = "Kitsune"
		if(target_human.dna.features["ears"] == "Kitsune")
			var/obj/item/organ/ears/kitsune/ears = new
			ears.Insert(target_human, movement_flags = DELETE_IF_REPLACED)
	return ..()

/datum/species/human/kitsune/get_species_description()
	return "Kitsune are one of the many types of genetic \
		modifications to come of humanity's mastery of genetic science, and are \
		a relatively uncommon variant of the animalids"

/datum/species/human/kitsune/get_species_lore()
	return list(
		"Bio-engineering has resulted in many different variants of animalids, some more.. eccentric than others, \
			Kitsune are one such result, being very similar to felinids in that while they mostly just gained a tail and ears \
			there were some more.. unintended effects on their thought process and speech patterns.",

		"Never the less, these variant of animalid is still popular among small groups of frea- of like minded individuals, enjoying \
			the fluffy ears and tails that the procedure gave them, alongside the violent racism and distain from non animalid races.",
	)

/datum/species/human/kitsune/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "assistive-listening-systems",
			SPECIES_PERK_NAME = "Sensitive Hearing",
			SPECIES_PERK_DESC = "Kitsunes are more sensitive to loud sounds, such as flashbangs, or the sound of a chef cracking \
			an egg",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "fist-raised",
			SPECIES_PERK_NAME = "Natural Tackler",
			SPECIES_PERK_DESC = "Kitsunes are experts at tackling their prey, and are naturally skilled when using \
			 gripper gloves and their ilk.",
		),
	)

	return to_add
