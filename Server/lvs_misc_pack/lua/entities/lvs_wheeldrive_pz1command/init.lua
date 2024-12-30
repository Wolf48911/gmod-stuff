AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "sh_tracks.lua" )
AddCSLuaFile( "cl_tankview.lua" )
AddCSLuaFile( "sh_turret.lua" )
include("shared.lua")
include("sh_turret.lua")
include("sh_tracks.lua")

-- since this is based on a tank we need to reset these to default var values:
ENT.DSArmorDamageReductionType = DMG_BULLET + DMG_CLUB
ENT.DSArmorIgnoreDamageType = DMG_SONIC


function ENT:OnSpawn( PObj )

	local ID = self:LookupAttachment( "mg_muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/pz2/mg42_loop.wav", "lvs/vehicles/pz2/mg42_loop.wav" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )


	local DriverSeat = self:AddDriverSeat( Vector(0,0,10), Angle(0,-90,0) )

	DriverSeat.HidePlayer = true

	self.HornSND = self:AddSoundEmitter( Vector(40,0,35), "lvs/horn3.wav" )
	self.HornSND:SetSoundLevel( 75 )
	self.HornSND:SetDoppler( true )

	local DoorHandler = self:AddDoorHandler( "hatch2", Vector(0.22,32.5,62.05), Angle(0,0,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "hatch1", Vector(-0.27,-8.36,86.96), Angle(0,0,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	self:AddEngine( Vector(-56.32,6.09,45.93) )
	self:AddFuelTank( Vector(-53.43,0,27.16), Angle(0,0,0), 600, LVS.FUELTYPE_DIESEL )

	self.SNDTurretMG = self:AddSoundEmitter( Vector(-63,0,85), "lvs/vehicles/halftrack/mc_loop.wav" )
	self.SNDTurretMG:SetSoundLevel( 95 )

	self:AddTrailerHitch( Vector(-86.85,0,22.49), LVS.HITCHTYPE_MALE )

	--frontshield
	self:AddArmor( Vector(0,0,66), Angle(0,0,0), Vector(-96,-62,-70), Vector(96,62,55), 300, self.FrontArmor )
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/halftrack/engine_start.wav" )
	end
end
