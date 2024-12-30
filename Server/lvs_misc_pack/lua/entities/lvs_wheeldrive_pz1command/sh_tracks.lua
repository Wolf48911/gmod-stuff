
if SERVER then

	ENT.PivotSteerEnable = true
	ENT.PivotSteerByBrake = true
	ENT.PivotSteerWheelRPM = 40

	function ENT:TracksCreate( PObj )
		local WheelModel = "models/props_vehicles/tire001b_truck.mdl"

		local L1 = self:AddWheel( { hide = true, pos = Vector(70,35.4,33), mdl = WheelModel } )
		local L2 = self:AddWheel( { hide = true, pos = Vector(35,35.4,33), mdl = WheelModel } )
		local L3 = self:AddWheel( { hide = true, pos = Vector(-0,35.4,33), mdl = WheelModel } )
		local L4 = self:AddWheel( { hide = true, pos = Vector(-35,35.4,33), mdl = WheelModel } )
		local L5 = self:AddWheel( { hide = true, pos = Vector(-70,35.4,33), mdl = WheelModel } )
		self:CreateWheelChain( {L1, L2, L3, L4, L5} )
		self:SetTrackDriveWheelLeft( L1 )

		local R1 = self:AddWheel( { hide = true, pos = Vector(70,-35.4,33), mdl = WheelModel, mdl_ang = Angle(0,180,0) } )
		local R2 = self:AddWheel( { hide = true, pos = Vector(35,-35.4,33), mdl = WheelModel, mdl_ang = Angle(0,180,0) } )
		local R3 = self:AddWheel( { hide = true, pos = Vector(-0,-35.4,33), mdl = WheelModel, mdl_ang = Angle(0,180,0) } )
		local R4 = self:AddWheel( { hide = true, pos = Vector(-35,-35.4,33), mdl = WheelModel, mdl_ang = Angle(0,180,0) } )
		local R5 = self:AddWheel( { hide = true, pos = Vector(-70,-35.4,33), mdl = WheelModel, mdl_ang = Angle(0,180,0) } )
		self:CreateWheelChain( {R1, R2, R3, R4, R5} )
		self:SetTrackDriveWheelRight( R1 )

		self:DefineAxle( {
			Axle = {
				ForwardAngle = Angle(0,0,0),
				SteerType = LVS.WHEEL_STEER_FRONT,
				SteerAngle = 30,
				TorqueFactor = 0,
				BrakeFactor = 1,
				UseHandbrake = true,
			},
			Wheels = { R1, L1, R2, L2 },
			Suspension = {
				Height = 15,
				MaxTravel = 15,
				ControlArmLength = 150,
				SpringConstant = 20000,
				SpringDamping = 1000,
				SpringRelativeDamping = 2000,
			},
		} )

		self:DefineAxle( {
			Axle = {
				ForwardAngle = Angle(0,0,0),
				SteerType = LVS.WHEEL_STEER_NONE,
				TorqueFactor = 1,
				BrakeFactor = 1,
				UseHandbrake = true,
			},
			Wheels = { R3, L3 },
			Suspension = {
				Height = 15,
				MaxTravel = 15,
				ControlArmLength = 150,
				SpringConstant = 20000,
				SpringDamping = 1000,
				SpringRelativeDamping = 2000,
			},
		} )

		self:DefineAxle( {
			Axle = {
				ForwardAngle = Angle(0,0,0),
				SteerType = LVS.WHEEL_STEER_REAR,
				SteerAngle = 30,
				TorqueFactor = 0,
				BrakeFactor = 1,
				UseHandbrake = true,
			},
			Wheels = { R5, L5, L4, R4 },
			Suspension = {
				Height = 15,
				MaxTravel = 15,
				ControlArmLength = 150,
				SpringConstant = 20000,
				SpringDamping = 1000,
				SpringRelativeDamping = 2000,
			},
		} )

	end
else
	ENT.TrackSystemEnable = true

	ENT.TrackScrollTexture = "models/diggercars/pz1/tracks"
	ENT.ScrollTextureData = {
		["$bumpmap"] = "models/diggercars/shared/skin_nm",
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

	ENT.TrackLeftSubMaterialID = 3
	ENT.TrackLeftSubMaterialMul = Vector(0.028,0,0)

	ENT.TrackRightSubMaterialID = 4
	ENT.TrackRightSubMaterialMul = Vector(0.028,0,0)

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
					toGroundDistance = 31,
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