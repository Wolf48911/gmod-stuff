local ATT

ATT = {}

ATT.PrintName = "Blank"
ATT.Icon = Material("entities/tacrp_att_blank.png", "mips smooth")
ATT.Description = "Used by the profesionalls for movies, there is no bullet."
ATT.Pros = {"blank", "stat.recoil"}
ATT.Cons = {"blank"}

ATT.Category = {"ammo_shotgun", "ammo_shotgun2","ammo_rifle", "ammo_sniper", "ammo_amr", "ammo_rifle_sub","ammo_pistol", "ammo_pistol_sub","ammo_40mm"}
ATT.Free = true

ATT.SortOrder = 100

ATT.Add_ArmorPenetration = -0.1

ATT.Override_BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 0,
    [HITGROUP_CHEST] = 0,
    [HITGROUP_STOMACH] = 0,
    [HITGROUP_LEFTARM] = 0,
    [HITGROUP_RIGHTARM] = 0,
    [HITGROUP_LEFTLEG] = 0,
    [HITGROUP_RIGHTLEG] = 0,
    [HITGROUP_GEAR] = 0.,
}

ATT.Mult_RecoilKick = 0.5

ATT.TracerNum = 0


ATT.Mult_Spread = .75

TacRP.LoadAtt(ATT, "ammo_blank")