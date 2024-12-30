
include("entities/lvs_tank_wheeldrive/modules/sh_turret.lua")

ENT.TurretAimRate = 50

ENT.TurretFakeBarrel = true
ENT.TurretFakeBarrelRotationCenter =  Vector(-43,0,83)

ENT.TurretRotationSound = "lvs/vehicles/cannons/cannon_small_vertical.wav"

ENT.TurretPitchPoseParameterName = "turret_pitch1"
ENT.TurretPitchMin = -10
ENT.TurretPitchMax = 85
ENT.TurretPitchMul = 1
ENT.TurretPitchOffset = 0

ENT.TurretYawPoseParameterName = "turret_yaw"
ENT.TurretYawMul = 1
ENT.TurretYawOffset = 180

function ENT:TurretInRange()
	local ID = self:LookupAttachment( "72k_muzzle" )

	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return true end

	local Dir1 = Muzzle.Ang:Forward()
	local Dir2 = self:GetAimVector() 

	return self:AngleBetweenNormal( Dir1, Dir2 ) < 10
end
