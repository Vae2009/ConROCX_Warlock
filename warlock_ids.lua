local ConROC_Warlock, ids = ...;
local optionMaxIds = ...;

--General
	ids.Racial = {
		Berserking = 26297,
		EscapeArtist = 20589,
	}
	ids.Spec = {
		Affliction = 1,
		Demonology = 2,
		Destruction = 3,
	}
	ids.Caster = {
		Shoot = 5019,
	}
--Affliction
	ids.Aff_Ability = {
		AmplifyCurse = 18288,
		CorruptionRank1 = 172,
		CorruptionRank2 = 6222,
		CorruptionRank3 = 6223,
		CorruptionRank4 = 7648,
		CorruptionRank5 = 11671,
		CorruptionRank6 = 11672,
		CorruptionRank7 = 25311,
		CorruptionRank8 = 27216,	
		CorruptionRank9 = 47812,	
		CorruptionRank10 = 47813,
		CurseofAgonyRank1 = 980,
		CurseofAgonyRank2 = 1014,
		CurseofAgonyRank3 = 6217,
		CurseofAgonyRank4 = 11711,
		CurseofAgonyRank5 = 11712,
		CurseofAgonyRank6 = 11713,
		CurseofAgonyRank7 = 27218,	
		CurseofAgonyRank8 = 47863,	
		CurseofAgonyRank9 = 47864,
		CurseofDoomRank1 = 603,
		CurseofDoomRank2 = 30910,	
		CurseofDoomRank3 = 47867,
		CurseofExhaustion = 18223,
		CurseofTonguesRank1 = 1714,
		CurseofTonguesRank2 = 11719,
		CurseoftheElementsRank1 = 1490,
		CurseoftheElementsRank2 = 11721,
		CurseoftheElementsRank3 = 11722,
		CurseoftheElementsRank4 = 27228,	
		CurseoftheElementsRank5 = 47865,
		CurseofWeaknessRank1 = 702,
		CurseofWeaknessRank2 = 1108,
		CurseofWeaknessRank3 = 6205,
		CurseofWeaknessRank4 = 7646,
		CurseofWeaknessRank5 = 11707,
		CurseofWeaknessRank6 = 11708,
		CurseofWeaknessRank7 = 27224,
		CurseofWeaknessRank8 = 30909,	
		CurseofWeaknessRank9 = 50511,
		DarkPactRank1 = 18220,
		DarkPactRank2 = 18937,
		DarkPactRank3 = 18938,
		DarkPactRank4 = 27265,
		DeathCoilRank1 = 6789,
		DeathCoilRank2 = 17925,
		DeathCoilRank3 = 17926,
		DeathCoilRank4 = 27223,	
		DeathCoilRank5 = 47859,	
		DeathCoilRank6 = 47860,
		DrainLifeRank1 = 689,
		DrainLifeRank2 = 699,
		DrainLifeRank3 = 709,
		DrainLifeRank4 = 7651,
		DrainLifeRank5 = 11699,
		DrainLifeRank6 = 11700,
		DrainLifeRank7 = 27219,
		DrainLifeRank8 = 27220,	
		DrainLifeRank9 = 47857,
		DrainManaRank1 = 5138,
		DrainSoulRank1 = 1120,
		DrainSoulRank2 = 8288,
		DrainSoulRank3 = 8289,
		DrainSoulRank4 = 11675,
		DrainSoulRank5 = 27217,	
		DrainSoulRank6 = 47855,
		FearRank1 = 5782,
		FearRank2 = 6213,
		FearRank3 = 6215,
		HowlofTerrorRank1 = 5484,
		HowlofTerrorRank2 = 17928,
		HauntRank1 = 48181,
		HauntRank2 = 59161,
		HauntRank3 = 59163,
		HauntRank4 = 59164,
		LifeTapRank1 = 1454,
		LifeTapRank2 = 1455,
		LifeTapRank3 = 1456,
		LifeTapRank4 = 11687,
		LifeTapRank5 = 11688,
		LifeTapRank6 = 11689,
		LifeTapRank7 = 27222,	
		LifeTapRank8 = 57946,	
		SeedofCorruptionRank1 = 27243,	
		SeedofCorruptionRank2 = 47835,	
		SeedofCorruptionRank3 = 47836,
		UnstableAfflictionRank1 = 30108,
		UnstableAfflictionRank2 = 30404,
		UnstableAfflictionRank3 = 30405,
		UnstableAfflictionRank4 = 47841,
		UnstableAfflictionRank5 = 47843,
	}
	ids.Aff_Talent = {
	--[[replaced by function in class file.
		ImprovedCurseofAgony = 15,--1,
		Suppression = 5,--2,
		ImprovedCorruption = 3,
		 
		ImprovedCurseofWeakness = 6,--4,
		ImprovedDrainSoul = 14,--5,
		ImprovedLifeTap = 7,--6,
		SoulSiphon = 4,--7,
		 
		ImprovedFear = 27,--8,
		FelConcentration = 1,--9,
		AmplifyCurse = 12,--10,
		 
		GrimReach = 8,--11,
		Nightfall = 2,--12,
		EmpoweredCorruption = 21,--13,
		 
		ShadowEmbrace = 20,--14,
		SiphonLife = 10, --15,
		CurseofExhaustion = 13,--16,
		
		ImprovedFelhunter = 22,--17,
		ShadowMastery = 11,--18,
		 
		Eradication = 25,--19,
		Contagion = 18,--20,
		DarkPact = 9,--21,

		ImprowedHowlofTerror = 17,--22,
		Malediction = 16,--23,

		DeathsEmbrace = 23,--24,
		UnstableAffliction = 19,--25,
		Pandemic = 28,--26,

		EverlastingAffliction = 24,--27,

		Haunt = 26,--28,
		--]]
	}		
