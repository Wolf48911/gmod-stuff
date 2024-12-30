include("entities/lvs_tank_wheeldrive/modules/sh_turret.lua")
include("entities/lvs_tank_wheeldrive/modules/sh_turret_ballistics.lua")

ENT.TurretBallisticsProjectileVelocity = ENT.ProjectileVelocityArmorPiercing -- default value what the vehicle spawns with
ENT.TurretBallisticsMuzzleAttachment = "muzzle"
ENT.TurretBallisticsViewAttachment = "sight"

ENT.TurretAimRate = 15

ENT.TurretRotationSound = "lvs/vehicles/cannons/cannon_big_horizontal.wav"

ENT.TurretPitchPoseParameterName = "cannon_pitch"
ENT.TurretPitchMin = -10
ENT.TurretPitchMax = 10
ENT.TurretPitchMul = -1
ENT.TurretPitchOffset = 0

ENT.TurretYawPoseParameterName = "cannon_yaw"
ENT.TurretYawMin = -10
ENT.TurretYawMax = 10
ENT.TurretYawMul = -1
ENT.TurretYawOffset = 0