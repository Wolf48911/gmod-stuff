
ENT.Base = "lvs_wheeldrive_sdkfz251_base"

ENT.PrintName = "Wurfrahmen 40"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Armored"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.RandomColor = {
	{
		Skin = 0,
		BodyGroups = {
			[3] = 1,
			[5] = 1,
			[6] = 6,
		},
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		BodyGroups = {
			[3] = 1,
			[5] = 1,
			[6] = 6,
		},
		Wheels = {
			Skin = 1,
		}
	},
}


function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "FrontGunnerSeat" )
end




function ENT:GunnerInRange( Dir )
	return self:AngleBetweenNormal( self:GetForward(), Dir ) < 30
end



function ENT:CalcMainActivityPassenger( ply )
	local FrontGunnerSeat = self:GetFrontGunnerSeat()

	if not IsValid( FrontGunnerSeat ) then return end

	if FrontGunnerSeat:GetDriver() ~= ply then return end

	if ply.m_bWasNoclipping then 
		ply.m_bWasNoclipping = nil 
		ply:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM ) 
		
		if CLIENT then 
			ply:SetIK( true )
		end 
	end 

	ply.CalcIdeal = ACT_STAND
	ply.CalcSeqOverride = ply:LookupSequence( "cwalk_revolver" )

	return ply.CalcIdeal, ply.CalcSeqOverride
end

function ENT:UpdateAnimation( ply, velocity, maxseqgroundspeed )
	ply:SetPlaybackRate( 1 )

	if CLIENT then
		local FrontGunnerSeat = self:GetFrontGunnerSeat()

		if ply == self:GetDriver() then
			ply:SetPoseParameter( "vehicle_steer", self:GetSteer() /  self:GetMaxSteerAngle() )
			ply:InvalidateBoneCache()
		end

		if IsValid( FrontGunnerSeat ) and FrontGunnerSeat:GetDriver() == ply then
			local Pitch = math.Remap( self:GetPoseParameter( "mg_pitch" ),0,1,-15,-5)
			local Yaw = math.Remap( self:GetPoseParameter( "mg_yaw" ),0,1,-15,15) 

			ply:SetPoseParameter( "aim_pitch", Pitch * 1.5 )
			ply:SetPoseParameter( "aim_yaw", Yaw * 1.5 )

			ply:SetPoseParameter( "head_pitch", -Pitch * 2 )
			ply:SetPoseParameter( "head_yaw", -Yaw * 3 )

			ply:SetPoseParameter( "move_x", 0 )
			ply:SetPoseParameter( "move_y", 0 )

			ply:InvalidateBoneCache()
		end

		GAMEMODE:GrabEarAnimation( ply )
		GAMEMODE:MouthMoveAnimation( ply )
	end

	return false
end


function ENT:InitWeapons()

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

		local ID = base:LookupAttachment( "muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= (ent:GetEyeTrace().HitPos - bullet.Src):GetNormalized()
		bullet.Spread 	= Vector(0.015,0.015,0.015)
		bullet.TracerName = "lvs_tracer_yellow_small"
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



		base:PlayAnimation( "shot_mg" )

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

		if not base:GetAI() and not IsValid( ent:GetDriver() ) then
			base:SetPoseParameter("mg_pitch",  15 )
			base:SetPoseParameter("mg_yaw", 0 )

			return
		end

		local Angles = base:WorldToLocalAngles( ent:GetAimVector():Angle() )
		Angles:Normalize()

		base:SetPoseParameter("mg_yaw", -Angles.y )
		base:SetPoseParameter("mg_pitch",  -Angles.p )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen()

		local Col =  base:GunnerInRange( ent:GetAimVector() ) and COLOR_WHITE or COLOR_RED

		base:PaintCrosshairCenter( Pos2D, Col )
		base:LVSPaintHitMarker( Pos2D )
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/overheat.wav")
	end
	self:AddWeapon( weapon, 3 )


	local weapon = {}
	weapon.Icon = Material("lvs/weapons/bomb.png")
	weapon.Ammo = 6 
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 3

	weapon.StartAttack = function( ent )

		if self:GetAI() then return end
		self:MakeProjectile()
	end
	weapon.FinishAttack = function( ent )
		if self:GetAI() then return end

		local Ammo = self:GetAmmo()
		self:SetBodygroup(6, Ammo-1 )

		self:FireProjectile()
	end
	weapon.Attack = function( ent )
		if not self:GetAI() then return end

		local Ammo = self:GetAmmo()
		self:SetBodygroup(6, Ammo-1 )

		self:MakeProjectile()
		self:FireProjectile()
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen()

		ent:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon, 1 )

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
	self:AddWeapon( weapon, 1 )
end