local printTalentsMode = false

-- Slash command for printing talent tree with talent names and ID numbers
SLASH_CONROCPRINTTALENTS1 = "/ConROCPT"
SlashCmdList["CONROCPRINTTALENTS"] = function()
    printTalentsMode = not printTalentsMode
    ConROC:PopulateTalentIDs()
end

ConROC.Warlock = {};

local ConROC_Warlock, ids = ...;
local optionMaxIds = ...;
local currentSpecName
function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Warlock.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConROC:PopulateTalentIDs()
    local numTabs = GetNumTalentTabs()
    
    for tabIndex = 1, numTabs do
        local tabName = GetTalentTabInfo(tabIndex) .. "_Talent"
        tabName = string.gsub(tabName, "%s", "") -- Remove spaces from tab name
        if printTalentsMode then
        	print(tabName..": ")
        else
        	ids[tabName] = {}
    	end
        
        local numTalents = GetNumTalents(tabIndex)

        for talentIndex = 1, numTalents do
            local name, _, _, _, _ = GetTalentInfo(tabIndex, talentIndex)

            if name then
                local talentID = string.gsub(name, "%s", "") -- Remove spaces from talent name
                if printTalentsMode then
                	print(talentID .." = ID no: ", talentIndex)
                else
                	ids[tabName][talentID] = talentIndex
                end
            end
        end
    end
    if printTalentsMode then printTalentsMode = false end
end
ConROC:PopulateTalentIDs()

local Racial, Spec, Caster, Aff_Ability, Aff_Talent, Demo_Ability, Demo_Talent, Dest_Ability, Dest_Talent, Pet, Player_Buff, Player_Debuff, Target_Debuff = ids.Racial, ids.Spec, ids.Caster, ids.Aff_Ability, ids.Affliction_Talent, ids.Demo_Ability, ids.Demonology_Talent, ids.Dest_Ability, ids.Destruction_Talent, ids.Pet, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff;

function ConROC:SpecUpdate()
	currentSpecName = ConROC:currentSpec()

	if currentSpecName then
	   ConROC:Print(self.Colors.Info .. "Current spec:", self.Colors.Success ..  currentSpecName)
	else
	   ConROC:Print(self.Colors.Error .. "You do not currently have a spec.")
	end
end
ConROC:SpecUpdate()
--Affliction
local _Corruption = Aff_Ability.CorruptionRank1;
local _CurseofAgony = Aff_Ability.CurseofAgonyRank1;
local _CurseofDoom = Aff_Ability.CurseofDoomRank1;
local _CurseofTongues = Aff_Ability.CurseofTonguesRank1;
local _CurseofExhaustion = ids.Aff_Ability.CurseofExhaustion;
local _CurseoftheElements = Aff_Ability.CurseoftheElementsRank1;
local _CurseofWeakness = Aff_Ability.CurseofWeaknessRank1;
local _DarkPact = Aff_Ability.DarkPactRank1;
local _DeathCoil = Aff_Ability.DeathCoilRank1;
local _DrainLife = Aff_Ability.DrainLifeRank1;
local _DrainMana = Aff_Ability.DrainManaRank1;
local _DrainSoul = Aff_Ability.DrainSoulRank1;
local _Fear = Aff_Ability.FearRank1;
local _Haunt = Aff_Ability.HauntRank1;
local _HowlofTerror = Aff_Ability.HowlofTerrorRank1;
local _LifeTap = Aff_Ability.LifeTapRank1;
local _LifeTapRank1 = Aff_Ability.LifeTapRank1;
local _SeedofCorruption = Aff_Ability.SeedofCorruptionRank1;
local _UnstableAffliction = Aff_Ability.UnstableAfflictionRank1;
--Demonology
local _Banish = Demo_Ability.BanishRank1;
local _CreateFirestone = Demo_Ability.CreateFirestoneRank1;
local _CreateHealthstone = Demo_Ability.CreateHealthstoneRank1;
local _CreateSoulstone = Demo_Ability.CreateSoulstoneRank1;	
local _CreateSpellstone = Demo_Ability.CreateSpellstoneRank1;
local _DemonArmor = Demo_Ability.DemonSkinRank1; --Demo_Ability.FelArmourRank1;
local _DetectInvisibility = Demo_Ability.DetectInvisibility;
local _HealthFunnel = Demo_Ability.HealthFunnelRank1;
local _Inferno = Demo_Ability.Inferno;
local _Metamorphosis = Demo_Ability.Metamorphosis
local _ShadowWard = Demo_Ability.ShadowWardRank1;
local _SubjagateDemon = Demo_Ability.SubjagateDemonRank1;
--Destruction
local _ChaosBolt = Dest_Ability.ChaosBoltRank1;
local _Conflagrate = Dest_Ability.ConflagrateRank1;
local _Hellfire = Dest_Ability.HellfireRank1;
local _Immolate = Dest_Ability.ImmolateRank1;
local _Incinerate = Dest_Ability.IncinerateRank1;
local _RainofFire = Dest_Ability.RainofFireRank1;
local _SearingPain = Dest_Ability.SearingPainRank1;
local _ShadowBolt = Dest_Ability.ShadowBoltRank1;
local _ShadowBoltRank1 = Dest_Ability.ShadowBoltRank1;
local _Shadowburn = Dest_Ability.ShadowburnRank1;
local _SoulFire = Dest_Ability.SoulFireRank1;
local _Shadowfury = Dest_Ability.ShadowfuryRank1;
local _ShadowFlame = Dest_Ability.ShadowFlameRank1;

function ConROC:UpdateSpellID()
--Ranks
if IsSpellKnown(Aff_Ability.CorruptionRank10) then _Corruption = Aff_Ability.CorruptionRank10;	
elseif IsSpellKnown(Aff_Ability.CorruptionRank9) then _Corruption = Aff_Ability.CorruptionRank9;	
elseif IsSpellKnown(Aff_Ability.CorruptionRank8) then _Corruption = Aff_Ability.CorruptionRank8;
elseif IsSpellKnown(Aff_Ability.CorruptionRank7) then _Corruption = Aff_Ability.CorruptionRank7;
elseif IsSpellKnown(Aff_Ability.CorruptionRank6) then _Corruption = Aff_Ability.CorruptionRank6;
elseif IsSpellKnown(Aff_Ability.CorruptionRank5) then _Corruption = Aff_Ability.CorruptionRank5;
elseif IsSpellKnown(Aff_Ability.CorruptionRank4) then _Corruption = Aff_Ability.CorruptionRank4;
elseif IsSpellKnown(Aff_Ability.CorruptionRank3) then _Corruption = Aff_Ability.CorruptionRank3;
elseif IsSpellKnown(Aff_Ability.CorruptionRank2) then _Corruption = Aff_Ability.CorruptionRank2; end

