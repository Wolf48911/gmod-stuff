AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "sh_tracks.lua" )
AddCSLuaFile( "sh_turret.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_optics.lua" )
AddCSLuaFile( "cl_tankview.lua" )
include("shared.lua")
include("sh_tracks.lua")
include("sh_turret.lua")

function ENT:OnSpawn( PObj )
	local ID = self:LookupAttachment( "muzzle_machinegun" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretMGf = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/sherman/mg_loop.wav", "lvs/vehicles/sherman/mg_loop_interior.wav" )
	self.SNDTurretMGf:SetSoundLevel( 95 )
	self.SNDTurretMGf:SetParent( self, ID )

	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/tiger/cannon_fire.wav", "lvs/vehicles/tiger/cannon_fire.wav" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )

	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretMG = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos - Muzzle.Ang:Up() * 140 - Muzzle.Ang:Forward() * 15 ), "lvs/vehicles/sherman/mg_loop.wav", "lvs/vehicles/sherman/mg_loop_interior.wav" )
	self.SNDTurretMG:SetSoundLevel( 95 )
	self.SNDTurretMG:SetParent( self, ID )

	local DriverSeat = self:AddDriverSeat( Vector(64.85,23.82,22.55), Angle(0,-90,0) )

	local GunnerSeat = self:AddPassengerSeat( Vector(0,0,60), Angle(0,-90,0) )
	GunnerSeat.HidePlayer = true
	self:SetGunnerSeat( GunnerSeat )

	local GunnerWeapon = GunnerSeat:lvsGetWeapon()
	if IsValid( GunnerWeapon ) then
		GunnerWeapon:UnlockAimVector() -- this will unlock internal view from the vehicle, client camera need to be adjusted manually see cl_tankview.lua line 20
	end

	local CommSeat = self:AddPassengerSeat( Vector(0,0,60), Angle(0,-90,0) )
	CommSeat.HidePlayer = true
	self:SetCommSeat( CommSeat )

	local RadioSeat = self:AddPassengerSeat( Vector(67.85,-23.82,24.55), Angle(0,-90,15) )
	self:SetRadioSeat( RadioSeat )

	local LoaderSeat = self:AddPassengerSeat( Vector(0,0,60), Angle(0,-90,0) )
	LoaderSeat.HidePlayer = true
	self:SetLoaderSeat( LoaderSeat )

	local DoorHandler = self:AddDoorHandler( "^hatch1", Vector(79.51,32.43,70.46), Angle(0,0,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )
	self.DriverHatch = DoorHandler

	local DoorHandler = self:AddDoorHandler( "^hatch2", Vector(79.51,-32.43,70.46), Angle(0,0,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( RadioSeat )
	self.RadioHatch = DoorHandler

	local DoorHandler = self:AddDoorHandler( "^hatch3", Vector(-20.52,20.81,111.06), Angle(0,0,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( CommSeat )
	self.CommHatch = DoorHandler

	local DoorHandler = self:AddDoorHandler( "^hatch4", Vector(-2.8,-27.64,103.61), Angle(0,0,0), Vector(-10,-10,-10), Vector(10,10,10), Vector(-10,-10,-10), Vector(10,10,10) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( LoaderSeat )
	self.LoaderHatch = DoorHandler

	self:AddEngine( Vector(-79.66,0,72.21), Angle(0,180,0) )
	self:AddFuelTank( Vector(-80,0,60), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL, Vector(-12,-50,-12),Vector(12,50,0) )

	-- front plate
	self:AddArmor( Vector(115,0,32), Angle(10,0,0), Vector(-20,-70,-20), Vector(20,70,20), 4000, self.FrontArmor )

	-- "windscreen"
	self:AddArmor( Vector(95,0,35), Angle(0,0,0), Vector(-15,-70,-30), Vector(10,70,40), 3000, self.FrontArmor )

	-- side armor
	self:AddArmor( Vector(0,50,30), Angle(0,0,0), Vector(-120,-15,0), Vector(80,15,45), 1500, self.SideArmor )
	self:AddArmor( Vector(0,-50,30), Angle(0,0,0), Vector(-120,-15,0), Vector(80,15,45), 1500, self.SideArmor )

	-- turret
	local TurretArmor = self:AddArmor( Vector(4,0,70), Angle(0,0,0), Vector(-60,-60,0), Vector(60,60,40), 3000, self.TurretArmor )
	TurretArmor.OnDestroyed = function( ent, dmginfo ) if not IsValid( self ) then return end self:SetTurretDestroyed( true ) end
	TurretArmor.OnRepaired = function( ent ) if not IsValid( self ) then return end self:SetTurretDestroyed( false ) end
	TurretArmor:SetLabel( "Turret" )
	self:SetTurretArmor( TurretArmor )

	-- rear
	self:AddArmor( Vector(-100,0,10), Angle(-15,0,0), Vector(-10,-45,0),Vector(10,45,65), 500, self.RearArmor )

	-- driver viewport weakspot
	self:AddDriverViewPort( Vector(105,21,55), Angle(0,0,0), Vector(-1,-7,-1), Vector(1,7,1) )

	-- ammo rack weakspot
	self:AddAmmoRack( Vector(0,50,55), Vector(0,0,65), Angle(0,0,0), Vector(-54,-12,-6), Vector(54,12,6) )
	self:AddAmmoRack( Vector(0,-50,55), Vector(0,0,65), Angle(0,0,0), Vector(-54,-12,-6), Vector(54,12,6) )
	self:AddAmmoRack( Vector(0,30,30), Vector(0,0,65), Angle(0,0,0), Vector(-30,-6,-12), Vector(30,6,12) )
	self:AddAmmoRack( Vector(0,-30,30), Vector(0,0,65), Angle(0,0,0), Vector(-30,-6,-12), Vector(30,6,12) )

	-- trailer hitch
	self:AddTrailerHitch( Vector(-112,0,22), LVS.HITCHTYPE_MALE )

end

function ENT:DoReloadSequence( delay )
	if self._ReloadActive then return end

	self._ReloadActive = true

	self:SetBodygroup(1, 1)

	timer.Simple(delay, function()
		if not IsValid( self ) then return end

		self:PlayAnimation("breech")
		timer.Simple(0.3, function()
			if not IsValid( self ) then return end
		end)
	end)

	timer.Simple(2, function()
		if not IsValid( self ) then return end

		self:PlayAnimation("reload")
		timer.Simple(0.1, function()
			if not IsValid( self ) then return end
			self:SetBodygroup(1, 0)
			self._ReloadActive = nil
		end )
		self:SetBodygroup(1, 1)
	end )

end

function ENT:DoAttackSequence()
	self:DoReloadSequence( 1 )
end



