require "/stats/effects/fu_armoreffects/setbonuses_common.lua"
setName = "nekitier5sset"

armorBonus = {
  {stat = "grit", amount = 0.7}
}

weaponBonus1 = {
  {stat = "critDamage", amount = 0.33},
  {stat = "powerMultiplier", effectiveMultiplier = 1.4}
}

weaponBonus2 = {
  {stat = "critChance", amount = 3.33},
  {stat = "powerMultiplier", effectiveMultiplier = 1.33}
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
  local weapons1 = weaponCheck({"fist"})
  local weapons2 = weaponCheck({"sniperrifle"})
  if weapons1["either"] then
    effect.setStatModifierGroup(effectHandlerList.weaponBonus1Handle, weaponBonus1)
  elseif weapons2["either"] then
    effect.setStatModifierGroup(effectHandlerList.weaponBonus1Handle, weaponBonus2)
  else
    effect.setStatModifierGroup(effectHandlerList.weaponBonus1Handle, {})
  end
end