if IsSpellKnown(Aff_Ability.CurseofAgonyRank9) then _CurseofAgony = Aff_Ability.CurseofAgonyRank9;	
elseif IsSpellKnown(Aff_Ability.CurseofAgonyRank8) then _CurseofAgony = Aff_Ability.CurseofAgonyRank8;	
elseif IsSpellKnown(Aff_Ability.CurseofAgonyRank7) then _CurseofAgony = Aff_Ability.CurseofAgonyRank7;
elseif IsSpellKnown(Aff_Ability.CurseofAgonyRank6) then _CurseofAgony = Aff_Ability.CurseofAgonyRank6;
elseif IsSpellKnown(Aff_Ability.CurseofAgonyRank5) then _CurseofAgony = Aff_Ability.CurseofAgonyRank5;
elseif IsSpellKnown(Aff_Ability.CurseofAgonyRank4) then _CurseofAgony = Aff_Ability.CurseofAgonyRank4;
elseif IsSpellKnown(Aff_Ability.CurseofAgonyRank3) then _CurseofAgony = Aff_Ability.CurseofAgonyRank3;
elseif IsSpellKnown(Aff_Ability.CurseofAgonyRank2) then _CurseofAgony = Aff_Ability.CurseofAgonyRank2; end

if IsSpellKnown(Aff_Ability.CurseofDoomRank3) then _CurseofDoom = Aff_Ability.CurseofDoomRank3;	
elseif IsSpellKnown(Aff_Ability.CurseofDoomRank2) then _CurseofDoom = Aff_Ability.CurseofDoomRank2; end

if IsSpellKnown(Aff_Ability.CurseofTonguesRank2) then _CurseofTongues = Aff_Ability.CurseofTonguesRank2; end

if IsSpellKnown(Aff_Ability.CurseoftheElementsRank5) then _CurseoftheElements = Aff_Ability.CurseoftheElementsRank5;	
elseif IsSpellKnown(Aff_Ability.CurseoftheElementsRank4) then _CurseoftheElements = Aff_Ability.CurseoftheElementsRank4;
elseif IsSpellKnown(Aff_Ability.CurseoftheElementsRank3) then _CurseoftheElements = Aff_Ability.CurseoftheElementsRank3;
elseif IsSpellKnown(Aff_Ability.CurseoftheElementsRank2) then _CurseoftheElements = Aff_Ability.CurseoftheElementsRank2; end

if IsSpellKnown(Aff_Ability.CurseofWeaknessRank9) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank9;	
elseif IsSpellKnown(Aff_Ability.CurseofWeaknessRank8) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank8;
elseif IsSpellKnown(Aff_Ability.CurseofWeaknessRank7) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank7;
elseif IsSpellKnown(Aff_Ability.CurseofWeaknessRank6) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank6;
elseif IsSpellKnown(Aff_Ability.CurseofWeaknessRank5) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank5;
elseif IsSpellKnown(Aff_Ability.CurseofWeaknessRank4) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank4;
elseif IsSpellKnown(Aff_Ability.CurseofWeaknessRank3) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank3;
elseif IsSpellKnown(Aff_Ability.CurseofWeaknessRank2) then _CurseofWeakness = Aff_Ability.CurseofWeaknessRank2; end

if IsSpellKnown(Aff_Ability.DarkPactRank4) then _DarkPact = Aff_Ability.DarkPactRank4;
elseif IsSpellKnown(Aff_Ability.DarkPactRank3) then _DarkPact = Aff_Ability.DarkPactRank3;
elseif IsSpellKnown(Aff_Ability.DarkPactRank2) then _DarkPact = Aff_Ability.DarkPactRank2; end

if IsSpellKnown(Aff_Ability.DeathCoilRank6) then _DeathCoil = Aff_Ability.DeathCoilRank6;	
elseif IsSpellKnown(Aff_Ability.DeathCoilRank5) then _DeathCoil = Aff_Ability.DeathCoilRank5;	
elseif IsSpellKnown(Aff_Ability.DeathCoilRank4) then _DeathCoil = Aff_Ability.DeathCoilRank4;
elseif IsSpellKnown(Aff_Ability.DeathCoilRank3) then _DeathCoil = Aff_Ability.DeathCoilRank3;
elseif IsSpellKnown(Aff_Ability.DeathCoilRank2) then _DeathCoil = Aff_Ability.DeathCoilRank2; end

if IsSpellKnown(Aff_Ability.DrainLifeRank9) then _DrainLife = Aff_Ability.DrainLifeRank9;	
elseif IsSpellKnown(Aff_Ability.DrainLifeRank8) then _DrainLife = Aff_Ability.DrainLifeRank8;
elseif IsSpellKnown(Aff_Ability.DrainLifeRank7) then _DrainLife = Aff_Ability.DrainLifeRank7;
elseif IsSpellKnown(Aff_Ability.DrainLifeRank6) then _DrainLife = Aff_Ability.DrainLifeRank6;
elseif IsSpellKnown(Aff_Ability.DrainLifeRank5) then _DrainLife = Aff_Ability.DrainLifeRank5;
elseif IsSpellKnown(Aff_Ability.DrainLifeRank4) then _DrainLife = Aff_Ability.DrainLifeRank4;
elseif IsSpellKnown(Aff_Ability.DrainLifeRank3) then _DrainLife = Aff_Ability.DrainLifeRank3;
elseif IsSpellKnown(Aff_Ability.DrainLifeRank2) then _DrainLife = Aff_Ability.DrainLifeRank2; end

if IsSpellKnown(Aff_Ability.DrainSoulRank6) then _DrainSoul = Aff_Ability.DrainSoulRank6;	
elseif IsSpellKnown(Aff_Ability.DrainSoulRank5) then _DrainSoul = Aff_Ability.DrainSoulRank5;
elseif IsSpellKnown(Aff_Ability.DrainSoulRank4) then _DrainSoul = Aff_Ability.DrainSoulRank4;
elseif IsSpellKnown(Aff_Ability.DrainSoulRank3) then _DrainSoul = Aff_Ability.DrainSoulRank3;
elseif IsSpellKnown(Aff_Ability.DrainSoulRank2) then _DrainSoul = Aff_Ability.DrainSoulRank2; end	

if IsSpellKnown(Aff_Ability.FearRank3) then _Fear = Aff_Ability.FearRank3;
elseif IsSpellKnown(Aff_Ability.FearRank2) then _Fear = Aff_Ability.FearRank2; end

if IsSpellKnown(Aff_Ability.HauntRank4) then _Haunt = Aff_Ability.HauntRank4;
elseif IsSpellKnown(Aff_Ability.HauntRank3) then _Haunt = Aff_Ability.HauntRank3;
elseif IsSpellKnown(Aff_Ability.HauntRank2) then _Haunt = Aff_Ability.HauntRank2; end

if IsSpellKnown(Aff_Ability.HowlofTerrorRank2) then _HowlofTerror = Aff_Ability.HowlofTerrorRank2; end

