///Z level traits for IceMoon mining
#define ZTRAITS_ICEMOON list( \
	list( \
	ZTRAIT_UP = TRUE, \
	ZTRAIT_MINING = TRUE, \
	ZTRAIT_ICE_RUINS_UNDERGROUND = TRUE, \
	ZTRAIT_BOMBCAP_MULTIPLIER = 2, \
	ZTRAIT_BASETURF = /turf/open/lava/plasma/ice_moon), \
	list( \
	ZTRAIT_DOWN = TRUE, \
	ZTRAIT_MINING = TRUE, \
	ZTRAIT_SNOWSTORM = TRUE, \
	ZTRAIT_ICE_RUINS_UNDERGROUND = TRUE, \
	ZTRAIT_BOMBCAP_MULTIPLIER = 2, \
	ZTRAIT_BASETURF = /turf/open/openspace/icemoon/keep_below) \
	)

///Z level traits for Badlands mining
#define ZTRAIT_BADLANDS_RUINS "Badlands Ruins"
#define ZTRAITS_BADLANDS list( \
	ZTRAIT_MINING = TRUE, \
	ZTRAIT_BADLANDS_RUINS = TRUE, \
	ZTRAIT_BOMBCAP_MULTIPLIER = 3, \
	ZTRAIT_BASETURF = /turf/open/chasm/lavaland)
