
include("entities/lvs_tank_wheeldrive/modules/sh_turret.lua")

ENT.TurretAimRate = 100

ENT.TurretFakeBarrel = true
ENT.TurretFakeBarrelRotationCenter =  Vector(-38,0,69)

ENT.TurretRotationSound = "common/null.wav"

ENT.TurretPitchPoseParameterName = "turret_pitch"
ENT.TurretPitchMin = -15
ENT.TurretPitchMax = 15
ENT.TurretPitchMul = 1
ENT.TurretPitchOffset = 0

ENT.TurretYawPoseParameterName = "turret_yaw"
ENT.TurretYawMul = 1
ENT.TurretYawOffset = 180

function ENT:TurretInRange()
	local ID = self:LookupAttachment( "muzzle" )

	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return true end

	local Dir1 = Muzzle.Ang:Forward()
	local Dir2 = self:GetAimVector() 

	return self:AngleBetweenNormal( Dir1, Dir2 ) < 10
end