if IsSpellKnown(Aff_Ability.SeedofCorruptionRank3) then _SeedofCorruption = Aff_Ability.SeedofCorruptionRank3;	
elseif IsSpellKnown(Aff_Ability.SeedofCorruptionRank2) then _SeedofCorruption = Aff_Ability.SeedofCorruptionRank2;	
elseif IsSpellKnown(Aff_Ability.SeedofCorruptionRank1) then _SeedofCorruption = Aff_Ability.SeedofCorruptionRank1; end

if IsSpellKnown(Aff_Ability.LifeTapRank8) then _LifeTap = Aff_Ability.LifeTapRank8;	
elseif IsSpellKnown(Aff_Ability.LifeTapRank7) then _LifeTap = Aff_Ability.LifeTapRank7;
elseif IsSpellKnown(Aff_Ability.LifeTapRank6) then _LifeTap = Aff_Ability.LifeTapRank6;
elseif IsSpellKnown(Aff_Ability.LifeTapRank5) then _LifeTap = Aff_Ability.LifeTapRank5;
elseif IsSpellKnown(Aff_Ability.LifeTapRank4) then _LifeTap = Aff_Ability.LifeTapRank4;
elseif IsSpellKnown(Aff_Ability.LifeTapRank3) then _LifeTap = Aff_Ability.LifeTapRank3;
elseif IsSpellKnown(Aff_Ability.LifeTapRank2) then _LifeTap = Aff_Ability.LifeTapRank2; end

if IsSpellKnown(Aff_Ability.UnstableAfflictionRank5) then _UnstableAffliction = Aff_Ability.UnstableAfflictionRank5;
elseif IsSpellKnown(Aff_Ability.UnstableAfflictionRank4) then _UnstableAffliction = Aff_Ability.UnstableAfflictionRank4;
elseif IsSpellKnown(Aff_Ability.UnstableAfflictionRank3) then _UnstableAffliction = Aff_Ability.UnstableAfflictionRank3;
elseif IsSpellKnown(Aff_Ability.UnstableAfflictionRank2) then _UnstableAffliction = Aff_Ability.UnstableAfflictionRank2; end

--Demonology
if IsSpellKnown(Demo_Ability.BanishRank2) then _Banish = Demo_Ability.BanishRank2; end

if IsSpellKnown(Demo_Ability.CreateFirestoneRank7) then _CreateFirestone = Demo_Ability.CreateFirestoneRank7;	
elseif IsSpellKnown(Demo_Ability.CreateFirestoneRank6) then _CreateFirestone = Demo_Ability.CreateFirestoneRank6;	
elseif IsSpellKnown(Demo_Ability.CreateFirestoneRank5) then _CreateFirestone = Demo_Ability.CreateFirestoneRank5;
elseif IsSpellKnown(Demo_Ability.CreateFirestoneRank4) then _CreateFirestone = Demo_Ability.CreateFirestoneRank4;
elseif IsSpellKnown(Demo_Ability.CreateFirestoneRank3) then _CreateFirestone = Demo_Ability.CreateFirestoneRank3;
elseif IsSpellKnown(Demo_Ability.CreateFirestoneRank2) then _CreateFirestone = Demo_Ability.CreateFirestoneRank2; end

if IsSpellKnown(Demo_Ability.CreateHealthstoneRank8) then _CreateHealthstone = Demo_Ability.CreateHealthstoneRank8;	
elseif IsSpellKnown(Demo_Ability.CreateHealthstoneRank7) then _CreateHealthstone = Demo_Ability.CreateHealthstoneRank7;	
elseif IsSpellKnown(Demo_Ability.CreateHealthstoneRank6) then _CreateHealthstone = Demo_Ability.CreateHealthstoneRank6;
elseif IsSpellKnown(Demo_Ability.CreateHealthstoneRank5) then _CreateHealthstone = Demo_Ability.CreateHealthstoneRank5;
elseif IsSpellKnown(Demo_Ability.CreateHealthstoneRank4) then _CreateHealthstone = Demo_Ability.CreateHealthstoneRank4;
elseif IsSpellKnown(Demo_Ability.CreateHealthstoneRank3) then _CreateHealthstone = Demo_Ability.CreateHealthstoneRank3;
elseif IsSpellKnown(Demo_Ability.CreateHealthstoneRank2) then _CreateHealthstone = Demo_Ability.CreateHealthstoneRank2; end

if IsSpellKnown(Demo_Ability.CreateSoulstoneRank7) then _CreateSoulstone = Demo_Ability.CreateSoulstoneRank7;	
elseif IsSpellKnown(Demo_Ability.CreateSoulstoneRank6) then _CreateSoulstone = Demo_Ability.CreateSoulstoneRank6;
elseif IsSpellKnown(Demo_Ability.CreateSoulstoneRank5) then _CreateSoulstone = Demo_Ability.CreateSoulstoneRank5;
elseif IsSpellKnown(Demo_Ability.CreateSoulstoneRank4) then _CreateSoulstone = Demo_Ability.CreateSoulstoneRank4;
elseif IsSpellKnown(Demo_Ability.CreateSoulstoneRank3) then _CreateSoulstone = Demo_Ability.CreateSoulstoneRank3;
elseif IsSpellKnown(Demo_Ability.CreateSoulstoneRank2) then _CreateSoulstone = Demo_Ability.CreateSoulstoneRank2; end

if IsSpellKnown(Demo_Ability.CreateSpellstoneRank4) then _CreateSpellstone = Demo_Ability.CreateSpellstoneRank4;
elseif IsSpellKnown(Demo_Ability.CreateSpellstoneRank3) then _CreateSpellstone = Demo_Ability.CreateSpellstoneRank3;
elseif IsSpellKnown(Demo_Ability.CreateSpellstoneRank2) then _CreateSpellstone = Demo_Ability.CreateSpellstoneRank2; end

if IsSpellKnown(Demo_Ability.FelArmorRank4) then _DemonArmor = Demo_Ability.FelArmorRank4;	
elseif IsSpellKnown(Demo_Ability.FelArmorRank3) then _DemonArmor = Demo_Ability.FelArmorRank3;	
elseif IsSpellKnown(Demo_Ability.FelArmorRank2) then _DemonArmor = Demo_Ability.FelArmorRank2;
elseif IsSpellKnown(Demo_Ability.FelArmorRank1) then _DemonArmor = Demo_Ability.FelArmorRank1;
elseif IsSpellKnown(Demo_Ability.DemonArmorRank6) then _DemonArmor = Demo_Ability.DemonArmorRank6;
elseif IsSpellKnown(Demo_Ability.DemonArmorRank5) then _DemonArmor = Demo_Ability.DemonArmorRank5;
elseif IsSpellKnown(Demo_Ability.DemonArmorRank4) then _DemonArmor = Demo_Ability.DemonArmorRank4;
elseif IsSpellKnown(Demo_Ability.DemonArmorRank3) then _DemonArmor = Demo_Ability.DemonArmorRank3;
elseif IsSpellKnown(Demo_Ability.DemonArmorRank2) then _DemonArmor = Demo_Ability.DemonArmorRank2;
elseif IsSpellKnown(Demo_Ability.DemonArmorRank1) then _DemonArmor = Demo_Ability.DemonArmorRank1;
elseif IsSpellKnown(Demo_Ability.DemonSkinRank2) then _DemonArmor = Demo_Ability.DemonSkinRank2; end	

