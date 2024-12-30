
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "BMW R75"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Military"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/bmw_r75/r75.mdl"
ENT.MDL_DESTROYED = "models/diggercars/bmw_r75/r75_dead.mdl"

ENT.AITEAM = 1

ENT.MaxHealth = 750

ENT.MaxVelocity = 1000

ENT.EngineCurve = 0.2
ENT.EngineTorque = 200

ENT.TransGears = 5
ENT.TransGearsReverse = 5

ENT.PhysicsMass = 300
ENT.WheelPhysicsMass = 100

ENT.FastSteerAngleClamp = 5
ENT.FastSteerDeactivationDriftAngle = 12

ENT.PhysicsWeightScale = 1.5
ENT.PhysicsDampingForward = true
ENT.PhysicsDampingReverse = true

ENT.lvsShowInSpawner = true

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/bmw_r75/bmw_Idle.wav",
		Volume = 0.5,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/bmw_r75/bmw_Idle.wav",
		Volume = 1,
		Pitch = 50,
		PitchMul = 100,
		SoundLevel = 75,
		UseDoppler = true,
	},
}

ENT.ExhaustPositions = {
	{
		pos = Vector(19.86,-12.19,11.76),
		ang = Angle(0,0,0),
	},
}
