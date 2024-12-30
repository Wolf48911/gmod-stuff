include("shared.lua")
include("sh_turret.lua")
include("cl_optics.lua")
include("entities/lvs_tank_wheeldrive/modules/cl_tankview.lua")

function ENT:TankViewOverride( ply, pos, angles, fov, pod )
	if ply == self:GetDriver() then
		if pod:GetThirdPersonMode() then
			pos = self:LocalToWorld( Vector(0,0,40) )
		else
			local ID = self:LookupAttachment( "sight" )

			local Muzzle = self:GetAttachment( ID )

			if Muzzle then
				pos =  self:LocalToWorld( Vector(10,10,20) ) + Muzzle.Ang:Forward() * -45 - Muzzle.Ang:Right() * 12
			end
		end
	end

	return pos, angles, fov
end

function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear, temperature, fuel, oil, ammeter )
	local Prongs = self:GetProngs()

	local T = CurTime()

	if Prongs then self._ProngTime = T + 1 end

	local ProngsActive = (self._ProngTime or 0) > T

	self:SetPoseParameter( "prong", self:QuickLerp( "prong", (ProngsActive and 1 or 0), 10 ) )
end

local switch = Material("lvs/weapons/change_ammo.png")
local AP = Material("lvs/weapons/bullet_ap.png")
local HE = Material("lvs/weapons/tank_cannon.png")
function ENT:DrawWeaponIcon( PodID, ID, x, y, width, height, IsSelected, IconColor )
	local Icon = self:GetUseHighExplosive() and HE or AP

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