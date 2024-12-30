
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "BA-64"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Armored"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/ba64/ba64.mdl"
ENT.MDL_DESTROYED = "models/diggercars/ba64/ba64_dead.mdl"

ENT.AITEAM = 2

ENT.MaxHealth = 750

--damage system
ENT.DSArmorIgnoreForce = 1000
ENT.CannonArmorPenetration = 1201


ENT.MaxVelocity = 1000

ENT.EngineCurve = 0.2
ENT.EngineTorque = 200

ENT.TransGears = 5
ENT.TransGearsReverse = 5

ENT.FastSteerAngleClamp = 5
ENT.FastSteerDeactivationDriftAngle = 12

ENT.PhysicsWeightScale = 1.5
ENT.PhysicsDampingForward = true
ENT.PhysicsDampingReverse = true

ENT.lvsShowInSpawner = true

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/willy/eng_idle_loop.wav",
		Volume = 0.5,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/willy/eng_loop.wav",
		Volume = 1,
		Pitch = 50,
		PitchMul = 100,
		SoundLevel = 75,
		UseDoppler = true,
	},
}

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "GunnerSeat" )
	self:AddDT( "Int", "DoorMode" )
end

function ENT:InitWeapons()
	local COLOR_WHITE = Color(255,255,255,255)

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/driver_visor.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.OnThink = function( ent )
		local DoorMode = self:GetDoorMode()
		local TargetValue = DoorMode >= 1 and 1 or 0
		self.SDsm = isnumber( self.SDsm ) and (self.SDsm + math.Clamp((TargetValue - self.SDsm) * 5,-1,2) * FrameTime() ) or 0
		self:SetPoseParameter("hatch", self.SDsm )
	end

	weapon.StartAttack = function( ent )
		local T = CurTime()

		if (ent.NextDoor or 0) > T then return end

		local DoorMode = ent:GetDoorMode() + 1

		ent:SetDoorMode( DoorMode )
			
		if DoorMode == 1 then
		end
			
		if DoorMode == 2 then
			ent:SetDoorMode( 0 )
		end
	end
	self:AddWeapon( weapon )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/mg.png")
	weapon.Ammo = 3000
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		local ID = base:LookupAttachment( "muzzle_turret" )

		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= Muzzle.Ang:Forward()
		bullet.Spread 	= Vector(0.015,0.015,0.015)
		bullet.TracerName = "lvs_tracer_yellow_small"
		bullet.EnableBallistics = true
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

		base:PlayAnimation( "shot" )

		ent:TakeAmmo( 1 )
	end
	weapon.StartAttack = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end
		if not IsValid( base.SNDTurretMG ) then return end
		base.SNDTurretMG:Play()
	end
	weapon.FinishAttack = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end
		if not IsValid( base.SNDTurretMG ) then return end
		base.SNDTurretMG:Stop()
	end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end

	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		local ID = base:LookupAttachment(  "muzzle_aim" )
		local Muzzle = base:GetAttachment( ID )

		if Muzzle then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Forward() * 50000,
				filter = base:GetCrosshairFilterEnts()

			} )

			local Distance = (traceTurret.HitPos - Muzzle.Pos):Length()

			local Angles = base:WorldToLocalAngles( ent:GetAimVector():Angle() )
			Angles:Normalize()

			AimLift = Distance/15000

			base:SetPoseParameter("aperture",  AimLift )
		end
	end
	self:AddWeapon( weapon, 2 )

	-- turret rotation disabler
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/tank_noturret.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.UseableByAI = false
	weapon.OnSelect = function( ent, old, new  )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		if base.SetTurretEnabled then
			base:SetTurretEnabled( false )
		end
	end
	weapon.OnDeselect = function( ent, old, new  )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		if base.SetTurretEnabled then
			base:SetTurretEnabled( true )
		end
	end
	self:AddWeapon( weapon, 2 )
end


ENT.ExhaustPositions = {
	{
		pos = Vector(19.86,-12.19,11.76),
		ang = Angle(0,0,0),
	},
}
