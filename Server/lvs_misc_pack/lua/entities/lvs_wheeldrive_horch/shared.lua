
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Horch 830"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Military"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/horch/horch.mdl"
ENT.MDL_DESTROYED = "models/diggercars/horch/horch_dead.mdl"

ENT.GibModels = {
	"models/diggercars/horch/horch_wheel.mdl",
	"models/gibs/manhack_gib01.mdl",
	"models/gibs/manhack_gib02.mdl",
	"models/gibs/manhack_gib03.mdl",
	"models/gibs/manhack_gib04.mdl",
	"models/props_c17/canisterchunk01a.mdl",
	"models/props_c17/canisterchunk01d.mdl",
}

ENT.AITEAM = 1

ENT.MaxVelocity = 1200

ENT.EngineCurve = 0.25
ENT.EngineTorque = 150

ENT.TransGears = 4
ENT.TransGearsReverse = 1

ENT.HornSound = "lvs/horn2.wav"
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
}

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/willy/eng_idle_loop.wav",
		Volume = 0.5,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/willy/eng_loop.wav",
		Volume = 1,
		Pitch = 50,
		PitchMul = 100,
		SoundLevel = 75,
		UseDoppler = true,
	},
}

ENT.Lights = {
	{
		Trigger = "main",
		Sprites = {
			{ pos = Vector(-84.89,-33.14,30.81), colorG = 0, colorB = 0, colorA = 150 },
			{ pos = Vector(27.6,24.33,49.54), colorB = 200, colorA = 150 },
		},
		ProjectedTextures = {
			{ pos = Vector(81.29,-14.38,39.6), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(81.29,14.38,39.6), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{ pos = Vector(81.29,-14.38,39.6), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(81.29,14.38,39.6), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 0,
		Sprites = {
			{ pos = Vector(81.29,-14.38,39.6), colorB = 200, colorA = 150 },
			{ pos = Vector(81.29,14.38,39.6), colorB = 200, colorA = 150 },
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 4,
	},
	{
		Trigger = "brake",
		Sprites = {
			{ pos = Vector(-84.89,-33.14,30.81), colorG = 0, colorB = 0, colorA = 150 },
		}
	},
}


ENT.ExhaustPositions = {
	{
		pos = Vector(-90.3,-9.64,13.25),
		ang = Angle(0,180,0),
	},
}
