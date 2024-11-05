#define SMOKER_ORGAN_HEALTH (STANDARD_ORGAN_THRESHOLD * 0.75)
#define SMOKER_LUNG_HEALING (STANDARD_ORGAN_HEALING * 0.75)

/obj/item/organ/lungs/skaven
	name = "skaven lungs"
	desc = "A putrid pile of squishy flesh that somewhat resemble lungs."
	icon = 'russstation/icons/obj/surgery.dmi'
	icon_state = "lungs-skaven"
	safe_oxygen_min = 0
	safe_miasma_min = 10 //what skaven breath
	suffers_miasma = FALSE

/obj/item/organ/lungs/skaven/skaven_smoker
	name = "smoker skaven lungs"
	desc = "A pair of putrid squishy flesh that somehow work as lungs, these also have burn scars, probably caused by inhaling hot smoke."

	maxHealth = SMOKER_ORGAN_HEALTH
	healing_factor = SMOKER_LUNG_HEALING

#undef SMOKER_ORGAN_HEALTH
#undef SMOKER_LUNG_HEALING
