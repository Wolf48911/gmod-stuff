
ENT.Base = "lvs_wheeldrive_sdkfz251_base"

ENT.PrintName = "Sd.Kfz 251/21"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Armored"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.CannonArmorPenetration = 3000
ENT.CannonArmorPenetration1km = 1000

ENT.HornSound = "lvs/horn1.wav"
ENT.HornPos = Vector(70,0,40)

ENT.RandomColor = {
	{
		Skin = 0,
		BodyGroups = {
			[3] = 4,
		},
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		BodyGroups = {
			[3] = 4,
		},
		Wheels = {
			Skin = 1,
		}
	},
}

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "FrontGunnerSeat" )
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
	weapon.Ammo = 1500
	weapon.Delay = 0.05
	weapon.HeatRateUp = 0.3
	weapon.HeatRateDown = 0.2

	weapon.Attack = function( ent )



		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		base._MuzzleID = base._MuzzleID and base._MuzzleID + 1 or 1

		if base._MuzzleID > 3 then
			base._MuzzleID = 1
		end

		local ID = base:LookupAttachment( "drilling_muzzle_"..base._MuzzleID )

		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= Muzzle.Ang:Forward()
		bullet.Spread 	= Vector(0.02,0.02,0.02)
		bullet.TracerName = "lvs_tracer_yellow_small"

		bullet.Force	= base.CannonArmorPenetration
		bullet.Force1km	= base.CannonArmorPenetration1km
		bullet.HullSize 	= 0
		bullet.Damage	= 50

		bullet.Velocity = 20000
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

		ent:TakeAmmo( 1 )

		if not IsValid( base.SNDTurret ) then return end

		base.SNDTurret:Play()
	end
	weapon.StartAttack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) or not IsValid( base.SNDTurret ) then return end

		base.SNDTurret:Play()
	end
	weapon.FinishAttack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) or not IsValid( base.SNDTurret ) then return end

		base.SNDTurret:Stop()
	end

	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()
		if not IsValid( base ) then return end

		local ID = base:LookupAttachment(  "drilling_muzzle_2" )

		local Muzzle = base:GetAttachment( ID )

		if Muzzle then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Forward() * 50000,
				filter = ent:GetCrosshairFilterEnts()
			} )

			local MuzzlePos2D = traceTurret.HitPos:ToScreen() 
			base:PaintCrosshairOuter( MuzzlePos2D, COLOR_WHITE )
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
