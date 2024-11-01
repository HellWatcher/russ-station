/**
  * Mystery Pods
  *
  * Seeds that can be cracked open to give a random item;
  * You will get a better random item if the plant's potency is above 90.
  * Made admin only as of https://github.com/RussStation/RussStation/pull/15 due to the lack of an icon and balance concerns.
  */

/obj/item/seeds/russ/mystery
	name = "pack of mystery pod seeds"
	desc = "These seeds grow into mystery pods. These seeds are said to have come from a dead singuloth."
	growing_icon = 'russstation/icons/obj/hydroponics/growing.dmi'
	icon_state = "seed-mysterypod"
	species = "mysterypod"
	plantname = "Mystery Pod"
	product = /obj/item/food/grown/russ/mystery_pod
	lifespan = 40
	endurance = 20
	production = 1
	yield = 2
	icon_grow = "mysterypod-grow"
	icon_dead = "mysterypod-dead"
	reagents_add = list(/datum/reagent/consumable/nothing = 0.5)

/obj/item/food/grown/russ/mystery_pod
	seed = /obj/item/seeds/russ/mystery
	name = "mystery pod"
	desc = "Feels extremely heavy. Whats inside this thing?"
	icon_state = "mystery"
	filling_color = "#000000"


/obj/item/food/grown/russ/mystery_pod/attack_self(mob/user)
	var/harvested_item

	if(seed.potency <= 90)
		harvested_item = get_random_thing(user)
	// We get special things at high potency
	else
		switch(rand(0,106))
			if(0 to 70)
				harvested_item = get_random_thing(user)
			if(71)
				harvested_item = /obj/machinery/chem_master
			if(72 to 77)
				harvested_item = pick(
					/obj/item/grenade/chem_grenade,
					/obj/item/grenade/chem_grenade/large,
					/obj/item/grenade/chem_grenade/cryo,
					/obj/item/grenade/chem_grenade/pyro,
					/obj/item/grenade/chem_grenade/adv_release,
				)
			if(78)
				harvested_item = pick(
					/obj/machinery/computer/arcade/amputation,
					/obj/machinery/computer/arcade/orion_trail,
					/obj/machinery/computer/arcade/orion_trail/kobayashi,
					/obj/machinery/computer/arcade/battle,
				)
			if(79)
				harvested_item = /obj/machinery/vending/donksofttoyvendor
			if(80 to 85)
				harvested_item = /obj/effect/spawner/random/maintenance/eight
			if(86 to 88)
				harvested_item = /obj/effect/spawner/random/exotic/antag_gear_weak
			if(89)
				harvested_item = /obj/item/toy/windup_toolbox
			if(90 to 94)
				harvested_item = /obj/structure/closet/crate/secure/loot
			if(95)
				harvested_item = /obj/effect/spawner/random/food_or_drink/seed_vault
			if(96)
				harvested_item = /obj/effect/spawner/random/medical/organs
			if(97 to 99)
				harvested_item = /obj/item/gun/energy/laser/retro/old
			if(100 to 103)
				harvested_item = pick(
					/obj/item/gun/ballistic/automatic/l6_saw/toy/unrestricted/riot,
					/obj/item/gun/ballistic/automatic/c20r/toy/unrestricted/riot,
					/obj/item/gun/ballistic/automatic/toy/riot,
				)
			if(104)
				harvested_item = /obj/item/storage/box/syndie_kit/chemical
			if(105)
				harvested_item = /obj/item/knife/rainbowknife
			if(106)
				harvested_item = /obj/machinery/autolathe/hacked

	to_chat(user, span_notice("You forcefully crack open the purple pod."))
	new harvested_item(get_turf(user))
	qdel(src)