--Demonology
	ids.Demo_Ability = {
		BanishRank1 = 710,
		BanishRank2 = 18647,	
		CreateFirestoneRank1 = 6366,
		CreateFirestoneRank2 = 17951,
		CreateFirestoneRank3 = 17952,
		CreateFirestoneRank4 = 17953,
		CreateFirestoneRank5 = 27250,	
		CreateFirestoneRank6 = 60219,	
		CreateFirestoneRank7 = 60220,
		CreateHealthstoneRank1 = 6201,
		CreateHealthstoneRank2 = 6202,
		CreateHealthstoneRank3 = 5699,
		CreateHealthstoneRank4 = 11729,
		CreateHealthstoneRank5 = 11730,
		CreateHealthstoneRank6 = 27230,	
		CreateHealthstoneRank7 = 47871,	
		CreateHealthstoneRank8 = 47878,
		CreateSoulstoneRank1 = 693,
		CreateSoulstoneRank2 = 20752,
		CreateSoulstoneRank3 = 20755,
		CreateSoulstoneRank4 = 20756,
		CreateSoulstoneRank5 = 20757,		
		CreateSoulstoneRank6 = 27238,	
		CreateSoulstoneRank7 = 47884,		
		CreateSpellstoneRank1 = 2362,
		CreateSpellstoneRank2 = 17727,
		CreateSpellstoneRank3 = 17728,
		CreateSpellstoneRank4 = 28172,	
		CreateSpellstoneRank5 = 47886,	
		CreateSpellstoneRank6 = 47888,
		DemonSkinRank1 = 687, --Just Demon Armor earlier ranks.
		DemonSkinRank2 = 696,
		DemonArmorRank1 = 706,
		DemonArmorRank2 = 1086,
		DemonArmorRank3 = 11733,
		DemonArmorRank4 = 11734,
		DemonArmorRank5 = 11735,
		DemonArmorRank6 = 27260,	
		DemonArmorRank7 = 47793,	
		DemonArmorRank8 = 47889,
		DemonicCircleSummon = 48018,	
		DemonicCircleTeleport = 48020,
		DetectInvisibility = 132,
		EyeofKilrogg = 126,
		FelArmorRank1 = 28176,
		FelArmorRank2 = 28189,	
		FelArmorRank3 = 47892,	
		FelArmorRank4 = 47893,
		FelDomination = 18708,
		HealthFunnelRank1 = 755,
		HealthFunnelRank2 = 3698,
		HealthFunnelRank3 = 3699,
		HealthFunnelRank4 = 3700,
		HealthFunnelRank5 = 11693,
		HealthFunnelRank6 = 11684,
		HealthFunnelRank7 = 11685,
		HealthFunnelRank8 = 27259,	
		HealthFunnelRank9 = 47856,
		Inferno = 1122,
		Metamorphosis = 47241,
		RitualofDoom = 18540,	
		RitualofSoulsRank1 = 29893,	
		RitualofSoulsRank2 = 58887,
		RitualofSummoning = 698,	
		SenseDemons = 5500,	
		ShadowWardRank1 = 6229,
		ShadowWardRank2 = 11739,
		ShadowWardRank3 = 11740,
		ShadowWardRank4 = 28610,	
		ShadowWardRank5 = 47890,	
		ShadowWardRank6 = 47891,
		SenseDemons = 5500,
		SoulLink = 19028,	
		Soulshatter = 29858,	
		SubjagateDemonRank1 = 1098,	 -- Renamed from EnslaveDemon
		SubjagateDemonRank2 = 11725,	
		SubjagateDemonRank3 = 11726,	
		SubjagateDemonRank4 = 61191,
		SummonFelhunter = 691,
		SummonImp = 688,
		SummonSuccubus = 712,
		SummonVoidwalker = 697,	
		SummonIncubus = 713,
		SummonFelguard = 30146,
		UnendingBreath = 5697,

		ChallengingHowl = 59671,	-- Req Metamorphosis
		DemonCharge = 54785,		-- Req Metamorphosis
		ImmolationAura = 50589,		-- Req Metamorphosis
		ShadowCleave = 50581,		-- Req Metamorphosis
	}
	ids.Demo_Talent = {
	--[[ replaced by function in class file.
		ImprovedHealthstone = 1,
		ImprovedImp = 2,
		DemonicEmbrace = 3,
		FelSynergy = 4,
		 
		ImprovedHealthFunnel = 4,--5,
		DemonicBrutality = 5,--6,
		FelVitality = 7,
		 
		ImprovedSayaad = 8, --new name from ImprovedSuccubus
		SoulLink = 9,
		FelDomination = 6,--10,
		DemonicAegis = 11,

		UnholyPower = 12,
		MasterSummoner = 7,--13,
		 
		ManaFeed = 14,
		MasterConjuror = 15,
		 
		MasterDemonologist = 16,
		MoltenCore = 17,

		DemonicResilience = 18,
		DemonicEmpowerment = 19,
		DemonicKnowledge = 20,

		DemonicTactics = 21,
		Decimation = 22,

		ImprovedDemonicTactics = 23,
		SummonFelguard = 24,

		DemonicPact = 25,

		Metamorphosis = 26,--]]
	}
