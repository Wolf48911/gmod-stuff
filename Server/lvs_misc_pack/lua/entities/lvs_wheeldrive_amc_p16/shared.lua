
ENT.Base = "lvs_tank_wheeldrive"

ENT.PrintName = "AMC P16"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Tanks"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Armored"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/amcp16/amcp16.mdl"
ENT.MDL_DESTROYED = "models/diggercars/amcp16/amcp16_dead.mdl"

ENT.AITEAM = 2

ENT.DSArmorIgnoreForce = 1100
ENT.MaxHealth = 600

ENT.FrontArmor = 200
ENT.TurretArmor = 1100

ENT.CannonArmorPenetration = 3500
ENT.CannonArmorPenetration1km = 2000

ENT.MaxVelocity = 500
ENT.MaxVelocityReverse = 250

ENT.EngineCurve = 0
ENT.EngineTorque = 120

ENT.TransGears = 3
ENT.TransGearsReverse = 1

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
		pos = Vector(-54.43,3.62,18.48),
		ang = Angle(0,180,0),
	},
}


ENT.Lights = {
	{
		Trigger = "main",
		Sprites = {
			{ pos = Vector(92.43,11.67,48.06), colorB = 200, colorA = 150, bodygroup = { name = "headlight1", active = { 0 } }, },
			{ pos = Vector(92.43,-11.67,48.06), colorB = 200, colorA = 150, bodygroup = { name = "headlight2", active = { 0 } }, },
		},
		ProjectedTextures = {
			{ pos = Vector(92.43,11.67,48.06), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "headlight1", active = { 0 } }, },
			{ pos = Vector(92.43,-11.67,48.06), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "headlight2", active = { 0 } }, },
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{ pos = Vector(92.43,11.67,48.06), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "headlight1", active = { 0 } }, },
			{ pos = Vector(92.43,-11.67,48.06), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true, bodygroup = { name = "headlight2", active = { 0 } }, },
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = 4,
		Sprites = {
			{ pos = Vector(92.43,11.67,48.06), colorB = 200, colorA = 150, bodygroup = { name = "headlight1", active = { 0 } }, },
			{ pos = Vector(92.43,-11.67,48.06), colorB = 200, colorA = 150, bodygroup = { name = "headlight2", active = { 0 } }, },
		},
	},
}

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "UseHighExplosive" )
end

function ENT:InitWeapons()
	local COLOR_WHITE = Color(255,255,255,255)

	-- coaxial machinegun
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/mg.png")
	weapon.Ammo = 1000
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		local ID = ent:LookupAttachment( "muzzle_mg" )

		local Muzzle = ent:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= Muzzle.Ang:Up()
		bullet.Spread 	= Vector(0.015,0.015,0.015)
		bullet.TracerName = "lvs_tracer_yellow"
		bullet.Force	= 10
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

		ent:TakeAmmo( 1 )
	end
	weapon.StartAttack = function( ent )
		if not IsValid( ent.SNDTurretMG ) then return end
		ent.SNDTurretMG:Play()
	end
	weapon.FinishAttack = function( ent )
		if not IsValid( ent.SNDTurretMG ) then return end
		ent.SNDTurretMG:Stop()
	end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	weapon.HudPaint = function( ent, X, Y, ply )
		local ID = ent:LookupAttachment(  "muzzle" )

		local Muzzle = ent:GetAttachment( ID )

		if Muzzle then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Up() * 50000,
				filter = ent:GetCrosshairFilterEnts()
			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			ent:PaintCrosshairCenter( MuzzlePos2D, COLOR_WHITE )
			ent:LVSPaintHitMarker( MuzzlePos2D )
		end
	end
	self:AddWeapon( weapon )



	local weapon = {}
	weapon.Icon = true
	weapon.Ammo = 100
	weapon.Delay = 3
	weapon.HeatRateUp = 1
	weapon.HeatRateDown = 0.3
	weapon.OnThink = function( ent )
		if ent:GetSelectedWeapon() ~= 2 then return end

		local ply = ent:GetDriver()

		if not IsValid( ply ) then return end

		local SwitchType = ply:lvsKeyDown( "CAR_SWAP_AMMO" )

		if ent._oldSwitchType ~= SwitchType then
			ent._oldSwitchType = SwitchType

			if SwitchType then
				ent:SetUseHighExplosive( not ent:GetUseHighExplosive() )
				ent:EmitSound("lvs/vehicles/sherman/cannon_unload.wav", 75, 100, 1, CHAN_WEAPON )
				ent:SetHeat( 1 )
				ent:SetOverheated( true )
			end
		end
	end
	weapon.Attack = function( ent )
		local ID = ent:LookupAttachment( "muzzle" )

		local Muzzle = ent:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= Muzzle.Ang:Up()
		bullet.Spread = Vector(0,0,0)

		if ent:GetUseHighExplosive() then
			bullet.Force	= 500
			bullet.HullSize 	= 15
			bullet.Damage	= 200
			bullet.SplashDamage = 250
			bullet.SplashDamageRadius = 150
			bullet.SplashDamageEffect = "lvs_bullet_impact_explosive"
			bullet.SplashDamageType = DMG_BLAST
			bullet.Velocity = 13000
		else
			bullet.Force	= ent.CannonArmorPenetration
			bullet.Force1km	= ent.CannonArmorPenetration1km
			bullet.HullSize 	= 0
			bullet.Damage	= 650
			bullet.Velocity = 18000
		end

		bullet.TracerName = "lvs_tracer_cannon"
		bullet.Attacker 	= ent:GetDriver()
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( bullet.Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		local PhysObj = ent:GetPhysicsObject()
		if IsValid( PhysObj ) then
			PhysObj:ApplyForceOffset( -bullet.Dir * 50000, bullet.Src )
		end

		ent:TakeAmmo( 1 )

		ent:PlayAnimation( "shot" )

		if not IsValid( ent.SNDTurret ) then return end

		ent.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )

		ent:EmitSound("lvs/vehicles/amcp16/reload.wav", 75, 100, 1, CHAN_WEAPON )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local ID = ent:LookupAttachment(  "muzzle" )

		local Muzzle = ent:GetAttachment( ID )

		if Muzzle then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Up() * 50000,
				filter = ent:GetCrosshairFilterEnts()
			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			if ent:GetUseHighExplosive() then
				ent:PaintCrosshairSquare( MuzzlePos2D, COLOR_WHITE )
			else
				ent:PaintCrosshairOuter( MuzzlePos2D, COLOR_WHITE )
			end

			ent:LVSPaintHitMarker( MuzzlePos2D )
		end
	end
	self:AddWeapon( weapon )



	-- turret rotation disabler
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/tank_noturret.png")
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


