AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	self:AddDriverSeat( Vector(-18,15.5,15), Angle(0,-90,0) )
	self:AddPassengerSeat( Vector(-7,-15.5,23), Angle(0,-90,10) )
	self:AddPassengerSeat( Vector(-42,10,30), Angle(0,-90,10) )
	self:AddPassengerSeat( Vector(-42,-10,30), Angle(0,-90,10) )

	local DoorHandler = self:AddDoorHandler( "trunk", Vector(27.71,0,53), Angle(0,0,0), Vector(-5,-23,-5), Vector(5,23,7), Vector(-5,-23,-10), Vector(18,23,-3) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_open.wav" )

	self:AddEngine( Vector(38,0,37) )
	self:AddFuelTank( Vector(-42.36,0,13.8), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL )

	local WheelModel = "models/diggercars/gaz67/gaz67_wheel.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(49.87,27,13), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2 } )
	local FRWheel = self:AddWheel( { pos = Vector(49.87,-27,13), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2} )
	local RLWheel = self:AddWheel( { pos = Vector(-35,27,13), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2 } )
	local RRWheel = self:AddWheel( { pos = Vector(-35,-27,13), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2} )

	self:CreateRigControler( "fl", FLWheel, 5, 26 )
	self:CreateRigControler( "fr", FRWheel, 5, 26 )
	self:CreateRigControler( "rl", RLWheel, 5, 26 )
	self:CreateRigControler( "rr", RRWheel, 5, 26 )


	self:AddEngine( Vector(70,0,22) )

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
			Height = 4,
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
			Height = 4,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )

	self:AddTrailerHitch( Vector(-62.35,0,23.34), LVS.HITCHTYPE_MALE )
end
