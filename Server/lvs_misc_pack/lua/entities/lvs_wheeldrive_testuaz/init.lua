AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )

	self:AddEngine( Vector(0,60,20) )


	local DriverSeat = self:AddDriverSeat( Vector(-17,-10,25), Angle(0,0,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(17,-5,30), Angle(0,0,0) )

	local DoorHandler = self:AddDoorHandler( "left_door", Vector(-30,7,35), Angle(0,90,0), Vector(-10,-6,-16), Vector(18,6,28), Vector(-10,-20,-16), Vector(18,30,28) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_door_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_door_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "right_door", Vector(30,7,35), Angle(0,90,0), Vector(-10,-6,-16), Vector(18,6,28), Vector(-10,-30,-16), Vector(18,20,28) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_door_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_door_close.wav" )
	DoorHandler:LinkToSeat( PassengerSeat )

	local DoorHandler = self:AddDoorHandler( "hood", Vector(0,50,38), Angle(0,0,-5), Vector(-29,-27,-3), Vector(29,23,13), Vector(-29,-27,-3), Vector(29,23,30) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )


	local FrontRadius = 14
	local RearRadius = 14

	local FL, FR, RL, RR, ForwardAngle = self:AddWheelsUsingRig( FrontRadius, RearRadius )

	local FrontAxle = self:DefineAxle( {
		Axle = {

			ForwardAngle = ForwardAngle,
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0.5,
			BrakeFactor = 1,
		},
		Wheels = {FL,FR},
		Suspension = {
			Height = 10,
			MaxTravel = 15,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )

	local RearAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = ForwardAngle,
			SteerType = LVS.WHEEL_STEER_NONE,
			TorqueFactor = 0.5,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = {RL,RR},
		Suspension = {
			Height = 15,
			MaxTravel = 15,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )
end
