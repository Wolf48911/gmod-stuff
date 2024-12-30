
include("entities/lvs_tank_wheeldrive/modules/cl_tankview.lua")

function ENT:TankViewOverride( ply, pos, angles, fov, pod )
	if pod == self:GetGunnerSeat() and not pod:GetThirdPersonMode() then
		local ID = self:LookupAttachment( "ptrs_eye" )

		local Muzzle = self:GetAttachment( ID )

		if Muzzle then
			pos =  Muzzle.Pos - Muzzle.Ang:Forward() * 2 - Muzzle.Ang:Right() * 0.08	
		end
	end
	return pos, angles, fov
end



