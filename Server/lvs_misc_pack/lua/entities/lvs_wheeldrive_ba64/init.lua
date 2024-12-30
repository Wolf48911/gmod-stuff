AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_attached_playermodels.lua" )
AddCSLuaFile( "sh_turret.lua" )
include("shared.lua")
include("sh_turret.lua")

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-10,0,15), Angle(0,-90,0) )

	local GunnerSeat = self:AddPassengerSeat( Vector(-40,0,30), Angle(0,-90,0) )
	GunnerSeat.HidePlayer = true
	self:SetGunnerSeat( GunnerSeat )

	local ID = self:LookupAttachment( "muzzle_turret" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretMG = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/t34/dt28_loop.wav", "lvs/vehicles/t34/dt28_loop.wav" )
	self.SNDTurretMG:SetSoundLevel( 95 )
	self.SNDTurretMG:SetParent( self, ID )


	local DoorHandler = self:AddDoorHandler( "ld", Vector(4.17,22.99,32.46), Angle(-29,-90,0), Vector(-1,-15,-15), Vector(1,15,15), Vector(-30,-15,-15), Vector(1,15,15) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "rd", Vector(4.17,-22.99,32.46), Angle(29,-90,0), Vector(-1,-15,-15), Vector(1,15,15), Vector(-1,-15,-15), Vector(30,15,15) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( GunnerSeat )

	self:AddEngine( Vector(42.25,0,45.39), Angle(0,-90,0) )
	self:AddFuelTank( Vector(-63,0,25), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL )

	local WheelModel = "models/diggercars/ba64/ba64_wheel.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(56,30,15), mdl = WheelModel, mdl_ang = Angle(0,-90,0), width = 2 } )
	local FRWheel = self:AddWheel( { pos = Vector(56,-30,15), mdl = WheelModel, mdl_ang = Angle(0,90,0), width = 2} )
	local RLWheel = self:AddWheel( { pos = Vector(-35,30,10), mdl = WheelModel, mdl_ang = Angle(0,-90,0), width = 2 } )
	local RRWheel = self:AddWheel( { pos = Vector(-35,-30,10), mdl = WheelModel, mdl_ang = Angle(0,90,0), width = 2} )

	self:CreateRigControler( "fl", FLWheel, 5, 20 )
	self:CreateRigControler( "fr", FRWheel, 5, 20 )
	self:CreateRigControler( "rl", RLWheel, 5, 20 )
	self:CreateRigControler( "rr", RRWheel, 5, 20 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0.4,
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

	local RearAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_REAR,
			SteerAngle = 0,
			TorqueFactor = 0.6,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { RLWheel, RRWheel },
		Suspension = {
			Height = 10,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )

	self:AddTrailerHitch( Vector(0,-66.36,18.15), LVS.HITCHTYPE_MALE )
end
