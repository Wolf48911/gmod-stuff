include("entities/lvs_tank_wheeldrive/modules/sh_turret.lua")
include("entities/lvs_tank_wheeldrive/modules/sh_turret_ballistics.lua")

ENT.TurretBallisticsProjectileVelocity = ENT.ProjectileVelocityArmorPiercing -- default value what the vehicle spawns with
ENT.TurretBallisticsMuzzleAttachment = "muzzle"
ENT.TurretBallisticsViewAttachment = "sight"

ENT.TurretAimRate = 15

ENT.TurretRotationSound = "lvs/vehicles/cannons/cannon_small_vertical.wav"

ENT.TurretPitchPoseParameterName = "cannon_pitch"
ENT.TurretPitchMin = -20
ENT.TurretPitchMax = 10
ENT.TurretPitchMul = -1
ENT.TurretPitchOffset = -2

ENT.TurretYawPoseParameterName = "cannon_yaw"
ENT.TurretYawMin = -25
ENT.TurretYawMax = 25
ENT.TurretYawMul = -1
ENT.TurretYawOffset = 0

