AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "sh_turret.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_optics.lua" )
AddCSLuaFile( "cl_tankview.lua" )
AddCSLuaFile( "cl_attached_playermodels.lua" )
include("shared.lua")
include("sh_turret.lua")

ENT.DSArmorDamageReductionType = DMG_BULLET + DMG_CLUB
ENT.DSArmorIgnoreDamageType = DMG_SONIC

function ENT:OnSpawn( PObj )

	local ID = self:LookupAttachment( "pak_muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/pak40/cannon_fire.wav", "lvs/vehicles/pak40/cannon_fire.wav" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )

	local DriverSeat = self:AddDriverSeat( Vector(6,16,30), Angle(0,-90,0) )
	local PassengerSeat = self:AddPassengerSeat( Vector(21,-17,37), Angle(0,-90,10) )
	local GunnerSeat = self:AddPassengerSeat( Vector(-66,10,66), Angle(0,-90,0) )
	self:SetFrontGunnerSeat( GunnerSeat )
	GunnerSeat.HidePlayer = true


	local DoorHandler = self:AddDoorHandler( "hatch1", Vector(-107,0,44.44), Angle(0,0,0), Vector(-10,-25,-15), Vector(10,25,25), Vector(-30,-25,-15), Vector(10,25,25) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "!dh1", Vector(29.46,16.28,72.09), Angle(0,0,0), Vector(-3,-10,-3), Vector(3,10,3), Vector(-3,-10,-3), Vector(3,10,3) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local DoorHandler = self:AddDoorHandler( "!gh1", Vector(29.46,-16.28,72.09), Angle(0,0,0), Vector(-3,-10,-3), Vector(3,10,3), Vector(-3,-10,-3), Vector(3,10,3) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local DoorHandler = self:AddDoorHandler( "!dh2", Vector(14.95,36.78,70.81), Angle(0,90,0), Vector(-3,-10,-3), Vector(3,10,3), Vector(-3,-10,-3), Vector(3,10,3) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	local DoorHandler = self:AddDoorHandler( "!gh2", Vector(14.95,-36.78,70.81), Angle(0,90,0), Vector(-3,-10,-3), Vector(3,10,3), Vector(-3,-10,-3), Vector(3,10,3) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )

	self:AddEngine( Vector(66.99,0,54.43) )
	self:AddFuelTank( Vector(-45,0,23.8), Angle(0,0,0), 600, LVS.FUELTYPE_DIESEL )

	local WheelModel = "models/diggercars/sdkfz251/fw.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(99,34,16.5), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2 } )
	local FRWheel = self:AddWheel( { pos = Vector(99,-34,16.5), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2} )

	self:CreateRigControler( "fl", FLWheel, 10, 17.7 )
	self:CreateRigControler( "fr", FRWheel, 10, 17.7 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0.5,
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

	--front
	self:AddArmor( Vector(70,0,49), Angle(0,0,0), Vector(-50,-53,-32), Vector(50,53,32), 300, self.FrontArmor )
	--hull
	self:AddArmor( Vector(-47,0,49), Angle(0,0,0), Vector(-68,-53,-32), Vector(68,53,32), 160, self.HullArmor )

	self:AddTrailerHitch( Vector(-104.95,0,25.75), LVS.HITCHTYPE_MALE )
end

function ENT:OnTick()
	self:AimTurret()
end

function ENT:OnCollision( data, physobj )
	if self:WorldToLocal( data.HitPos ).z < 19 then return true end -- dont detect collision  when the lower part of the model touches the ground

	return false
end


function ENT:SpawnShell()
	local ID = self:LookupAttachment( "pak_muzzle" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return end

	local Shell = ents.Create( "lvs_item_shell" )

	if not IsValid( Shell ) then return end

	Shell.MDL = "models/props_debris/shellcasing_10.mdl"
	Shell.CollisionSounds = {
		"lvs/vehicles/pak40/shell_impact1.wav",
		"lvs/vehicles/pak40/shell_impact2.wav"
	}

	Shell:SetPos( Muzzle.Pos - Muzzle.Ang:Forward() * 150 )
	Shell:SetAngles( Muzzle.Ang + Angle(90,0,0) )
	Shell:Spawn()
	Shell:Activate()
	Shell:SetOwner( self )

	local PhysObj = Shell:GetPhysicsObject()

	if not IsValid( PhysObj ) then return end

	PhysObj:SetVelocityInstantaneous( Shell:GetRight() * 250 - Shell:GetForward() * 80 )
	PhysObj:SetAngleVelocityInstantaneous( Vector(0,0,0) )
end

function ENT:DoReloadSequence( delay )
	if self._ReloadActive then return end

	self._ReloadActive = true

	self:SetBodygroup(4, 0)

	timer.Simple(delay, function()
		if not IsValid( self ) then return end

		self:PlayAnimation("breech_pak")

		self:EmitSound("lvs/vehicles/pak40/cannon_unload.wav", 75, 100, 0.5, CHAN_WEAPON )

		timer.Simple(0.3, function()
			if not IsValid( self ) then return end
			self:SpawnShell()
		end)
	end)

	timer.Simple(2, function()
		if not IsValid( self ) then return end

		self:PlayAnimation("reload_pak")

		self:EmitSound("lvs/vehicles/75mle1897/cannon_reload.wav", 75, 100, 1, CHAN_WEAPON )

		timer.Simple(0.1, function()
			if not IsValid( self ) then return end
			self:SetBodygroup(4, 1)
			self._ReloadActive = nil
		end )
	end )
end

function ENT:DoAttackSequence()
	if not IsValid( self.SNDTurret ) then return end

	self.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + self:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )

	self:PlayAnimation("shot_pak")

	self:DoReloadSequence( 1 )
end
