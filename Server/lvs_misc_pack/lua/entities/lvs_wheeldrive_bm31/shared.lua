
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "BM-31"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Military"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/bm13/bm13.mdl"
ENT.MDL_DESTROYED = "models/diggercars/bm13/dead.mdl"

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

ENT.RandomColor = {
	{
		Skin = 0,
		BodyGroups = {
			[1] = 1,
			[3] = 12,
		},
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		BodyGroups = {
			[1] = 1,
			[3] = 12,
		},
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
			{ pos = Vector(101.4,20.27,51.84), colorB = 200, colorA = 150, },
			{ pos = Vector(101.4,-20.27,51.84), colorB = 200, colorA = 150, },
		},
		ProjectedTextures = {
			{ pos = Vector(101.4,20.27,51.84), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(101.4,-20.27,51.84), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{ pos = Vector(101.4,20.27,51.84), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(101.4,-20.27,51.84), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 3,
		Sprites = {
			{ pos = Vector(101.4,20.27,51.84), colorB = 200, colorA = 150 },
			{ pos = Vector(101.4,-20.27,51.84), colorB = 200, colorA = 150 },
		},
	},
	{
		Trigger = "main+brake",
		SubMaterialID = 1,
		Sprites = {
			{ pos = Vector(-138.48,14.33,37.38), colorG = 0, colorB = 0, colorA = 150 },
		}
	},

}


function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/bomb.png")
	weapon.Ammo = 12 
	weapon.Delay = 1
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 1

	weapon.StartAttack = function( ent )

		if self:GetAI() then return end
		self:MakeProjectile()
	end
	weapon.FinishAttack = function( ent )
		if self:GetAI() then return end

		local Ammo = self:GetAmmo()
		self:SetBodygroup(3, Ammo-1 )

		self:FireProjectile()
	end
	weapon.Attack = function( ent )
		if not self:GetAI() then return end

		local Ammo = self:GetAmmo()
		self:SetBodygroup(3, Ammo-1 )

		self:MakeProjectile()
		self:FireProjectile()
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen()

		ent:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon )

	-- turret rotation disabler
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/tank_noturret.png")
	weapon.UseableByAI = false
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.OnSelect = function( ent, old, new  )
		if ent.SetTurretEnabled then
			ent:SetTurretEnabled( false )
		end
	end
	weapon.OnDeselect = function( ent, old, new  )
		if ent.SetTurretEnabled then
			ent:SetTurretEnabled( true )
		end
	end
	self:AddWeapon( weapon )
end