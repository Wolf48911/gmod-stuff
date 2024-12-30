include("shared.lua")

function ENT:OnSpawn()
	self:RegisterTrail( Vector(40,200,70), 0, 20, 2, 1000, 400 )
	self:RegisterTrail( Vector(40,-200,70), 0, 20, 2, 1000, 400 )

	self:CreateBonePoseParameter( "cabin", 15, Angle(0,0,0), Angle(0,80,0), Vector(0,0,0), Vector(0,0,0) )
end

function ENT:OnFrame()
	local FT = RealFrameTime()

	self:AnimControlSurfaces( FT )
	self:AnimLandingGear( FT )
	self:AnimRotor( FT )
end

function ENT:AnimRotor( frametime )
	if not self.RotorRPM then return end

	local PhysRot = self.RotorRPM < 470

	self._rRPM = self._rRPM and (self._rRPM + self.RotorRPM *  frametime * (PhysRot and 4 or 1)) or 0

	local Rot = Angle( 0,self._rRPM,0)
	Rot:Normalize() 
	self:ManipulateBoneAngles( 9, -Rot )
	self:ManipulateBoneAngles( 7, -Rot )
	self:SetBodygroup( 1, PhysRot and 0 or 1 ) 
end

function ENT:AnimControlSurfaces( frametime )
	local FT = frametime * 10

	local Steer = self:GetSteer()

	local Pitch = -Steer.y * 30
	local Yaw = -Steer.z * 20
	local Roll = math.Clamp(-Steer.x * 60,-30,30)

	self.smPitch = self.smPitch and self.smPitch + (Pitch - self.smPitch) * FT or 0
	self.smYaw = self.smYaw and self.smYaw + (Yaw - self.smYaw) * FT or 0
	self.smRoll = self.smRoll and self.smRoll + (Roll - self.smRoll) * FT or 0

	self:ManipulateBoneAngles( 12, Angle( 0,self.smRoll,0) )
	self:ManipulateBoneAngles( 10, Angle( 0,self.smRoll,0) )

	self:ManipulateBoneAngles( 16, Angle( 0,-self.smPitch/2,0) )
	self:ManipulateBoneAngles( 18, Angle( 0,self.smPitch/2,0) )

	self:ManipulateBoneAngles( 30, Angle( 0,self.smYaw,0 ) )
	self:ManipulateBoneAngles( 28, Angle( 0,self.smYaw,0 ) )
end

function ENT:AnimLandingGear( frametime )
	self._smLandingGear = self._smLandingGear and self._smLandingGear + (90 *  self:GetLandingGear() - self._smLandingGear) * frametime * 8 or 0

	self:ManipulateBoneAngles( 20, Angle( 0, self._smLandingGear/1.5,0) )
	self:ManipulateBoneAngles( 22, Angle( 0, self._smLandingGear/1.5,0) )
	self:ManipulateBoneAngles( 24, Angle( 0, -self._smLandingGear/1.5,0) )
	self:ManipulateBoneAngles( 26, Angle( 0, -self._smLandingGear/1.5,0) )


	self:ManipulateBoneAngles( 32, Angle( 0,0, -self._smLandingGear) )
	self:ManipulateBoneAngles( 36, Angle( 0,0, self._smLandingGear/1.8) )
	self:ManipulateBoneAngles( 38, Angle( 0,0, self._smLandingGear/0.88) )
	self:ManipulateBoneAngles( 39, Angle( 0,0, self._smLandingGear/2) )

	self:ManipulateBonePosition( 37, Vector(0,0,self._smLandingGear/5) )

	self:ManipulateBoneAngles( 40, Angle( 0,0, self._smLandingGear/0.8) )
	self:ManipulateBonePosition( 42, Vector(0,0,self._smLandingGear/9) )

	self:ManipulateBoneAngles( 54, Angle( 0,self._smLandingGear, 0) )
	self:ManipulateBoneAngles( 56, Angle( 0,-self._smLandingGear, 0) )

	self:ManipulateBoneAngles( 46, Angle( 0,self._smLandingGear, 0) )
	self:ManipulateBoneAngles( 48, Angle( 0,-self._smLandingGear, 0) )
	self:ManipulateBoneAngles( 50, Angle( 0,self._smLandingGear, 0) )
	self:ManipulateBoneAngles( 52, Angle( 0,-self._smLandingGear, 0) )
end

