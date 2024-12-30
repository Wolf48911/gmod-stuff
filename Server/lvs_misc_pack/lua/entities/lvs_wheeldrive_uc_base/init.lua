AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "sh_tracks.lua" )
include("shared.lua")
include("sh_tracks.lua")

-- since this is based on a tank we need to reset these to default var values:
ENT.DSArmorDamageReductionType = DMG_BULLET + DMG_CLUB
ENT.DSArmorIgnoreDamageType = DMG_SONIC


function ENT:OnSpawn( PObj )

	local DriverSeat = self:AddDriverSeat( Vector(20,-11,2.8), Angle(0,-90,10) )
	local GunnerSeat = self:AddPassengerSeat( Vector(25,9.5,11), Angle(0,-90,0) )
	self:SetGunnerSeat( GunnerSeat )

	local PassengerSeat = self:AddPassengerSeat( Vector(0,-25,32), Angle(0,0,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(-30,-25,32), Angle(0,0,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(0,25,32), Angle(0,180,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(-30,25,32), Angle(0,180,0) )

	local ID = self:LookupAttachment( "dt_muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretDT = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/sherman/mg_loop.wav", "lvs/vehicles/sherman/mg_loop_interior.wav" )
	self.SNDTurretDT:SetSoundLevel( 95 )
	self.SNDTurretDT:SetParent( self, ID )

	local ID = self:LookupAttachment( "bren_muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretBR = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/sherman/mg_loop.wav", "lvs/vehicles/sherman/mg_loop_interior.wav" )
	self.SNDTurretBR:SetSoundLevel( 95 )
	self.SNDTurretBR:SetParent( self, ID )

	local ID = self:LookupAttachment( "ptrs_muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/222/cannon_fire.wav", "lvs/vehicles/222/cannon_fire_interior.wav" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )

	self:AddEngine( Vector(-10,0,49) )
	self:AddFuelTank( Vector(-25,0,23.8), Angle(0,0,0), 600, LVS.FUELTYPE_DIESEL )

	--front
	self:AddArmor( Vector(44,0,31), Angle(0,0,0), Vector(-27,-35,-26), Vector(27,35,26), 200, self.FrontArmor )
	--hull
	self:AddArmor( Vector(-29,0,31), Angle(0,0,0), Vector(-46,-35,-26), Vector(46,35,26), 140, self.SideArmor )

	-- driver viewport weakspot
	self:AddDriverViewPort( Vector(36.78,-12,44), Angle(0,0,0), Vector(-1,-3,-1), Vector(1,3,1) )

	self:AddTrailerHitch( Vector(-57.43,0,18.37), LVS.HITCHTYPE_MALE )
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/sdkfz250/engine_start.wav" )
	end
end
