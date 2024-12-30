AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "sh_turret.lua" )
AddCSLuaFile( "cl_tankview.lua" )
include("shared.lua")
include("sh_turret.lua")

function ENT:DoReloadSequence( delay )
	if self._ReloadActive then return end

	self._ReloadActive = true
		self:PlayAnimation("breech")

	timer.Simple(0.3, function()
		if not IsValid( self ) then return end
		self:EmitSound("lvs/vehicles/ba64/dt_reload.wav")
		self:PlayAnimation("reload")
		timer.Simple(0.1, function()
			if not IsValid( self ) then return end
			self._ReloadActive = nil

		end )
	end )
end

function ENT:DoAttackSequence()
	self:DoReloadSequence( 1 )
end
