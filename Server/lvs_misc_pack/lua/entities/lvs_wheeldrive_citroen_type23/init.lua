AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(5,12,8), Angle(0,-95,-8) )
	local PassengerSeat = self:AddPassengerSeat( Vector(22,-12,12), Angle(0,-85,15) )
	local PassengerSeat1 = self:AddPassengerSeat( Vector(-10,-29,35), Angle(0,0,0) )
	local PassengerSeat1 = self:AddPassengerSeat( Vector(-30,-29,35), Angle(0,0,0) )
	local PassengerSeat1 = self:AddPassengerSeat( Vector(-50,-29,35), Angle(0,0,0) )
	local PassengerSeat1 = self:AddPassengerSeat( Vector(-70,-29,35), Angle(0,0,0) )
	local PassengerSeat1 = self:AddPassengerSeat( Vector(-90,-29,35), Angle(0,0,0) )

	local PassengerSeat1 = self:AddPassengerSeat( Vector(-10,29,35), Angle(0,180,0) )
	local PassengerSeat1 = self:AddPassengerSeat( Vector(-30,29,35), Angle(0,180,0) )
	local PassengerSeat1 = self:AddPassengerSeat( Vector(-50,29,35), Angle(0,180,0) )
	local PassengerSeat1 = self:AddPassengerSeat( Vector(-70,29,35), Angle(0,180,0) )
	local PassengerSeat1 = self:AddPassengerSeat( Vector(-90,29,35), Angle(0,180,0) )

	local DoorHandler = self:AddDoorHandler( "ld", Vector(19,31.5,17.83), Angle(0,0,0), Vector(-10,-3,-12), Vector(20,6,12), Vector(-10,-15,-12), Vector(20,30,12) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_door_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_door_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "rd", Vector(19,-31.5,17.83), Angle(0,180,0), Vector(-10,-3,-12), Vector(20,6,12), Vector(-10,-15,-12), Vector(20,30,12) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_door_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_door_close.wav" )
	DoorHandler:LinkToSeat( PassengerSeat )

	local WheelModel = "models/diggercars/citroen_type23/citroen_wheel_f.mdl"
	local WheelModelR = "models/diggercars/citroen_type23/citroen_wheel_r.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(77.5,30,-2), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2 } )
	local FRWheel = self:AddWheel( { pos = Vector(77.5,-30,-2), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2} )
	local RLWheel = self:AddWheel( { pos = Vector(-55.7,30,-4), mdl = WheelModelR, mdl_ang = Angle(0,0,0), width = 2 } )
	local RRWheel = self:AddWheel( { pos = Vector(-55.7,-30,-4), mdl = WheelModelR, mdl_ang = Angle(0,180,0), width = 2} )

	self:CreateRigControler( "fl", FLWheel, -12, 5.7 )
	self:CreateRigControler( "fr", FRWheel, -12, 5.7 )
	self:CreateRigControler( "rl", RLWheel, -12, 5.7 )
	self:CreateRigControler( "rr", RRWheel, -12, 5.7 )


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
			TorqueFactor = 1,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { RLWheel, RRWheel },
		Suspension = {
			Height = 9,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 80000,
			SpringDamping = 6000,
			SpringRelativeDamping = 6000,
		},
	} )

	self:AddTrailerHitch( Vector(-96.93,0,1.56), LVS.HITCHTYPE_MALE )
end