--Destruction
	ids.Dest_Ability = {
		ChaosBoltRank1 = 50796,
		ChaosBoltRank2 = 59170,
		ChaosBoltRank3 = 59171,
		ChaosBoltRank4 = 59172,
		ConflagrateRank1 = 17962,
		HellfireRank1 = 1949,
		HellfireRank2 = 11683,
		HellfireRank3 = 11684,
		HellfireRank4 = 27213,	
		HellfireRank5 = 47823,
		ImmolateRank1 = 348,
		ImmolateRank2 = 707,
		ImmolateRank3 = 1094,
		ImmolateRank4 = 2941,
		ImmolateRank5 = 11665,
		ImmolateRank6 = 11667,
		ImmolateRank7 = 11668,
		ImmolateRank8 = 25309,
		ImmolateRank9 = 27215,	
		ImmolateRank10 = 47810,	
		ImmolateRank11 = 47811,	
		IncinerateRank1 = 29722,	
		IncinerateRank2 = 32231,	
		IncinerateRank3 = 47837,	
		IncinerateRank4 = 47838,
		RainofFireRank1 = 5740,
		RainofFireRank2 = 6219,
		RainofFireRank3 = 11677,
		RainofFireRank4 = 11678,
		RainofFireRank5 = 27212,	
		RainofFireRank6 = 47819,	
		RainofFireRank7 = 47820,
		SearingPainRank1 = 5676,
		SearingPainRank2 = 17919,
		SearingPainRank3 = 17920,
		SearingPainRank4 = 17921,
		SearingPainRank5 = 17922,
		SearingPainRank6 = 17923,
		SearingPainRank7 = 27210,
		SearingPainRank8 = 30459,	
		SearingPainRank9 = 47814,	
		SearingPainRank10 = 47815,
		ShadowBoltRank1 = 686,
		ShadowBoltRank2 = 695,
		ShadowBoltRank3 = 705,
		ShadowBoltRank4 = 1088,
		ShadowBoltRank5 = 1106,
		ShadowBoltRank6 = 7641,
		ShadowBoltRank7 = 11659,
		ShadowBoltRank8 = 11660,
		ShadowBoltRank9 = 11661,
		ShadowBoltRank10 = 25307,
		ShadowBoltRank11 = 27209,	
		ShadowBoltRank12 = 47808,	
		ShadowBoltRank13 = 47809,
		ShadowburnRank1 = 17877,
		ShadowburnRank2 = 18867,
		ShadowburnRank3 = 18868,
		ShadowburnRank4 = 18869,
		ShadowburnRank5 = 18870,
		ShadowburnRank6 = 18871,
		ShadowburnRank7 = 27263,
		ShadowburnRank8 = 30546,	
		ShadowFlameRank1 = 47897,	
		ShadowFlameRank2 = 61290,
		SoulFireRank1 = 6353,
		SoulFireRank2 = 17924,
		SoulFireRank3 = 27211,
		SoulFireRank4 = 30545,	
		SoulFireRank5 = 47824,	
		SoulFireRank6 = 47825,
		ShadowfuryRank1 = 30283,
		ShadowfuryRank2 = 30413,
		ShadowfuryRank3 = 30414,
		ShadowfuryRank4 = 47846,
		ShadowfuryRank5 = 47847,
	}
	ids.Dest_Talent = {
	--[[replaced by function in class file.
		ImprovedShadowBolt = 1,
		Bane = 2,
		 
		Aftermath = 3,
		MoltenSkin = 4,
		Cataclysm = 5,
		 
		DemonicPower = 6,
		Shadowburn = 7,
		Ruin = 8,		
		 
		Intensity = 9,
		DestructiveReach = 10,
		ImprovedSearingPain = 11,
		
		Backlash = 12,
		ImprovedImmolate = 13,
		Devastation = 14,
		 
		NetherProtection = 15,
		Emberstorm = 16,
		 
		Conflagrate = 18,
		SoulLeech = 19,
		Pyroclasm = 20,

		ShadowAndFlame = 21,
		ImprovedSoulLeech = 22,

		Backdraft = 23,
		Shadowfury = 24,
		EmpoweredImp = 25,

		FireAndBrimstone = 26,

		ChaosBolt = 27,--]]
	}
--Pet
	ids.Pet = {

	}
-- Auras
	ids.Player_Buff = {
		BurningWish = 18789,
		FelEnergy = 18792,
		FelStamina = 18790,
		ShadowTrance = 17941,
		TouchofShadow = 18791,
		LifeTap = 63321,
		SpiritsoftheDamned = 61082,
		IllustrationoftheDragonSoul = 60486,
		MoltenCore = 71165,
		DecimationRank1 = 163165,
		DecimationRank2 = 163167,
	}
	ids.Player_Debuff = {

	}
	ids.Target_Debuff = {
	
	}
	ids.optionMaxIds = {
		
	}