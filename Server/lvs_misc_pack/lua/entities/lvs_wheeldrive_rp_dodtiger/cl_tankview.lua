
include("entities/lvs_tank_wheeldrive/modules/cl_tankview.lua")

function ENT:TankViewOverride( ply, pos, angles, fov, pod )
	if ply == self:GetDriver() and not pod:GetThirdPersonMode() then
		local ID = self:LookupAttachment( "driver_eye" )

		local Muzzle = self:GetAttachment( ID )

		if Muzzle then
			pos =  Muzzle.Pos
		end

	end

	if pod == self:GetGunnerSeat() then

		angles = ply:EyeAngles() -- this will unlock the camera from tank rotation. See init.lua line 39 for server

		if not pod:GetThirdPersonMode() then
			if ply:lvsKeyDown( "ZOOM" ) then

				local ID = self:LookupAttachment( "gunner_visor" )

				local Muzzle = self:GetAttachment( ID )

				if Muzzle then
					pos =  Muzzle.Pos
				end

			else

				local ID = self:LookupAttachment( "gunner_eye" )

				local Muzzle = self:GetAttachment( ID )

				if Muzzle then
					pos =  Muzzle.Pos
				end

			end
		end
	end


	if pod == self:GetCommSeat() and not pod:GetThirdPersonMode() then
		local ID = self:LookupAttachment( "comm_eye" )

		local Muzzle = self:GetAttachment( ID )

		if Muzzle then
			pos =  Muzzle.Pos
		end
	end

	if pod == self:GetRadioSeat() and not pod:GetThirdPersonMode() then

		if ply:lvsKeyDown( "ZOOM" ) then

		local ID = self:LookupAttachment( "muzzle_machinegun" )

		local Muzzle = self:GetAttachment( ID )

		if Muzzle then
			pos =  Muzzle.Pos
		end

		else

		local ID = self:LookupAttachment( "radio_eye" )

		local Muzzle = self:GetAttachment( ID )

		if Muzzle then
			pos =  Muzzle.Pos
		end

		end
	end

	if pod == self:GetLoaderSeat() and not pod:GetThirdPersonMode() then
		local ID = self:LookupAttachment( "loader_eye" )

		local Muzzle = self:GetAttachment( ID )

		if Muzzle then
			if self:GetSelectedWeapon() ~= 0 then
				pos =  Muzzle.Pos - Muzzle.Ang:Up() * -10 - Muzzle.Ang:Forward() * -10 - Muzzle.Ang:Right() * 10
			else
				pos =  Muzzle.Pos
			end
		end
	end

	return pos, angles, fov
end

function ENT:CalcViewPassenger( ply, pos, angles, fov, pod )
	return self:CalcTankView( ply, pos, angles, fov, pod )
end
