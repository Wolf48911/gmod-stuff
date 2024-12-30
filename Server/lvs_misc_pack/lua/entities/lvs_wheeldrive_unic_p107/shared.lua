
ENT.Base = "lvs_tank_wheeldrive"

ENT.PrintName = "Unic P107"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Military"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/unic_p107/p107.mdl"
ENT.MDL_DESTROYED = "models/diggercars/unic_p107/p107_dead.mdl"

ENT.AITEAM = 2

ENT.MaxHealth = 500

ENT.PhysicsMass = 2500
ENT.WheelPhysicsMass = 300

ENT.MaxVelocity = 300
ENT.MaxVelocityReverse = 150

ENT.EngineCurve = 0
ENT.EngineTorque = 250

ENT.TransGears = 3
ENT.TransGearsReverse = 1

ENT.RandomColor = {
	{
		Skin = 0,
		Wheels = {
			Skin = 0,
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
		sound = "lvs/vehicles/halftrack/eng_idle_loop.wav",
		Volume = 0.5,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/amcp16/engine_idle.wav",
		Volume = 1,
		Pitch = 50,
		PitchMul = 80,
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

ENT.ExhaustPositions = {
	{
		pos = Vector(-95.09,-16.82,33.66),
		ang = Angle(0,180,0),
	},
}


ENT.Lights = {
	{
		Trigger = "main",
		Sprites = {
			{ pos = Vector(115.5,19.62,51.33), colorB = 200, colorA = 150, bodygroup = { name = "headlight1", active = { 0 } }, },
			{ pos = Vector(115.5,-19.62,51.33), colorB = 200, colorA = 150, bodygroup = { name = "headlight2", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(115.5,19.62,51.33), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "headlight1", active = { 0 } }, },
			{ pos = Vector(115.5,-19.62,51.33), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "headlight2", active = { 0 } }, },
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{ pos = Vector(115.5,19.62,51.33), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "headlight1", active = { 0 } }, },
			{ pos = Vector(115.5,-19.62,51.33), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "headlight2", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 4,
		Sprites = {
			{ pos = Vector(115.5,19.62,51.33), colorB = 200, colorA = 150, bodygroup = { name = "headlight1", active = { 0 } }, },
			{ pos = Vector(115.5,-19.62,51.33), colorB = 200, colorA = 150, bodygroup = { name = "headlight2", active = { 0 } }, },
		},
	},
}