//Get a random item
/obj/item/proc/get_random_thing(mob/user)
	var/harvested_item

	switch(rand(0, 213))
		if(0 to 19)
			harvested_item = pick(
				/obj/item/seeds/ambrosia,
				/obj/item/seeds/ambrosia/deus,
				/obj/item/seeds/ambrosia/gaia,
				/obj/item/seeds/russ/bung,
				/obj/item/seeds/apple/gold,
				/obj/item/seeds/apple,
				/obj/item/seeds/banana,
				/obj/item/seeds/banana/mime,
				/obj/item/seeds/banana/bluespace,
				/obj/item/seeds/soya/koi,
				/obj/item/seeds/soya,
				/obj/item/seeds/berry,
				/obj/item/seeds/berry/poison,
				/obj/item/seeds/berry,
				/obj/item/seeds/berry/death,
				/obj/item/seeds/berry/glow,
				/obj/item/seeds/cherry/blue,
				/obj/item/seeds/cherry/bomb,
				/obj/item/seeds/cherry,
				/obj/item/seeds/grape,
				/obj/item/seeds/grape/green,
				/obj/item/seeds/cannabis/rainbow,
				/obj/item/seeds/cannabis,
				/obj/item/seeds/cannabis/death,
				/obj/item/seeds/cannabis/white,
				/obj/item/seeds/cannabis/ultimate,
				/obj/item/seeds/wheat,
				/obj/item/seeds/wheat/oat,
				/obj/item/seeds/wheat/rice,
				/obj/item/seeds/wheat/meat,
				/obj/item/seeds/chili,
				/obj/item/seeds/chili/ice,
				/obj/item/seeds/chili/ghost,
				/obj/item/seeds/lime,
				/obj/item/seeds/orange,
				/obj/item/seeds/russ/white,
				/obj/item/seeds/russ/goblin,
				/obj/item/seeds/lemon,
				/obj/item/seeds/firelemon,
				/obj/item/seeds/cocoapod,
				/obj/item/seeds/cocoapod/vanillapod,
				/obj/item/seeds/corn,
				/obj/item/seeds/corn/snapcorn,
				/obj/item/seeds/eggplant,
				/obj/item/seeds/eggplant/eggy,
				/obj/item/seeds/poppy,
				/obj/item/seeds/poppy/lily,
				/obj/item/seeds/poppy/geranium,
				/obj/item/seeds/harebell,
				/obj/item/seeds/sunflower,
				/obj/item/seeds/sunflower/moonflower,
				/obj/item/seeds/sunflower/novaflower,
				/obj/item/seeds/grass,
				/obj/item/seeds/grass/carpet,
				/obj/item/seeds/watermelon,
				/obj/item/seeds/glowshroom/shadowshroom,
				/obj/item/seeds/glowshroom,
				/obj/item/seeds/watermelon/holy,
				/obj/item/seeds/starthistle,
				/obj/item/seeds/cabbage,
				/obj/item/seeds/sugarcane,
				/obj/item/seeds/reishi,
				/obj/item/seeds/amanita,
				/obj/item/seeds/angel,
				/obj/item/seeds/liberty,
				/obj/item/seeds/plump/walkingmushroom,
				/obj/item/seeds/plump,
				/obj/item/seeds/chanter,
				/obj/item/seeds/glowshroom/glowcap,
				/obj/item/seeds/nettle,
				/obj/item/seeds/nettle/death,
				/obj/item/seeds/russ/mystery,
				/obj/item/seeds/onion,
				/obj/item/seeds/onion/red,
				/obj/item/seeds/pineapple,
				/obj/item/seeds/potato,
				/obj/item/seeds/potato/sweet,
				/obj/item/seeds/pumpkin,
				/obj/item/seeds/pumpkin/blumpkin,
				/obj/item/seeds/replicapod,
				/obj/item/seeds/carrot,
				/obj/item/seeds/carrot/parsnip,
				/obj/item/seeds/whitebeet,
				/obj/item/seeds/redbeet,
				/obj/item/seeds/tea/astra,
				/obj/item/seeds/tea,
				/obj/item/seeds/coffee/robusta,
				/obj/item/seeds/coffee,
				/obj/item/seeds/tobacco/space,
				/obj/item/seeds/tobacco,
				/obj/item/seeds/tomato/blue,
				/obj/item/seeds/tomato/blood,
				/obj/item/seeds/tomato/blue/bluespace,
				/obj/item/seeds/tomato/killer,
				/obj/item/seeds/tomato,
				/obj/item/seeds/tower,
				/obj/item/seeds/tower/steel,
				/obj/item/seeds/ambrosia,
				/obj/item/seeds/ambrosia/deus,
				/obj/item/seeds/ambrosia/gaia,
				/obj/item/seeds/russ/bung,
				/obj/item/seeds/apple/gold,
				/obj/item/seeds/apple,
				/obj/item/seeds/banana,
				/obj/item/seeds/banana/mime,
				/obj/item/seeds/banana/bluespace,
				/obj/item/seeds/soya/koi,
				/obj/item/seeds/soya,
				/obj/item/seeds/berry,
				/obj/item/seeds/berry/poison,
				/obj/item/seeds/berry,
				/obj/item/seeds/berry/death,
				/obj/item/seeds/berry/glow,
				/obj/item/seeds/cherry/blue,
				/obj/item/seeds/cherry/bomb,
				/obj/item/seeds/cherry,
				/obj/item/seeds/grape,
				/obj/item/seeds/grape/green,
				/obj/item/seeds/cannabis/rainbow,
				/obj/item/seeds/cannabis,
				/obj/item/seeds/cannabis/death,
				/obj/item/seeds/cannabis/white,
				/obj/item/seeds/cannabis/ultimate,
				/obj/item/seeds/wheat,
				/obj/item/seeds/wheat/oat,
				/obj/item/seeds/wheat/rice,
				/obj/item/seeds/wheat/meat,
				/obj/item/seeds/chili,
				/obj/item/seeds/chili/ice,
				/obj/item/seeds/chili/ghost,
				/obj/item/seeds/lime,
				/obj/item/seeds/orange,
				/obj/item/seeds/russ/white,
				/obj/item/seeds/russ/goblin,
				/obj/item/seeds/lemon,
				/obj/item/seeds/firelemon,
				/obj/item/seeds/cocoapod,
				/obj/item/seeds/cocoapod/vanillapod,
				/obj/item/seeds/corn,
				/obj/item/seeds/corn/snapcorn,
				/obj/item/seeds/eggplant,
				/obj/item/seeds/eggplant/eggy,
				/obj/item/seeds/poppy,
				/obj/item/seeds/poppy/lily,
				/obj/item/seeds/poppy/geranium,
				/obj/item/seeds/harebell,
				/obj/item/seeds/sunflower,
				/obj/item/seeds/sunflower/moonflower,
				/obj/item/seeds/sunflower/novaflower,
				/obj/item/seeds/grass,
				/obj/item/seeds/grass/carpet,
				/obj/item/seeds/watermelon,
				/obj/item/seeds/glowshroom/shadowshroom,
				/obj/item/seeds/glowshroom,
				/obj/item/seeds/watermelon/holy,
				/obj/item/seeds/starthistle,
				/obj/item/seeds/cabbage,
				/obj/item/seeds/sugarcane,
				/obj/item/seeds/reishi,
				/obj/item/seeds/amanita,
				/obj/item/seeds/angel,
				/obj/item/seeds/liberty,
				/obj/item/seeds/plump/walkingmushroom,
				/obj/item/seeds/plump,
				/obj/item/seeds/chanter,
				/obj/item/seeds/glowshroom/glowcap,
				/obj/item/seeds/nettle,
				/obj/item/seeds/nettle/death,
				/obj/item/seeds/russ/mystery,
				/obj/item/seeds/onion,
				/obj/item/seeds/onion/red,
				/obj/item/seeds/pineapple,
				/obj/item/seeds/potato,
				/obj/item/seeds/potato/sweet,
				/obj/item/seeds/pumpkin,
				/obj/item/seeds/pumpkin/blumpkin,
				/obj/item/seeds/replicapod,
				/obj/item/seeds/carrot,
				/obj/item/seeds/carrot/parsnip,
				/obj/item/seeds/whitebeet,
				/obj/item/seeds/redbeet,
				/obj/item/seeds/tea/astra,
				/obj/item/seeds/tea,
				/obj/item/seeds/coffee/robusta,
				/obj/item/seeds/coffee,
				/obj/item/seeds/tobacco/space,
				/obj/item/seeds/tobacco,
				/obj/item/seeds/tomato/blue,
				/obj/item/seeds/tomato/blood,
				/obj/item/seeds/tomato/blue/bluespace,
				/obj/item/seeds/tomato/killer,
				/obj/item/seeds/tomato,
				/obj/item/seeds/tower,
				/obj/item/seeds/tower/steel,
			)
		if(20 to 50)
			harvested_item = pick(/obj/item/seeds/random)
		if(51)
			harvested_item = /obj/item/seeds/gatfruit
		if(52 to 62)
			harvested_item = pick(
				/obj/item/wrench,
				/obj/item/weldingtool,
				/obj/item/screwdriver,
				/obj/item/crowbar,
				/obj/item/wirecutters,
				/obj/item/multitool,
				/obj/item/stack/cable_coil,
			)
		if(63 to 93)
			harvested_item = pick(
				/mob/living/basic/butterfly,
				/mob/living/basic/cockroach/glockroach,
				/mob/living/basic/pet/dog/corgi/puppy,
				/mob/living/basic/pet/dog/corgi,
				/mob/living/basic/crab,
				/mob/living/basic/cow,
				/mob/living/basic/chicken,
				/mob/living/basic/goat,
				/mob/living/basic/pet/fox,
				/mob/living/basic/lizard,
				/mob/living/basic/mouse,
				/mob/living/basic/pet/penguin/baby,
				/mob/living/basic/pet/penguin/emperor,
				/mob/living/basic/pet/penguin/emperor/shamebrero,
				/mob/living/basic/sloth,
				/mob/living/basic/pet/dog/pug,
			)
		if(94 to 102)
			harvested_item = pick(
				/mob/living/basic/bat,
				/mob/living/basic/carp,
				/mob/living/basic/hivebot/,
				/mob/living/basic/spider/giant/nurse,
				/mob/living/simple_animal/hostile/illusion/escape,
				/mob/living/basic/snake,
				/mob/living/basic/killer_tomato,
				/mob/living/basic/viscerator,
				/mob/living/basic/clown/russ/goblin,
				/mob/living/basic/poly_raptor,
			)
		if(103 to 109)
			harvested_item = pick(
				/mob/living/basic/carp/mega,
				/mob/living/basic/faithless,
				/mob/living/basic/bear,
				/mob/living/basic/spider/giant,
				/mob/living/basic/hivebot/range,
				/mob/living/simple_animal/hostile/mimic/copy,
				/mob/living/basic/clown/russ/goblin,
				/mob/living/basic/venus_human_trap,
				/mob/living/basic/bear/snow,
			)
		if(110 to 120)
			harvested_item = pick(
					/obj/item/storage/pill_bottle/maintenance_pill/full,
					/obj/item/lipstick/random,
				)
		if(121 to 148)
			harvested_item = pick(
				/obj/item/reagent_containers/cup/glass/bottle/gin,
				/obj/item/reagent_containers/cup/glass/bottle/whiskey,
				/obj/item/reagent_containers/cup/glass/bottle/vodka,
				/obj/item/reagent_containers/cup/glass/bottle/tequila,
				/obj/item/reagent_containers/cup/glass/bottle/bottleofnothing,
				/obj/item/reagent_containers/cup/glass/bottle/patron,
				/obj/item/reagent_containers/cup/glass/bottle/rum,
				/obj/item/reagent_containers/cup/glass/bottle/holywater,
				/obj/item/reagent_containers/cup/glass/bottle/vermouth,
				/obj/item/reagent_containers/cup/glass/bottle/kahlua,
				/obj/item/reagent_containers/cup/glass/bottle/goldschlager,
				/obj/item/reagent_containers/cup/glass/bottle/cognac,
				/obj/item/reagent_containers/cup/glass/bottle/wine,
				/obj/item/reagent_containers/cup/glass/bottle/absinthe,
				/obj/item/reagent_containers/cup/glass/bottle/lizardwine,
				/obj/item/reagent_containers/cup/glass/bottle/hcider,
				/obj/item/reagent_containers/cup/glass/bottle/grappa,
				/obj/item/reagent_containers/cup/glass/bottle/sake,
				/obj/item/reagent_containers/cup/glass/bottle/fernet,
				/obj/item/reagent_containers/cup/glass/bottle/juice/orangejuice,
				/obj/item/reagent_containers/cup/glass/bottle/juice/limejuice,
				/obj/item/reagent_containers/cup/glass/bottle/juice/menthol,
				/obj/item/reagent_containers/cup/glass/bottle/grenadine,
				/obj/item/reagent_containers/cup/glass/bottle/applejack,
				/obj/item/reagent_containers/cup/glass/bottle/champagne,
				/obj/item/reagent_containers/cup/glass/bottle/blazaam,
				/obj/item/reagent_containers/cup/glass/bottle/trappist,
				/obj/item/reagent_containers/cup/glass/bottle/molotov,
			)
		if(149 to 159)
			harvested_item = pick(
				/obj/item/reagent_containers/cup/bottle/nutrient/ez,
				/obj/item/reagent_containers/cup/bottle/nutrient/l4z,
				/obj/item/reagent_containers/cup/bottle/nutrient/rh,
				/obj/item/reagent_containers/cup/bottle/killer/weedkiller,
				/obj/item/reagent_containers/cup/bottle/killer/pestkiller,
				/obj/item/reagent_containers/cup/bottle/potion/flight,
				/obj/item/reagent_containers/cup/bottle/epinephrine,
				/obj/item/reagent_containers/cup/bottle/toxin,
				/obj/item/reagent_containers/cup/bottle/cyanide,
				/obj/item/reagent_containers/cup/bottle/spewium,
				/obj/item/reagent_containers/cup/bottle/morphine,
				/obj/item/reagent_containers/cup/bottle/chloralhydrate,
				/obj/item/reagent_containers/cup/bottle/mannitol,
				/obj/item/reagent_containers/cup/bottle/mutagen,
				/obj/item/reagent_containers/cup/bottle/plasma,
				/obj/item/reagent_containers/cup/bottle/synaptizine,
				/obj/item/reagent_containers/cup/bottle/formaldehyde,
				/obj/item/reagent_containers/cup/bottle/ammonia,
				/obj/item/reagent_containers/cup/bottle/diethylamine,
				/obj/item/reagent_containers/cup/bottle/facid,
				/obj/item/reagent_containers/cup/bottle/adminordrazine,
				/obj/item/reagent_containers/cup/bottle/capsaicin,
				/obj/item/reagent_containers/cup/bottle/frostoil,
				/obj/item/reagent_containers/cup/bottle/traitor,
				/obj/item/reagent_containers/cup/bottle/polonium,
				/obj/item/reagent_containers/cup/bottle/magillitis,
				/obj/item/reagent_containers/cup/bottle/venom,
				/obj/item/reagent_containers/cup/bottle/fentanyl,
				/obj/item/reagent_containers/cup/bottle/initropidril,
				/obj/item/reagent_containers/cup/bottle/pancuronium,
				/obj/item/reagent_containers/cup/bottle/sodium_thiopental,
				/obj/item/reagent_containers/cup/bottle/coniine,
				/obj/item/reagent_containers/cup/bottle/curare,
				/obj/item/reagent_containers/cup/bottle/amanitin,
				/obj/item/reagent_containers/cup/bottle/histamine,
				/obj/item/reagent_containers/cup/bottle/diphenhydramine,
				/obj/item/reagent_containers/cup/bottle/potass_iodide,
				/obj/item/reagent_containers/cup/bottle/salglu_solution,
				/obj/item/reagent_containers/cup/bottle/atropine,
				/obj/item/reagent_containers/cup/bottle/romerol,
				/obj/item/reagent_containers/cup/bottle/random_virus,
				/obj/item/reagent_containers/cup/bottle/pierrot_throat,
				/obj/item/reagent_containers/cup/bottle/cold,
				/obj/item/reagent_containers/cup/bottle/flu_virion,
				/obj/item/reagent_containers/cup/bottle/retrovirus,
				/obj/item/reagent_containers/cup/bottle/gbs,
				/obj/item/reagent_containers/cup/bottle/fake_gbs,
				/obj/item/reagent_containers/cup/bottle/brainrot,
				/obj/item/reagent_containers/cup/bottle/magnitis,
				/obj/item/reagent_containers/cup/bottle/wizarditis,
				/obj/item/reagent_containers/cup/bottle/anxiety,
				/obj/item/reagent_containers/cup/bottle/beesease,
				/obj/item/reagent_containers/cup/bottle/fluspanish,
				/obj/item/reagent_containers/cup/bottle/tuberculosis,
				/obj/item/reagent_containers/cup/bottle/tuberculosiscure,
				/obj/item/reagent_containers/cup/bottle/hydrogen,
				/obj/item/reagent_containers/cup/bottle/lithium,
				/obj/item/reagent_containers/cup/bottle/carbon,
				/obj/item/reagent_containers/cup/bottle/nitrogen,
				/obj/item/reagent_containers/cup/bottle/oxygen,
				/obj/item/reagent_containers/cup/bottle/fluorine,
				/obj/item/reagent_containers/cup/bottle/sodium,
				/obj/item/reagent_containers/cup/bottle/aluminium,
				/obj/item/reagent_containers/cup/bottle/iron,
				/obj/item/reagent_containers/cup/bottle/copper,
				/obj/item/reagent_containers/cup/bottle/mercury,
				/obj/item/reagent_containers/cup/bottle/radium,
				/obj/item/reagent_containers/cup/bottle/water,
				/obj/item/reagent_containers/cup/bottle/ethanol,
				/obj/item/reagent_containers/cup/bottle/sugar,
				/obj/item/reagent_containers/cup/bottle/sacid,
				/obj/item/reagent_containers/cup/bottle/welding_fuel,
				/obj/item/reagent_containers/cup/bottle/silver,
				/obj/item/reagent_containers/cup/bottle/iodine,
				/obj/item/reagent_containers/cup/bottle/bromine,
			)
		if(160 to 185)
			harvested_item = pick(
				/obj/item/stack/sheet/animalhide/human,
				/obj/item/stack/sheet/animalhide/generic,
				/obj/item/stack/sheet/animalhide/corgi,
				/obj/item/stack/sheet/animalhide/gondola,
				/obj/item/stack/sheet/animalhide/cat,
				/obj/item/stack/sheet/animalhide/monkey,
				/obj/item/stack/sheet/animalhide/lizard,
				/obj/item/stack/sheet/animalhide/xeno,
				/obj/item/stack/sheet/animalhide/goliath_hide,
				/obj/item/stack/sheet/animalhide/ashdrake,
				/obj/machinery/vending/donksofttoyvendor,
				/obj/item/gun/ballistic/automatic/c20r/toy/unrestricted,
				/obj/item/gun/ballistic/automatic/toy/riot,
				/obj/item/gun/ballistic/automatic/l6_saw/toy/unrestricted,
				/obj/item/toy/crayon/rainbow,
				/obj/item/lighter,
				/obj/item/flashlight/glowstick/red,
				/obj/item/flashlight/glowstick/blue,
				/obj/item/flashlight/glowstick/cyan,
				/obj/item/flashlight/glowstick/orange,
				/obj/item/flashlight/glowstick/yellow,
				/obj/item/flashlight/glowstick/pink,
				/obj/effect/decal/cleanable/blood/gibs,
				/obj/item/toy/plush/carpplushie,
				/obj/item/toy/plush/bubbleplush,
				/obj/item/toy/plush/ratplush,
				/obj/item/toy/plush/narplush,
				/obj/item/toy/plush/lizard_plushie/space/green,
				/obj/item/toy/plush/snakeplushie,
				/obj/item/toy/plush/nukeplushie,
				/obj/item/toy/plush/slimeplushie,
				/obj/item/toy/plush/awakenedplushie,
				/obj/item/toy/figure/cmo,
				/obj/item/toy/figure/assistant,
				/obj/item/toy/figure/atmos,
				/obj/item/toy/figure/bartender,
				/obj/item/toy/figure/borg,
				/obj/item/toy/figure/botanist,
				/obj/item/toy/figure/captain,
				/obj/item/toy/figure/cargotech,
				/obj/item/toy/figure/ce,
				/obj/item/toy/figure/chaplain,
				/obj/item/toy/figure/chef,
				/obj/item/toy/figure/chemist,
				/obj/item/toy/figure/clown,
				/obj/item/toy/figure/ian,
				/obj/item/toy/figure/detective,
				/obj/item/toy/figure/dsquad,
				/obj/item/toy/figure/engineer,
				/obj/item/toy/figure/geneticist,
				/obj/item/toy/figure/hop,
				/obj/item/toy/figure/hos,
				/obj/item/toy/figure/qm,
				/obj/item/toy/figure/janitor,
				/obj/item/toy/figure/lawyer,
				/obj/item/toy/figure/curator,
				/obj/item/toy/figure/md,
				/obj/item/toy/figure/mime,
				/obj/item/toy/figure/miner,
				/obj/item/toy/figure/ninja,
				/obj/item/toy/figure/wizard,
				/obj/item/toy/figure/rd,
				/obj/item/toy/figure/roboticist,
				/obj/item/toy/figure/scientist,
				/obj/item/toy/figure/syndie,
				/obj/item/toy/figure/secofficer,
				/obj/item/toy/figure/warden,
			)
		if(186 to 206)
			harvested_item = pick(
				/obj/item/stack/sheet/mineral/sandstone,
				/obj/item/stack/sheet/mineral/diamond,
				/obj/item/stack/sheet/mineral/uranium,
				/obj/item/stack/sheet/mineral/plasma,
				/obj/item/stack/sheet/mineral/gold,
				/obj/item/stack/sheet/mineral/silver,
				/obj/item/stack/sheet/mineral/bananium,
				/obj/item/stack/sheet/mineral/titanium,
				/obj/item/stack/sheet/mineral/plastitanium,
				/obj/item/stack/sheet/mineral/abductor,
				/obj/item/stack/sheet/mineral/adamantine,
			)
		if(207 to 213)
			harvested_item = pick(
				/obj/item/clothing/mask/gas/clown_hat,
				/obj/item/clothing/shoes/clown_shoes,
				/obj/item/toy/crayon/rainbow,
				/obj/item/bikehorn,
				/obj/structure/statue/bananium/clown,
				/obj/item/reagent_containers/cup/soda_cans/canned_laughter,
				/obj/item/food/pie/cream,
				/obj/item/reagent_containers/spray/waterflower,
				/obj/item/storage/backpack/clown,
				/obj/item/seeds/banana,
				/obj/item/stamp/clown,
				/obj/item/restraints/handcuffs,
			)

	return harvested_item
