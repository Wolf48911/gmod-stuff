AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-18,10,19), Angle(0,-90,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(-5,-10,24), Angle(0,-90,10) )
	local PassengerSeat1 = self:AddPassengerSeat( Vector(-48,10,24), Angle(0,-90,10) )
	local PassengerSeat2 = self:AddPassengerSeat( Vector(-48,-10,24), Angle(0,-90,10) )

	local DoorHandler = self:AddDoorHandler( "left_door", Vector(-3,24,32), Angle(0,0,0), Vector(-10,-6,-12), Vector(20,6,15), Vector(-10,-15,-12), Vector(20,40,15) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_door_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_door_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "rear_left_door", Vector(-35,26,32), Angle(0,0,0), Vector(-10,-6,-12), Vector(20,6,15), Vector(-10,-15,-12), Vector(20,40,15) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_door_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_door_close.wav" )
	DoorHandler:LinkToSeat( PassengerSeat1 )

	local DoorHandler = self:AddDoorHandler( "right_door", Vector(-3,-24,32), Angle(0,0,0), Vector(-10,-6,-12), Vector(20,6,15), Vector(-10,-40,-12), Vector(20,15,15) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_door_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_door_close.wav" )
	DoorHandler:LinkToSeat( PassengerSeat )

	local DoorHandler = self:AddDoorHandler( "rear_right_door", Vector(-35,-26,32), Angle(0,0,0), Vector(-10,-6,-12), Vector(20,6,15), Vector(-10,-40,-12), Vector(20,15,15) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_door_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_door_close.wav" )
	DoorHandler:LinkToSeat( PassengerSeat2 )



	local WheelModel = "models/diggercars/gazm1/gazm1_wheel.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(64.7,31,21), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2 } )
	local FRWheel = self:AddWheel( { pos = Vector(64.7,-31,21), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2} )
	local RLWheel = self:AddWheel( { pos = Vector(-50.5,31.5,21), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2 } )
	local RRWheel = self:AddWheel( { pos = Vector(-50.5,-31.5,21), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2} )

	self:CreateRigControler( "fl", FLWheel, 6.6, 25.6 )
	self:CreateRigControler( "fr", FRWheel, 6.6, 25.6 )
	self:CreateRigControler( "rl", RLWheel, 6.6, 25.6 )
	self:CreateRigControler( "rr", RRWheel, 6.6, 25.6 )


	self:AddEngine( Vector(50.45,0,42.54) )

	local FuelTank = self:AddFuelTank( Vector(-57.06,0,18.92), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL )



	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0,
			BrakeFactor = 1,
		},
		Wheels = { FLWheel, FRWheel },
		Suspension = {
			Height = 12,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )

	local RearAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_NONE,
			TorqueFactor = 1,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { RLWheel, RRWheel },
		Suspension = {
			Height = 12,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )

	self:AddTrailerHitch( Vector(-83.87,0,14.94), LVS.HITCHTYPE_MALE )
end
