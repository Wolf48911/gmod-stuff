
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Fiat 621"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Military"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/fiat_621/fiat.mdl"
ENT.MDL_DESTROYED = "models/diggercars/fiat_621/fiat_dead.mdl"

ENT.GibModels = {
	"models/diggercars/fiat_621/fiat_wheel_f.mdl",
	"models/gibs/manhack_gib01.mdl",
	"models/gibs/manhack_gib02.mdl",
	"models/gibs/manhack_gib03.mdl",
	"models/gibs/manhack_gib04.mdl",
	"models/props_c17/canisterchunk01a.mdl",
	"models/props_c17/canisterchunk01d.mdl",
}

ENT.AITEAM = 2

ENT.MaxVelocity = 1200

ENT.PhysicsMass = 2500
ENT.WheelPhysicsMass = 200

ENT.EngineTorque = 200
ENT.EngineCurve = 0.25

ENT.SteerSpeed = 1
ENT.SteerReturnSpeed = 2

ENT.TransGears = 4
ENT.TransGearsReverse = 1

ENT.HornSound = "lvs/horn1.wav"
ENT.HornPos = Vector(40,0,35)

ENT.RandomColor = {
	{
		Skin = 0,
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		Wheels = {
			Skin = 1,
		}
	},
	{
		Skin = 2,
		Wheels = {
			Skin = 2,
		}
	},
}

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/kuebelwagen/eng_idle_loop.wav",
		Volume = 0.5,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/kuebelwagen/eng_loop.wav",
		Volume = 1,
		Pitch = 100,
		PitchMul = 100,
		SoundLevel = 75,
		UseDoppler = true,
	},
}

ENT.Lights = {
	{
		Trigger = "main",
		Sprites = {
			{ pos = Vector(95.96,-16.1,10.17), colorB = 200, colorA = 150, },
			{ pos = Vector(95.96,16.1,10.17), colorB = 200, colorA = 150, },
		},
		ProjectedTextures = {
			{ pos = Vector(95.96,-16.1,10.17), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(95.96,16.1,10.17), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{ pos = Vector(95.96,-16.1,10.17), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(95.96,16.1,10.17), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 0,
		Sprites = {
			{ pos = Vector(95.96,-16.1,10.17), colorB = 200, colorA = 150 },
			{ pos = Vector(95.96,16.1,10.17), colorB = 200, colorA = 150 },
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 3,
	},
	{
		Trigger = "main+high",
		SubMaterialID = 5,
	},
}

