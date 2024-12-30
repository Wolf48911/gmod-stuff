
if SERVER then
	ENT.PivotSteerEnable = true
	ENT.PivotSteerByBrake = true
	ENT.PivotSteerWheelRPM = 40

	function ENT:TracksCreate( PObj )
		local WheelModel = "models/Combine_Helicopter/helicopter_bomb01.mdl"

		local L2 = self:AddWheel( { hide = true, wheeltype = LVS.WHEELTYPE_LEFT, pos = Vector(50,30,31), mdl = WheelModel } )
		local L3 = self:AddWheel( { hide = true, wheeltype = LVS.WHEELTYPE_LEFT, pos = Vector(15,30,30), mdl = WheelModel } )
		local L4 = self:AddWheel( { hide = true, wheeltype = LVS.WHEELTYPE_LEFT, pos = Vector(-15,30,29), mdl = WheelModel } )
		local L5 = self:AddWheel( { hide = true, wheeltype = LVS.WHEELTYPE_LEFT, pos = Vector(-50,30,26), mdl = WheelModel } )
		local LeftWheelChain = self:CreateWheelChain( { L2, L3, L4, L5} )
		self:SetTrackDriveWheelLeft( L4 )

		local R2 = self:AddWheel( { hide = true, wheeltype = LVS.WHEELTYPE_RIGHT, pos = Vector(50,-30,31), mdl = WheelModel } )
		local R3 = self:AddWheel( { hide = true, wheeltype = LVS.WHEELTYPE_RIGHT, pos = Vector(15,-30,30), mdl = WheelModel } )
		local R4 = self:AddWheel( { hide = true, wheeltype = LVS.WHEELTYPE_RIGHT, pos = Vector(-15,-30,29), mdl = WheelModel } )
		local R5 = self:AddWheel( { hide = true, wheeltype = LVS.WHEELTYPE_RIGHT, pos = Vector(-50,-30,26), mdl = WheelModel } )
		local RightWheelChain = self:CreateWheelChain( { R2, R3, R4, R5} )
		self:SetTrackDriveWheelRight( R4 )

		local LeftTracksArmor = self:AddArmor( Vector(0,30,16), Angle(0,0,0), Vector(-67,-15,-15), Vector(67,15,15), 200, self.FrontArmor )
		LeftTracksArmor.OnDestroyed = LeftWheelChain.OnDestroyed
		LeftTracksArmor.OnRepaired = LeftWheelChain.OnRepaired
		LeftTracksArmor:SetLabel( "Tracks" )

		local RightTracksArmor = self:AddArmor( Vector(0,-30,16), Angle(0,0,0), Vector(-67,-15,-15), Vector(67,15,15), 200, self.FrontArmor )
		RightTracksArmor.OnDestroyed = RightWheelChain.OnDestroyed
		RightTracksArmor.OnRepaired = RightWheelChain.OnRepaired
		RightTracksArmor:SetLabel( "Tracks" )

		self:DefineAxle( {
			Axle = {
				ForwardAngle = Angle(0,0,0),
				SteerType = LVS.WHEEL_STEER_FRONT,
				SteerAngle = 30,
				TorqueFactor = 0,
				BrakeFactor = 1,
				UseHandbrake = true,
			},
			Wheels = { R2, L2 },
			Suspension = {
				Height = 20,
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
			Wheels = { R3, L3, R4, L4 },
			Suspension = {
				Height = 20,
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
			Wheels = { R5, L5 },
			Suspension = {
				Height = 20,
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

	ENT.TrackScrollTexture = "models/diggercars/universal_carrier/tracks"
	ENT.ScrollTextureData = {
		["$bumpmap"] = "models/diggercars/universal_carrier/tracks_nm",
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

	ENT.TrackLeftSubMaterialID = 11
	ENT.TrackLeftSubMaterialMul = Vector(0.011,0,0)

	ENT.TrackRightSubMaterialID = 12
	ENT.TrackRightSubMaterialMul = Vector(0.011,0,0)

	ENT.TrackPoseParameterLeft = "spin_wheels_left"
	ENT.TrackPoseParameterLeftMul =  -1.352

	ENT.TrackPoseParameterRight = "spin_wheels_right"
	ENT.TrackPoseParameterRightMul =  -1.352

	ENT.TrackSounds = "lvs/vehicles/t26/t26_track.wav"
	ENT.TrackHull = Vector(20,20,20)
	ENT.TrackData = {}
	for i = 1, 3 do
		for n = 0, 1 do
			local LR = n == 0 and "l" or "r"
			local LeftRight = n == 0 and "left" or "right"
			local data = {
				Attachment = {
					name = "vehicle_suspension_"..LR.."_"..i,
					toGroundDistance = 32,
					traceLength = 100,
				},
				PoseParameter = {
					name = "suspension_"..LeftRight.."_"..i,
					rangeMultiplier = -1,
					lerpSpeed = 25,
				}
			}
			table.insert( ENT.TrackData, data )
		end
	end
end