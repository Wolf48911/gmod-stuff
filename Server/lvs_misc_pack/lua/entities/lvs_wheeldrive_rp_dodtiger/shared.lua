
ENT.Base = "lvs_tank_wheeldrive"

ENT.PrintName = "Panzer VI Tiger"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - RP Tanks"

ENT.VehicleCategory = "Tanks"
ENT.VehicleSubCategory = "RP"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/blu/tanks/tiger_int.mdl"
ENT.MDL_DESTROYED = "models/blu/tanks/tiger_lvs_gib_1.mdl"

ENT.GibModels = {
	"models/blu/tanks/tiger_lvs_gib_2.mdl",
	"models/blu/tanks/tiger_lvs_gib_3.mdl",
	"models/blu/tanks/tiger_lvs_gib_4.mdl",
}

ENT.AITEAM = 1

ENT.MaxHealth = 1500

--damage system
ENT.DSArmorIgnoreForce = 4000
ENT.CannonArmorPenetration = 14500
ENT.CannonArmorPenetration1km = 10500
ENT.FrontArmor = 6000
ENT.SideArmor = 4000
ENT.TurretArmor = 6000
ENT.RearArmor = 4000

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

ENT.TransGears = 7
ENT.TransGearsReverse = 1

ENT.MouseSteerAngle = 45

ENT.lvsShowInSpawner = true

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/tiger/eng_idle_loop.wav",
		Volume = 1,
		Pitch = 70,
		PitchMul = 30,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/tiger/eng_loop.wav",
		Volume = 1,
		Pitch = 30,
		PitchMul = 100,
		SoundLevel = 85,
		SoundType = LVS.SOUNDTYPE_NONE,
		UseDoppler = true,
	},
}

