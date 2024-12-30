AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_tankview.lua" )
AddCSLuaFile( "sh_turret.lua" )
AddCSLuaFile( "cl_attached_playermodels.lua" )
include("shared.lua")
include("sh_turret.lua")

ENT.DSArmorDamageReductionType = DMG_BULLET + DMG_CLUB
ENT.DSArmorIgnoreDamageType = DMG_SONIC

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-12,10,20), Angle(0,-90,0) )

	local DoorHandler = self:AddDoorHandler( "ld", Vector(-18,29,40), Angle(0,180,0), Vector(-10,-3,-12), Vector(20,6,22), Vector(-10,-30,-12), Vector(20,15,22) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "rd", Vector(-18,-29,40), Angle(0,180,0), Vector(-10,-3,-12), Vector(20,6,22), Vector(-10,-15,-12), Vector(20,30,22) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "hood2", Vector(44.85,14.37,46.87), Angle(0,180,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	local DoorHandler = self:AddDoorHandler( "hood1", Vector(44.85,-14.37,46.87), Angle(0,180,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local DoorHandler = self:AddDoorHandler( "hatch1", Vector(13.17,11.02,60.78), Angle(0,0,0), Vector(-3,-10,-3), Vector(3,10,3), Vector(-3,-10,-3), Vector(3,10,3) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local DoorHandler = self:AddDoorHandler( "hatch2", Vector(-65.76,0,60.88), Angle(0,0,0), Vector(-3,-10,-3), Vector(3,10,3), Vector(-3,-10,-3), Vector(3,10,3) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ),  "lvs/vehicles/sdkfz250/mg_loop.wav"  )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )

	local WheelModel = "models/diggercars/kfz13/wh.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(62,30,19), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2 } )
	local FRWheel = self:AddWheel( { pos = Vector(62,-30,19), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2} )
	local RLWheel = self:AddWheel( { pos = Vector(-60,30,19), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2 } )
	local RRWheel = self:AddWheel( { pos = Vector(-60,-30,19), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2} )

	self:AddEngine( Vector(40,0,46.77) )

	local FuelTank = self:AddFuelTank( Vector(-70,0,21), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL )



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
			SpringConstant = 30000,
			SpringDamping = 3000,
			SpringRelativeDamping = 3000,
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
		Wheels = { RLWheel, RRWheel },
		Suspension = {
			Height = 9,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 30000,
			SpringDamping = 3000,
			SpringRelativeDamping = 3000,
		},
	} )

	--frontshield
	self:AddArmor( Vector(72,0,40), Angle(0,0,0), Vector(-10,-16,-25), Vector(10,16,15), 500, self.FrontArmor )
	--engine
	self:AddArmor( Vector(52,0,40), Angle(0,0,0), Vector(-35,-22,-25), Vector(10,22,15), 100, self.TurretArmor )
	--hull
	self:AddArmor( Vector(0,0,40), Angle(0,0,0), Vector(-90,-30,-25), Vector(20,30,28), 100, self.TurretArmor )

	--wheel_fl
	self:AddArmor( Vector(62,30,19), Angle(0,0,0), Vector(-20,-7,-20), Vector(20,7,20), 500, self.RearArmor )
	--wheel_fr
	self:AddArmor( Vector(62,-30,19), Angle(0,0,0), Vector(-20,-7,-20), Vector(20,7,20), 500, self.RearArmor )
	--wheel_rl
	self:AddArmor( Vector(-60,30,19), Angle(0,0,0), Vector(-20,-7,-20), Vector(20,7,20), 500, self.RearArmor )
	--wheel_rr
	self:AddArmor( Vector(-60,-30,19), Angle(0,0,0), Vector(-20,-7,-20), Vector(20,7,20), 500, self.RearArmor )

	self:AddTrailerHitch( Vector(-98.44,0,18.83), LVS.HITCHTYPE_MALE )
end
