
ENT.Base = "lvs_base_wheeldrive_trailer"

ENT.PrintName = "105mm MLE 1913"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS]"

ENT.VehicleCategory = "Artillery"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/cannons/schneider.mdl"

ENT.GibModels = {
	"models/diggercars/cannons/schneider_d1.mdl",
	"models/diggercars/cannons/schneider_d2.mdl",
	"models/diggercars/cannons/schneider_d3.mdl",
	"models/diggercars/cannons/schneider_d4.mdl",
	"models/diggercars/cannons/schneider_d5.mdl",
	"models/diggercars/cannons/schneider_d6.mdl",
	"models/diggercars/cannons/schneider_wheel.mdl",
	"models/diggercars/cannons/schneider_wheel.mdl",
}

ENT.AITEAM = 2

ENT.MaxHealth = 1000

ENT.DSArmorIgnoreForce = 1000

ENT.PhysicsMass = 2200
ENT.WheelPhysicsMass = 200
ENT.WheelPhysicsInertia = Vector(10,8,10)

ENT.CannonArmorPenetration = 1200

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "Prongs" )
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
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/bomb.png")
	weapon.Ammo = 32
	weapon.Delay = 5
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0.2
	weapon.StartAttack = function( ent )
	
		if self:GetAI() then return end

		self:MakeProjectile()
	end
	weapon.FinishAttack = function( ent )
		if self:GetAI() then return end
		self:PlayAnimation("fire")
		self:FireProjectile()
		self:DoReloadSequence( 0 )
	end
	weapon.Attack = function( ent )
		if not self:GetAI() then return end

		self:MakeProjectile()
		self:FireProjectile()

	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen()

		ent:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon )

	-- turret rotation disabler
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/tank_noturret.png")
	weapon.UseableByAI = false
	weapon.Ammo = -1
	weapon.Delay = 0
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0
	weapon.OnSelect = function( ent, old, new  )
		if ent.SetTurretEnabled then
			ent:SetTurretEnabled( false )
		end
	end
	weapon.OnDeselect = function( ent, old, new  )
		if ent.SetTurretEnabled then
			ent:SetTurretEnabled( true )
		end
	end
	self:AddWeapon( weapon )
end
