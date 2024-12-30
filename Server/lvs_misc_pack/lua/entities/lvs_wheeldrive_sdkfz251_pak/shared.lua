
ENT.Base = "lvs_wheeldrive_sdkfz251_base"

ENT.PrintName = "Kanonenpanzerwagen"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Armored"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.CannonArmorPenetration = 14500
ENT.CannonArmorPenetration1km = 10500

ENT.HornSound = "lvs/horn1.wav"
ENT.HornPos = Vector(70,0,40)

ENT.RandomColor = {
	{
		Skin = 0,
		BodyGroups = {
			[3] = 2,
		},
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		BodyGroups = {
			[3] = 2,
		},
		Wheels = {
			Skin = 1,
		}
	},
}

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "FrontGunnerSeat" )
	self:AddDT( "Bool", "UseHighExplosive" )
end

function ENT:InitWeapons()
	self:AddGunnerWeapons()
end

function ENT:GunnerInRange( Dir )
	return self:AngleBetweenNormal( self:GetForward(), Dir ) < 30
end

function ENT:AddGunnerWeapons()
	local COLOR_WHITE = Color(255,255,255,255)

	local weapon = {}
	weapon.Icon = true
	weapon.Ammo = 20
	weapon.Delay = 3
	weapon.HeatRateUp = 1
	weapon.HeatRateDown = 0.2

	weapon.OnThink = function( ent )
		local base = ent:GetVehicle()
		local ply = ent:GetDriver()

		if not IsValid( ply ) then return end

		local SwitchType = ply:lvsKeyDown( "CAR_SWAP_AMMO" )

		if ent._oldSwitchType ~= SwitchType then
			ent._oldSwitchType = SwitchType

			if SwitchType then
				base:SetUseHighExplosive( not base:GetUseHighExplosive() )
				base:DoReloadSequence( 0 )
				base:SetHeat( 1 )
				base:SetOverheated( true )
			end
		end
	end

	weapon.Attack = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		local ID = base:LookupAttachment( "pak_muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= Muzzle.Ang:Forward()
		bullet.Spread = Vector(0,0,0)

		if base:GetUseHighExplosive() then
			bullet.Force	= 2500
			bullet.HullSize 	= 15
			bullet.Damage	= 250
			bullet.SplashDamage = 750
			bullet.SplashDamageRadius = 200
			bullet.SplashDamageEffect = "lvs_bullet_impact_explosive"
			bullet.SplashDamageType = DMG_BLAST
			bullet.Velocity = 13000
		else
			bullet.Force	= base.CannonArmorPenetration
			bullet.Force1km	= base.CannonArmorPenetration1km
			bullet.HullSize 	= 0
			bullet.Damage	= 1500
			bullet.Velocity = 16000
		end

		bullet.TracerName = "lvs_tracer_cannon"
		bullet.Attacker 	= ent:GetDriver()
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( bullet.Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		ent:TakeAmmo( 1 )

	local PhysObj = self:GetPhysicsObject()
	if IsValid( PhysObj ) then
		PhysObj:ApplyForceOffset( -Muzzle.Ang:Forward() * 100000, Muzzle.Pos )
	end

		base:DoAttackSequence()
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		local ID = base:LookupAttachment(  "pak_muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if Muzzle then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Forward() * 50000,
				filter = ent:GetCrosshairFilterEnts()
			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 

			if base:GetUseHighExplosive() then
				base:PaintCrosshairSquare( MuzzlePos2D, COLOR_WHITE )
			else
				base:PaintCrosshairOuter( MuzzlePos2D, COLOR_WHITE )
			end

			base:LVSPaintHitMarker( MuzzlePos2D )
		end
	end
	self:AddWeapon( weapon, 3 )
end
