AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "sh_tracks.lua" )
AddCSLuaFile( "cl_optics.lua" )
AddCSLuaFile( "cl_tankview.lua" )
AddCSLuaFile( "sh_turret.lua" )
AddCSLuaFile( "cl_attached_playermodels.lua" )
include("shared.lua")
include("sh_turret.lua")
include("sh_tracks.lua")

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

	local DoorHandler = self:AddDoorHandler( "hatch1", Vector(78,0,48), Angle(0,0,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "hatch2", Vector(-13.86,11.35,77.72), Angle(0,0,0), Vector(-12,-12,-2), Vector(8,12,2), Vector(-12,-12,-2), Vector(12,12,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	self:AddEngine( Vector(-20,0,50) )
	self:AddFuelTank( Vector(-80,0,35), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL )

	-- front
	local F = self:AddArmor( Vector(50,0,36), Angle(0,0,0), Vector(-52,-32,-23), Vector(52,32,23), 400, self.Armor )
	F.OnDestroyed = function( ent, dmginfo ) self:SetBodygroup(5,1) end
	F.OnRepaired = function( ent ) self:SetBodygroup(5,0) end
	F:SetLabel( "F" )

	-- rear
	local R = self:AddArmor( Vector(-53,0,36), Angle(0,0,0), Vector(-52,-32,-23), Vector(52,32,23), 400, self.Armor )
	R.OnDestroyed = function( ent, dmginfo ) self:SetBodygroup(6,1) end
	R.OnRepaired = function( ent ) self:SetBodygroup(6,0) end
	R:SetLabel( "R" )

	local TurretArmor = self:AddArmor( Vector(25,0,72), Angle(0,0,0), Vector(-28,-28,-13), Vector(28,28,13), 400, self.Armor )
	TurretArmor.OnDestroyed = function( ent, dmginfo ) self:SetBodygroup(7,1) if not IsValid( self ) then return end self:SetTurretDestroyed( true ) end
	TurretArmor.OnRepaired = function( ent ) self:SetBodygroup(7,0) if not IsValid( self ) then return end self:SetTurretDestroyed( false ) end
	TurretArmor:SetLabel( "Turret" )
	self:SetTurretArmor( Armor )

	-- ammo rack weakspot
	self:AddAmmoRack( Vector(26,0,20), Vector(26,0,58), Angle(0,0,0), Vector(-17,-20,-5), Vector(17,20,5) )

	self:AddTrailerHitch( Vector(-99.19,0,24.1), LVS.HITCHTYPE_MALE )
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/halftrack/engine_start.wav" )
	end
end
