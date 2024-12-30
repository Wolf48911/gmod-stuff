
ENT.PDSDamageMultiplier = 0.075 -- default value 0.05

function ENT:CreatePDS()
	-- left headlight
	self:AddPDS( {
		pos = Vector(30,11,54.7),
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
					mdl = "models/diggercars/t26/t26_light1.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,-90,0),
				},
			},
		}
	} )
	-- right headlight
	self:AddPDS( {
		pos = Vector(30,1.7,51.7),
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
					mdl = "models/diggercars/t26/t26_light2.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,-90,0),
				},
			},
		}
	} )
	-- left zip
	self:AddPDS( {
		pos = Vector(0,-40,47.6),
		ang = Angle(0,0,0),
		mins = Vector(-11,-11,-11),
		maxs = Vector(11,11,11),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [6] = 1 },
				sound = "physics/metal/metal_sheet_impact_hard7.wav",
				gib = {
					mdl = "models/diggercars/t26/t26_zip1.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,-90,0),
				},
			},
		}
	} )
	-- right zip
	self:AddPDS( {
		pos = Vector(0,40,47.6),
		ang = Angle(0,0,0),
		mins = Vector(-11,-11,-11),
		maxs = Vector(11,11,11),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [7] = 1 },
				sound = "physics/metal/metal_sheet_impact_hard7.wav",
				gib = {
					mdl = "models/diggercars/t26/t26_zip2.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,-90,0),
				},
			},
		}
	} )
	-- engine cover
	self:AddPDS( {
		pos = Vector(-80,20,42.8),
		ang = Angle(0,0,0),
		mins = Vector(-11,-11,-11),
		maxs = Vector(11,11,11),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [8] = 1 },
				sound = "physics/metal/metal_sheet_impact_hard7.wav",
				gib = {
					mdl = "models/diggercars/t26/t26_hatch.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,-90,0),
				},
			},
		}
	} )


end