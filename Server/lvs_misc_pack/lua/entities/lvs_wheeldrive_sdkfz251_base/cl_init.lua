include("shared.lua")
include("sh_tracks.lua")

function ENT:OnSpawn()
	self:CreateBonePoseParameter( "dh1", 17, Angle(0,0,0), Angle(-50,0,0), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "dh2", 18, Angle(0,0,0), Angle(0,0,50), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "gh1", 20, Angle(0,0,0), Angle(-50,0,0), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "gh2", 21, Angle(0,0,0), Angle(0,0,-50), Vector(0,0,0), Vector(0,0,0) )

	self:CreateBonePoseParameter( "hud_km", 140, Angle(0,0,0), Angle(0,0,179), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "tacho_gauge", 136, Angle(0,0,0), Angle(0,0,179), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "oil_guage", 137, Angle(0,0,0), Angle(0,0,179), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "fuel_gauge", 139, Angle(0,0,0), Angle(0,0,179), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "temp_gauge", 138, Angle(0,0,0), Angle(0,0,179), Vector(0,0,0), Vector(0,0,0) )


	self:CreateBonePoseParameter( "sw", 131, Angle(0,0,-90), Angle(0,0,90), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "handbrake", 141, Angle(0,0,0), Angle(-20,0,0), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "gas", 133, Angle(0,0,0), Angle(-20,0,0), Vector(0,0,0), Vector(0,0,0) )
	self:CreateBonePoseParameter( "brake", 134, Angle(0,0,0), Angle(0,0,0), Vector(0,0,0), Vector(2,-1,0) )
	self:CreateBonePoseParameter( "clutch", 135, Angle(0,0,0), Angle(0,0,0), Vector(0,0,0), Vector(2,-1,0) )
end

function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear, temperature, fuel, oil, ammeter )
	self:SetBonePoseParameter( "!sw", steer )
	self:SetBonePoseParameter( "!tacho_gauge", engine_rpm / 6000 )
	self:SetBonePoseParameter( "!temp_gauge", temperature )
	self:SetBonePoseParameter( "!fuel_gauge", fuel )
	self:SetBonePoseParameter( "!oil_guage", oil )
	self:SetBonePoseParameter( "!hud_km", speed_kmh / 30 )
	self:SetBonePoseParameter( "!gas", throttle )
	self:SetBonePoseParameter( "!brake", brake )
	self:SetBonePoseParameter( "!handbrake", handbrake )
	self:SetBonePoseParameter( "!clutch", clutch )

	local GearIDtoPose = {
		[-1] = 0,
		[1] = 3,
		[2] = 5,
		[3] = 8,
	}

	self:SetPoseParameter( "gear",  self:QuickLerp( "gear", (GearIDtoPose[ gear ] or 1) ) )

end
