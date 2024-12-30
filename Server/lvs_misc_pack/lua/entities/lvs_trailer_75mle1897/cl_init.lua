include("shared.lua")
include("sh_turret.lua")
include("entities/lvs_tank_wheeldrive/modules/cl_tankview.lua")
include("cl_optics.lua")

function ENT:TankViewOverride( ply, pos, angles, fov, pod )
	if ply == self:GetDriver() then
		if pod:GetThirdPersonMode() then
			pos = self:LocalToWorld( Vector(0,0,40) )
		else
			local ID = self:LookupAttachment( "muzzle" )

			local Muzzle = self:GetAttachment( ID )

			if Muzzle then
				pos =  self:LocalToWorld( Vector(10,10,30) ) + Muzzle.Ang:Forward() * -45 - Muzzle.Ang:Right() * 12
			end
		end
	end

	return pos, angles, fov
end
