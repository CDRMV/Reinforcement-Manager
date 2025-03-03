#****************************************************************************
#**
#**  File     :  /data/projectiles/TIFNapalmCarpetBomb02/TIFNapalmCarpetBomb02_script.lua
#**  Author(s):  Matt Vainio
#**
#**  Summary  :  Heavy Napalm Bomb, DEA0202
#**
#**  Copyright � 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TNapalmHvyCarpetBombProjectile = import('/lua/terranprojectiles.lua').TNapalmHvyCarpetBombProjectile
local EffectTemplate = import('/lua/EffectTemplates.lua')
local RandomFloat = import('/lua/utilities.lua').GetRandomFloat

TIFNapalmCarpetBomb04 = Class(TNapalmHvyCarpetBombProjectile) {

    FxImpactUnit = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxImpactProp = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxImpactLand = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxImpactWater = EffectTemplate.TNapalmHvyCarpetBombHitWater01,
    FxImpactUnderWater = {},

    OnImpact = function(self, TargetType, targetEntity)
		if TargetType != 'Water' then 
			local rotation = RandomFloat(0,2*math.pi)
			local size = RandomFloat(3.75,5.0)
	        
			CreateDecal(self:GetPosition(), rotation, 'scorch_001_albedo', '', 'Albedo', size, size, 150, 15, self:GetArmy())
		end	 
		TNapalmHvyCarpetBombProjectile.OnImpact( self, TargetType, targetEntity )
    end,	    
}
TypeClass = TIFNapalmCarpetBomb04