if IsSpellKnown(Demo_Ability.HealthFunnelRank9) then _HealthFunnel = Demo_Ability.HealthFunnelRank9;	
elseif IsSpellKnown(Demo_Ability.HealthFunnelRank8) then _HealthFunnel = Demo_Ability.HealthFunnelRank8;
elseif IsSpellKnown(Demo_Ability.HealthFunnelRank7) then _HealthFunnel = Demo_Ability.HealthFunnelRank7;
elseif IsSpellKnown(Demo_Ability.HealthFunnelRank6) then _HealthFunnel = Demo_Ability.HealthFunnelRank6;
elseif IsSpellKnown(Demo_Ability.HealthFunnelRank5) then _HealthFunnel = Demo_Ability.HealthFunnelRank5;
elseif IsSpellKnown(Demo_Ability.HealthFunnelRank4) then _HealthFunnel = Demo_Ability.HealthFunnelRank4;
elseif IsSpellKnown(Demo_Ability.HealthFunnelRank3) then _HealthFunnel = Demo_Ability.HealthFunnelRank3;
elseif IsSpellKnown(Demo_Ability.HealthFunnelRank2) then _HealthFunnel = Demo_Ability.HealthFunnelRank2; end

if IsSpellKnown(Demo_Ability.ShadowWardRank6) then _ShadowWard = Demo_Ability.ShadowWardRank6;
elseif IsSpellKnown(Demo_Ability.ShadowWardRank5) then _ShadowWard = Demo_Ability.ShadowWardRank5;
elseif IsSpellKnown(Demo_Ability.ShadowWardRank4) then _ShadowWard = Demo_Ability.ShadowWardRank4;
elseif IsSpellKnown(Demo_Ability.ShadowWardRank3) then _ShadowWard = Demo_Ability.ShadowWardRank3;
elseif IsSpellKnown(Demo_Ability.ShadowWardRank2) then _ShadowWard = Demo_Ability.ShadowWardRank2; end

--renamed from EnslaveDemon to Subjugate Demon	
if IsSpellKnown(Demo_Ability.SubjagateDemonRank3) then _SubjagateDemon = Demo_Ability.SubjagateDemonRank3;
elseif IsSpellKnown(Demo_Ability.SubjagateDemonRank2) then _SubjagateDemon = Demo_Ability.SubjagateDemonRank2; end

--Destruction
if IsSpellKnown(Dest_Ability.ChaosBoltRank4) then _ChaosBolt = Dest_Ability.ChaosBoltRank4;
elseif IsSpellKnown(Dest_Ability.ChaosBoltRank3) then _ChaosBolt = Dest_Ability.ChaosBoltRank3;
elseif IsSpellKnown(Dest_Ability.ChaosBoltRank2) then _ChaosBolt = Dest_Ability.ChaosBoltRank2; end

if IsSpellKnown(Dest_Ability.HellfireRank5) then _Hellfire = Dest_Ability.HellfireRank5;	
elseif IsSpellKnown(Dest_Ability.HellfireRank4) then _Hellfire = Dest_Ability.HellfireRank4;
elseif IsSpellKnown(Dest_Ability.HellfireRank3) then _Hellfire = Dest_Ability.HellfireRank3;
elseif IsSpellKnown(Dest_Ability.HellfireRank2) then _Hellfire = Dest_Ability.HellfireRank2; end

if IsSpellKnown(Dest_Ability.ImmolateRank11) then _Immolate = Dest_Ability.ImmolateRank11;	
elseif IsSpellKnown(Dest_Ability.ImmolateRank10) then _Immolate = Dest_Ability.ImmolateRank10;	
elseif IsSpellKnown(Dest_Ability.ImmolateRank9) then _Immolate = Dest_Ability.ImmolateRank9;
elseif IsSpellKnown(Dest_Ability.ImmolateRank8) then _Immolate = Dest_Ability.ImmolateRank8;
elseif IsSpellKnown(Dest_Ability.ImmolateRank7) then _Immolate = Dest_Ability.ImmolateRank7;
elseif IsSpellKnown(Dest_Ability.ImmolateRank6) then _Immolate = Dest_Ability.ImmolateRank6;
elseif IsSpellKnown(Dest_Ability.ImmolateRank5) then _Immolate = Dest_Ability.ImmolateRank5;
elseif IsSpellKnown(Dest_Ability.ImmolateRank4) then _Immolate = Dest_Ability.ImmolateRank4;
elseif IsSpellKnown(Dest_Ability.ImmolateRank3) then _Immolate = Dest_Ability.ImmolateRank3;
elseif IsSpellKnown(Dest_Ability.ImmolateRank2) then _Immolate = Dest_Ability.ImmolateRank2; end	

if IsSpellKnown(Dest_Ability.IncinerateRank4) then _Incinerate = Dest_Ability.IncinerateRank4;
elseif IsSpellKnown(Dest_Ability.IncinerateRank3) then _Incinerate = Dest_Ability.IncinerateRank3;
elseif IsSpellKnown(Dest_Ability.IncinerateRank2) then _Incinerate = Dest_Ability.IncinerateRank2; end

if IsSpellKnown(Dest_Ability.RainofFireRank7) then _RainofFire = Dest_Ability.RainofFireRank7;	
elseif IsSpellKnown(Dest_Ability.RainofFireRank6) then _RainofFire = Dest_Ability.RainofFireRank6;	
elseif IsSpellKnown(Dest_Ability.RainofFireRank5) then _RainofFire = Dest_Ability.RainofFireRank5;
elseif IsSpellKnown(Dest_Ability.RainofFireRank4) then _RainofFire = Dest_Ability.RainofFireRank4;
elseif IsSpellKnown(Dest_Ability.RainofFireRank3) then _RainofFire = Dest_Ability.RainofFireRank3;
elseif IsSpellKnown(Dest_Ability.RainofFireRank2) then _RainofFire = Dest_Ability.RainofFireRank2; end	

