
ENT.Base = "lvs_tank_wheeldrive"

ENT.PrintName = "Panzer I [A]"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Tanks"

ENT.VehicleCategory = "Tanks"
ENT.VehicleSubCategory = "Light"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/pz1/pz1b.mdl"
ENT.MDL_DESTROYED = "models/diggercars/pz1/pz1b_dead.mdl"

ENT.AITEAM = 1

ENT.DSArmorIgnoreForce = 500
ENT.FrontArmor = 900
ENT.MaxHealth = 750


ENT.SteerSpeed = 1
ENT.SteerReturnSpeed = 2

ENT.PhysicsWeightScale = 2
ENT.PhysicsDampingSpeed = 1000
ENT.PhysicsInertia = Vector(6000,6000,1500)

ENT.MaxVelocity = 450
ENT.MaxVelocityReverse = 150

ENT.EngineCurve = 0.1
ENT.EngineTorque = 200

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

function ENT:InitWeapons()
	local COLOR_WHITE = Color(255,255,255,255)

	local weapon = {}
	weapon.Ammo = 2500
	weapon.Delay = 0.05
	weapon.HeatRateUp = 0.4
	weapon.HeatRateDown = 0.25


	weapon.OnThink = function( ent )
		if ent:GetSelectedWeapon() ~= 1 then return end

		local ply = ent:GetDriver()

		if not IsValid( ply ) then return end

	end


	weapon.Attack = function( ent )

		ent._MuzzleID = ent._MuzzleID and ent._MuzzleID + 1 or 1

		if ent._MuzzleID > 2 then
			ent._MuzzleID = 1
		end

		local ID = ent:LookupAttachment( "turret_muzzle"..ent._MuzzleID )


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
			PhysObj:ApplyForceOffset( -bullet.Dir * 10000, bullet.Src )
		end

		ent:TakeAmmo( 1 )
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
		pos = Vector(-84.09,-33.01,42.26),
		ang = Angle(0,-90,0),
	},
}
