require "/stats/effects/fu_armoreffects/setbonuses_common.lua"
setName = "nekitier3set"

armorBonus = {
  {stat = "grit", amount = 0.3}
}

weaponBonus = {
  {stat = "critDamage", amount = 0.1},
  {stat = "powerMultiplier", effectiveMultiplier = 1.25}
}

function init()
  setSEBonusInit(setName)
  effectHandlerList.weaponBonus1Handle = effect.addStatModifierGroup({})

  checkWeapons()

  effectHandlerList.armorBonusHandle = effect.addStatModifierGroup(armorBonus)
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
