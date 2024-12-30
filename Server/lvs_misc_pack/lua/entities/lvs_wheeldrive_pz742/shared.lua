
ENT.Base = "lvs_tank_wheeldrive"

ENT.PrintName = "Pz.742r"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Tanks"

ENT.VehicleCategory = "Tanks"
ENT.VehicleSubCategory = "Light"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/bt7/pz742.mdl"
ENT.MDL_DESTROYED = "models/diggercars/bt7/pz_dead.mdl"

ENT.AITEAM = 1

ENT.MaxHealth = 1000

ENT.DSArmorIgnoreForce = 1000
ENT.CannonArmorPenetration = 7000
ENT.CannonArmorPenetration1km = 3000
ENT.Armor = 1000
ENT.TrackArmor = 3000

ENT.SteerSpeed = 1
ENT.SteerReturnSpeed = 2

ENT.PhysicsWeightScale = 2
ENT.PhysicsDampingSpeed = 1000
ENT.PhysicsInertia = Vector(6000,6000,1500)

ENT.MaxVelocity = 850
ENT.MaxVelocityReverse = 350

ENT.EngineCurve = 0.1
ENT.EngineTorque = 150

ENT.TransMinGearHoldTime = 0.1
ENT.TransShiftSpeed = 0

ENT.TransGears = 3
ENT.TransGearsReverse = 1

ENT.MouseSteerAngle = 45

ENT.lvsShowInSpawner = true

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
		sound = "lvs/vehicles/t26/t26_idle.wav",
		Volume = 1,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/t26/t26_engine.wav",
		Volume = 1.5,
		Pitch = 50,
		PitchMul = 100,
		SoundLevel = 75,
		UseDoppler = true,
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
		bullet.Dir 	= Muzzle.Ang:Forward()
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
				endpos = Muzzle.Pos + Muzzle.Ang:Forward() * 50000,
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
	weapon.Ammo = 120
	weapon.Delay = 2.5
	weapon.HeatRateUp = 1
	weapon.HeatRateDown = 0.4
	weapon.OnThink = function( ent )
		if ent:GetSelectedWeapon() ~= 2 then return end

		local ply = ent:GetDriver()

		if not IsValid( ply ) then return end

		local SwitchType = ply:lvsKeyDown( "CAR_SWAP_AMMO" )

		if ent._oldSwitchType ~= SwitchType then
			ent._oldSwitchType = SwitchType

			if SwitchType then
				ent:SetUseHighExplosive( not ent:GetUseHighExplosive() )
				ent:EmitSound("lvs/vehicles/t26/reload.wav", 75, 100, 1, CHAN_WEAPON )
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
		bullet.Dir 	= Muzzle.Ang:Forward()
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
			bullet.Damage	= 700
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

		ent:EmitSound("lvs/vehicles/t26/reload.wav", 75, 100, 1, CHAN_WEAPON )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local ID = ent:LookupAttachment(  "muzzle" )

		local Muzzle = ent:GetAttachment( ID )

		if Muzzle then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Forward() * 50000,
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

ENT.ExhaustPositions = {
	{
		pos = Vector(-92.36,-38.4,45.2),
		ang = Angle(140,0,0),
	},
	{
		pos = Vector(-91.6,-38.4,38.2),
		ang = Angle(140,0,0),
	},
}
