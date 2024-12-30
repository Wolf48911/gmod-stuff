
ENT.Base = "lvs_base_wheeldrive_trailer"

ENT.PrintName = "ZIS 3"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS]"

ENT.VehicleCategory = "Artillery"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/cannons/zis3.mdl"

ENT.GibModels = {
	"models/diggercars/cannons/zis3_d2.mdl",
	"models/diggercars/cannons/zis3_d3.mdl",
	"models/diggercars/cannons/zis3_d4.mdl",
	"models/diggercars/cannons/zis3_d5.mdl",
	"models/diggercars/cannons/zis3_d6.mdl",
	"models/diggercars/cannons/zis3_wheel.mdl",
	"models/diggercars/cannons/zis3_wheel.mdl",
}

ENT.AITEAM = 2

ENT.WheelPhysicsMass = 350
ENT.WheelPhysicsInertia = Vector(10,8,10)

ENT.CannonArmorPenetration = 7700
ENT.CannonArmorPenetration1km = 4500

ENT.ProjectileVelocityHighExplosive = 12700
ENT.ProjectileVelocityArmorPiercing = 14000

ENT.lvsShowInSpawner = false

ENT.MaxHealth = 800

ENT.DSArmorIgnoreForce = 1000

ENT.RandomColor = {
	{
		Skin = 0,
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		Wheels = {
			Skin = 1,
		}
	},
}

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "Prongs" )
	self:AddDT( "Bool", "UseHighExplosive" )
end

function ENT:CalcMainActivity( ply )
	if ply ~= self:GetDriver() then return self:CalcMainActivityPassenger( ply ) end

	if ply.m_bWasNoclipping then 
		ply.m_bWasNoclipping = nil 
		ply:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM ) 
		
		if CLIENT then 
			ply:SetIK( true )
		end 
	end 

	ply.CalcIdeal = ACT_STAND
	ply.CalcSeqOverride = ply:LookupSequence( "cidle_knife" )

	return ply.CalcIdeal, ply.CalcSeqOverride
end

function ENT:InitWeapons()
	local COLOR_WHITE = Color(255,255,255,255)

	local weapon = {}
	weapon.Icon = true
	weapon.Ammo = 100
	weapon.Delay = 3
	weapon.HeatRateUp = 1
	weapon.HeatRateDown = 0.3
	weapon.OnThink = function( ent )
		local ply = ent:GetDriver()

		if not IsValid( ply ) then return end

		local SwitchType = ply:lvsKeyDown( "CAR_SWAP_AMMO" )

		if ent._oldSwitchType ~= SwitchType then
			ent._oldSwitchType = SwitchType

			if SwitchType then
				ent:SetUseHighExplosive( not ent:GetUseHighExplosive() )
				ent:DoReloadSequence( 0 )
				ent:SetHeat( 1 )
				ent:SetOverheated( true )
				if ent:GetUseHighExplosive() then
					ent:TurretUpdateBallistics( ent.ProjectileVelocityHighExplosive )
				else
					ent:TurretUpdateBallistics( ent.ProjectileVelocityArmorPiercing )
				end
			end
		end
	end
	weapon.Attack = function( ent )
		local ID = ent:LookupAttachment( "muzzle" )

		local Muzzle = ent:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= Muzzle.Ang:Forward()
		bullet.Spread = Vector(0,0,0)
		bullet.EnableBallistics = true

		if ent:GetUseHighExplosive() then
			bullet.Force	= 500
			bullet.HullSize 	= 15
			bullet.Damage	= 250
			bullet.SplashDamage = 750
			bullet.SplashDamageRadius = 200
			bullet.SplashDamageEffect = "lvs_bullet_impact_explosive"
			bullet.SplashDamageType = DMG_BLAST
			bullet.Velocity = ent.ProjectileVelocityHighExplosive
		else
			bullet.Force	= ent.CannonArmorPenetration
			bullet.Force1km	= ent.CannonArmorPenetration1km
			bullet.HullSize 	= 0
			bullet.Damage	= 1000
			bullet.Velocity = ent.ProjectileVelocityArmorPiercing
		end

		bullet.TracerName = "lvs_tracer_cannon"
		bullet.Attacker 	= ent:GetDriver()
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( bullet.Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

	local PhysObj = self:GetPhysicsObject()
	if IsValid( PhysObj ) then
		PhysObj:ApplyForceOffset( -Muzzle.Ang:Forward() * 30000, Muzzle.Pos )
	end

		ent:TakeAmmo( 1 )

		ent:DoAttackSequence()
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		local ID = base:LookupAttachment( "muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if Muzzle then
			local traceTurret = util.TraceLine( {
				start = Muzzle.Pos,
				endpos = Muzzle.Pos + Muzzle.Ang:Forward() * 50000,
				filter = base:GetCrosshairFilterEnts()
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
	weapon.OnSelect = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) or not base.GetUseHighExplosive then return end

		if base:GetUseHighExplosive() then
			base:TurretUpdateBallistics( base.ProjectileVelocityHighExplosive, "muzzle" )
		else
			base:TurretUpdateBallistics( base.ProjectileVelocityArmorPiercing, "muzzle" )
		end
	end
	self:AddWeapon( weapon )
end