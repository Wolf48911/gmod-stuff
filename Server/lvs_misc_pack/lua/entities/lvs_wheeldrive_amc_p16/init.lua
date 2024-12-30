AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "sh_tracks.lua" )
AddCSLuaFile( "cl_tankview.lua" )
AddCSLuaFile( "sh_turret.lua" )
include("shared.lua")
include("sh_tracks.lua")
include("sh_turret.lua")
include("sv_pds.lua")



-- since this is based on a tank we need to reset these to default var values:
ENT.DSArmorDamageReductionType = DMG_BULLET + DMG_CLUB
ENT.DSArmorIgnoreDamageType = DMG_SONIC


function ENT:OnSpawn( PObj )

	local ID = self:LookupAttachment( "muzzle_mg" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretMG = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/amcp16/mg_loop.wav", "lvs/vehicles/amcp16/mg_loop.wav" )
	self.SNDTurretMG:SetSoundLevel( 95 )
	self.SNDTurretMG:SetParent( self, ID )

	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/sherman/cannon_fire.wav", "lvs/vehicles/amcp16/shot_in.wav" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )

	local DriverSeat = self:AddDriverSeat( Vector(-25,10,35), Angle(0,-90,0) )

	local DoorHandler = self:AddDoorHandler( "hatch1", Vector(-63,0,50), Angle(19,0,0), Vector(-4,-15,-15), Vector(4,15,22), Vector(-15,-15,-15), Vector(4,15,22) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )
	DoorHandler:LinkToSeat( DriverSeat )

	local DoorHandler = self:AddDoorHandler( "hatch2", Vector(-20,0,100), Angle(0,0,0), Vector(-10,-10,-5), Vector(10,10,5), Vector(-15,-10,-5), Vector(10,10,5) )
	DoorHandler:SetSoundOpen( "lvs/vehicles/generic/car_hood_open.wav" )
	DoorHandler:SetSoundClose( "lvs/vehicles/generic/car_hood_close.wav" )


	self:AddEngine( Vector(68,0,50) )
	self:AddFuelTank( Vector(-40,0,25), Angle(0,0,0), 600, LVS.FUELTYPE_DIESEL )

	local WheelModel = "models/diggercars/amcp16/amcp16_wheel.mdl"

	local FLWheel = self:AddWheel( { pos = Vector(67,32,23.55), mdl = WheelModel, mdl_ang = Angle(0,0,0), width = 2, radius = 19 } )
	local FRWheel = self:AddWheel( { pos = Vector(67,-32,23.55), mdl = WheelModel, mdl_ang = Angle(0,180,0), width = 2, radius = 19 } )

	self:CreateRigControler( "fl", FLWheel, 13, 29 )
	self:CreateRigControler( "fr", FRWheel, 13, 29 )

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 20,
			TorqueFactor = 0,
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

	--frontcylinders
	self:AddArmor( Vector(108.7,0,28.6), Angle(0,0,0), Vector(-11,-15,-11), Vector(11,15,11), 100, self.FrontArmor )

	--front
	self:AddArmor( Vector(60,0,40), Angle(0,0,0), Vector(-25,-26,-25), Vector(32,26,25), 100, self.FrontArmor )
	--mid
	self:AddArmor( Vector(26,0,40), Angle(0,0,0), Vector(-15,-28,-25), Vector(12,28,28), 100, self.FrontArmor )
	--rear
	self:AddArmor( Vector(-20,0,40), Angle(0,0,0), Vector(-55,-32,-25), Vector(39,32,38), 100, self.FrontArmor )
	--turret
	self:AddArmor( Vector(-20,0,75), Angle(0,0,0), Vector(-29,-29,0), Vector(29,29,29), 100, self.FrontArmor )
	--left
	self:AddArmor( Vector(-18,28,47), Angle(0,0,0), Vector(-55,-10,-5), Vector(55,10,8), 100, self.FrontArmor )
	--right
	self:AddArmor( Vector(-18,-28,47), Angle(0,0,0), Vector(-55,-10,-5), Vector(55,10,8), 100, self.FrontArmor )

	self:AddDriverViewPort( Vector(9.38,10.39,71.02), Angle(0,0,0), Vector(-1,-5,-1), Vector(1,5,1) )

	-- ammo rack weakspot
	self:AddAmmoRack( Vector(0,0,28), Vector(-20,0,76.5), Angle(0,0,0), Vector(-16,-16,-6), Vector(10,16,6) )

	self:AddTrailerHitch( Vector(-68.54,0,23.62), LVS.HITCHTYPE_MALE )

	self:CreatePDS()

end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/halftrack/engine_start.wav" )
	end
end
