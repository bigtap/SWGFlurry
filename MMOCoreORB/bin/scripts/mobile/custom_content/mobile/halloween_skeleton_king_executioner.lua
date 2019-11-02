halloween_skeleton_king_executioner = Creature:new {
	customName = "Skeleton King's Executioner",
	--objectName = "",
	--randomNameType = NAME_GENERIC_TAG,
	socialGroup = "halloween",
	faction = "halloween",
	level = 300,
	chanceHit = 30,
	damageMin = 1645,
	damageMax = 3000,
	specialDamageMult = 7.5,
	baseXp = 28549,
	baseHAM = 385000,
	baseHAMmax = 471000,
	armor = 3,
	resists = {50,50,50,50,50,50,50,50,50},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE + JTLINTERESTING,

	templates = {"object/mobile/halloween_skeleton_1.iff"},
  	outfit = "custom_halloween1_outfit",
	scale = 1.5,
	lootGroups = {
		{
			groups = {
				{group = "tierone", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "tiertwo", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "tierthree", chance = 2500000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "tierdiamond", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "halloween", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "power_crystals", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nightsister1", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nightsister2", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nightsister3", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nightsister4", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "krayt_tissue_rare", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "krayt_pearls", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 10000000
		},
	},
	weapons = {},
	reactionStf = "@npc_reaction/slang",
	attacks = merge(tkamaster,brawlermaster,fencermaster,swordsmanmaster,pikemanmaster)
}

CreatureTemplates:addCreatureTemplate(halloween_skeleton_king_executioner, "halloween_skeleton_king_executioner")

