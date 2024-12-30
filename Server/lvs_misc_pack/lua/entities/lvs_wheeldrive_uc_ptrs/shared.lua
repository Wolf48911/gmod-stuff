
ENT.Base = "lvs_wheeldrive_uc_base"

ENT.PrintName = "Universal Carrier (PTRS)"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Armored"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.lvsShowInSpawner = true

ENT.RandomColor = {
	{
		Skin = 0,
		BodyGroups = {
			[4] = 2,
		},
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		BodyGroups = {
			[4] = 2,
		},
		Wheels = {
			Skin = 1,
		}
	},
}

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "GunnerSeat" )
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
	weapon.Ammo = 80
	weapon.Delay = 1
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0

	weapon.OnThink = function( ent )
		local base = ent:GetVehicle()
		local ply = ent:GetDriver()

		if not IsValid( ply ) then return end

		local SwitchType = ply:lvsKeyDown( "CAR_SWAP_AMMO" )

		if ent._oldSwitchType ~= SwitchType then
			ent._oldSwitchType = SwitchType

			if SwitchType then
				ent:SetHeat( 1 )
			end
		end
	end


	weapon.Attack = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end
		local ID = base:LookupAttachment( "ptrs_muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= Muzzle.Ang:Forward()
		bullet.Spread 	= Vector(0.01,0.01,0.01)
		bullet.TracerName = "lvs_tracer_autocannon"

		bullet.Force	= base.CannonArmorPenetration
		bullet.Force1km	= base.CannonArmorPenetration1km
		bullet.HullSize 	= 0
		bullet.Damage	= 125

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

		base:PlayAnimation( "shot" )

		ent:TakeAmmo( 1 )

		if not IsValid( base.SNDTurret ) then return end

		base.SNDTurret:PlayOnce( 100 + math.cos( CurTime() + base:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end


	weapon.OnOverheat = function( ent )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end
		base:DoReloadSequence( 1 )


	timer.Simple(3, function()
		if not IsValid( ent ) then return end
		ent:SetHeat( 0 )
	end )

	end
	self:AddWeapon( weapon, 2 )

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
	self:AddWeapon( weapon, 2 )
end