if IsSpellKnown(Dest_Ability.SearingPainRank10) then _SearingPain = Dest_Ability.SearingPainRank10;	
elseif IsSpellKnown(Dest_Ability.SearingPainRank9) then _SearingPain = Dest_Ability.SearingPainRank9;	
elseif IsSpellKnown(Dest_Ability.SearingPainRank8) then _SearingPain = Dest_Ability.SearingPainRank8;
elseif IsSpellKnown(Dest_Ability.SearingPainRank7) then _SearingPain = Dest_Ability.SearingPainRank7;
elseif IsSpellKnown(Dest_Ability.SearingPainRank6) then _SearingPain = Dest_Ability.SearingPainRank6;
elseif IsSpellKnown(Dest_Ability.SearingPainRank5) then _SearingPain = Dest_Ability.SearingPainRank5;
elseif IsSpellKnown(Dest_Ability.SearingPainRank4) then _SearingPain = Dest_Ability.SearingPainRank4;
elseif IsSpellKnown(Dest_Ability.SearingPainRank3) then _SearingPain = Dest_Ability.SearingPainRank3;
elseif IsSpellKnown(Dest_Ability.SearingPainRank2) then _SearingPain = Dest_Ability.SearingPainRank2; end

if IsSpellKnown(Dest_Ability.ShadowBoltRank13) then _ShadowBolt = Dest_Ability.ShadowBoltRank13;	
elseif IsSpellKnown(Dest_Ability.ShadowBoltRank12) then _ShadowBolt = Dest_Ability.ShadowBoltRank12;	
elseif IsSpellKnown(Dest_Ability.ShadowBoltRank11) then _ShadowBolt = Dest_Ability.ShadowBoltRank11;
elseif IsSpellKnown(Dest_Ability.ShadowBoltRank10) then _ShadowBolt = Dest_Ability.ShadowBoltRank10;
elseif IsSpellKnown(Dest_Ability.ShadowBoltRank9) then _ShadowBolt = Dest_Ability.ShadowBoltRank9;
elseif IsSpellKnown(Dest_Ability.ShadowBoltRank8) then _ShadowBolt = Dest_Ability.ShadowBoltRank8;
elseif IsSpellKnown(Dest_Ability.ShadowBoltRank7) then _ShadowBolt = Dest_Ability.ShadowBoltRank7;	
elseif IsSpellKnown(Dest_Ability.ShadowBoltRank6) then _ShadowBolt = Dest_Ability.ShadowBoltRank6;
elseif IsSpellKnown(Dest_Ability.ShadowBoltRank5) then _ShadowBolt = Dest_Ability.ShadowBoltRank5;
elseif IsSpellKnown(Dest_Ability.ShadowBoltRank4) then _ShadowBolt = Dest_Ability.ShadowBoltRank4;
elseif IsSpellKnown(Dest_Ability.ShadowBoltRank3) then _ShadowBolt = Dest_Ability.ShadowBoltRank3;
elseif IsSpellKnown(Dest_Ability.ShadowBoltRank2) then _ShadowBolt = Dest_Ability.ShadowBoltRank2; end

if IsSpellKnown(Dest_Ability.ShadowburnRank8) then _Shadowburn = Dest_Ability.ShadowburnRank8;
elseif IsSpellKnown(Dest_Ability.ShadowburnRank7) then _Shadowburn = Dest_Ability.ShadowburnRank7;
elseif IsSpellKnown(Dest_Ability.ShadowburnRank6) then _Shadowburn = Dest_Ability.ShadowburnRank6;
elseif IsSpellKnown(Dest_Ability.ShadowburnRank5) then _Shadowburn = Dest_Ability.ShadowburnRank5;
elseif IsSpellKnown(Dest_Ability.ShadowburnRank4) then _Shadowburn = Dest_Ability.ShadowburnRank4;
elseif IsSpellKnown(Dest_Ability.ShadowburnRank3) then _Shadowburn = Dest_Ability.ShadowburnRank3;
elseif IsSpellKnown(Dest_Ability.ShadowburnRank2) then _Shadowburn = Dest_Ability.ShadowburnRank2; end

if IsSpellKnown(Dest_Ability.ShadowFlameRank2) then _ShadowFlame = Dest_Ability.ShadowFlameRank2;	end

if IsSpellKnown(Dest_Ability.SoulFireRank6) then _SoulFire = Dest_Ability.SoulFireRank6;	
elseif IsSpellKnown(Dest_Ability.SoulFireRank5) then _SoulFire = Dest_Ability.SoulFireRank5;	
elseif IsSpellKnown(Dest_Ability.SoulFireRank4) then _SoulFire = Dest_Ability.SoulFireRank4;
elseif IsSpellKnown(Dest_Ability.SoulFireRank3) then _SoulFire = Dest_Ability.SoulFireRank3;
elseif IsSpellKnown(Dest_Ability.SoulFireRank2) then _SoulFire = Dest_Ability.SoulFireRank2; end

if IsSpellKnown(Dest_Ability.ShadowfuryRank5) then _Shadowfury = Dest_Ability.ShadowfuryRank5;
elseif IsSpellKnown(Dest_Ability.ShadowfuryRank4) then _Shadowfury = Dest_Ability.ShadowfuryRank4;
elseif IsSpellKnown(Dest_Ability.ShadowfuryRank3) then _Shadowfury = Dest_Ability.ShadowfuryRank3;
elseif IsSpellKnown(Dest_Ability.ShadowfuryRank2) then _Shadowfury = Dest_Ability.ShadowfuryRank2; end
	
ids.optionMaxIds = {
	--Affliction
	Corruption = _Corruption, 
	CurseofAgony = _CurseofAgony, 
	CurseofDoom = _CurseofDoom, 
	CurseofTongues = _CurseofTongues, 
	CurseofExhaustion = _CurseofExhaustion, 
	CurseoftheElements = _CurseoftheElements, 
	CurseofWeakness = _CurseofWeakness, 
	DarkPact = _DarkPact, 
	DeathCoil = _DeathCoil, 
	DrainLife = _DrainLife, 
	DrainMana = _DrainMana, 
	DrainSoul = _DrainSoul, 
	Fear = _Fear, 
	Haunt = _Haunt, 
	HowlofTerror = _HowlofTerror, 
	LifeTap = _LifeTap, 
	LifeTapRank1 = _LifeTapRank1, 
	SeedofCorruption = _SeedofCorruption, 
	UnstableAffliction = _UnstableAffliction, 
	--Demonology
	Banish = _Banish,
	CreateFirestone = _CreateFirestone,
	CreateHealthstone = _CreateHealthstone,
	CreateSoulstone = _CreateSoulstone,
	CreateSpellstone = _CreateSpellstone,
	DemonArmor = _DemonArmor,
	DetectInvisibility = _DetectInvisibility,
	HealthFunnel = _HealthFunnel,
	Metamorphosis = _Metamorphosis,
	ShadowWard = _ShadowWard,
	SubjagateDemon = _SubjagateDemon,
	--Destruction
	ChaosBolt = _ChaosBolt,
	Conflagrate = _Conflagrate,
	Hellfire = _Hellfire,
	Immolate = _Immolate,
	Incinerate = _Incinerate,
	RainofFire = _RainofFire,
	SearingPain = _SearingPain,
	ShadowBolt = _ShadowBolt,
	ShadowBoltRank1 = _ShadowBoltRank1,
	Shadowburn = _Shadowburn,
	SoulFire = _SoulFire,
	Shadowfury = _Shadowfury,
	ShadowFlame = _ShadowFlame
}
end
ConROC:UpdateSpellID()

