require "/stats/effects/fu_armoreffects/setbonuses_common.lua"
setName = "nekitier4set"

armorBonus = {
  {stat = "grit", amount = 0.5}
}

weaponBonus1 = {
  {stat = "critDamage", amount = 0.2},
  {stat = "powerMultiplier", effectiveMultiplier = 1.3}
}

weaponBonus2 = {
  {stat = "critChance", amount = 2.5},
  {stat = "powerMultiplier", effectiveMultiplier = 1.15}
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
