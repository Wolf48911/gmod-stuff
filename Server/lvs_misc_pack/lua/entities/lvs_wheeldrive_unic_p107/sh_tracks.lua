
if SERVER then
	function ENT:TracksCreate( PObj )
		local WheelModel = "models/diggercars/unic_p107/unic_p107_wheel.mdl"

		local L1 = self:AddWheel( { hide = true, pos = Vector(-5,31,25), mdl = WheelModel } )
		local L2 = self:AddWheel( { hide = true, pos = Vector(-40,31,25), mdl = WheelModel } )
		local L3 = self:AddWheel( { hide = true, pos = Vector(-72,31,25), mdl = WheelModel } )
		local LeftWheelChain = self:CreateWheelChain( {L1, L2, L3} )
		self:SetTrackDriveWheelLeft( L1 )

		local R1 = self:AddWheel( { hide = true, pos = Vector(-5,-31,25), mdl = WheelModel, mdl_ang = Angle(0,180,0) } )
		local R2 = self:AddWheel( { hide = true, pos = Vector(-40,-31,25), mdl = WheelModel, mdl_ang = Angle(0,180,0) } )
		local R3 = self:AddWheel( { hide = true, pos = Vector(-72,-31,25), mdl = WheelModel, mdl_ang = Angle(0,180,0) } )
		local RightWheelChain = self:CreateWheelChain( {R1, R2, R3} )
		self:SetTrackDriveWheelRight( R1 )

		self:DefineAxle( {
			Axle = {
				ForwardAngle = Angle(0,0,0),
				SteerType = LVS.WHEEL_STEER_NONE,
				TorqueFactor = 0.5,
				BrakeFactor = 1,
				UseHandbrake = true,
			},
			Wheels = { R1, L1, L2, R2, R3, L3 },
				Suspension = {
				Height = 10,
				MaxTravel = 7,
				ControlArmLength = 25,
				SpringConstant = 50000,
				SpringDamping = 5000,
				SpringRelativeDamping = 5000,
			},
		} )
	end
else
	ENT.TrackSystemEnable = true

	ENT.TrackScrollTexture = "models/diggercars/unic_p107/tracks"
	ENT.ScrollTextureData = {
		["$bumpmap"] = "models/diggercars/unic_p107/tracks_nm",
		["$phong"] = "1",
		["$phongboost"] = "0.04",
		["$phongexponent"] = "3",
		["$phongfresnelranges"] = "[1 1 1]",
		["$translate"] = "[0.0 0.0 0.0]",
		["$colorfix"] = "{255 255 255}",
		["Proxies"] = {
			["TextureTransform"] = {
				["translateVar"] = "$translate",
				["centerVar"]    = "$center",
				["resultVar"]    = "$basetexturetransform",
			},
			["Equals"] = {
				["srcVar1"] =  "$colorfix",
				["resultVar"] = "$color",
			}
		}
	}

	ENT.TrackLeftSubMaterialID = 2
	ENT.TrackLeftSubMaterialMul = Vector(0.023,0,0)

	ENT.TrackRightSubMaterialID = 3
	ENT.TrackRightSubMaterialMul = Vector(0.023,0,0)

	ENT.TrackPoseParameterLeft = "spin_wheels_left"
	ENT.TrackPoseParameterLeftMul = -1.5

	ENT.TrackPoseParameterRight = "spin_wheels_right"
	ENT.TrackPoseParameterRightMul = -1.5

	ENT.TrackSounds = "lvs/vehicles/halftrack/tracks_loop.wav"
	ENT.TrackHull = Vector(5,5,5)
	ENT.TrackData = {}

	for i = 1, 5 do
		for n = 0, 1 do
			local LR = n == 0 and "l" or "r"
			local LeftRight = n == 0 and "left" or "right"
			local data = {
				Attachment = {
					name = "vehicle_suspension_"..LR.."_"..i,
					toGroundDistance = 28,
					traceLength = 150,
				},
				PoseParameter = {
					name = "suspension_"..LeftRight.."_"..i,
					rangeMultiplier = -1.25,
					lerpSpeed = 25,
				}
			}
			table.insert( ENT.TrackData, data )
		end
	end
end