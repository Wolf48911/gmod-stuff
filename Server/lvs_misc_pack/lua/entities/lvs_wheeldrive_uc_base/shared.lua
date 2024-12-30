
ENT.Base = "lvs_tank_wheeldrive"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/universal_carrier/uc.mdl"
ENT.MDL_DESTROYED = "models/diggercars/universal_carrier/dead.mdl"

ENT.AITEAM = 2

ENT.MaxHealth = 500

ENT.DSArmorIgnoreForce = 400
ENT.CannonArmorPenetration = 3500
ENT.CannonArmorPenetration1km = 2000
ENT.FrontArmor = 600
ENT.SideArmor = 300

ENT.SteerSpeed = 1
ENT.SteerReturnSpeed = 2

ENT.PhysicsWeightScale = 2
ENT.PhysicsDampingSpeed = 1000
ENT.PhysicsInertia = Vector(6000,6000,1500)

ENT.MaxVelocity = 550
ENT.MaxVelocityReverse = 150

ENT.EngineCurve = 0.1
ENT.EngineTorque = 100

ENT.TransMinGearHoldTime = 0.1
ENT.TransShiftSpeed = 0

ENT.TransGears = 4
ENT.TransGearsReverse = 1

ENT.MouseSteerAngle = 45

ENT.lvsShowInSpawner = false



ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/sdkfz250/eng_idle_loop.wav",
		Volume = 0.5,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/sdkfz250/eng_loop.wav",
		Volume = 1,
		Pitch = 20,
		PitchMul = 100,
		SoundLevel = 85,
		SoundType = LVS.SOUNDTYPE_REV_UP,
		UseDoppler = true,
	},
	{
		sound = "lvs/vehicles/sdkfz250/eng_revdown_loop.wav",
		Volume = 1,
		Pitch = 20,
		PitchMul = 100,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_DOWN,
		UseDoppler = true,
	},
}

ENT.ExhaustPositions = {
	{
		pos = Vector(-58.16,16.9,19.24),
		ang = Angle(90,0,0),
	},
	{
		pos = Vector(-58.16,-16.9,19.24),
		ang = Angle(90,0,0),
	},
}
