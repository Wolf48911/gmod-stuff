SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "OCP Auto 9"
SWEP.AbbrevName = "Auto 9"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "4Consumer"
SWEP.SubCatType = "1Pistol"

SWEP.Description = "Made for Alex Murphy after becoming Robocop."
SWEP.Description_Quote = "\Dead or alive, you're coming with me\"" // Robocop 2

SWEP.Trivia_Caliber = "9mm Parabellum"
SWEP.Trivia_Manufacturer = "Omni Consumer Products"
SWEP.Trivia_Year = "1991"

SWEP.Faction = TacRP.FACTION_NEUTRAL
SWEP.Credits = [[
Model: Kimono, Faffout
Texture: Crash
Sound: Vunsunta, DMG, Strelok]]

SWEP.ViewModel = "models/v_models/v_auto_9.mdl"
SWEP.WorldModel = "models/w_models/weapons/w_auto_9.mdl"

SWEP.Slot = 1

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 16,
        Damage_Min = 12,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 7,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 0.9,
            [HITGROUP_RIGHTLEG] = 0.9,
            [HITGROUP_GEAR] = 0.9
        },
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 14,
        Damage_Min = 8,
        Range_Min = 500,
        Range_Max = 3000,
        RPM = 450,
        RPMMultSemi = 1,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 5,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 0.9,
            [HITGROUP_RIGHTLEG] = 0.9,
            [HITGROUP_GEAR] = 0.9
        },
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.Pistol

// "ballistics"

SWEP.Damage_Max = 15
SWEP.Damage_Min = 9
SWEP.Range_Min = 900
SWEP.Range_Max = 3000
SWEP.Penetration = 4
SWEP.ArmorPenetration = 0.625
SWEP.ArmorBonus = 0.5

SWEP.MuzzleVelocity = 32000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 4,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemode = -3

SWEP.RPM = 470
SWEP.RPMMultSemi = 0.8
SWEP.RPMMultBurst = 2

SWEP.PostBurstDelay = 0.1
SWEP.RunawayBurst = true

SWEP.Spread = 0.003

SWEP.ShootTimeMult = 0.5

SWEP.RecoilResetInstant = false
SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 4
SWEP.RecoilResetTime = 0
SWEP.RecoilDissipationRate = 10
SWEP.RecoilFirstShotMult = 1

SWEP.RecoilVisualKick = 0.5
SWEP.RecoilKick = 2
SWEP.RecoilStability = 0.6

SWEP.HipFireSpreadPenalty = 0.01
SWEP.RecoilSpreadPenalty = 0.002

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 1
SWEP.ShootingSpeedMult = 1
SWEP.SightedSpeedMult = 0.9

SWEP.ReloadSpeedMult = 0.75

SWEP.AimDownSightsTime = 0.22
SWEP.SprintToFireTime = 0.15

SWEP.Sway = 0.5
SWEP.ScopedSway = 0.5

SWEP.FreeAimMaxAngle = 2

// hold types

SWEP.HoldType = "pistol"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeBlindFire = "pistol"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_PISTOL

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -1, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(0, -2, -5)

SWEP.BlindFireSuicideAng = Angle(-125, 0, 45)
SWEP.BlindFireSuicidePos = Vector(25, 12, -6)

SWEP.SprintAng = Angle(0, 30, 0)
SWEP.SprintPos = Vector(2, 4, -12)

SWEP.SightAng = Angle(-0.01, 0.5, 0)
SWEP.SightPos = Vector(-3.2, 0, -2.99)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_PISTOL
SWEP.HolsterPos = Vector(0, 3, -4)
SWEP.HolsterAng = Angle(90, 0, 0)


// reload

SWEP.ClipSize = 12 // 10 irl but it should be slightly better than the Amphibian
SWEP.Ammo = "pistol"
SWEP.Ammo_Expanded = "ti_pistol_light"

SWEP.ReloadUpInTime = 1
SWEP.DropMagazineTime = 0.25

SWEP.ReloadTimeMult = 0.875

SWEP.DropMagazineModel = "models/weapons/tacint/magazines/vertec.mdl"
SWEP.DropMagazineImpact = "pistol"

// sounds

local path = "TacRP/weapons/vertec/vertec_"
local path1 = "tacint_extras/woodsman/"

SWEP.Sound_Shoot = "^" .. path1 .. "p228-1.wav"
SWEP.Sound_Shoot_Silenced = path .. "fire_silenced-1.wav"

SWEP.Vol_Shoot = 95
SWEP.Pitch_Shoot = 105
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 4

SWEP.MuzzleEffect = "muzzleflash_pistol"
SWEP.EjectEffect = 1

// anims

SWEP.DeployTimeMult = 0.5
SWEP.HolsterTimeMult = 0.5

-- SWEP.AnimationTranslationTable = {
--     ["deploy"] = "draw",
--     ["fire_iron"] = "shoot3",
--     ["fire"] = {"shoot1", "shoot2", "shoot3"},
--     ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
--     ["melee"] = {"melee1", "melee2"},
--     ["jam"] = "midreload"
-- }

SWEP.AnimationTranslationTable = {
    ["deploy"] = "sh_draw",
    ["unholster"] = "sh_unholster",
    ["fire_iron"] = "sh_shoot3",
    ["fire"] = {"sh_shoot1", "sh_shoot2", "sh_shoot3"},
    ["blind_fire"] = {"blind_shoot1", "blind_shoot2", "blind_shoot3"},
    ["melee"] = {"melee1", "melee2"},
    ["jam"] = "sh_midreload",
    ["reload"] = "sh_reload",
    ["dryfire"] = "sh_dryfire",
    ["idle"] = "sh_idle",
    ["holster"] = "sh_holster",
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -0.6, -0.5),
    vm_ang = Angle(0, 2, 0),
    t = 0.2,
    tmax = 0.2,
    bones = {
        {
            bone = "ValveBiped.slide",
            pos = Vector(0, 0, -3),
            t0 = 0,
            t1 = 0.1,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger1",
            ang = Angle(0, -15, 0),
            t0 = 0,
            t1 = 0.2,
        },
        {
            bone = "ValveBiped.Bip01_R_Finger11",
            ang = Angle(-35, 0, 0),
            t0 = 0,
            t1 = 0.15,
        },
    },
}

SWEP.LastShot = false

// attachments

SWEP.BlindFireCamera = true

SWEP.Attachments = {
    [1] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_extmag_pistol", "acc_holster", "acc_brace"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [2] = {
        PrintName = "Bolt",
        Category = {"bolt_automatic"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [3] = {
        PrintName = "Trigger",
        Category = {"trigger","trigger_burstauto"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Ammo",
        Category = {"ammo_pistol"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
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

addsound("tacint_woodsman.clip_in", path1 .. "p228_clipin.wav")
addsound("tacint_woodsman.clip_in-mid", path .. "clip_in-mid.wav")
addsound("tacint_woodsman.clip_out", path1 .. "p228_clipout.wav")
addsound("tacint_woodsman.slide_action", path1 .. "p228_deploy.wav")
