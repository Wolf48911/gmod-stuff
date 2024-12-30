
include("entities/lvs_tank_wheeldrive/modules/sh_turret.lua")

ENT.TurretAimRate = 5

ENT.TurretRotationSound = "lvs/vehicles/cannons/cannon_big_horizontal.wav"
ENT.TurretElevationSound = "lvs/vehicles/cannons/cannon_big_vertical.wav"

ENT.TurretPitchPoseParameterName = "turret_pitch"
ENT.TurretPitchMin = -60
ENT.TurretPitchMax = 10
ENT.TurretPitchMul = -1
ENT.TurretPitchOffset = 0

ENT.TurretYawPoseParameterName = "turret_yaw"
ENT.TurretYawMin = -5
ENT.TurretYawMax = 5
ENT.TurretYawMul = -1
ENT.TurretYawOffset = 0