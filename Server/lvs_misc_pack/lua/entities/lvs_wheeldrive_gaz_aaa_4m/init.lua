AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_tankview.lua" )
AddCSLuaFile( "sh_turret.lua" )
AddCSLuaFile( "cl_attached_playermodels.lua" )
include("shared.lua")
include("sh_turret.lua")

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(4,13,27), Angle(0,-90,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(24,-13,32), Angle(0,-85,15) )

	local DoorHandler = self:AddDoorHandler( "ld", Vector(22,29,40), Angle(0,0,0), Vector(-10,-3,-12), Vector(20,6,12), Vector(-10,-15,-12), Vector(20,30,12) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "rd", Vector(28,-29,40), Angle(0,180,0), Vector(-10,-3,-12), Vector(20,6,12), Vector(-10,-15,-12), Vector(20,30,12) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( PassengerSeat )

	local DoorHandler = self:AddDoorHandler( "trunk", Vector(-104.39,0,53), Angle(0,180,0), Vector(-2,-40,-10), Vector(2,40,10), Vector(-2,-40,-30), Vector(2,40,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "hood1", Vector(69.58,14.4,46.54), Angle(0,180,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	local DoorHandler = self:AddDoorHandler( "hood2", Vector(69.58,-14.4,46.54), Angle(0,180,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	self.SNDTurretMG = self:AddSoundEmitter( Vector(-63,0,85), "lvs/vehicles/gaz_aaa/zpu_m41.wav" )
	self.SNDTurretMG:SetSoundLevel( 95 )

	local WheelModel = "models/diggercars/gaz_aaa/fw.mdl"
	local WheelModelR = "models/diggercars/gaz_aaa/rw.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(87.3,31,20), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2 } )
	local FRWheel = self:AddWheel( { pos = Vector(87.3,-31,20), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2} )
	local MLWheel = self:AddWheel( { pos = Vector(-26,32.5,20), mdl = WheelModelR, mdl_ang = Angle(0,0,0), width = 2 } )
	local MRWheel = self:AddWheel( { pos = Vector(-26,-32.5,20), mdl = WheelModelR, mdl_ang = Angle(0,180,0), width = 2} )
	local RLWheel = self:AddWheel( { pos = Vector(-65,32.5,20), mdl = WheelModelR, mdl_ang = Angle(0,0,0), width = 2 } )
	local RRWheel = self:AddWheel( { pos = Vector(-65,-32.5,20), mdl = WheelModelR, mdl_ang = Angle(0,180,0), width = 2} )

	self:CreateRigControler( "fl", FLWheel, 7.2, 27 )
	self:CreateRigControler( "fr", FRWheel, 7.2, 27 )
	self:CreateRigControler( "ml", MLWheel, 7.2, 27 )
	self:CreateRigControler( "mr", MRWheel, 7.2, 27 )
	self:CreateRigControler( "rl", RLWheel, 7.2, 27 )
	self:CreateRigControler( "rr", RRWheel, 7.2, 27 )


	self:AddEngine( Vector(66,0,45.14) )

	local FuelTank = self:AddFuelTank( Vector(-57.06,0,35), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL )



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
			TorqueFactor = 0.5,
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


	self:AddTrailerHitch( Vector(-96.49,0,25.28), LVS.HITCHTYPE_MALE )
end

