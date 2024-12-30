AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_tankview.lua" )
AddCSLuaFile( "cl_attached_playermodels.lua" )
AddCSLuaFile( "sh_turret.lua" )
include("shared.lua")
include("sh_turret.lua")

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(0,-8,10), Angle(0,0,0) )

	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/t34/dt28_loop.wav", "lvs/vehicles/t34/dt28_loop.wav" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )


	self:AddEngine( Vector(0,42.25,45.39), Angle(0,-90,0) )
	self:AddFuelTank( Vector(0,-63,25), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL )

	local WheelModel = "models/diggercars/bmw_r75/r75_wheel.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(-17,38,15), mdl = WheelModel, mdl_ang = Angle(0,-90,0), width = 2 } )
	local RLWheel = self:AddWheel( { pos = Vector(-17,-21,10), mdl = WheelModel, mdl_ang = Angle(0,-90,0), width = 2 } )
	local RRWheel = self:AddWheel( { pos = Vector(27,-14,13), mdl = WheelModel, mdl_ang = Angle(0,90,0), width = 2} )

	self:CreateRigControler( "fl", FLWheel, 5, 12 )
	self:CreateRigControler( "rl", RLWheel, 5, 12 )
	self:CreateRigControler( "rr", RRWheel, 5, 12 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,90,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0.4,
			BrakeFactor = 1,
		},
		Wheels = { FLWheel },
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
			ForwardAngle = Angle(0,90,0),
			SteerType = LVS.WHEEL_STEER_REAR,
			SteerAngle = 0,
			TorqueFactor = 0.6,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { RLWheel, RRWheel },
		Suspension = {
			Height = 10,
			MaxTravel = 1,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )

	self:AddTrailerHitch( Vector(0,-66.36,18.15), LVS.HITCHTYPE_MALE )
end