function ConROC:EnableRotationModule()
	self.Description = 'Warlock';
	self.NextSpell = ConROC.Warlock.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self:RegisterEvent("PLAYER_TALENT_UPDATE");
	self.lastSpellId = 0;	
	
	ConROC:SpellmenuClass();
end
function ConROC:PLAYER_TALENT_UPDATE()
	ConROC:SpecUpdate();
    ConROC:closeSpellmenu();
end
function ConROC.Warlock.Damage(_, timeShift, currentSpell, gcd)
ConROC:UpdateSpellID()
--Character
	local plvl 												= UnitLevel('player');
--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent 										= math.max(0, mana) / math.max(1, manaMax) * 100;
	local soulShards										= GetItemCount(6265);
	local hasDec, deccurrentRank, decmaxRank, decName, decTier = ConROC:TalentChosen(Spec.Demonology, Demo_Talent.Decimation)
	if hasDec then
		local decRank = "DecimationRank"..deccurrentRank
		local decBUFF 										= ConROC:Buff(Player_Buff[decRank], timeShift);
	end

--Abilities
	local dLifeRDY											= ConROC:AbilityReady(_DrainLife, timeShift);
	local ampCurseRDY										= ConROC:AbilityReady(Aff_Ability.AmplifyCurse, timeShift);
	local corrRDY											= ConROC:AbilityReady(_Corruption, timeShift);
		local corrDEBUFF										= ConROC:TargetDebuff(_Corruption);
		local mcoreBUFF											= ConROC:Buff(Player_Buff.MoltenCore, timeShift);
	local cofaRDY											= ConROC:AbilityReady(_CurseofAgony, timeShift);
		local cofaDEBUFF										= ConROC:TargetDebuff(_CurseofAgony);
	local cofdRDY											= ConROC:AbilityReady(_CurseofDoom, timeShift);
		local cofdDEBUFF										= ConROC:TargetDebuff(_CurseofDoom);		
	local cofeRDY											= ConROC:AbilityReady(Aff_Ability.CurseofExhaustion, timeShift);
		local cofeDEBUFF										= ConROC:TargetDebuff(Aff_Ability.CurseofExhaustion);			
	local coftRDY											= ConROC:AbilityReady(_CurseofTongues, timeShift);
		local coftDEBUFF										= ConROC:TargetDebuff(_CurseofTongues);		
	local cofteRDY											= ConROC:AbilityReady(_CurseoftheElements, timeShift);
		local cofteDEBUFF										= ConROC:TargetDebuff(_CurseoftheElements);
	local cofwRDY											= ConROC:AbilityReady(_CurseofWeakness, timeShift);
		local cofwDEBUFF										= ConROC:TargetDebuff(_CurseofWeakness);
	local dPactRDY											= ConROC:AbilityReady(_DarkPact, timeShift);
	local dCoilRDY											= ConROC:AbilityReady(_DeathCoil, timeShift);
	local dManaRDY											= ConROC:AbilityReady(_DrainMana, timeShift);
	local dSoulRDY											= ConROC:AbilityReady(_DrainSoul, timeShift);
	local fearRDY											= ConROC:AbilityReady(_Fear, timeShift);	
	local hoftRDY											= ConROC:AbilityReady(_HowlofTerror, timeShift);	
	local lTapRDY											= ConROC:AbilityReady(_LifeTap, timeShift);
	local seedRDY											= ConROC:AbilityReady(_SeedofCorruption, timeShift);
		local seedDEBUFF										= ConROC:TargetDebuff(_SeedofCorruption);
	local unsAffRDY											= ConROC:AbilityReady(_UnstableAffliction, timeShift);
		local unsAffDEBUFF										= ConROC:TargetDebuff(_UnstableAffliction);

	local banishRDY											= ConROC:AbilityReady(_Banish, timeShift);	
	local cFirestoneRDY										= ConROC:AbilityReady(_CreateFirestone, timeShift);	
	local cHealthstoneRDY									= ConROC:AbilityReady(_CreateHealthstone, timeShift);	
	local cSoulstoneRDY										= ConROC:AbilityReady(_CreateSoulstone, timeShift);	
	local cSpellstoneRDY									= ConROC:AbilityReady(_CreateSpellstone, timeShift);	
	local detInvisRDY										= ConROC:AbilityReady(_DetectInvisibility, timeShift);
	local subDemonRDY										= ConROC:AbilityReady(_SubjagateDemon, timeShift);	
	local felDomRDY											= ConROC:AbilityReady(Demo_Ability.FelDomination, timeShift);
	local sumFelhRDY										= ConROC:AbilityReady(Demo_Ability.SummonFelhunter, timeShift);
	local sumImpRDY											= ConROC:AbilityReady(Demo_Ability.SummonImp, timeShift);
	local sumInfernoRDY										= ConROC:AbilityReady(_Inferno, timeShift);
	local sumSucRDY											= ConROC:AbilityReady(Demo_Ability.SummonSuccubus, timeShift);
	local sumVoidRDY										= ConROC:AbilityReady(Demo_Ability.SummonVoidwalker, timeShift);
	local sumIncRDY											= ConROC:AbilityReady(Demo_Ability.SummonIncubus, timeShift);
	local sumFelgRDY										= ConROC:AbilityReady(Demo_Ability.SummonFelguard, timeShift);

	local metaRDY											= ConROC:AbilityReady(Demo_Ability.Metamorphosis, timeShift);

	local confRDY											= ConROC:AbilityReady(_Conflagrate, timeShift);	
	local hfireRDY											= ConROC:AbilityReady(_Hellfire, timeShift);
	local immoRDY											= ConROC:AbilityReady(_Immolate, timeShift);
		local immoDEBUFF, _, immoEXP							= ConROC:TargetDebuff(_Immolate, timeShift, timeExp);
	local incRDY											= ConROC:AbilityReady(_Incinerate, timeShift)
	local roffireRDY										= ConROC:AbilityReady(_RainofFire, timeShift);
	local sPainRDY											= ConROC:AbilityReady(_SearingPain, timeShift);
	local sBoltRDY											= ConROC:AbilityReady(_ShadowBolt, timeShift);
		local sTranceBUFF										= ConROC:Buff(Player_Buff.ShadowTrance, timeShift);
	local cBoltRDY											= ConROC:AbilityReady(_ChaosBolt, timeShift);
	local sflameRDY											= ConROC:AbilityReady(_ShadowFlame, timeShift);
		local sflameDEBUFF										= ConROC:TargetDebuff(_ShadowFlame);
	local sfuryRDY											= ConROC:AbilityReady(_Shadowfury, timeShift);
	local sburnRDY											= ConROC:AbilityReady(_Shadowburn, timeShift);
	local sfireRDY											= ConROC:AbilityReady(_SoulFire, timeShift);
	local hauntRDY											= ConROC:AbilityReady(_Haunt, timeShift);
		local hauntDEBUFF										= ConROC:TargetDebuff(_Haunt);
		local lifeTapBUFF										= ConROC:Buff(Player_Buff.LifeTap, timeShift);
		local sotdBUFF										= ConROC:Buff(Player_Buff.SpiritsoftheDamned, timeShift);
		local iothDEBUFF, iothCount							= ConROC:Buff(Player_Buff.IllustrationoftheDragonSoul, timeShift);

