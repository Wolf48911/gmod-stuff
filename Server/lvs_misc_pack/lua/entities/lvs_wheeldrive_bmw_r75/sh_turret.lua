
include("entities/lvs_tank_wheeldrive/modules/sh_turret.lua")

ENT.TurretAimRate = 50

ENT.TurretRotationSound = "vehicles/tank_turret_loop1.wav"

ENT.TurretPitchPoseParameterName = "turret_pitch"
ENT.TurretPitchMin = -20
ENT.TurretPitchMax = 20
ENT.TurretPitchMul = -1
ENT.TurretPitchOffset = -2

ENT.TurretYawPoseParameterName = "turret_yaw"
ENT.TurretYawMin = -30
ENT.TurretYawMax = 30
ENT.TurretYawMul = 1
ENT.TurretYawOffset = 0