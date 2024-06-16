/obj/item/bodypart/head/skaven
	icon = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_static = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_greyscale = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_state = "skaven_head"
	limb_id = SPECIES_SKAVEN
	is_dimorphic = FALSE
	head_flags = HEAD_LIPS|HEAD_EYESPRITES|HEAD_EYEHOLES|HEAD_DEBRAIN

/obj/item/bodypart/chest/skaven
	icon = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_static = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_greyscale = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_state = "skaven_chest"
	limb_id = SPECIES_SKAVEN
	is_dimorphic = FALSE
	wing_types = NONE

/obj/item/bodypart/chest/skaven/get_butt_sprite()
	return BUTT_SPRITE_CAT

/obj/item/bodypart/arm/left/skaven
	icon = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_static = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_greyscale = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_state = "skaven_l_arm"
	limb_id = SPECIES_SKAVEN
	unarmed_attack_verbs = list("claw")
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'

/obj/item/bodypart/arm/right/skaven
	icon = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_static = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_greyscale = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_state = "skaven_r_arm"
	limb_id = SPECIES_SKAVEN
	unarmed_attack_verbs = list("claw")
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'

/obj/item/bodypart/leg/left/skaven
	icon = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_static = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_greyscale = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_state = "skaven_l_leg"
	limb_id = SPECIES_SKAVEN

/obj/item/bodypart/leg/right/skaven
	icon = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_static = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_greyscale = 'russstation/icons/mob/human_parts_greyscale.dmi'
	icon_state = "skaven_r_leg"
	limb_id = SPECIES_SKAVEN