--Conditions		
	local summoned 											= ConROC:CallPet();
	local assist 											= ConROC:PetAssist();
	local moving 											= ConROC:PlayerSpeed();
	local incombat 											= UnitAffectingCombat('player');
	local inmelee											= CheckInteractDistance("target", 3);
	local targetPh 											= ConROC:PercentHealth('target');	
	local playerPh 											= ConROC:PercentHealth('player');	
	local hasWand											= HasWandEquipped();
	local tarHasMana 										= UnitPower('target', Enum.PowerType.Mana);

--Indicators
	ConROC:AbilityBurst(_SoulFire, sfireRDY);
	ConROC:AbilityBurst(Aff_Ability.AmplifyCurse, ampCurseRDY and (ConROC:CheckBox(ConROC_SM_Curse_Weakness) or ConROC:CheckBox(ConROC_SM_Curse_Agony)));

--Warnings
	if not assist and summoned and incombat then
		ConROC:Warnings("Pet is NOT attacking!!!", true);		
	end
--Rotations	
	--Demons--
	if ConROC:CheckBox(ConROC_SM_Demon_Felhunter) and sumFelhRDY and not summoned then
		return Demo_Ability.SummonFelhunter;
	end

	if ConROC:CheckBox(ConROC_SM_Demon_Imp) and sumImpRDY and not summoned then
		return Demo_Ability.SummonImp;
	end

	if ConROC:CheckBox(ConROC_SM_Demon_Succubus) and sumSucRDY and not summoned then
		return Demo_Ability.SummonSuccubus;
	end

	if ConROC:CheckBox(ConROC_SM_Demon_Voidwalker) and sumVoidRDY and not summoned then
		return Demo_Ability.SummonVoidwalker;
	end

	if ConROC:CheckBox(ConROC_SM_Demon_Incubus) and sumIncRDY and not summoned then
		return Demo_Ability.SummonIncubus;
	end

	if ConROC:CheckBox(ConROC_SM_Demon_Felguard) and sumFelgRDY and not summoned then
		return Demo_Ability.SummonFelguard;
	end

	--spells
	if lTapRDY and manaPercent < 20 and playerPh >= 30 then
		return _LifeTap;
	end

	if dManaRDY and tarHasMana > 0 and manaPercent < 20 then
		return _DrainMana;
	end
	if dLifeRDY and playerPh <= 30 then
		return _DrainLife;
	end
	if IsEquippedItem(40432) and not UnitAffectingCombat("player") and iothCount <=9 and playerPh >= 30 and ConROC:CheckBox(ConROC_SM_Option_PrePull) and ConROC:TarHostile() and ConROC:IsGlyphActive(63320) then
		return _LifeTapRank1
	elseif not (sotdBUFF or lifeTapBUFF) and not UnitAffectingCombat("player") and playerPh >= 30 and ConROC:TarHostile() and ConROC:IsGlyphActive(63320) then
		return _LifeTapRank1;
	end

	if (currentSpecName == "Affliction") then
		if sBoltRDY and not UnitAffectingCombat("player") then
			return _ShadowBoltRank1
		end

		if sBoltRDY and sTranceBUFF then
			return _ShadowBolt;
		end

		if dSoulRDY and ((ConROC:Raidmob() and targetPh <= 5) or (not ConROC:Raidmob() and targetPh <= 20)) then
			return _DrainSoul;
		end 
		
		if ConROC:TalentChosen(Spec.Affliction, Aff_Talent.UnstableAffliction) and unsAffRDY and not unsAffDEBUFF then
			return _UnstableAffliction;
		end

		if ConROC:TalentChosen(Spec.Affliction, Aff_Talent.Haunt) and hauntRDY and not hauntDEBUFF then
			return _Haunt;
		end

		if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and corrRDY and not corrDEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
			return _Corruption;
		end

		--Curses
		if ConROC:CheckBox(ConROC_SM_Curse_Weakness) and cofwRDY and not cofwDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
			return _CurseofWeakness;
		end
		
		if ConROC:CheckBox(ConROC_SM_Curse_Agony) and cofaRDY and not cofaDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
			return _CurseofAgony;
		end

		if ConROC:CheckBox(ConROC_SM_Curse_Tongues) and coftRDY and not coftDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
			return _CurseofTongues;
		end

		if ConROC:CheckBox(ConROC_SM_Curse_Exhaustion) and cofeRDY and not cofeDEBUFF then 
			return Aff_Ability.CurseofExhaustion;
		end

		if ConROC:CheckBox(ConROC_SM_Curse_Elements) and cofteRDY and not cofteDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
			return _CurseoftheElements;
		end

		if ConROC:CheckBox(ConROC_SM_Curse_Doom) and cofdRDY and not cofdDEBUFF and ((ConROC:Raidmob() and targetPh >= 75) or (not ConROC:Raidmob() and targetPh == 100)) then 
			return _CurseofDoom;
		end	

		-- Metamorphosis 
		if ConROC:CheckBox(ConROC_SM_Option_Metamorphosis) and metaRDY and ConROC:TalentChosen(Spec.Demonology, Demo_Talent.Metamorphosis) and inMelee then
			return Demo_Ability.Metamorphosis;
		end
		
		if confRDY and immoDEBUFF or sflameDEBUFF then
			return _Conflagrate;
		end
		
		if cBoltRDY then
			return _ChaosBolt;
		end
		
		if incRDY and immoDEBUFF then
			return _Incinerate;
		end
		
		if sburnRDY and ((ConROC:Raidmob() and targetPh <= 5) or (not ConROC:Raidmob() and targetPh <= 20)) then
			return _Shadowburn;
		end
		
		if dSoulRDY and ConROC:SoulShards() < ConROC_SM_Option_SoulShard:GetNumber() and ((ConROC:Raidmob() and targetPh <= 5) or (not ConROC:Raidmob() and targetPh <= 20)) then --Soul Shard counter needed.
			return _DrainSoul;
		end

		if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_SeedofCorruption) and seedRDY and not seedDEBUFF then
			return _SeedofCorruption;
		end

		if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_Hellfire) and hfireRDY and inMelee and playerPh >= 30 then
			return _Hellfire;
		end
		
		if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_RainofFire) and roffireRDY then
			return _RainofFire;
		end

		if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and immoRDY and not immoDEBUFF and currentSpell ~= _Immolate and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
			return _Immolate;
		end

		if ConROC:CheckBox(ConROC_SM_Option_UseWand) and hasWand and (manaPercent <= 20 or targetPh <= 5) then
			return Caster.Shoot;
		end	
		
		if ConROC:CheckBox(ConROC_SM_Spell_ShadowBolt) and sBoltRDY then
			return _ShadowBolt;
		end
		
		if ConROC:CheckBox(ConROC_SM_Spell_SearingPain) and sPainRDY then
			return _SearingPain;
		end

		if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and corrRDY and not corrDEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
			return _Corruption;
		end
	elseif (currentSpecName == "Demonology") then
		if ConROC:CheckBox(ConROC_SM_Curse_Doom) and cofdRDY and not cofdDEBUFF and ((ConROC:Raidmob() and targetPh >= 75) or (not ConROC:Raidmob() and targetPh == 100)) then 
			return _CurseofDoom;
		end

		if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and corrRDY and not corrDEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
			return _Corruption;
		end		
		
		if sfireRDY and decBUFF then
			return _SoulFire
		end
		if incRDY and mcoreBUFF then
			return _Incinerate;
		end

		if ConROC:CheckBox(ConROC_SM_Spell_ShadowBolt) and sBoltRDY then
			return _ShadowBolt;
		end

	elseif (currentSpecName == "Destruction") then
		if ConROC_AoEButton:IsVisible() then
			if ConROC:CheckBox(ConROC_SM_AoE_SeedofCorruption) and seedRDY and not seedDEBUFF then
				return _SeedofCorruption;
			end
			if sfuryRDY then
				return _Shadowfury;
			end
			if sumInfernoRDY then
				return _Inferno;
			end
			if ConROC:CheckBox(ConROC_SM_AoE_Hellfire) and hfireRDY and inMelee and playerPh >= 30 then
				return _Hellfire;
			end			
			if ConROC:CheckBox(ConROC_SM_AoE_RainofFire) and roffireRDY then
				return _RainofFire;
			end
			if sflameRDY and inMelee then
				return _ShadowFlame;
			end
		end
		if sfireRDY and not UnitAffectingCombat("player") then
			return _SoulFire
		end

		if moving and ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and corrRDY and not corrDEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
			return _Corruption;
		end

		if ConROC:CheckBox(ConROC_SM_Curse_Doom) and cofdRDY and not cofdDEBUFF and ((ConROC:Raidmob() and targetPh >= 75) or (not ConROC:Raidmob() and targetPh == 100)) then 
			return _CurseofDoom;
		end
		if ConROC:CheckBox(ConROC_SM_Curse_Agony) and cofaRDY and not cofaDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
			return _CurseofAgony;
		end

		if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and immoRDY and not immoDEBUFF and currentSpell ~= _Immolate and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
			return _Immolate;
		end

		if confRDY and immoDEBUFF or sflameDEBUFF then
			return _Conflagrate;
		end
		
		if cBoltRDY and currentSpell ~= _Immolate then
			return _ChaosBolt;
		end
		
		if incRDY and immoDEBUFF and currentSpell ~= _Immolate then
			return _Incinerate;
		end

		if dSoulRDY and ConROC:SoulShards() < ConROC_SM_Option_SoulShard:GetNumber() and ((ConROC:Raidmob() and targetPh <= 5) or (not ConROC:Raidmob() and targetPh <= 20)) then --Soul Shard counter needed.
			return _DrainSoul;
		end
    elseif plvl < 10 then
        if sBoltRDY and not UnitAffectingCombat("player") then
            return _ShadowBoltRank
        end
        if sBoltRDY and sTranceBUFF then
            return _ShadowBolt;
        end
        if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and corrRDY and not corrDEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
            return _Corruption;
        end
        if ConROC:CheckBox(ConROC_SM_Curse_Weakness) and cofwRDY and not cofwDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
            return _CurseofWeakness;
        end
        
        if ConROC:CheckBox(ConROC_SM_Curse_Agony) and cofaRDY and not cofaDEBUFF and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then 
            return _CurseofAgony;
        end
        if ConROC:CheckBox(ConROC_SM_Debuff_Immolate) and immoRDY and not immoDEBUFF and currentSpell ~= _Immolate and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
            return _Immolate;
        end
        if ConROC:CheckBox(ConROC_SM_Spell_ShadowBolt) and sBoltRDY then
            return _ShadowBolt;
        end
        if ConROC:CheckBox(ConROC_SM_Debuff_Corruption) and corrRDY and not corrDEBUFF and currentSpell ~= _Corruption and ((ConROC:Raidmob() and targetPh >= 5) or (not ConROC:Raidmob() and targetPh >= 20)) then
            return _Corruption;
        end
        return nil;
	end
	return nil;
