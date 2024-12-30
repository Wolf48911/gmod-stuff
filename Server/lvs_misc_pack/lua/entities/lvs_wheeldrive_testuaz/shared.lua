
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Test UAZ"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Civilian"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL =  "models/diggercars/uaz/uaz_2315.mdl"

ENT.HornSound = "lvs/horn4.wav"
ENT.HornPos = Vector(0,40,35)

ENT.MaxVelocity = 2200

ENT.EngineTorque = 80

ENT.TransGears = 4
ENT.TransGearsReverse = 1

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/mercedes_w123/eng_idle_loop.wav",
		Volume = 1,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/mercedes_w123/eng_loop.wav",
		Volume = 1,
		Pitch = 80,
		PitchMul = 110,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_UP,
		UseDoppler = true,
	},
	{
		sound = "lvs/vehicles/mercedes_w123/eng_revdown_loop.wav",
		Volume = 1,
		Pitch = 80,
		PitchMul = 110,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_DOWN,
		UseDoppler = true,
	},
}

ENT.ExhaustPositions = {
	{
		pos = Vector(11.4,-110.86,14.77),
		ang = Angle(0,0,0),
	}
}

ENT.Lights = {
	{
		Trigger = "main",
		ProjectedTextures = {
			{ pos = Vector(21.65,76.07,39.35), ang = Angle(0,90,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(-21.65,76.07,39.35), ang = Angle(0,90,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{ pos = Vector(21.65,76.07,39.35), ang = Angle(0,90,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(-21.65,76.07,39.35), ang = Angle(0,90,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
	Trigger = "main+high",
		SubMaterialID = 11,
		Sprites = {
			{ pos = Vector(21.65,76.07,39.35), colorB = 200, colorA = 150 },
			{ pos = Vector(-21.65,76.07,39.35), colorB = 200, colorA = 150 },
		},
	},
	{
		Trigger = "main+brake",
		SubMaterialID = 15,
		Sprites = {
			{ pos = Vector(-25.57,-107.29,29.27), colorG = 0, colorB = 0, colorA = 150 },
			{ pos = Vector(25.57,-107.29,29.27), colorG = 0, colorB = 0, colorA = 150 },
		}
	},
	{
		Trigger = "reverse",
		SubMaterialID = 14,
		Sprites = {
			{ pos = Vector(-21.73,-107.24,29.43), height = 25, width = 25, colorA = 150 },
			{ pos = Vector(21.73,-107.24,29.43), height = 25, width = 25, colorA = 150 },
		}
	},
	{
		Trigger = "turnright",
		SubMaterialID = 13,
		Sprites = {
			{ width = 35, height = 35, pos = Vector(-24.44,74.87,32.56), colorG = 100, colorB = 0, colorA = 50 },
			{ width = 15, height = 15, pos = Vector(-32.23,35.18,43.65), colorG = 100, colorB = 0, colorA = 50 },
			{ width = 40, height = 40, pos = Vector(-30.69,-107.34,29.07), colorG = 100, colorB = 0, colorA = 150 },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 12,
		Sprites = {
			{ width = 35, height = 35, pos = Vector(24.44,74.87,32.56), colorG = 100, colorB = 0, colorA = 50 },
			{ width = 15, height = 15, pos = Vector(32.23,35.18,43.65), colorG = 100, colorB = 0, colorA = 50 },
			{ width = 40, height = 40, pos = Vector(30.69,-107.34,29.07), colorG = 100, colorB = 0, colorA = 150 },
		},
	},
	{
		Trigger = "fog",
		SubMaterialID = 16,
		Sprites = {
			{ pos = Vector(23.63,75.61,19.94), colorG = 200, colorB = 0, colorA = 100 },
			{ pos = Vector(-23.63,75.61,19.94), colorG = 200, colorB = 0, colorA = 100 },
		},
	},
}
