
ENT.Base = "lvs_tank_wheeldrive"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/sdkfz251/251.mdl"
ENT.MDL_DESTROYED = "models/diggercars/sdkfz251/dead.mdl"

ENT.AITEAM = 1

ENT.DSArmorIgnoreForce = 700
ENT.MaxHealth = 600

ENT.HullArmor = 200
ENT.FrontArmor = 800
ENT.TracksArmor = 2800

ENT.MaxVelocity = 700
ENT.MaxVelocityReverse = 250

ENT.EngineCurve = 0.7
ENT.EngineTorque = 100

ENT.PhysicsWeightScale = 1.5
ENT.PhysicsInertia = Vector(2500,2500,850)

ENT.TransGears = 3
ENT.TransGearsReverse = 1

ENT.lvsShowInSpawner = true

ENT.Lights = {
	{
		Trigger = "main",
		Sprites = {
			{ pos = Vector(118.79,-29.79,43.26), colorB = 200, colorA = 150, },
			{ pos = Vector(118.79,28.79,43.26), colorB = 200, colorA = 150, },
		},
		ProjectedTextures = {
			{ pos = Vector(118.79,-29.79,43.26), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(118.79,28.79,43.26), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{ pos = Vector(118.79,-29.79,43.26), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(118.79,28.79,43.26), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 1,
		Sprites = {
			{ pos = Vector(118.79,-29.79,43.26), colorB = 200, colorA = 150 },
			{ pos = Vector(118.79,28.79,43.26), colorB = 200, colorA = 150 },
		},
	},

}


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
		pos = Vector(69.25,45.68,30.93),
		ang = Angle(0,90,0),
	},
}