end

function ConROC.Warlock.Defense(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');

--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent 										= math.max(0, mana) / math.max(1, manaMax) * 100;
	local soulShards										= GetItemCount(6265);

--Abilities
	local dLifeRDY											= ConROC:AbilityReady(_DrainLife, timeShift);
	
	local dArmorRDY											= ConROC:AbilityReady(_DemonArmor, timeShift);
		local dArmorBUFF, _, dArmorDUR							= ConROC:Buff(_DemonArmor, timeShift);	
	local hFunnelRDY										= ConROC:AbilityReady(_HealthFunnel, timeShift);
	local sWardRDY											= ConROC:AbilityReady(_ShadowWard, timeShift);
		local sWardBUFF											= ConROC:Buff(_ShadowWard, timeShift);	
	local sLinkRDY											= ConROC:AbilityReady(Demo_Ability.SoulLink, timeShift);
		local sLinkBUFF											= ConROC:Buff(Demo_Ability.SoulLink, timeShift);	
		
--Conditions	
	local petPh												= ConROC:PercentHealth('pet');
	local summoned 											= ConROC:CallPet();
	local playerPh 											= ConROC:PercentHealth('player');	
	
--Rotations	
	if dArmorRDY and not dArmorBUFF then
		return _DemonArmor;
	end
	
	if sLinkRDY and not sLinkBUFF then
		return Demo_Ability.SoulLink;
	end	

	if dLifeRDY and playerPh <= 30 then
		return _DrainLife;
	end
	
	if hFunnelRDY and petPh <= 25 and playerPh >= 50 and not ConROC:TarYou() then
		return _HealthFunnel;
	end
	
	return nil;
end

function ConROC:SoulShards()
	local SoulShardItemID = 6265;
	local numShards = 0;
	for bag = 0, 4 do 
		for slot = C_Container.GetContainerNumSlots(bag), 1, -1 do
			if C_Container.GetContainerItemID(bag, slot) == SoulShardItemID then
				numShards = numShards + 1;
			end
		end
	end
	return numShards;
end