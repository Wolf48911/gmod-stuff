AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "sh_tracks.lua" )
include("shared.lua")
include("sh_tracks.lua")
include("sv_pds.lua")

function ENT:OnSpawn( PObj )


	local DriverSeat = self:AddDriverSeat( Vector(10,18,45), Angle(0,-90,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(25,0,50), Angle(0,-90,10) )
	local PassengerSeat = self:AddPassengerSeat( Vector(25,-18,50), Angle(0,-90,10) )
	local PassengerSeat1 = self:AddPassengerSeat( Vector(-15,18,50), Angle(0,-90,10) )
	local PassengerSeat2 = self:AddPassengerSeat( Vector(-15,0,50), Angle(0,-90,10) )
	local PassengerSeat2 = self:AddPassengerSeat( Vector(-15,-18,50), Angle(0,-90,10) )

	local DoorHandler = self:AddDoorHandler( "hatch2", Vector(29.43,33.69,54.82), Angle(0,-100,0), Vector(-4,-15,-15), Vector(4,15,22), Vector(-15,-15,-15), Vector(4,15,22) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "hatch1", Vector(29.43,-33.69,54.82), Angle(0,100,0), Vector(-4,-15,-15), Vector(4,15,22), Vector(-15,-15,-15), Vector(4,15,22) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( PassengerSeat )

	local DoorHandler = self:AddDoorHandler( "hatch4", Vector(-12.32,34.69,57.69), Angle(0,-90,0), Vector(-4,-15,-15), Vector(4,15,22), Vector(-15,-15,-15), Vector(4,15,22) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( PassengerSeat1 )

	local DoorHandler = self:AddDoorHandler( "hatch3", Vector(-12.32,-34.69,57.69), Angle(0,90,0), Vector(-4,-15,-15), Vector(4,15,22), Vector(-15,-15,-15), Vector(4,15,22) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( PassengerSeat2 )


	self:AddEngine( Vector(68,0,50) )
	self:AddFuelTank( Vector(-40,0,25), Angle(0,0,0), 600, LVS.FUELTYPE_DIESEL )

	local WheelModel = "models/diggercars/unic_p107/unic_p107_wheel.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(81,32,23.55), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2, radius = 19 } )
	local FRWheel = self:AddWheel( { pos = Vector(81,-32,23.55), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2, radius = 19 } )

	self:CreateRigControler( "fl", FLWheel, 13, 29 )
	self:CreateRigControler( "fr", FRWheel, 13, 29 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 20,
			TorqueFactor = 0,
			BrakeFactor = 1,
		},
		Wheels = { FLWheel, FRWheel },
		Suspension = {
			Height = 10,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 50000,
			SpringDamping = 5000,
			SpringRelativeDamping = 5000,
		},
	} )

	self:AddTrailerHitch( Vector(-102.43,0,37.86), LVS.HITCHTYPE_MALE )

	self:CreatePDS()

end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/halftrack/engine_start.wav" )
	end
end
