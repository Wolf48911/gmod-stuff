
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Gaz AAA"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Military"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/gaz_aaa/gaz.mdl"
ENT.MDL_DESTROYED = "models/diggercars/gaz_aaa/gaz_dead.mdl"

ENT.GibModels = {
	"models/diggercars/gaz_aaa/fw.mdl",
	"models/diggercars/gaz_aaa/rw.mdl",
	"models/diggercars/gaz_aaa/rw.mdl",
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
			{ pos = Vector(94.64,16.24,45.4), colorB = 200, colorA = 150, },
			{ pos = Vector(94.64,-16.24,45.4), colorB = 200, colorA = 150, },
		},
		ProjectedTextures = {
			{ pos = Vector(94.64,16.24,45.4), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(94.64,-16.24,45.4), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{ pos = Vector(94.64,16.24,45.4), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(94.64,-16.24,45.4), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 4,
		Sprites = {
			{ pos = Vector(94.64,16.24,45.4), colorB = 200, colorA = 150 },
			{ pos = Vector(94.64,-16.24,45.4), colorB = 200, colorA = 150 },
		},
	},
	{
		Trigger = "main+brake",
		SubMaterialID = 1,
		Sprites = {
			{ pos = Vector(-92.78,22.86,29.321), colorG = 0, colorB = 0, colorA = 150 },
		}
	},

}