ENT.ExhaustPositions = {
	{
		pos = Vector(-116.7,-16.67,68.88),
		ang = Angle(-90,0,0),
	},
	{
		pos = Vector(-116.7,16.67,68.88),
		ang = Angle(-90,0,0),
	},
}

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "GunnerSeat" )
	self:AddDT( "Entity", "CommSeat" )
	self:AddDT( "Entity", "RadioSeat" )
	self:AddDT( "Entity", "LoaderSeat" )
	self:AddDT( "Bool", "UseHighExplosive" )
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
		self:SetPoseParameter("visor", self.SDsm )
		self:SetPoseParameter("hatch1", self.SDsm )
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
	weapon.Icon = Material("lvs/weapons/smoke_launcher.png")
	weapon.Ammo = 3
	weapon.Delay = 1
	weapon.HeatRateUp = 1
	weapon.HeatRateDown = 0.05
	weapon.Attack = function( ent )
		ent:TakeAmmo( 1 )

		local ID1 = ent:LookupAttachment( "muzzle_smoke_right" )
		local ID2 = ent:LookupAttachment( "muzzle_smoke_left" )

		local Muzzle1 = ent:GetAttachment( ID1 )
		local Muzzle2 = ent:GetAttachment( ID2 )

		if not Muzzle1 or not Muzzle2 then return end

		local Up = self:GetUp()

		ent:EmitSound("lvs/smokegrenade.wav")

		local Ang1 = Muzzle1.Ang
		Ang1:RotateAroundAxis( Up, -5 )
		local grenade = ents.Create( "lvs_item_smoke" )
		grenade:SetPos( Muzzle1.Pos )
		grenade:SetAngles( Ang1 )
		grenade:Spawn()
		grenade:Activate()
		grenade:GetPhysicsObject():SetVelocity( Ang1:Up() * 1000 ) 

		local Ang2 = Muzzle2.Ang
		Ang2:RotateAroundAxis( Up, 5 )
		local grenade = ents.Create( "lvs_item_smoke" )
		grenade:SetPos( Muzzle2.Pos )
		grenade:SetAngles( Ang2 )
		grenade:Spawn()
		grenade:Activate()
		grenade:GetPhysicsObject():SetVelocity( Ang2:Up() * 1000 ) 

		local Ang3 = Muzzle1.Ang
		Ang3:RotateAroundAxis( Up, -15 )
		local grenade = ents.Create( "lvs_item_smoke" )
		grenade:SetPos( Muzzle1.Pos )
		grenade:SetAngles( Ang3 )
		grenade:Spawn()
		grenade:Activate()
		grenade:GetPhysicsObject():SetVelocity( Ang3:Up() * 1000 ) 


		local Ang4 = Muzzle2.Ang
		Ang4:RotateAroundAxis( Up, 15 )
		local grenade = ents.Create( "lvs_item_smoke" )
		grenade:SetPos( Muzzle2.Pos )
		grenade:SetAngles( Ang4 )
		grenade:Spawn()
		grenade:Activate()
		grenade:GetPhysicsObject():SetVelocity( Ang4:Up() * 1000 ) 
	end
	self:AddWeapon( weapon )


	local weapon = {}
	weapon.Icon = Material("lvs/weapons/grenade_launcher.png")
	weapon.Ammo = 1
	weapon.Delay = 1
	weapon.HeatRateUp = 1
	weapon.HeatRateDown = 1
	weapon.Attack = function( ent )
		ent:TakeAmmo( 1 )

		ent:EmitSound("lvs/smokegrenade.wav")

		local nades = {
			[1] = {
				pos = Vector(82.52,61.27,74.75),
				ang = Angle(-60,45,0),
			},
			[2] = {
				pos = Vector(82.52,-61.27,74.75),
				ang = Angle(-60,-45,0),
			},
			[3] = {
				pos = Vector(-46.24,61.77,75.63),
				ang = Angle(-60,90,0),
			},
			[4] = {
				pos = Vector(-46.24,-61.77,75.63),
				ang = Angle(-60,-90,0),
			},
		}

		for _, data in pairs( nades ) do
			timer.Simple( math.Rand(0,0.2), function()
				if not IsValid( ent ) then return end

				local pos = ent:LocalToWorld( data.pos ) 
				local ang = ent:LocalToWorldAngles( data.ang )
		
				local grenade = ents.Create( "lvs_item_explosive" )
				grenade:SetPos( pos )
				grenade:SetAngles( ang )
				grenade:Spawn()
				grenade:Activate()
				grenade:SetAttacker( ent:GetDriver() )
				grenade:GetPhysicsObject():SetVelocity( ang:Forward() * 300 )
			end )
		end
	end
	self:AddWeapon( weapon )

	-- driver hatch open
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hatch_opend.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.OnSelect = function( ent, old, new  )
		local base = ent:GetVehicle()
		if not IsValid( base.DriverHatch ) then return end
		if not IsValid( base ) then return end
		base.DriverHatch:Open()
	end
	weapon.OnDeselect = function( ent, old, new  )
		local base = ent:GetVehicle()
		if not IsValid( base.DriverHatch ) then return end
		if not IsValid( base ) then return end
		base.DriverHatch:Close()
	end
	self:AddWeapon( weapon )


	self:AddGunnerWeapons()
end

function ENT:GunnerInRange( Dir )
	return self:AngleBetweenNormal( self:GetForward(), Dir ) < 30
end

