AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

ENT.DriverActiveSound = "common/null.wav"
ENT.DriverInActiveSound = "common/null.wav"

function ENT:OnSpawn( PObj )
	self:SetBodygroup( 14, 1 ) 
	self:SetBodygroup( 13, 1 ) 

	PObj:SetMass( 5000 )

	local DriverSeat = self:AddDriverSeat( Vector(155,0,91), Angle(0,-90,10) )

	local DoorHandler = self:AddDoorHandler( "!cabin" )
	DoorHandler:SetSoundOpen( "vehicles/atv_ammo_open.wav" )
	DoorHandler:SetSoundClose( "vehicles/atv_ammo_close.wav"  )
	DoorHandler:LinkToSeat( DriverSeat )

	self:AddWheel( Vector(139.37,102.05,-1.1), 18, 600 )
	self:AddWheel( Vector(139.37,-102.05,-1.1), 18, 600 )
	self:AddWheel( Vector(-214.99,0,69.18), 8, 1200, LVS.WHEEL_STEER_REAR )

	self:AddEngine( Vector(193.84,-99.29,84.01) )

	local Rotor = self:AddRotor( Vector(160,0,75) )
	Rotor:SetSound("lvs/vehicles/generic/bomber_propeller.wav")
	Rotor:SetSoundStrain("lvs/vehicles/generic/bomber_propeller_strain.wav")
end

function ENT:OnLandingGearToggled( IsDeployed )
	self:EmitSound( "lvs/vehicles/generic/gear.wav" )
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/bf109/engine_start.wav" )
	else
		self:EmitSound( "lvs/vehicles/bf109/engine_stop.wav" )
	end
end