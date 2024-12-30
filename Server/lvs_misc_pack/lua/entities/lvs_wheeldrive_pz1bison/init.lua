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

	local ID = self:LookupAttachment( "muzzle_bison" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurret = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "lvs/vehicles/cannons/105to130mm.mp3" )
	self.SNDTurret:SetSoundLevel( 95 )
	self.SNDTurret:SetParent( self, ID )


	local DriverSeat = self:AddDriverSeat( Vector(0,0,10), Angle(0,-90,0) )

	DriverSeat.HidePlayer = true

	self.HornSND = self:AddSoundEmitter( Vector(40,0,35), "lvs/horn3.wav" )
	self.HornSND:SetSoundLevel( 75 )
	self.HornSND:SetDoppler( true )

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

function ENT:MakeProjectile()
	local ID = self:LookupAttachment( "muzzle_bison" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return end

	local Driver = self:GetDriver()

	local projectile = ents.Create( "lvs_bomb" )
	projectile:SetPos( Muzzle.Pos )
	projectile:SetAngles( Muzzle.Ang )
	projectile:SetParent( self, ID )
	projectile:Spawn()
	projectile:Activate()
	projectile:SetModel("models/misc/88mm_projectile.mdl")
	projectile:SetAttacker( IsValid( Driver ) and Driver or self )
	projectile:SetEntityFilter( self:GetCrosshairFilterEnts() )
	projectile:SetSpeed( Muzzle.Ang:Forward() * 2000 )
	projectile:SetDamage( 3000 )
	projectile.UpdateTrajectory = function( bomb )
		bomb:SetSpeed( bomb:GetForward() * 2000 )
	end

	if projectile.SetMaskSolid then
		projectile:SetMaskSolid( true )
	end

	self._ProjectileEntity = projectile
end

function ENT:FireProjectile()
	local ID = self:LookupAttachment( "muzzle_bison" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle or not IsValid( self._ProjectileEntity ) then return end

	self._ProjectileEntity:Enable()
	self._ProjectileEntity:SetCollisionGroup( COLLISION_GROUP_NONE )

	local effectdata = EffectData()
		effectdata:SetOrigin( self._ProjectileEntity:GetPos() )
		effectdata:SetEntity( self._ProjectileEntity )
	util.Effect( "lvs_haubitze_trail", effectdata )

	local effectdata = EffectData()
	effectdata:SetOrigin( Muzzle.Pos )
	effectdata:SetNormal( Muzzle.Ang:Forward() )
	effectdata:SetEntity( self )
	util.Effect( "lvs_haubitze_muzzle", effectdata )

	local PhysObj = self:GetPhysicsObject()
	if IsValid( PhysObj ) then
		PhysObj:ApplyForceOffset( -Muzzle.Ang:Forward() * 1000000, Muzzle.Pos )
	end

	self:TakeAmmo()
	self:SetHeat( 1 )
	self:SetOverheated( true )

	self._ProjectileEntity = nil

	if not IsValid( self.SNDTurret ) then return end

	self.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + self:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )

	self:EmitSound("lvs/vehicles/wespe/cannon_reload.wav", 75, 100, 1, CHAN_WEAPON )
end
