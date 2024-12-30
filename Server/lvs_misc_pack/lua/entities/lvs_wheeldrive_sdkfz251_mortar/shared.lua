
ENT.Base = "lvs_wheeldrive_sdkfz251_base"

ENT.PrintName = "Schutzenpanzerwagen mit Granatwerfer"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Armored"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.RandomColor = {
	{
		Skin = 0,
		BodyGroups = {
			[3] = 5,
		},
		Wheels = {
			Skin = 0,
		}
	},
	{
		Skin = 1,
		BodyGroups = {
			[3] = 5,
		},
		Wheels = {
			Skin = 1,
		}
	},
}

function ENT:InitWeapons()

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/bomb.png")
	weapon.Ammo = 40 
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0
	weapon.HeatRateDown = 0.5

	weapon.StartAttack = function( ent )

		if self:GetAI() then return end
		self:MakeProjectile()
	end
	weapon.FinishAttack = function( ent )
		if self:GetAI() then return end


		self:FireProjectile()
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
	self:AddWeapon( weapon, 1 )

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
	self:AddWeapon( weapon, 1 )
end