
ENT.Base = "lvs_base_fighterplane"

ENT.PrintName = "Yak-2"
ENT.Author = "Digger"
ENT.Information = "Soviet World War 2 Heavy Fighterplane"
ENT.Category = "[LVS] - Planes"

ENT.VehicleCategory = "Planes"
ENT.VehicleSubCategory = "Fighters"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggerthings/yak2/1.mdl"

ENT.AITEAM = 2

ENT.MaxVelocity = 2500
ENT.MaxPerfVelocity = 1800
ENT.MaxThrust = 1250

ENT.TurnRatePitch = 1
ENT.TurnRateYaw = 1
ENT.TurnRateRoll = 0.75

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.MaxSlipAnglePitch = 20
ENT.MaxSlipAngleYaw = 10

ENT.MaxHealth = 1200

function ENT:InitWeapons()
	self.PosLMG = Vector(133.05,-13.85,63.64)
	self.DirLMG = 0
	self:AddWeapon( LVS:GetWeaponPreset( "LMG" ) )

	self.PosHMG = Vector(163.22,-5.48,63.66)
	self.DirHMG = 0.5
	self:AddWeapon( LVS:GetWeaponPreset( "HMG" ) )

	self:AddWeapon( LVS:GetWeaponPreset( "TURBO" ) )
end

ENT.FlyByAdvance = 0.5
ENT.FlyBySound = "lvs/vehicles/bf109/flyby.wav" 
ENT.DeathSound = "lvs/vehicles/generic/crash.wav"

ENT.EngineSounds = {
	{
		sound = "^lvs/vehicles/bf109/dist.wav",
		sound_int = "",
		Pitch = 80,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 40,
		FadeIn = 0.35,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
		VolumeMin = 0,
		VolumeMax = 1,
		SoundLevel = 110,
	},
	{
		sound = "lvs/vehicles/bf109/engine_compressor.wav",
		sound_int = "",
		Pitch = 50,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 60,
		FadeIn = 0.35,
		FadeOut = 1,
		FadeSpeed = 5,
		UseDoppler = true,
		VolumeMin = 0,
		VolumeMax = 0.25,
		SoundLevel = 120,
	},
	{
		sound = "lvs/vehicles/bf109/engine_low.wav",
		Pitch = 80,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 300,
		FadeIn = 0,
		FadeOut = 0.15,
		FadeSpeed = 1.5,
		UseDoppler = false,
	},
	{
		sound = "lvs/vehicles/bf109/engine_mid.wav",
		Pitch = 80,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 80,
		FadeIn = 0.15,
		FadeOut = 0.35,
		FadeSpeed = 1.5,
		UseDoppler = true,
	},
	{
		sound = "lvs/vehicles/bf109/engine_high.wav",
		sound_int = "lvs/vehicles/bf109/engine_high_int.wav",
		Pitch = 50,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 60,
		FadeIn = 0.35,
		FadeOut = 1,
		FadeSpeed = 1,
		UseDoppler = true,
	},
}

ENT.ExhaustPositions = {
	{
		pos = Vector(134.49,114.2,97.4),
		ang = Angle(-40,0,0),
	},
	{
		pos = Vector(133.78,85.49,97.32),
		ang = Angle(-40,0,0),
	},
	{
		pos = Vector(134.49,-114.2,97.4),
		ang = Angle(-40,0,0),
	},
	{
		pos = Vector(133.78,-85.49,97.32),
		ang = Angle(-40,0,0),
	},
	{
		pos = Vector(134.49,114.2,97.4),
		ang = Angle(-40,0,0),
	},
	{
		pos = Vector(133.78,85.49,97.32),
		ang = Angle(-40,0,0),
	},
	{
		pos = Vector(134.49,-114.2,97.4),
		ang = Angle(-40,0,0),
	},
	{
		pos = Vector(133.78,-85.49,97.32),
		ang = Angle(-40,0,0),
	},
}
