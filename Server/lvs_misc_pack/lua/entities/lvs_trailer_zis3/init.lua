AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "sh_turret.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_optics.lua" )
include("shared.lua")
include("sh_turret.lua")

ENT.AISearchCone = 30

function ENT:OnSpawn( PObj )
	self:AddDriverSeat( Vector(-45,15,-5), Angle(0,-90,0) )

	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/cannons/75_105_05.wav", "lvs/vehicles/cannons/75_105_05.wav" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )

	local WheelModel = "models/diggerCars/cannons/zis3_wheel.mdl"

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_NONE,
			SteerAngle = 0,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = {
			self:AddWheel( {
				pos = Vector(0,28.8,17),
				mdl = WheelModel,
				mdl_ang = Angle(0,-90,0),
			} ),

			self:AddWheel( {
				pos = Vector(0,-28.8,17),
				mdl = WheelModel,
				mdl_ang = Angle(0,90,0),

			} ),
		},
		Suspension = {
			Height = 0,
			MaxTravel = 0,
			ControlArmLength = 0,
		},
	} )

	self:AddTrailerHitch( Vector(-135.9,0,10.46), LVS.HITCHTYPE_FEMALE )
end

function ENT:OnTick()
	self:AimTurret()
end

function ENT:OnCollision( data, physobj )
	if self:WorldToLocal( data.HitPos ).z < 19 then return true end -- dont detect collision  when the lower part of the model touches the ground

	return false
end

function ENT:OnCoupled( targetVehicle, targetHitch )
	self:SetProngs( true )

	timer.Simple( 0.2, function()
		if not IsValid( self ) then return end

		self:RebuildCrosshairFilterEnts()
	end )
end

function ENT:OnDecoupled( targetVehicle, targetHitch )
	self:SetProngs( false )

	timer.Simple( 0.2, function()
		if not IsValid( self ) then return end

		self:RebuildCrosshairFilterEnts()
	end )
end

function ENT:OnStartDrag( caller, activator )
	self:SetProngs( true )
end

function ENT:OnStopDrag( caller, activator )
	self:SetProngs( false )
end

function ENT:SpawnShell()
	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return end

	local Shell = ents.Create( "lvs_item_shell" )

	if not IsValid( Shell ) then return end

	Shell.MDL = "models/props_debris/shellcasing_08.mdl"
	Shell.CollisionSounds = {
		"lvs/vehicles/pak40/shell_impact1.wav",
		"lvs/vehicles/pak40/shell_impact2.wav"
	}

	Shell:SetPos( Muzzle.Pos - Muzzle.Ang:Forward() * 140 )
	Shell:SetAngles( Muzzle.Ang + Angle(90,0,0) )
	Shell:Spawn()
	Shell:Activate()
	Shell:SetOwner( self )

	local PhysObj = Shell:GetPhysicsObject()

	if not IsValid( PhysObj ) then return end

	PhysObj:SetVelocityInstantaneous( Shell:GetRight() * 250 - Shell:GetUp() * 20 )
	PhysObj:SetAngleVelocityInstantaneous( Vector(0,-40,0) )
end

function ENT:DoReloadSequence( delay )
	if self._ReloadActive then return end

	self._ReloadActive = true

	self:SetBodygroup(1, 1)

	timer.Simple(delay, function()
		if not IsValid( self ) then return end

		self:PlayAnimation("breech")

		self:EmitSound("lvs/vehicles/75mle1897/cannon_unload.wav", 75, 100, 0.5, CHAN_WEAPON )

		timer.Simple(0.3, function()
			if not IsValid( self ) then return end
			self:SpawnShell()
		end)
	end)

	timer.Simple(2, function()
		if not IsValid( self ) then return end

		self:PlayAnimation("reload")

		self:EmitSound("lvs/vehicles/75mle1897/cannon_reload.wav", 75, 100, 1, CHAN_WEAPON )

		timer.Simple(0.1, function()
			if not IsValid( self ) then return end
			self:SetBodygroup(1, 0)
			self._ReloadActive = nil
		end )
	end )
end

function ENT:DoAttackSequence()
	if not IsValid( self.SNDTurret ) then return end

	self.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + self:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )

	self:PlayAnimation("fire")

	self:DoReloadSequence( 1 )
end


function ENT:MakeProjectile()
	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return end

	local Driver = self:GetDriver()

	local projectile = ents.Create( "lvs_bomb" )
	projectile:SetPos( Muzzle.Pos )
	projectile:SetAngles( Muzzle.Ang + Angle(0,90,90) )
	projectile:SetParent( self, ID )
	projectile:Spawn()
	projectile:Activate()
	projectile:SetModel("models/misc/88mm_projectile.mdl")
	projectile:SetAttacker( IsValid( Driver ) and Driver or self )
	projectile:SetEntityFilter( self:GetCrosshairFilterEnts() )
	projectile:SetSpeed( Muzzle.Ang:Up() * 10000 )
	projectile:SetDamage( 500 )
	projectile.UpdateTrajectory = function( bomb )
		bomb:SetSpeed( bomb:GetUp() * 10000 )
	end

	if projectile.SetMaskSolid then
		projectile:SetMaskSolid( true )
	end

	self._ProjectileEntity = projectile
end

function ENT:FireProjectile()
	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle or not IsValid( self._ProjectileEntity ) then return end

	self._ProjectileEntity:Enable()
	self._ProjectileEntity:SetCollisionGroup( COLLISION_GROUP_NONE )

	local effectdata = EffectData()
		effectdata:SetOrigin( self._ProjectileEntity:GetPos() )
		effectdata:SetEntity( self._ProjectileEntity )
	util.Effect( "lvs_haubitze_trail", effectdata )

	local effectdata = EffectData()
	effectdata:SetOrigin( Muzzle.Pos )
	effectdata:SetNormal( Muzzle.Ang:Forward() )
	effectdata:SetEntity( self )
	util.Effect( "lvs_haubitze_muzzle", effectdata )

	local PhysObj = self:GetPhysicsObject()
	if IsValid( PhysObj ) then
		PhysObj:ApplyForceOffset( -Muzzle.Ang:Up() * 100000, Muzzle.Pos )
	end

	self:TakeAmmo()
	self:SetHeat( 1 )
	self:SetOverheated( true )

	self._ProjectileEntity = nil

	if not IsValid( self.SNDTurret ) then return end

	self.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + self:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )

	self:EmitSound("lvs/vehicles/wespe/cannon_reload.wav", 75, 100, 1, CHAN_WEAPON )
end