function ENT:AddGunnerWeapons()
	local COLOR_RED = Color(255,0,0,255)
	local COLOR_WHITE = Color(255,255,255,255)






	local weapon = {}
	weapon.Icon = true
	weapon.Ammo = 30
	weapon.Delay = 3.3
	weapon.HeatRateUp = 1
	weapon.HeatRateDown = 0.22

	weapon.OnThink = function( ent )
		local base = ent:GetVehicle()
		local ply = ent:GetDriver()
		if ent:GetSelectedWeapon() ~= 1 then return end
		if not IsValid( ply ) then return end

		local SwitchType = ply:lvsKeyDown( "CAR_SWAP_AMMO" )

		if ent._oldSwitchType ~= SwitchType then
			ent._oldSwitchType = SwitchType

			if SwitchType then
				base:SetUseHighExplosive( not base:GetUseHighExplosive() )
				base:EmitSound("lvs/vehicles/tiger/cannon_unload.wav", 75, 100, 1, CHAN_WEAPON )
				base:DoReloadSequence( 0 )
				ent:SetHeat( 1 )
				ent:SetOverheated( true )
			end
		end
	end

	weapon.Attack = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end
		local ID = base:LookupAttachment( "muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= Muzzle.Ang:Up()
		bullet.Spread = Vector(0,0,0)

		if base:GetUseHighExplosive() then
			bullet.Force	= 500
			bullet.HullSize 	= 15
			bullet.Damage	= 250
			bullet.SplashDamage = 1000
			bullet.SplashDamageRadius = 250
			bullet.SplashDamageEffect = "lvs_bullet_impact_explosive"
			bullet.SplashDamageType = DMG_BLAST
			bullet.Velocity = 13000
		else
			bullet.Force	= base.CannonArmorPenetration
			bullet.Force1km	= base.CannonArmorPenetration1km
			bullet.HullSize 	= 0
			bullet.Damage	= 1250
			bullet.Velocity = 16000
		end

		bullet.TracerName = "lvs_tracer_cannon"
		bullet.Attacker 	= ent:GetDriver()
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( bullet.Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		local PhysObj = base:GetPhysicsObject()
		if IsValid( PhysObj ) then
			PhysObj:ApplyForceOffset( -bullet.Dir * 150000, bullet.Src )
		end

		ent:TakeAmmo( 1 )

		base:PlayAnimation( "shot" )
		base:DoReloadSequence( 1 )

		if not IsValid( base.SNDTurret ) then return end

		base.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + base:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )

		base:EmitSound("lvs/vehicles/tiger/cannon_reload.wav", 75, 100, 1, CHAN_WEAPON )
	end

	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end
		local ID = base:LookupAttachment(  "muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if Muzzle then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Up() * 50000,
				filter = base:GetCrosshairFilterEnts()

			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			if base:GetUseHighExplosive() then
				base:PaintCrosshairSquare( MuzzlePos2D, COLOR_WHITE )
			else
				base:PaintCrosshairOuter( MuzzlePos2D, COLOR_WHITE )
			end

			base:LVSPaintHitMarker( MuzzlePos2D )
		if not self:GetGunnerSeat():GetThirdPersonMode() and ply:lvsKeyDown("ZOOM") then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Up() * 50000,
				filter = ent:GetCrosshairFilterEnts()
			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			if (MuzzlePos2D.x > -X and MuzzlePos2D.x < X * 2) and (MuzzlePos2D.y > -Y and MuzzlePos2D.y < Y * 2) then

				local black = Material( "lvs/halo.png" )
				local scope = Material( "lvs/sight_empty.png" )
				local aim = Material( "lvs/sight_ger_aim.png" )
				local rot = Material( "lvs/rot_tiger.png" )
				surface.SetMaterial( black )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 28160, MuzzlePos2D.y - 15840, 56320, 31680 )
			
				surface.SetMaterial( scope )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 600, MuzzlePos2D.y - 600, 1200, 1200 )

				surface.SetMaterial( aim )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 500, MuzzlePos2D.y - 500, 1000, 1000 )

				surface.SetMaterial( rot )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRectRotated( MuzzlePos2D.x - 0, MuzzlePos2D.y - 0, 900, 900, 0 )

			else
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawRect( 0, 0, X, Y )
			end
		end
	end
	end

	self:AddWeapon( weapon, 2 )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/mg.png")
	weapon.Ammo = 1000
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		local ID = base:LookupAttachment( "muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos - Muzzle.Ang:Up() * 140 - Muzzle.Ang:Forward() * 15
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
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end
		local ID = base:LookupAttachment(  "muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if Muzzle then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Up() * 50000,
				filter = base:GetCrosshairFilterEnts()

			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			base:PaintCrosshairCenter( MuzzlePos2D, Col )

			base:LVSPaintHitMarker( MuzzlePos2D )
		if not self:GetGunnerSeat():GetThirdPersonMode() and ply:lvsKeyDown("ZOOM") then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Up() * 50000,
				filter = ent:GetCrosshairFilterEnts()
			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			if (MuzzlePos2D.x > -X and MuzzlePos2D.x < X * 2) and (MuzzlePos2D.y > -Y and MuzzlePos2D.y < Y * 2) then
				local black = Material( "lvs/halo.png" )
				local scope = Material( "lvs/sight_empty.png" )
				local aim = Material( "lvs/sight_ger_aim.png" )
				local rot = Material( "lvs/rot_tiger.png" )
				surface.SetMaterial( black )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 28160, MuzzlePos2D.y - 15840, 56320, 31680 )
			
				surface.SetMaterial( scope )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 600, MuzzlePos2D.y - 600, 1200, 1200 )

				surface.SetMaterial( aim )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 500, MuzzlePos2D.y - 500, 1000, 1000 )

				surface.SetMaterial( rot )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRectRotated( MuzzlePos2D.x - 0, MuzzlePos2D.y - 0, 900, 900, 180 )

			else
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawRect( 0, 0, X, Y )
			end
		end
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
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end
		local ID = base:LookupAttachment(  "muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if Muzzle then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Up() * 50000,
				filter = base:GetCrosshairFilterEnts()

			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			base:LVSPaintHitMarker( MuzzlePos2D )
		if not self:GetGunnerSeat():GetThirdPersonMode() and ply:lvsKeyDown("ZOOM") then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Up() * 50000,
				filter = ent:GetCrosshairFilterEnts()
			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			if (MuzzlePos2D.x > -X and MuzzlePos2D.x < X * 2) and (MuzzlePos2D.y > -Y and MuzzlePos2D.y < Y * 2) then
				local black = Material( "lvs/halo.png" )
				local scope = Material( "lvs/sight_empty.png" )
				local aim = Material( "lvs/sight_ger_aim.png" )
				local rot = Material( "lvs/rot_tiger.png" )
				surface.SetMaterial( black )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 28160, MuzzlePos2D.y - 15840, 56320, 31680 )
			
				surface.SetMaterial( scope )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 600, MuzzlePos2D.y - 600, 1200, 1200 )

				surface.SetMaterial( aim )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 500, MuzzlePos2D.y - 500, 1000, 1000 )

				surface.SetMaterial( rot )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRectRotated( MuzzlePos2D.x - 0, MuzzlePos2D.y - 0, 900, 900, 180 )

			else
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawRect( 0, 0, X, Y )
			end
		end
	end
	end
	self:AddWeapon( weapon, 2 )


	local weapon = {}
	weapon.Icon = Material("lvs/weapons/mg.png")
	weapon.Ammo = 1000
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if not base:GunnerInRange( ent:GetAimVector() ) then

			if not IsValid( base.SNDTurretMGf ) then return true end

			base.SNDTurretMGf:Stop()
	
			return true
		end

		local ID = base:LookupAttachment( "muzzle_machinegun" )

		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= (ent:GetEyeTrace().HitPos - bullet.Src):GetNormalized()
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
		effectdata:SetNormal( Muzzle.Ang:Forward() )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		ent:TakeAmmo( 1 )

		if not IsValid( base.SNDTurretMGf ) then return end

		base.SNDTurretMGf:Play()
	end
	weapon.StartAttack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) or not IsValid( base.SNDTurretMGf ) then return end

		base.SNDTurretMGf:Play()
	end
	weapon.FinishAttack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) or not IsValid( base.SNDTurretMGf ) then return end

		base.SNDTurretMGf:Stop()
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		local Angles = base:WorldToLocalAngles( ent:GetAimVector():Angle() )
		Angles:Normalize()

		base:SetPoseParameter("mg_yaw", -Angles.y )
		base:SetPoseParameter("mg_pitch",  -Angles.p )
	end

	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end
		local ID = base:LookupAttachment( "muzzle_machinegun" )

		local Muzzle = base:GetAttachment( ID )

		if Muzzle then
			local Start = Muzzle.Pos

			local traceTurret = util.TraceLine( {
				start = Start,
				endpos = Start + Muzzle.Ang:Forward() * 50000,
				filter = base:GetCrosshairFilterEnts()
			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			base:PaintCrosshairCenter( MuzzlePos2D, Col )
			base:LVSPaintHitMarker( MuzzlePos2D )
		end
		if not self:GetRadioSeat():GetThirdPersonMode() and ply:lvsKeyDown("ZOOM") then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Forward() * 50000,
				filter = ent:GetCrosshairFilterEnts()
			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			if (MuzzlePos2D.x > -X and MuzzlePos2D.x < X * 2) and (MuzzlePos2D.y > -Y and MuzzlePos2D.y < Y * 2) then
				local black = Material( "lvs/halo.png" )
				local scope = Material( "lvs/sight_empty.png" )
				local aim = Material( "lvs/sight_ger_aim.png" )
				surface.SetMaterial( black )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 28160, MuzzlePos2D.y - 15840, 56320, 31680 )
			
				surface.SetMaterial( scope )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 600, MuzzlePos2D.y - 600, 1200, 1200 )

				surface.SetMaterial( aim )
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawTexturedRect( MuzzlePos2D.x - 500, MuzzlePos2D.y - 500, 1000, 1000 )
			else
				surface.SetDrawColor( 0, 0, 0, 255 )
				surface.DrawRect( 0, 0, X, Y )
			end
		end
	end

	self:AddWeapon( weapon, 4 )

	-- radio hatch open
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hatch_opend.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.OnSelect = function( ent, old, new  )
		local base = ent:GetVehicle()
		if not IsValid( base.RadioHatch ) then return end
		if not IsValid( base ) then return end
		base.RadioHatch:Open()
	end
	weapon.OnDeselect = function( ent, old, new  )
		local base = ent:GetVehicle()
		if not IsValid( base.RadioHatch ) then return end
		if not IsValid( base ) then return end
		base.RadioHatch:Close()
	end
	self:AddWeapon( weapon, 4 )


	-- comm default
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hatch_closed.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	self:AddWeapon( weapon, 3 )

	-- comm hatch open
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hatch_opend.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.OnSelect = function( ent, old, new  )
		local base = ent:GetVehicle()
		if not IsValid( base.CommHatch ) then return end
		if not IsValid( base ) then return end
		base.CommHatch:Open()
	end
	weapon.OnDeselect = function( ent, old, new  )
		local base = ent:GetVehicle()
		if not IsValid( base.CommHatch ) then return end
		if not IsValid( base ) then return end
		base.CommHatch:Close()
	end
	self:AddWeapon( weapon, 3 )


	-- loader default
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hatch_closed.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	self:AddWeapon( weapon, 5 )

	-- loader hatch open
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hatch_opend.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.OnSelect = function( ent, old, new  )
		local base = ent:GetVehicle()
		if not IsValid( base.LoaderHatch ) then return end
		if not IsValid( base ) then return end
		base.LoaderHatch:Open()
	end
	weapon.OnDeselect = function( ent, old, new  )
		local base = ent:GetVehicle()
		if not IsValid( base.LoaderHatch ) then return end
		if not IsValid( base ) then return end
		base.LoaderHatch:Close()
	end
	self:AddWeapon( weapon, 5 )

end
