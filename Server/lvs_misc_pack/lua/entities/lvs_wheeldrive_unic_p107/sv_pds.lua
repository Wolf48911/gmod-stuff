
ENT.PDSDamageMultiplier = 0.075 -- default value 0.05

function ENT:CreatePDS()
	-- left headlight
	self:AddPDS( {
		pos = Vector(113.26,-19.15,51.46),
		ang = Angle(0,0,0),
		mins = Vector(-5,-5,-5),
		maxs = Vector(5,5,5),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [4] = 1 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_cup_break1.wav",
				gib = {
					mdl = "models/diggercars/amcp16/amcp16_light1.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,-90,0),
				},
			},
		}
	} )
	-- right headlight
	self:AddPDS( {
		pos = Vector(113.26,19.15,51.46),
		ang = Angle(0,0,0),
		mins = Vector(-5,-5,-5),
		maxs = Vector(5,5,5),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [5] = 1 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_cup_break1.wav",
				gib = {
					mdl = "models/diggercars/amcp16/amcp16_light2.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,-90,0),
				},
			},
		}
	} )

end