require "/stats/effects/fu_armoreffects/setbonuses_common.lua"
setName = "nekitier1set"

weaponBonus = {
  {stat = "powerMultiplier", effectiveMultiplier = 1.2}
}

function init()
  setSEBonusInit(setName)
  effectHandlerList.weaponBonus1Handle = effect.addStatModifierGroup({})

  checkWeapons()
end

function update(dt)
  if not checkSetWorn(self.setBonusCheck) then
    effect.expire()
  else
    checkWeapons()
  end
end

function checkWeapons()
  local weapons = weaponCheck({"fist"})
  if weapons["either"] then
    effect.setStatModifierGroup(effectHandlerList.weaponBonus1Handle, weaponBonus)
  else
    effect.setStatModifierGroup(effectHandlerList.weaponBonus1Handle, {})
  end
end
