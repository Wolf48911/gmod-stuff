AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-14,9,0), Angle(0,-90,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(0,-9,8), Angle(0,-85,15) )
	local PassengerSeat = self:AddPassengerSeat( Vector(-30,-9,8), Angle(0,-85,15) )
	local PassengerSeat = self:AddPassengerSeat( Vector(-30,9,8), Angle(0,-85,15) )

	local WheelModel = "models/diggercars/fiat_508/fiat_wheel.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(51.47,24,1), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2 } )
	local FRWheel = self:AddWheel( { pos = Vector(51.47,-24,1), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2} )
	local RLWheel = self:AddWheel( { pos = Vector(-38.99,24,1), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2 } )
	local RRWheel = self:AddWheel( { pos = Vector(-38.99,-24,1), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2} )

	self:CreateRigControler( "fl", FLWheel, -24.6, -4.5 )
	self:CreateRigControler( "fr", FRWheel, -24.6, -4.5 )
	self:CreateRigControler( "rl", RLWheel, -24.6, -4.5 )
	self:CreateRigControler( "rr", RRWheel, -24.6, -4.5 )


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

	self:AddTrailerHitch( Vector(-69.2,0,0.95), LVS.HITCHTYPE_MALE )
end
