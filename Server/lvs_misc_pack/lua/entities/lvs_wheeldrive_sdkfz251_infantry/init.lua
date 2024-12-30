AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_tankview.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )

	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretMGf = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ),  "lvs/vehicles/sdkfz250/mg_loop.wav"  )
	self.SNDTurretMGf:SetSoundLevel( 95 )
	self.SNDTurretMGf:SetParent( self, ID )

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
