
include("entities/lvs_tank_wheeldrive/modules/cl_attachable_playermodels.lua")

function ENT:DrawGunner()
	local pod = self:GetFrontGunnerSeat()

	if not IsValid( pod ) then self:RemovePlayerModel( "passenger" ) return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and not pod:GetThirdPersonMode()) then self:RemovePlayerModel( "passenger" ) return end

	local ID = self:LookupAttachment( "drilling_gunner" )
	local Att = self:GetAttachment( ID )

	if not Att then self:RemovePlayerModel( "passenger" ) return end

	local Pos,Ang = LocalToWorld( Vector(0,0,0), Angle(0,0,-90), Att.Pos, Att.Ang )

	local model = self:CreatePlayerModel( ply, "passenger" )

	model:SetSequence( "sit" )
	model:SetRenderOrigin( Pos )
	model:SetRenderAngles( Ang )
	model:DrawModel()
end

function ENT:PreDraw()
	self:DrawGunner()
	return true
end
