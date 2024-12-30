
ENT.Base = "lvs_wheeldrive_sdkfz251_base"

ENT.PrintName = "Sd.Kfz 251/19"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Armored"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.CannonArmorPenetration = 3900
ENT.CannonArmorPenetration1km = 1500

ENT.HornSound = "lvs/horn1.wav"
ENT.HornPos = Vector(70,0,40)

ENT.RandomColor = {
	{
		Skin = 0,
		BodyGroups = {
			[3] = 3,
		},
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		BodyGroups = {
			[3] = 3,
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
	weapon.Icon = Material("lvs/weapons/bullet_ap.png")
	weapon.Ammo = 600
	weapon.Delay = 0.18
	weapon.HeatRateUp = 0.3
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
				base:EmitSound("lvs/vehicles/222/cannon_overheat.wav", 75, 100, 1, CHAN_WEAPON )
				ent:SetHeat( 1 )
				ent:SetOverheated( true )
			end
		end
	end

	weapon.Attack = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end
		local ID = base:LookupAttachment( "flak_muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= Muzzle.Ang:Forward()
		bullet.Spread 	= Vector(0.01,0.01,0.01)
		bullet.TracerName = "lvs_tracer_autocannon"

		if base:GetUseHighExplosive() then
			bullet.Force	= 500
			bullet.HullSize 	= 15
			bullet.Damage	= 5
			bullet.SplashDamage = 80
			bullet.SplashDamageRadius = 190
			bullet.SplashDamageEffect = "lvs_defence_explosion"
			bullet.SplashDamageType = DMG_BLAST
		else
			bullet.Force	= base.CannonArmorPenetration
			bullet.Force1km	= base.CannonArmorPenetration1km
			bullet.HullSize 	= 0
			bullet.Damage	= 70
		end

		bullet.Velocity = 30000
		bullet.Attacker 	= ent:GetDriver()
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( bullet.Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		local PhysObj = ent:GetPhysicsObject()
		if IsValid( PhysObj ) then
			PhysObj:ApplyForceOffset( -bullet.Dir * 10000, bullet.Src )
		end

		base:PlayAnimation( "shot_flak" )

		ent:TakeAmmo( 1 )

		if not IsValid( base.SNDTurret ) then return end

		base.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + base:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		local ID = base:LookupAttachment(  "flak_muzzle" )

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
	weapon.OnOverheat = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end
		base:EmitSound("lvs/vehicles/222/cannon_overheat.wav")
	end
	self:AddWeapon( weapon, 3 )

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/tank_noturret.png")
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.OnSelect = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		if base.SetTurretEnabled then
			base:SetTurretEnabled( false )
		end
	end
	weapon.OnDeselect = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		if base.SetTurretEnabled then
			base:SetTurretEnabled( true )
		end
	end
	self:AddWeapon( weapon, 3 )
end
