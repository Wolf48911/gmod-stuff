AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "sh_tracks.lua" )
AddCSLuaFile( "cl_optics.lua" )
AddCSLuaFile( "cl_tankview.lua" )
AddCSLuaFile( "sh_turret.lua" )
include("shared.lua")
include("sh_turret.lua")
include("sh_tracks.lua")
include("sv_pds.lua")

-- since this is based on a tank we need to reset these to default var values:
ENT.DSArmorDamageReductionType = DMG_BULLET + DMG_CLUB
ENT.DSArmorIgnoreDamageType = DMG_SONIC


function ENT:OnSpawn( PObj )

	local ID = self:LookupAttachment( "muzzle_mg" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretMG = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/t34/dt28_loop.wav", "lvs/vehicles/t34/dt28_loop.wav" )
	self.SNDTurretMG:SetSoundLevel( 95 )
	self.SNDTurretMG:SetParent( self, ID )

	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/t26/t26_shot_outside.wav", "lvs/vehicles/t26/t26_shot_inside.wav" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )


	local DriverSeat = self:AddDriverSeat( Vector(0,0,30), Angle(0,-90,0) )

	DriverSeat.HidePlayer = true

	self.HornSND = self:AddSoundEmitter( Vector(40,0,35), "lvs/horn3.wav" )
	self.HornSND:SetSoundLevel( 75 )
	self.HornSND:SetDoppler( true )

	local DoorHandler = self:AddDoorHandler( "hatch1", Vector(29.6,-19.27,49.18), Angle(0,0,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "hatch2", Vector(-12.15,-4.53,85.26), Angle(0,0,0), Vector(-8,-8,-2), Vector(8,8,2), Vector(-8,-8,-2), Vector(8,8,2) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local DoorHandler = self:AddDoorHandler( "hatch3", Vector(-12.15,15.57,85.25), Angle(0,0,0), Vector(-8,-8,-2), Vector(8,8,2), Vector(-8,-8,-2), Vector(8,8,2) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	self:AddEngine( Vector(-54.09,13.33,32) )
	self:AddFuelTank( Vector(-54.09,-13.33,32), Angle(0,0,0), 600, LVS.FUELTYPE_DIESEL )

	-- front mid
	self:AddArmor( Vector(75.5,0,32), Angle(0,0,0), Vector(-5,-35,-7), Vector(5,35,7), 400, self.FrontArmor )
	-- front bottom
	self:AddArmor( Vector(70,0,22), Angle(45,0,0), Vector(-5,-35,-10), Vector(5,35,10), 400, self.FrontArmor )
	-- front upper
	self:AddArmor( Vector(45,0.01,38), Angle(-80,0,0), Vector(-5,-35,-27), Vector(5,35,20), 400, self.SideArmor )
	-- hatch armor
	self:AddArmor( Vector(30.44,-19.52,49.3), Angle(-45,0,0), Vector(-10,-15,-13), Vector(5,15,13), 400, self.FrontArmor )

	-- turret
	self:AddArmor( Vector(-3.05,5,73.3), Angle(0,0,0), Vector(-30,-30,-14), Vector(30,30,12), 400, self.FrontArmor )

	-- midblock front
	self:AddArmor( Vector(22,0,53.34), Angle(0,0,0), Vector(-5,-35,-7), Vector(5,35,7), 400, self.FrontArmor )
	-- midblock back
	self:AddArmor( Vector(-26,0,53), Angle(0,0,0), Vector(-5,-35,-7), Vector(5,35,7), 400, self.FrontArmor )
	-- midblock left
	self:AddArmor( Vector(-2,28,53.34), Angle(0,90,0), Vector(-5,-25,-7), Vector(5,25,7), 400, self.FrontArmor )
	-- midblock right
	self:AddArmor( Vector(-2,-29,53.34), Angle(0,90,0), Vector(-5,-25,-7), Vector(5,25,7), 400, self.FrontArmor )

	-- rear upper
	self:AddArmor( Vector(-60,0,38), Angle(80,0,0), Vector(-5,-35,-28), Vector(5,35,30), 400, self.RearArmor )
	-- rear lower
	self:AddArmor( Vector(-80,0,21.5), Angle(0,0,0), Vector(-5,-35,-7), Vector(5,35,7), 400, self.FrontArmor )

	self:AddDriverViewPort( Vector(29.53,-19.04,51.69), Angle(0,0,0), Vector(-1,-5,-1), Vector(1,5,1) )

	-- ammo rack weakspot
	self:AddAmmoRack( Vector(-10,0,28), Vector(-2,5,60), Angle(0,0,0), Vector(-16,-16,-6), Vector(10,16,6) )

	self:AddTrailerHitch( Vector(-84.48,0,17.44), LVS.HITCHTYPE_MALE )

	self:CreatePDS()
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/halftrack/engine_start.wav" )
	end
end
