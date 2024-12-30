include("shared.lua")
include("sh_turret.lua")
include("cl_tankview.lua")
include("cl_attached_playermodels.lua")

function ENT:UpdatePoseParameters( steer )
	self:SetPoseParameter( "vehicle_steer", steer )
end

local switch = Material("lvs/weapons/change_ammo.png")
local AP = Material("lvs/weapons/bullet_ap.png")
local TR = Material("lvs/weapons/bullet.png")

function ENT:DrawWeaponIcon( PodID, ID, x, y, width, height, IsSelected, IconColor )
	local Icon = self:GetUseAP() and TR or AP

	surface.SetMaterial( Icon )
	surface.DrawTexturedRect( x, y, width, height )

	local ply = LocalPlayer()

	if not IsValid( ply ) or self:GetSelectedWeapon() ~= 1 then return end

	surface.SetMaterial( switch )
	surface.DrawTexturedRect( x + width + 5, y + 7, 24, 24 )

	local buttonCode = ply:lvsGetControls()[ "CAR_SWAP_AMMO" ]

	if not buttonCode then return end

	local KeyName = input.GetKeyName( buttonCode )

	if not KeyName then return end

	draw.DrawText( KeyName, "DermaDefault", x + width + 17, y + height * 0.5 + 7, Color(0,0,0,IconColor.a), TEXT_ALIGN_CENTER )
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/bmw_r75/bmw_start.wav", 75, 100,  LVS.EngineVolume )
	else
		self:EmitSound( "lvs/vehicles/bmw_r75/bmw_stop.wav", 75, 100,  LVS.EngineVolume )
	end
end
