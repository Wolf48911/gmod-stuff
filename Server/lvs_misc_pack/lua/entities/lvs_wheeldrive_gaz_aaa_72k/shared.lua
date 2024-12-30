
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Gaz AAA 72K"
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
	"models/diggercars/gaz_aaa/72k_gib1.mdl",
	"models/diggercars/gaz_aaa/72k_gib2.mdl",
	"models/diggercars/gaz_aaa/72k_gib3.mdl",
	"models/gibs/manhack_gib04.mdl",
	"models/props_c17/canisterchunk01a.mdl",
	"models/props_c17/canisterchunk01d.mdl",
}

ENT.AITEAM = 2

ENT.MaxVelocity = 1200

ENT.CannonArmorPenetration = 3500
ENT.CannonArmorPenetration1km = 1500
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
			[6] = 1,
			[7] = 1,
		},
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		BodyGroups = {
			[6] = 1,
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

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "UseHighExplosive" )
end

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/bullet_ap.png")
	weapon.Ammo = 300
	weapon.Delay = 0.25
	weapon.HeatRateUp = 0.25
	weapon.HeatRateDown = 0.5

	weapon.OnThink = function( ent )
		if ent:GetSelectedWeapon() ~= 1 then return end

		local ply = ent:GetDriver()

		if not IsValid( ply ) then return end

		local SwitchType = ply:lvsKeyDown( "CAR_SWAP_AMMO" )

		if ent._oldSwitchType ~= SwitchType then
			ent._oldSwitchType = SwitchType

			if SwitchType then
				ent:SetUseHighExplosive( not ent:GetUseHighExplosive() )
				ent:EmitSound("lvs/vehicles/222/cannon_overheat.wav", 75, 100, 1, CHAN_WEAPON )
				ent:SetHeat( 1 )
				ent:SetOverheated( true )
			end
		end
	end



	weapon.Attack = function( ent )

		if not ent:TurretInRange() then
			return true
		end

		local ID = ent:LookupAttachment( "72k_muzzle" )

		local Muzzle = ent:GetAttachment( ID )

		if not Muzzle then return end

		local Pos = Muzzle.Pos
		local Dir = (ent:GetEyeTrace().HitPos - Pos):GetNormalized()

		local bullet = {}
		bullet.Src 	= Pos
		bullet.Dir 	= Dir
		bullet.Spread 	= Vector(0,0,0)
		bullet.TracerName = "lvs_tracer_autocannon"

		if ent:GetUseHighExplosive() then
			bullet.SplashDamage = 80
			bullet.SplashDamageRadius = 190
			bullet.SplashDamageEffect = "lvs_defence_explosion"
			bullet.SplashDamageType = DMG_BLAST
			bullet.Force	= 900
			bullet.Damage	= 5
			bullet.HullSize 	= math.Round( math.min( 200 * math.abs( Dir.z ), 50 ), 0 )
		else
			bullet.Force	= ent.CannonArmorPenetration
			bullet.Force1km	= ent.CannonArmorPenetration1km
			bullet.Damage	= 80
			bullet.HullSize 	= 1
		end



		bullet.Velocity = 30000
		bullet.Attacker 	= ent:GetDriver()
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( bullet.Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		ent:PlayAnimation( "fire" )

		ent:TakeAmmo( 1 )

		if not IsValid( ent.SNDTurret ) then return end

		ent.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
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
end

