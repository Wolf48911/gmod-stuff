
include("entities/lvs_tank_wheeldrive/modules/cl_attachable_playermodels.lua")

function ENT:DrawCommander()
	local pod = self:GetDriverSeat()

	if not IsValid( pod ) then self:RemovePlayerModel( "driver" ) return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and not pod:GetThirdPersonMode()) then self:RemovePlayerModel( "driver" ) return end

	local ID = self:LookupAttachment( "m4_gunner" )
	local Att = self:GetAttachment( ID )

	if not Att then self:RemovePlayerModel( "driver" ) return end

	local Pos,Ang = LocalToWorld( Vector(0,0,0), Angle(0,0,-90), Att.Pos, Att.Ang )

	local model = self:CreatePlayerModel( ply, "driver" )

	model:SetSequence( "idle_dual" )
	model:SetRenderOrigin( Pos )
	model:SetRenderAngles( Ang )
	model:DrawModel()
end

function ENT:PreDraw()
	self:DrawCommander()
	return true
end
