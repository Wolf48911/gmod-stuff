include("shared.lua")
include("sh_tracks.lua")
include("sh_turret.lua")
include("cl_optics.lua")
include("cl_tankview.lua")

function ENT:OnSpawn()
	self:CreateBonePoseParameter( "suspension_left_1", 5, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_left_2", 7, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_left_3", 9, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_left_4", 11, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_left_5", 13, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_left_6", 15, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_left_7", 17, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_left_8", 19, nil, nil, Vector(0,5,0), Vector(0,-10,0) )

	self:CreateBonePoseParameter( "suspension_right_1", 21, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_right_2", 23, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_right_3", 25, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_right_4", 27, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_right_5", 29, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_right_6", 31, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_right_7", 33, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
	self:CreateBonePoseParameter( "suspension_right_8", 35, nil, nil, Vector(0,5,0), Vector(0,-10,0) )
end

function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear, temperature, fuel, oil, ammeter )
	self:SetPoseParameter( "vehicle_steer", steer )
	self:SetPoseParameter( "tacho_gauge", engine_rpm / 6000 )
	self:SetPoseParameter( "temp_gauge", temperature )
	self:SetPoseParameter( "fuel_gauge", oil )
	self:SetPoseParameter( "alt_gauge", speed_kmh / 90 )
	self:SetPoseParameter( "throttle_pedal", throttle )
	self:SetPoseParameter( "brake_pedal", brake )
	self:SetPoseParameter( "handbrake_pedal", handbrake )
	self:SetPoseParameter( "clutch_pedal", clutch )

	local GearIDtoPose = {
		[-1] = 0,
		[1] = 1,
		[2] = 4,
		[3] = 7,
		[4] = 10,
		[5] = 13,
		[6] = 16,
		[7] = 19,
	}

	self:SetPoseParameter( "gear",  self:QuickLerp( "gear", (GearIDtoPose[ gear ] or 1) ) )

end

local switch = Material("lvs/weapons/change_ammo.png")
local AP = Material("lvs/weapons/bullet_ap.png")
local HE = Material("lvs/weapons/tank_cannon.png")
function ENT:DrawWeaponIcon( PodID, ID, x, y, width, height, IsSelected, IconColor )
	local Icon = self:GetUseHighExplosive() and HE or AP

	surface.SetMaterial( Icon )
	surface.DrawTexturedRect( x, y, width, height )

	local ply = LocalPlayer()

	if not IsValid( ply ) or self:GetSelectedWeapon() ~= 2 then return end

	surface.SetMaterial( switch )
	surface.DrawTexturedRect( x + width + 5, y + 7, 24, 24 )

	local buttonCode = ply:lvsGetControls()[ "CAR_SWAP_AMMO" ]

	if not buttonCode then return end

	local KeyName = input.GetKeyName( buttonCode )

	if not KeyName then return end

	draw.DrawText( KeyName, "DermaDefault", x + width + 17, y + height * 0.5 + 7, Color(0,0,0,IconColor.a), TEXT_ALIGN_CENTER )
end


function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/tiger/engine_start.wav", 75, 100,  LVS.EngineVolume )
	else
		self:EmitSound( "lvs/vehicles/tiger/engine_stop.wav", 75, 100,  LVS.EngineVolume )
	end
end
