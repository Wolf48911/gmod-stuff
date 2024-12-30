
include("entities/lvs_tank_wheeldrive/modules/cl_attachable_playermodels.lua")

function ENT:DrawDriver()
	local pod = self:GetDriverSeat()

	if not IsValid( pod ) then self:RemovePlayerModel( "driver" ) return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and not pod:GetThirdPersonMode()) then self:RemovePlayerModel( "driver" ) return end

	local ID = self:LookupAttachment( "driver" )
	local Att = self:GetAttachment( ID )

	if not Att then self:RemovePlayerModel( "driver" ) return end

	local Pos,Ang = LocalToWorld( Vector(-10,-8,0), Angle(-5,10,-90), Att.Pos, Att.Ang )

	local model = self:CreatePlayerModel( ply, "driver" )

	model:SetSequence( "drive_jeep" )
	model:SetRenderOrigin( Pos )
	model:SetRenderAngles( Ang )
	model:DrawModel()
end

function ENT:DrawCommander()
	local pod = self:GetDriverSeat()

	if not IsValid( pod ) then self:RemovePlayerModel( "driver" ) return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and not pod:GetThirdPersonMode()) then self:RemovePlayerModel( "driver" ) return end

	local ID = self:LookupAttachment( "72k_gunner" )
	local Att = self:GetAttachment( ID )

	if not Att then self:RemovePlayerModel( "driver" ) return end

	local Pos,Ang = LocalToWorld( Vector(-12,-3,0), Angle(5,0,-90), Att.Pos, Att.Ang )

	local model = self:CreatePlayerModel( ply, "driver" )

	model:SetSequence( "drive_jeep" )
	model:SetRenderOrigin( Pos )
	model:SetRenderAngles( Ang )
	model:DrawModel()
end

function ENT:DrawLoader()
	local pod = self:GetDriverSeat()

	if not IsValid( pod ) then self:RemovePlayerModel( "driver" ) return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and not pod:GetThirdPersonMode()) then self:RemovePlayerModel( "driver" ) return end

	local ID = self:LookupAttachment( "72k_loader" )
	local Att = self:GetAttachment( ID )

	if not Att then self:RemovePlayerModel( "driver" ) return end

	local Pos,Ang = LocalToWorld( Vector(-12,-3,0), Angle(0,0,-90), Att.Pos, Att.Ang )

	local model = self:CreatePlayerModel( ply, "driver" )

	model:SetSequence( "drive_jeep" )
	model:SetRenderOrigin( Pos )
	model:SetRenderAngles( Ang )
	model:DrawModel()
end


function ENT:PreDraw()
	self:DrawDriver()
	self:DrawLoader()
	self:DrawCommander()
	return true
end
