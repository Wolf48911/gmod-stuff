
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Maschinengewehrkraftwagen"
ENT.Author = "Digger"
ENT.Information = "Maschinengewehr-Kraftwagen"
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
			[16] = 1,
			[17] = 1,
			[19] = 1,
		},
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		BodyGroups = {
			[16] = 1,
			[17] = 1,
			[19] = 1,
		},
		Wheels = {
			Skin = 1,
		}
	},
	{
		Skin = 2,
		BodyGroups = {
			[16] = 1,
			[17] = 1,
			[19] = 1,
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

function ENT:InitWeapons()
	local COLOR_WHITE = Color(255,255,255,255)

	local weapon = {}
	weapon.Ammo = 2500
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.1
	weapon.HeatRateDown = 0.25


	weapon.OnThink = function( ent )
		if ent:GetSelectedWeapon() ~= 1 then return end

		local ply = ent:GetDriver()

		if not IsValid( ply ) then return end

	end


	weapon.Attack = function( ent )

		local ID = ent:LookupAttachment( "muzzle" )

		local Muzzle = ent:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= Muzzle.Ang:Forward()
		bullet.Spread 	= Vector(0.01,0.01,0.01)

		bullet.HullSize 	= 0
		bullet.Damage	= 25
		bullet.Velocity = 30000
		bullet.Attacker 	= ent:GetDriver()

		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( bullet.Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		local PhysObj = ent:GetPhysicsObject()
		if IsValid( PhysObj ) then
			PhysObj:ApplyForceOffset( -bullet.Dir * 5000, bullet.Src )
		end

		ent:TakeAmmo( 1 )
		ent:PlayAnimation( "fire" )
	end
	weapon.StartAttack = function( ent )
		if not IsValid( ent.SNDTurret ) then return end
		ent.SNDTurret:Play()
	end
	weapon.FinishAttack = function( ent )
		if not IsValid( ent.SNDTurret ) then return end
		ent.SNDTurret:Stop()
	end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	weapon.HudPaint = function( ent, X, Y, ply )
		local ID = ent:LookupAttachment( "turret_muzzle1" )

		local Muzzle = ent:GetAttachment( ID )

		if Muzzle then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Forward() * 50000,
				filter = ent:GetCrosshairFilterEnts()
			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			ent:PaintCrosshairCenter( MuzzlePos2D, COLOR_WHITE )
			ent:LVSPaintHitMarker( MuzzlePos2D )
		end
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/vehicles/222/cannon_overheat.wav")
	end
	self:AddWeapon( weapon )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/tank_noturret.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.OnSelect = function( ent )
		if ent.SetTurretEnabled then
			ent:SetTurretEnabled( false )
		end
	end
	weapon.OnDeselect = function( ent )
		if ent.SetTurretEnabled then
			ent:SetTurretEnabled( true )
		end
	end
	self:AddWeapon( weapon )
end


ENT.ExhaustPositions = {
	{
		pos = Vector(-3.97,-32,18.68),
		ang = Angle(0,-90,0),
	},
}

