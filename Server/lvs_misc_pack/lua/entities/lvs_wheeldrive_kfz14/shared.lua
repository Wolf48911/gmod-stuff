
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Funkkraftwagen"
ENT.Author = "Digger"
ENT.Information = "Funkkraftwagen"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Armored"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/kfz13/kfz13.mdl"
ENT.MDL_DESTROYED = "models/diggercars/kfz13/kfz_dead.mdl"

ENT.AITEAM = 1

ENT.DSArmorIgnoreForce = 800
ENT.MaxHealth = 500

ENT.TurretArmor = 100
ENT.FrontArmor = 800
ENT.RearArmor = 2000

ENT.MaxVelocity = 800

ENT.PhysicsMass = 1500
ENT.WheelPhysicsMass = 150

ENT.EngineTorque = 250
ENT.EngineCurve = 0.25

ENT.SteerSpeed = 1
ENT.SteerReturnSpeed = 2

ENT.TransGears = 4
ENT.TransGearsReverse = 1

ENT.RandomColor = {
	{
		Skin = 0,
		BodyGroups = {
			[15] = 1,
		},
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		BodyGroups = {
			[15] = 1,
		},
		Wheels = {
			Skin = 1,
		}
	},
	{
		Skin = 2,
		BodyGroups = {
			[15] = 1,
		},
		Wheels = {
			Skin = 2,
		}
	},
}

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/halftrack/eng_idle_loop.wav",
		Volume = 0.5,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/halftrack/eng_loop.wav",
		Volume = 1,
		Pitch = 50,
		PitchMul = 100,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_UP,
		UseDoppler = true,
	},
	{
		sound = "lvs/vehicles/halftrack/eng_revdown_loop.wav",
		Volume = 1,
		Pitch = 50,
		PitchMul = 100,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_DOWN,
		UseDoppler = true,
	},
}

ENT.Lights = {
	{
		Trigger = "main",
		Sprites = {
			{ pos = Vector(73.11,18.22,43.88), colorB = 200, colorA = 150, },
			{ pos = Vector(73.11,-18.22,43.88), colorB = 200, colorA = 150, },
		},
		ProjectedTextures = {
			{ pos = Vector(73.11,18.22,43.88), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(73.11,-18.22,43.88), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{ pos = Vector(73.11,18.22,43.88), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(73.11,-18.22,43.88), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 2,
		Sprites = {
			{ pos = Vector(73.11,18.22,43.88), colorB = 200, colorA = 150 },
			{ pos = Vector(73.11,-18.22,43.88), colorB = 200, colorA = 150 },
		},
	},
	{
		Trigger = "main+brake",
		SubMaterialID = 1,
		Sprites = {
			{ pos = Vector(-76.56,30.07,34.96), colorG = 0, colorB = 0, colorA = 150 },
			{ pos = Vector(-76.56,-30.07,34.96), colorG = 0, colorB = 0, colorA = 150 },
		}
	},

}
ENT.ExhaustPositions = {
	{
		pos = Vector(-3.97,-32,18.68),
		ang = Angle(0,-90,0),
	},
}

