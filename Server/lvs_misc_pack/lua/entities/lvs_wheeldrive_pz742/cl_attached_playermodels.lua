
include("entities/lvs_tank_wheeldrive/modules/cl_attachable_playermodels.lua")

function ENT:DrawDriver()
	local pod = self:GetDriverSeat()

	if not IsValid( pod ) then self:RemovePlayerModel( "driver" ) return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and not pod:GetThirdPersonMode()) then self:RemovePlayerModel( "driver" ) return end

	local ID = self:LookupAttachment( "driver_pos" )
	local Att = self:GetAttachment( ID )

	if not Att then self:RemovePlayerModel( "driver" ) return end

	local Pos,Ang = LocalToWorld( Vector(5,2,0), Angle(0,30,-90), Att.Pos, Att.Ang )

	local model = self:CreatePlayerModel( ply, "driver" )

	model:SetSequence( "sit_knife" )
	model:SetRenderOrigin( Pos )
	model:SetRenderAngles( Ang )
	model:DrawModel()
end

function ENT:DrawGunner()
	local pod = self:GetDriverSeat()

	if not IsValid( pod ) then self:RemovePlayerModel( "driver" ) return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and not pod:GetThirdPersonMode()) then self:RemovePlayerModel( "driver" ) return end

	local ID = self:LookupAttachment( "comm_seat" )
	local Att = self:GetAttachment( ID )

	if not Att then self:RemovePlayerModel( "driver" ) return end

	local Pos,Ang = LocalToWorld( Vector(2,5,-3), Angle(-5,10,-90), Att.Pos, Att.Ang )

	local model = self:CreatePlayerModel( ply, "driver" )

	model:SetSequence( "sit_knife" )
	model:SetRenderOrigin( Pos )
	model:SetRenderAngles( Ang )
	model:DrawModel()
end

function ENT:PreDraw()
	self:DrawDriver()
	self:DrawGunner()
	return true
end
