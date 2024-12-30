
include("entities/lvs_tank_wheeldrive/modules/sh_turret.lua")

ENT.TurretAimRate = 10

ENT.TurretRotationSound = "lvs/vehicles/cannons/cannon_big_horizontal.wav"

ENT.TurretPitchPoseParameterName = "cannon_pitch"
ENT.TurretPitchMin = -15
ENT.TurretPitchMax = 5
ENT.TurretPitchMul = -1
ENT.TurretPitchOffset = -2

ENT.TurretYawPoseParameterName = "cannon_yaw"
ENT.TurretYawMin = -4
ENT.TurretYawMax = 4
ENT.TurretYawMul = -1
ENT.TurretYawOffset = 0