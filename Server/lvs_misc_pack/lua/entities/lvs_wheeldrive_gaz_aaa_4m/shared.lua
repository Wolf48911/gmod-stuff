
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Gaz AAA 4M"
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

ENT.CannonArmorPenetration = 900
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
			[6] = 2,
			[7] = 1,
		},
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		BodyGroups = {
			[6] = 2,
			[7] = 1,
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
function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/bullet.png")
	weapon.Ammo = 4000
	weapon.Delay = 0.02
	weapon.HeatRateUp = 0.25
	weapon.HeatRateDown = 0.15
	weapon.Attack = function( ent )
		if not ent:TurretInRange() then
			if IsValid( ent.SNDTurretMG ) then
				ent.SNDTurretMG:Stop()
			end

			return true
		end

		ent._MuzzleID = ent._MuzzleID and ent._MuzzleID + 1 or 1

		if ent._MuzzleID > 4 then
			ent._MuzzleID = 1
		end

		local ID = ent:LookupAttachment( "m4_muzzle_"..ent._MuzzleID )

		local Muzzle = ent:GetAttachment( ID )

		if not Muzzle then return end

		local Pos = Muzzle.Pos
		local Dir =  Muzzle.Ang:Forward()

		local bullet = {}
		bullet.Src 	= Pos
		bullet.Dir 	= (ent:GetEyeTrace().HitPos - Pos):GetNormalized()
		bullet.Spread 	= Vector(0.05,0.05,0.05)
		bullet.TracerName = "lvs_tracer_white"
		bullet.Force	= ent.CannonArmorPenetration
		bullet.HullSize 	= 1
		bullet.Damage	= 25
		bullet.Velocity = 30000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo) end
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetOrigin( Pos )
		effectdata:SetNormal( Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		ent:TakeAmmo( 1 )

		if not IsValid( ent.SNDTurretMG ) then return end

		ent.SNDTurretMG:Play()
	end
	weapon.StartAttack = function( ent )
		if not IsValid( ent.SNDTurretMG ) then return end
		ent.SNDTurretMG:Play()
	end
	weapon.FinishAttack = function( ent )
		if not IsValid( ent.SNDTurretMG ) then return end
		if not ent.SNDTurretMG:GetActive() then return end

		ent.SNDTurretMG:Stop()
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/vehicles/222/cannon_overheat.wav")
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen()

		local Col =  ent:TurretInRange() and Color(255,255,255,255) or Color(255,0,0,255)

		ent:PaintCrosshairCenter( Pos2D, Col )
		ent:PaintCrosshairOuter( Pos2D, Col )
		ent:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/horn.png")
	weapon.Ammo = -1
	weapon.Delay = 0.5
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.UseableByAI = false
	weapon.Attack = function( ent ) end
	weapon.StartAttack = function( ent )
		if not IsValid( ent.HornSND ) then return end
		ent.HornSND:Play()
	end
	weapon.FinishAttack = function( ent )
		if not IsValid( ent.HornSND ) then return end
		ent.HornSND:Stop()
	end
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
	weapon.OnThink = function( ent, active )
		ent:SetHeat( self.WEAPONS[1][ 1 ]._CurHeat or 0 )
	end
	self:AddWeapon( weapon )
end

