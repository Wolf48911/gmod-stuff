include("entities/lvs_tank_wheeldrive/modules/sh_turret_splitsound.lua")
include("entities/lvs_tank_wheeldrive/modules/sh_turret_ballistics.lua")

ENT.TurretBallisticsProjectileVelocity = ENT.ProjectileVelocityArmorPiercing -- default value what the vehicle spawns with
ENT.TurretBallisticsMuzzleAttachment = "muzzle" -- default value what the vehicle spawns with
ENT.TurretBallisticsViewAttachment = "sight"

ENT.TurretAimRate = 15

ENT.TurretRotationSound = "lvs/vehicles/cannons/cannon_big_horizontal.wav"
ENT.TurretElevationSound = "lvs/vehicles/cannons/cannon_big_vertical.wav"

ENT.TurretPitchPoseParameterName = "cannon_pitch"
ENT.TurretPitchMin = -35
ENT.TurretPitchMax = 5
ENT.TurretPitchMul = -1
ENT.TurretPitchOffset = -2

ENT.TurretYawPoseParameterName = "cannon_yaw"
ENT.TurretYawMin = -27
ENT.TurretYawMax = 27
ENT.TurretYawMul = -1
ENT.TurretYawOffset = 0