AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "sh_turret.lua" )
include("shared.lua")
include("sh_turret.lua")
function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(12,13,35), Angle(0,-95,-8) )
	local PassengerSeat = self:AddPassengerSeat( Vector(34,-13,40), Angle(0,-85,15) )



	local DoorHandler = self:AddDoorHandler( "ld", Vector(28,29,50), Angle(0,0,0), Vector(-10,-3,-12), Vector(20,6,12), Vector(-10,-15,-12), Vector(20,30,12) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "rd", Vector(28,-29,50), Angle(0,180,0), Vector(-10,-3,-12), Vector(20,6,12), Vector(-10,-15,-12), Vector(20,30,12) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( PassengerSeat )

	local DoorHandler = self:AddDoorHandler( "trunk", Vector(-143.57,0,39.14), Angle(0,180,0), Vector(-2,-20,-10), Vector(2,20,10), Vector(-2,-20,-30), Vector(2,20,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local DoorHandler = self:AddDoorHandler( "shield", Vector(50.3,0,78.45), Angle(0,180,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local WheelModel = "models/diggercars/bm13/fw.mdl"
	local WheelModelR = "models/diggercars/bm13/rw.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(86,31,19), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2 } )
	local FRWheel = self:AddWheel( { pos = Vector(86,-31,19), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2} )
	local MLWheel = self:AddWheel( { pos = Vector(-55,32.5,22), mdl = WheelModelR, mdl_ang = Angle(0,180,0), width = 2 } )
	local MRWheel = self:AddWheel( { pos = Vector(-55,-32.5,22), mdl = WheelModelR, mdl_ang = Angle(0,0,0), width = 2} )
	local RLWheel = self:AddWheel( { pos = Vector(-99,32.5,22), mdl = WheelModelR, mdl_ang = Angle(0,180,0), width = 2 } )
	local RRWheel = self:AddWheel( { pos = Vector(-99,-32.5,22), mdl = WheelModelR, mdl_ang = Angle(0,0,0), width = 2} )

	self:CreateRigControler( "fl", FLWheel, 7.2, 27 )
	self:CreateRigControler( "fr", FRWheel, 7.2, 27 )
	self:CreateRigControler( "ml", MLWheel, 7.2, 27 )
	self:CreateRigControler( "mr", MRWheel, 7.2, 27 )
	self:CreateRigControler( "rl", RLWheel, 7.2, 27 )
	self:CreateRigControler( "rr", RRWheel, 7.2, 27 )


	self:AddEngine( Vector(66,0,45.14) )

	local FuelTank = self:AddFuelTank( Vector(-57.06,0,35), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL )


	local ID = self:LookupAttachment( "bm13_12" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/251/katy_burst.wav" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0.3,
			BrakeFactor = 1,
		},
		Wheels = { FLWheel, FRWheel },
		Suspension = {
			Height = 11,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 40000,
			SpringDamping = 4000,
			SpringRelativeDamping = 4000,
		},
	} )

	local RearAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_NONE,
			TorqueFactor = 0.6,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { RLWheel, RRWheel, MLWheel, MRWheel },
		Suspension = {
			Height = 9,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 50000,
			SpringDamping = 5000,
			SpringRelativeDamping = 5000,
		},
	} )

	self:AddTrailerHitch( Vector(-139.7,0,30.73), LVS.HITCHTYPE_MALE )
end

function ENT:MakeProjectile()

		local Ammo = self:GetAmmo()
		local ID = self:LookupAttachment( "bm13_"..Ammo )
		local Muzzle = self:GetAttachment( ID )


	if not Muzzle then return end

	local Driver = self:GetDriver()



	local projectile = ents.Create( "lvs_bomb" )
	projectile:SetPos( Muzzle.Pos )
	projectile:SetAngles( Muzzle.Ang + Angle(0,0,0) )
	projectile:SetParent( self, ID )
	projectile:Spawn()
	projectile:Activate()
	projectile:SetModel("models/diggercars/bm13/bm13_rocket.mdl")
	projectile:SetAttacker( IsValid( Driver ) and Driver or self )
	projectile:SetEntityFilter( self:GetCrosshairFilterEnts() )
	projectile:SetSpeed( Muzzle.Ang:Forward() * 4000 )
	projectile:SetDamage( 800 )
	projectile.UpdateTrajectory = function( bomb )
		bomb:SetSpeed( bomb:GetForward() * 4000 )
	end

	if projectile.SetMaskSolid then
		projectile:SetMaskSolid( true )
	end

	self._ProjectileEntity = projectile
end

function ENT:FireProjectile()

		local Ammo = self:GetAmmo()
		local ID = self:LookupAttachment( "bm13_"..Ammo )
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
	effectdata:SetNormal( Muzzle.Ang:Right() )
	effectdata:SetEntity( self )
	util.Effect( "lvs_haubitze_muzzle", effectdata )

	local PhysObj = self:GetPhysicsObject()
	if IsValid( PhysObj ) then
		PhysObj:ApplyForceOffset( -Muzzle.Ang:Forward() * 25000, Muzzle.Pos )
	end



	self:TakeAmmo()
	self:SetHeat( 1 )

	self._ProjectileEntity = nil

	if not IsValid( self.SNDTurret ) then return end

	self.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + self:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
end
