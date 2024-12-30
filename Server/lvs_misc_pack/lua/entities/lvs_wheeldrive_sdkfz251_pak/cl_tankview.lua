
include("entities/lvs_tank_wheeldrive/modules/cl_tankview.lua")

function ENT:TankViewOverride( ply, pos, angles, fov, pod )
	if pod == self:GetFrontGunnerSeat() and not pod:GetThirdPersonMode() then
		local ID = self:LookupAttachment( "pak_eye" )

		local Muzzle = self:GetAttachment( ID )

		if Muzzle then
			pos =  Muzzle.Pos - Muzzle.Ang:Up() * 1 - Muzzle.Ang:Forward() * 1 - Muzzle.Ang:Right() * 1		
		end
	end

	return pos, angles, fov
end



