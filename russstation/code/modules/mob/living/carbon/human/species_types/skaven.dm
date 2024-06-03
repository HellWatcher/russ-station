/datum/species/skaven
	name = "\improper Skaven"
	id = SPECIES_SKAVEN
	inherent_traits = list(
		TRAIT_AGENDER,
		TRAIT_MUTANT_COLORS,
		TRAIT_FIXED_MUTANT_COLORS,
	)
	external_organs = list(
		/obj/item/organ/external/horns = "None",
		/obj/item/organ/external/snout = "Round",
		/obj/item/organ/external/tail/skaven = "Skaven",
	)
	inherent_respiration_type = RESPIRATION_MIASMA
	mutantlungs = /obj/item/organ/internal/lungs/skaven
	mutanttongue = /obj/item/organ/internal/tongue/skaven
	mutantears = /obj/item/organ/internal/ears/skaven
	payday_modifier = 0.25 //Might as well be a slave
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_cookie = /obj/item/food/meat/slab
	meat = /obj/item/food/meat/slab/human/mutant/skaven
	skinned_type = /obj/item/stack/sheet/animalhide/skaven
	outfit_important_for_life = /datum/outfit/skaven
	species_language_holder = /datum/language_holder/skaven
	sexes = FALSE //ever heard of female skaven? didnt think so
	examine_limb_id = SPECIES_SKAVEN
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/skaven,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/skaven,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/skaven,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/skaven,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/skaven,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/skaven,
	)

/// Returns the species's scream sound. (human screams)
/datum/species/skaven/get_scream_sound(mob/living/carbon/human/human)
	if(human.gender == MALE)
		if(prob(1))
			return 'sound/voice/human/wilhelm_scream.ogg'
		return pick(
			'sound/voice/human/malescream_1.ogg',
			'sound/voice/human/malescream_2.ogg',
			'sound/voice/human/malescream_3.ogg',
			'sound/voice/human/malescream_4.ogg',
			'sound/voice/human/malescream_5.ogg',
			'sound/voice/human/malescream_6.ogg',
		)

	return pick(
		'sound/voice/human/femalescream_1.ogg',
		'sound/voice/human/femalescream_2.ogg',
		'sound/voice/human/femalescream_3.ogg',
		'sound/voice/human/femalescream_4.ogg',
		'sound/voice/human/femalescream_5.ogg',
	)

/datum/species/skaven/get_cough_sound(mob/living/carbon/human/skaven)
	if(skaven.gender == FEMALE)
		return pick(
			'sound/voice/human/female_cough1.ogg',
			'sound/voice/human/female_cough2.ogg',
			'sound/voice/human/female_cough3.ogg',
			'sound/voice/human/female_cough4.ogg',
			'sound/voice/human/female_cough5.ogg',
			'sound/voice/human/female_cough6.ogg',
		)
	return pick(
		'sound/voice/human/male_cough1.ogg',
		'sound/voice/human/male_cough2.ogg',
		'sound/voice/human/male_cough3.ogg',
		'sound/voice/human/male_cough4.ogg',
		'sound/voice/human/male_cough5.ogg',
		'sound/voice/human/male_cough6.ogg',
	)


/datum/species/skaven/get_cry_sound(mob/living/carbon/human/skaven)
	if(skaven.gender == FEMALE)
		return pick(
			'sound/voice/human/female_cry1.ogg',
			'sound/voice/human/female_cry2.ogg',
		)
	return pick(
		'sound/voice/human/male_cry1.ogg',
		'sound/voice/human/male_cry2.ogg',
		'sound/voice/human/male_cry3.ogg',
	)


/datum/species/skaven/get_sneeze_sound(mob/living/carbon/human/skaven)
	if(skaven.gender == FEMALE)
		return 'sound/voice/human/female_sneeze1.ogg'
	return 'sound/voice/human/male_sneeze1.ogg'

/datum/species/skaven/get_laugh_sound(mob/living/carbon/human)
	if(!istype(human))
		return
	return 'sound/voice/lizard/lizard_laugh1.ogg'


/datum/species/skaven/get_features()
	var/list/features = ..()
	features += "feature_skavencolor"
	return features

/datum/species/skaven/pre_equip_species_outfit(datum/job/job, mob/living/carbon/human/equipping, visuals_only = FALSE)
	equipping.equipOutfit(/datum/outfit/skaven, visuals_only)
	equipping.internal = equipping.get_item_for_held_index(2)

/datum/species/skaven/random_name(gender, unique, lastname)
	if(unique)
		return random_unique_skaven_name()
	var/randname = skaven_name()
	if(lastname)
		randname += " [lastname]"
	return randname

/datum/species/skaven/randomize_features()
	var/list/features = ..()
	features["tail_skaven"] = pick(GLOB.tails_list_skaven)
	features["ears"] = pick("None", "Skaven")
	features["skaven_color"] = GLOB.color_list_skaven[pick(GLOB.color_list_skaven)]
	return features

/datum/species/skaven/on_species_gain(mob/living/carbon/carbon_being, datum/species/old_species, pref_load)

	//Adds skaven custom speech bubble
	// carbon_being.bubble_file = 'russstation/icons/mob/talk.dmi'
	// carbon_being.bubble_icon = "skaven"

	if(ishuman(carbon_being))
		var/mob/living/carbon/human/target_human = carbon_being
		if(!pref_load)
			target_human.dna.features["tail_skaven"] = "Skaven"
			if(target_human.dna.features["ears"] == "None")
				target_human.dna.features["ears"] = "Skaven"
		if(target_human.dna.features["ears"] == "Skaven")
			var/obj/item/organ/internal/ears/skaven/ears = new
			ears.Insert(target_human, movement_flags = DELETE_IF_REPLACED)
		// ensure our mcolor (used for bodyparts) is set to our skaven's color
		target_human.dna.features["mcolor"] = target_human.dna.features["skaven_color"]
	return ..()

/datum/species/skaven/randomize_main_appearance_element(mob/living/carbon/human/human_mob)
	var/tail = pick(GLOB.tails_list_skaven)
	human_mob.dna.features["tail_skaven"] = tail
	mutant_bodyparts["tail_skaven"] = tail
	human_mob.update_body()

/datum/species/skaven/get_species_description()
	return "The enigmatic Rat-folk, hailing from deep underground on many \
		planets. Having travelled amongst the stars through few feats of their \
		own, yet are industrious enough to have earned a spot among Nanotrasen's \
		less-than-finest."

/datum/species/skaven/get_species_lore()
	return list(
		"The Skaven have made homes and hovels underground on many planets, but poor recordkeeping and countless civil wars between numerous clans have lost their origin planet to time. What little records remain hint of a mysterious substance known as warpstone, but any accounts beyond being a source of great power have been chewed beyond recognition.",
		"Accustomed to depths far below most races would go, Skaven being among the surface dwellers are a relatively recent development. The clans united in an effort to seek the warpstone once more, so they might one day understand where they came from, and what drove their clans to such violence.",
	)

/datum/species/skaven/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "wind",
			SPECIES_PERK_NAME = "Miasma Breathing",
			SPECIES_PERK_DESC = "Skaven must breathe miasma to survive. You receive a \
				tank when you arrive. Additional miasma can be created via compost \
				bins or ordered from cargo.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "hand-holding-usd",
			SPECIES_PERK_NAME = "Reduced Salary",
			SPECIES_PERK_DESC = "Skaven are not held in high regard. Your salary will be \
				significantly less than other species.",
		),
	)

	return to_add
