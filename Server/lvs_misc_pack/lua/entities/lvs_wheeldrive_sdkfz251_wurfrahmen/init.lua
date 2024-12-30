AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_tankview.lua" )
AddCSLuaFile( "sh_turret.lua" )
include("shared.lua")
include("sh_turret.lua")

function ENT:OnSpawn( PObj )

	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretMGf = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ),  "lvs/vehicles/sdkfz250/mg_loop.wav"  )
	self.SNDTurretMGf:SetSoundLevel( 95 )
	self.SNDTurretMGf:SetParent( self, ID )

	local ID = self:LookupAttachment( "wra_1" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/251/nebel_burst_01.wav" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )

	local DriverSeat = self:AddDriverSeat( Vector(6,16,30), Angle(0,-90,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(21,-17,37), Angle(0,-90,10) )
	local GunnerSeat = self:AddPassengerSeat( Vector(-17,-2,36), Angle(0,-90,0) )

	self:SetFrontGunnerSeat( GunnerSeat )

	local PassengerSeat = self:AddPassengerSeat( Vector(-15,-18,42), Angle(0,0,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(-40,-18,42), Angle(0,0,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(-65,-18,42), Angle(0,0,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(-90,-18,42), Angle(0,0,0) )

	local PassengerSeat = self:AddPassengerSeat( Vector(-15,18,42), Angle(0,180,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(-40,18,42), Angle(0,180,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(-65,18,42), Angle(0,180,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(-90,18,42), Angle(0,180,0) )



	local DoorHandler = self:AddDoorHandler( "hatch1", Vector(-107,0,44.44), Angle(0,0,0), Vector(-10,-25,-15), Vector(10,25,25), Vector(-30,-25,-15), Vector(10,25,25) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "!dh1", Vector(29.46,16.28,72.09), Angle(0,0,0), Vector(-3,-10,-3), Vector(3,10,3), Vector(-3,-10,-3), Vector(3,10,3) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local DoorHandler = self:AddDoorHandler( "!gh1", Vector(29.46,-16.28,72.09), Angle(0,0,0), Vector(-3,-10,-3), Vector(3,10,3), Vector(-3,-10,-3), Vector(3,10,3) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local DoorHandler = self:AddDoorHandler( "!dh2", Vector(14.95,36.78,70.81), Angle(0,90,0), Vector(-3,-10,-3), Vector(3,10,3), Vector(-3,-10,-3), Vector(3,10,3) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local DoorHandler = self:AddDoorHandler( "!gh2", Vector(14.95,-36.78,70.81), Angle(0,90,0), Vector(-3,-10,-3), Vector(3,10,3), Vector(-3,-10,-3), Vector(3,10,3) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	self:AddEngine( Vector(66.99,0,54.43) )
	self:AddFuelTank( Vector(-45,0,23.8), Angle(0,0,0), 600, LVS.FUELTYPE_DIESEL )

	local WheelModel = "models/diggercars/sdkfz251/fw.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(99,34,16.5), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2 } )
	local FRWheel = self:AddWheel( { pos = Vector(99,-34,16.5), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2} )

	self:CreateRigControler( "fl", FLWheel, 10, 17.7 )
	self:CreateRigControler( "fr", FRWheel, 10, 17.7 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0.5,
			BrakeFactor = 1,
		},
		Wheels = { FLWheel, FRWheel },
		Suspension = {
			Height = 10,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )

	--front
	self:AddArmor( Vector(70,0,49), Angle(0,0,0), Vector(-50,-53,-32), Vector(50,53,32), 300, self.FrontArmor )
	--hull
	self:AddArmor( Vector(-47,0,49), Angle(0,0,0), Vector(-68,-53,-32), Vector(68,53,32), 160, self.HullArmor )

	self:AddTrailerHitch( Vector(-104.95,0,25.75), LVS.HITCHTYPE_MALE )
end

function ENT:MakeProjectile()

		local Ammo = self:GetAmmo()
		local ID = self:LookupAttachment( "wra_"..Ammo )
		local Muzzle = self:GetAttachment( ID )


	if not Muzzle then return end

	local Driver = self:GetDriver()



	local projectile = ents.Create( "lvs_bomb" )
	projectile:SetPos( Muzzle.Pos )
	projectile:SetAngles( Muzzle.Ang + Angle(0,0,0) )
	projectile:SetParent( self, ID )
	projectile:Spawn()
	projectile:Activate()
	projectile:SetModel("models/diggercars/sdkfz251/wurfrahmen_rocket.mdl")
	projectile:SetAttacker( IsValid( Driver ) and Driver or self )
	projectile:SetEntityFilter( self:GetCrosshairFilterEnts() )
	projectile:SetSpeed( Muzzle.Ang:Forward() * 4000 )
	projectile:SetDamage( 4000 )
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
		local ID = self:LookupAttachment( "wra_"..Ammo )
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
		PhysObj:ApplyForceOffset( -Muzzle.Ang:Forward() * 250000, Muzzle.Pos )
	end



	self:TakeAmmo()
	self:SetHeat( 1 )

	self._ProjectileEntity = nil

	if not IsValid( self.SNDTurret ) then return end

	self.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + self:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
end
