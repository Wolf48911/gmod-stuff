
include("entities/lvs_tank_wheeldrive/modules/sh_turret.lua")

ENT.TurretAimRate = 15

ENT.TurretRotationSound = "lvs/vehicles/cannons/cannon_big_horizontal.wav"
ENT.TurretElevationSound = "lvs/vehicles/cannons/cannon_big_vertical.wav"

ENT.TurretPitchPoseParameterName = "turret_pitch"
ENT.TurretPitchMin = -15
ENT.TurretPitchMax = 5
ENT.TurretPitchMul = -1
ENT.TurretPitchOffset = 0

ENT.TurretYawPoseParameterName = "turret_yaw"
ENT.TurretYawMin = -15
ENT.TurretYawMax = 15
ENT.TurretYawMul = -1
ENT.TurretYawOffset = 0