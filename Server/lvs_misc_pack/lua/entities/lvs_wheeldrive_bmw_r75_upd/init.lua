AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-19.5,17,26.5), Angle(0,-90,-30) )

	local GunnerSeat = self:AddPassengerSeat( Vector(-6,-10,3), Angle(0,-75,-5) )
	self:SetGunnerSeat( GunnerSeat )

	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretMGf = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ),  "lvs/vehicles/sdkfz250/mg_loop.wav"  )
	self.SNDTurretMGf:SetSoundLevel( 95 )
	self.SNDTurretMGf:SetParent( self, ID )


	self:AddEngine( Vector(13.85,17.08,8.3) )

	local FuelTank = self:AddFuelTank( Vector(13.84,17.09,26.21), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL, Vector(-10,-5,-4),Vector(8,5,4) )

	local WheelModel = "models/diggercars/bmw_r75/r75_wheel.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(38,17,15), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2 } )
	local RLWheel = self:AddWheel( { pos = Vector(-21,17,10), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2 } )
	local RRWheel = self:AddWheel( { pos = Vector(-14,-27,15), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2} )

	self:CreateRigControler( "fl", FLWheel, 5, 13 )
	self:CreateRigControler( "rl", RLWheel, 5, 13 )
	self:CreateRigControler( "rr", RRWheel, 5, 13 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0,
			BrakeFactor = 1,
		},
		Wheels = { FLWheel },
		Suspension = {
			Height = 14,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 25000,
			SpringDamping = 2500,
			SpringRelativeDamping = 2500,
		},
	} )

	local RearAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_REAR,
			SteerAngle = 0,
			TorqueFactor = 1,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { RLWheel },
		Suspension = {
			Height = 9,
			MaxTravel = 1,
			ControlArmLength = 25,
			SpringConstant = 25000,
			SpringDamping = 2500,
			SpringRelativeDamping = 2500,
		},
	} )

	local CabAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_REAR,
			SteerAngle = 0,
			TorqueFactor = 0,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { RRWheel },
		Suspension = {
			Height = 9,
			MaxTravel = 1,
			ControlArmLength = 25,
			SpringConstant = 25000,
			SpringDamping = 2500,
			SpringRelativeDamping = 2500,
		},
	} )

	for _, wheel in pairs( self:GetWheels() ) do
		if not IsValid( wheel ) then continue end

		wheel:SetModelScale( 0 )
	end
end
