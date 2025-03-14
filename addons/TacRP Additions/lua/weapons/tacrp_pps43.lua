    SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "PPS-43"
SWEP.AbbrevName = "PPS"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "5Value"
SWEP.SubCatType = "3Submachine Gun"

SWEP.Description = [[A popular firearm amongst both civilian shooters and communists. Designed by Alexey Sudayev
 as a cheaper replacment of the PPSH-41 .]]

SWEP.Trivia_Caliber = "7.62x25mm"
SWEP.Trivia_Manufacturer = "Various"
SWEP.Trivia_Year = "1943"

SWEP.Faction = TacRP.FACTION_MILITIA
SWEP.Credits = "Assets: Bulkhead Interactive"

SWEP.ViewModel = "models/v_models/v_silenced_smg.mdl"
SWEP.WorldModel = "models/w_models/weapons/w_smg_a.mdl"

SWEP.Slot = 2

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 12,
        Damage_Min = 6,
        Range_Min = 800,
        Range_Max = 2000,
        RPM = 600,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 2,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
            [HITGROUP_GEAR] = 0.9
        },
    },
    [TacRP.BALANCE_PVE] = {
        Damage_Max = 8,
        Damage_Min = 4,
        RPM = 850,
    },
    [TacRP.BALANCE_OLDSCHOOL] = {
        RecoilSpreadPenalty = 0.0024
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.MachinePistol

// "ballistics"

SWEP.Damage_Max = 22
SWEP.Damage_Min = 6
SWEP.Range_Min = 500
SWEP.Range_Max = 2000
SWEP.Penetration = 4
SWEP.ArmorPenetration = 0.675
SWEP.ArmorBonus = 0.5

SWEP.MuzzleVelocity = 12500

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 1.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemodes = {2}

SWEP.RPM = 600

SWEP.Spread = 0.035

SWEP.JamFactor = 0.011

SWEP.Spread = 0.008
SWEP.RecoilSpreadPenalty = 0.0018
SWEP.HipFireSpreadPenalty = 0.014

SWEP.ShootTimeMult = 0.5

SWEP.RecoilResetInstant = false
SWEP.RecoilPerShot = 1.2
SWEP.RecoilMaximum = 15
SWEP.RecoilResetTime = 0
SWEP.RecoilDissipationRate = 40
SWEP.RecoilFirstShotMult = 3

SWEP.RecoilVisualKick = 2
SWEP.RecoilKick = 3.25
SWEP.RecoilStability = 0.2

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.975
SWEP.ShootingSpeedMult = 0.75
SWEP.SightedSpeedMult = 0.8

SWEP.ReloadSpeedMult = 0.6

SWEP.AimDownSightsTime = 0.275
SWEP.SprintToFireTime = 0.30

// hold types

SWEP.HoldType = "smg"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(1, -1, 0)
SWEP.PassivePos = Vector(1, 3, 0)

SWEP.BlindFireAng = Angle(0, 0, -50)
SWEP.BlindFirePos = Vector(2, 2, 4)

SWEP.BlindFireSuicideAng = Angle(-7, 135, 0)
SWEP.BlindFireSuicidePos = Vector(0, 30, -25)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 2, 2)

SWEP.SightAng = Angle(0, -0, 0)
SWEP.SightPos = Vector(-2.7, -1, 1.65)

SWEP.CorrectivePos = Vector(0.04, 0, 0.15)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(2.5, -2, -6)
SWEP.HolsterAng = Angle(0, 90, 0)

SWEP.Sway = 1.2
SWEP.ScopedSway = 0.4

SWEP.FreeAimMaxAngle = 4

// reload

SWEP.ClipSize = 35
SWEP.Ammo = "pistol"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/mp5.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1.1
SWEP.DropMagazineTime = 0.35

// sounds

local path = "tacrp/weapons/uzi/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = path .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 110
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 1

SWEP.MuzzleEffect = "muzzleflash_smg"
SWEP.EjectEffect = 1

// anims

SWEP.AnimationTranslationTable = {
    ["fire_iron"] = "fire1_M",
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = "fire4_M",
    ["melee"] = {"melee","melee2"}
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -1, -0.1),
    vm_ang = Angle(0, 0.4, 0),
    t = 0.1,
    tmax = 0.1,
    bones = {
        {
            bone = "ValveBiped.bolt_handle",
            pos = Vector(0, 0, -2),
            t0 = 0.05,
            t1 = 0.2,
        },
    },
}

// attachments

SWEP.AttachmentElements = {
    ["foldstock"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {2, 1}
        },
    },
    ["flashlight"] = {
        BGs_VM = {
            {2, 1}
        },
        BGs_WM = {
            {1, 1}
    },
    },
}

SWEP.Attachments = {
    [3] = {
        PrintName = "Tactical",
        Category = {"tactical", "tactical_zoom", "tactical_ebullet"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        InstalledElements = {"flashlight"},

    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock2", "acc_extmag_smg", "acc_holster"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Bolt",
        Category = {"bolt_automatic", "bolt_jammable"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Trigger",
        Category = {"trigger_auto"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [7] = {
        PrintName = "Ammo",
        Category = {"ammo_pistol"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [8] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
    },
}

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("tacint_miniuzi.insert_clip", path .. "insert_clip.wav")
addsound("tacint_miniuzi.remove_clip", path .. "remove_clip.wav")
addsound("tacint_miniuzi.bolt_action", path .. "bolt_action.wav")
addsound("tacint_miniuzi.foldingstock_back", path .. "foldingstock_back.wav")