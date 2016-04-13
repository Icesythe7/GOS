if myHero.charName ~= "Ryze" then
 return
end

require 'OpenPredict'
require 'DamageLib'

local rver = "0.01"

function AutoUpdate(data)
    if tonumber(data) > tonumber(rver) then
        PrintChat("New version found! " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/Icesythe7/GOS/master/IcyRyze.lua", SCRIPT_PATH .. "IcyRyze.lua", function() PrintChat("Update Complete, please 2x F6!") return end)
    else
        PrintChat("No updates found, IcyRyze Loaded!")
    end
end

GetWebResultAsync("https://raw.githubusercontent.com/Icesythe7/GOS/master/IcyRyze.version", AutoUpdate)

local Q = {range = 860, delay = 0.26 , speed = 1700, radius = 60}
local W = {range = 585}
local E = {range = 585}
local summonerSpells = {ignite = {}, flash = {}, heal = {}, barrier = {}, smite = {}}
local igniteFound = false
local Qdamage = {60, 85, 110, 135, 160}
local Qdamagemana = {2, 2.5, 3, 3.5, 4}
local Wdamage = {80, 100, 120, 140, 160}
local Edamage = {36, 52, 68, 84, 100}
local CalcMagicDamage = function(self, t, dmg) if not dmg then dmg = self.totalDamage end local enemy = type(t) == "table" and t.object or t local armor = GetMagicResist(enemy) local perc = GetMagicPenPercent(self) local flat = GetMagicPenFlat(self) armor = (armor*(perc))-flat return (dmg*(armor >= 0 and (100/(100+armor)) or (2-(100/(100-armor))))) end
local PassiveBuff = 0
local Charged = false
local masterycd = false

local Menu = MenuConfig("Ryze", "Icy Ryze")
Menu:Menu("Combo", "Combo")
Menu.Combo:Boolean("useQ", "Use Q (Over Load)", true)
Menu.Combo:Boolean("useW", "Use W (Rune Prison)", true)
Menu.Combo:Boolean("useE", "Use E (Spell Flux)", true)
Menu.Combo:Boolean("useR", "Use R (Desperate Power)", true)
Menu.Combo:Boolean("useRww", "Only R if Target Is Rooted", true)
Menu:Menu("Harass", "Harass")
Menu.Harass:Boolean("UseQ", "Use Q", true)
Menu.Harass:Boolean("UseQMl", "Use Q last hit minion", true)
Menu.Harass:Boolean("UseWM", "Use W last hit minion", true)
Menu.Harass:Boolean("UseEM", "Use E last hit minion", true)
Menu.Harass:Slider("mMin", "Minimum Mana For Spells",  10, 0, 100, 1)
Menu:Menu("Farm", "Lane Clear")
Menu.Farm:Boolean("UseQ", "Use Q To Lane Clear", true)
Menu.Farm:Boolean("UseW", "Use W To Lane Clear", true)
Menu.Farm:Boolean("UseE", "Use E To Lane Clear", true)
Menu.Farm:Boolean("UseR", "Use R In Lane Clear", false)
Menu.Farm:Slider("useEPL", "Min %Mana For Lane Clear", 50,0,100,1)
Menu:Menu("KillSteal", "Kill Steal")
Menu.KillSteal:Boolean("KS", "Kill Steal Enable", true)
Menu.KillSteal:Boolean("UseQ", "Use Q for KS", true)
Menu.KillSteal:Boolean("UseW", "Use W for KS", true)
Menu.KillSteal:Boolean("UseE", "Use E for KS", true)
Menu:Menu("Drawing", "Drawing")
Menu.Drawing:Boolean("Qrange", "Draw Q range", true)
Menu.Drawing:Boolean("WErange", "Draw W/E range", true)
Menu.Drawing:Boolean("DrawStack", "Draw Stack", true)
Menu:Menu("misc", "Misc")
Menu.misc:Slider("pred", "Q Hit Chance", 3,0,10,1)
Menu.misc:Info("info", "         0 = Low - 10 = High")
Menu.misc:Boolean("mast", "ThunderLord Mastery?", false)
Menu.misc:Menu("gap", "Anti-Gapclosers")
Menu.misc:ColorPick("qcolor", "Q Color", {255,255,0,0})
Menu.misc:ColorPick("wecolor", "W/E Color", {255,255,255,0})
Menu.misc:ColorPick("stack", "Stack Color", {255,255,0,0})
Menu:Info("Version", "Version                               "..rver)

OnLoad (function()
  if not igniteFound then
      if GetCastName(myHero, SUMMONER_1):lower():find("summonerdot") then
          igniteFound = true
          summonerSpells.ignite = SUMMONER_1
          Menu.KillSteal:Boolean("ignite", "Auto Ignite", true)
      elseif GetCastName(myHero, SUMMONER_2):lower():find("summonerdot") then
          igniteFound = true
          summonerSpells.ignite = SUMMONER_2
          Menu.KillSteal:Boolean("ignite", "Auto Ignite", true)
      end
  end
end)

OnUpdateBuff (function(unit, buff)
  if not unit or not buff or not buff.Count then 
    return 
  end
  if unit.isMe and buff.Name:lower() == "ryzepassivestack" then
    PassiveBuff = buff.Count
  end
  if unit.isMe and buff.Name:lower() == "ryzepassivecharged" then
    Charged = true
  end
  if unit.isMe and buff.Name:lower() == "masterylordsdecreecooldown" then
    masterycd = true
  end
end)

OnRemoveBuff (function(unit, buff)
  if unit and unit.isMe and buff.Name:lower():lower() == "ryzepassivestack" then
    PassiveBuff = 0
  end
  if unit.isMe and buff.Name:lower() == "ryzepassivecharged" then
    Charged = false
  end
  if unit.isMe and buff.Name:lower() == "masterylordsdecreecooldown" then
    masterycd = false
  end
end)

OnTick (function()
  if IsDead(myHero) then 
    return 
  end
  if IOW_Loaded then
    if IOW:Mode() == "Combo" then
      local qTarget = GetBestTarget(Q.range)
      if qTarget and (GetDistance(qTarget) > 440 or Ready(_E) or Ready(_Q)) and GetCurrentHP(qTarget) > 3*getdmg('AD',qTarget,myHero) then
        IOW.attacksEnabled = false
      else
        IOW.attacksEnabled = true
      end
      Combo()
    elseif IOW:Mode() == "Harass" and ((GetCurrentMana(myHero) / GetMaxMana(myHero) * 100) >= Menu.Harass.mMin:Value()) then
      IOW.attacksEnabled = true
      Mixed()
    elseif IOW:Mode() == "LaneClear" then
      IOW.attacksEnabled = true
      LaneClear()
    end
  elseif DAC_Loaded then
    if DAC:Mode() == "Combo" then
      local qTarget = GetBestTarget(Q.range)
      if qTarget and (GetDistance(qTarget) > 440 or Ready(_E) or Ready(_Q)) and GetCurrentHP(qTarget) > 3*getdmg('AD',qTarget,myHero) then
        DAC.attacksEnabled = false
      else
        DAC.attacksEnabled = true
      end
      Combo()
    elseif DAC:Mode() == "Harass" and ((GetCurrentMana(myHero) / GetMaxMana(myHero) * 100) >= Menu.Harass.mMin:Value()) then
      DAC.attacksEnabled = true
      Mixed()
    elseif DAC:Mode() == "LaneClear" then
      DAC.attacksEnabled = true
      LaneClear()
    end
  elseif PW_Loaded then
    if PW:Mode() == "Combo" then
      local qTarget = GetBestTarget(Q.range)
      if qTarget and (GetDistance(qTarget) > 440 or Ready(_E) or Ready(_Q)) and GetCurrentHP(qTarget) > 3*getdmg('AD',qTarget,myHero) then
        PW.attacksEnabled = false
      else
        PW.attacksEnabled = true
      end
      Combo()
    elseif PW:Mode() == "Harass" and ((GetCurrentMana(myHero) / GetMaxMana(myHero) * 100) >= Menu.Harass.mMin:Value()) then
      PW.attacksEnabled = true
      Mixed()
    elseif PW:Mode() == "LaneClear" then
      PW.attacksEnabled = true
      LaneClear()
    end
  elseif GoSWalkLoaded then
    if GoSWalk.CurrentMode == 0 then
      local qTarget = GetBestTarget(Q.range)
      if qTarget and (GetDistance(qTarget) > 440 or Ready(_E) or Ready(_Q)) and GetCurrentHP(qTarget) > 3*getdmg('AD',qTarget,myHero) then
        -- disable attack wtf
      else
        --GoSWalk.EnableAttack() = true
      end
      Combo()
    elseif GoSWalk.CurrentMode == 1 and ((GetCurrentMana(myHero) / GetMaxMana(myHero) * 100) >= Menu.Harass.mMin:Value()) then
      --GoSWalk.EnableAttack() = true
      Mixed()
    elseif GoSWalk.CurrentMode == 2 then
      --GoSWalk.EnableAttack() = true
      LaneClear()
    end
  end
  KillSteal()
end)

function CastQ(unit)
  if unit then
    local pI = GetPrediction(unit, Q)
    if pI and pI.hitChance >= (Menu.misc.pred:Value() * 0.1) and not pI:mCollision(1) then
      CastSkillShot(_Q, pI.castPos)
    end
  end
end

function CastQn(unit)
  if unit then
    local pI = GetPrediction(unit, Q)
    CastSkillShot(_Q, pI.castPos)
  end
end

function KillSteal()
  if not Menu.KillSteal.KS:Value() then 
    return 
  end
  local ks = GetBestTarget(Q.range)
  if ks ~= nil and ValidTarget(ks) then
    if Menu.KillSteal.UseQ:Value() and Ready(_Q) and GetDamage(_Q,ks) > GetCurrentHP(ks) and GetDistance(ks) < Q.range then
      CastQ(ks)
    elseif  Menu.KillSteal.UseW:Value() and Ready(_W) and GetDamage(_W,ks) > GetCurrentHP(ks) and GetDistance(ks) <= W.range then
      CastTargetSpell(ks, _W)
    elseif Menu.KillSteal.UseE:Value() and Ready(_E) and GetDamage(_E,ks) > GetCurrentHP(ks) and GetDistance(ks) <= E.range then
      CastTargetSpell(ks, _E)
    end
  end
end

function Combo()
  local qSpell = Menu.Combo.useQ:Value()
  local eSpell = Menu.Combo.useE:Value()
  local wSpell = Menu.Combo.useW:Value()
  local rSpell = Menu.Combo.useR:Value()
  local rwwSpell = Menu.Combo.useRww:Value()
  local target = GetBestTarget(Q.range)

  if not ValidTarget(target,Q.range) then 
    return 
  end

  if igniteFound and IgniteReady and ValidTarget(target,590) and GetCurrentHP(target) < GetComboDamage({_W,summonerSpells.ignite},target) then
    CastTargetSpell(target, summonerSpells.ignite)
  end
  if GetDistance(target) <= Q.range then
    if GetPassiveBuff() <= 2 and not Ready(_R) then
      if qSpell and Ready(_Q) then
        CastQn(target)
      end
      if ValidTarget(target,W.range) and wSpell and Ready(_W) then
        CastTargetSpell(target, _W)
      end
      if GetDistance(target) <= E.range and eSpell and Ready(_E) then
        CastTargetSpell(target, _E)
      end
    end
    if GetPassiveBuff() <= 2 and Ready(_R) then 
      if qSpell and Ready(_Q) then
        CastQn(target)
      end
      if GetDistance(target) <= E.range and eSpell and Ready(_E) then
        CastTargetSpell(target, _E)
      end
    end
    if GetPassiveBuff() == 3 and not Ready(_R) then
      if ValidTarget(target,W.range) and wSpell and Ready(_W) then
        CastTargetSpell(target, _W)
      end
      if qSpell and Ready(_Q) then
        CastQn(target)
      end
      if GetDistance(target) <= E.range and eSpell and Ready(_E) then
        CastTargetSpell(target, _E)
      end
    end
    if GetPassiveBuff() == 3 and Ready(_R) then
      if Ready(_R) and rSpell then
        if GetDistance(target) <= Q.range and GetCurrentHP(target) > GetDamage(_Q,target) + GetDamage(_E,target) then
          if not rwwSpell or (rwwSpell and GotBuff(target, "RyzeW"))  then
            CastSpell(_R)
          end
        end
      end
    end
    if GetPassiveBuff() == 4 and not Ready(_R) then
      if qSpell and Ready(_Q) then
        CastQn(target)
      end
      if ValidTarget(target,W.range) and wSpell and Ready(_W) then
        CastTargetSpell(target, _W)
      end
      if GetDistance(target) <= E.range and eSpell and Ready(_E) then
        CastTargetSpell(target, _E)
      end
    end
    if GetPassiveBuff() == 4 and Ready(_R) then
      if Ready(_R) and rSpell then
        if GetDistance(target) <= Q.range and GetCurrentHP(target) > GetDamage(_Q,target) + GetDamage(_E,target) then
          if not rwwSpell or (rwwSpell and GotBuff(target, "RyzeW"))  then
            CastSpell(_R)
          end
        end
      end
    end
    if Charged == true and not Ready(_R) then
      if qSpell and Ready(_Q) then
        CastQn(target)
      end

      if ValidTarget(target,W.range) and wSpell and Ready(_W) then
        CastTargetSpell(target, _W)
      end

      if qSpell and Ready(_Q) then
        CastQn(target)
      end

      if GetDistance(target) <= E.range and eSpell and Ready(_E) then
        CastTargetSpell(target, _E)
      end
    end
    if Charged == true and Ready(_R) then
      if Ready(_R) and rSpell then
        if GetDistance(target) <= Q.range and GetCurrentHP(target) > GetDamage(_Q,target) + GetDamage(_E,target) then
          if not rwwSpell or (rwwSpell and GotBuff(target, "RyzeW"))  then
            CastSpell(_R)
          end
        end
      end
    end
  end
end

function Mixed()
  local qSpell = Menu.Harass.UseQ:Value()
  local qlSpell  = Menu.Harass.UseQMl:Value()
  local minMana = Menu.Farm.useEPL:Value()/100
  local target = GetBestTarget(900)
  if GetCurrentMana(myHero)/GetMaxMana(myHero) < minMana then 
    return 
  end
  if qSpell and ValidTarget(target,Q.range) and Ready(_Q) and qSpell then
    CastQ(target)
  end
  if qlSpell and Ready(_Q) then
    for i, minion in pairs(minionManager.objects) do
      if ValidTarget(minion,Q.range) and GetDamage(_Q,minion) > GetCurrentHP(minion) then
        CastQ(minion)
      end
    end
  end
  if wSpell and Ready(_W) then
    for i, minion in pairs(minionManager.objects) do
      if ValidTarget(minion,W.range) and GetDamage(_W,minion) > GetCurrentHP(minion) then
        CastTargetSpell(minion, _W)
      end
    end
  end
  if eSpell and Ready(_E) then
    for i, minion in pairs(minionManager.objects) do
      if ValidTarget(minion,E.range) and GetDamage(_E,minion) > GetCurrentHP(minion) then
        CastTargetSpell(minion, _E)
      end
    end
  end
end

function LaneClear()
  local UseQ = Menu.Farm.UseQ:Value()
  local UseW = Menu.Farm.UseW:Value()
  local UseE = Menu.Farm.UseE:Value()
  local UseR = Menu.Farm.UseR:Value()
  local minMana = Menu.Farm.useEPL:Value()/100
  if GetCurrentMana(myHero)/GetMaxMana(myHero) < minMana then return end
  for i, minion in pairs(minionManager.objects) do
    if UseQ and Ready(_Q) and ValidTarget(minion,Q.range) then
      CastQ(minion)
    end
    if UseW and Ready(_W) and ValidTarget(minion,W.range) then
      CastTargetSpell(minion, _W)
    end
    if UseQ and Ready(_Q) and ValidTarget(minion,Q.range) then
      CastQ(minion)
    end
    if UseE and Ready(_E) and ValidTarget(minion,E.range) then
      CastTargetSpell(minion, _E)
    end
    if UseR and Ready(_R) and ValidTarget(minion,Q.range) then
      CastSpell(_R)
    end
  end
end

function GetComboDamage(Combo, Unit)
  local totaldamage = 0
  for i, spell in pairs(Combo) do
    totaldamage = totaldamage + GetDamage(spell, Unit)
  end
  return totaldamage
end

function GetDamage(Spell, Unit)
  local truedamage = 0
  if Spell == _Q and GetCastLevel(GetMyHero(), _Q) ~= 0 then
    truedamage = CalcMagicDamage(GetMyHero(), Unit, Qdamage[GetCastLevel(GetMyHero(), _Q)] + GetBonusAP(GetMyHero()) * 0.55 + Qdamagemana[GetCastLevel(GetMyHero(), _Q)]* GetMaxMana(GetMyHero())/100)
  elseif Spell == _W and GetCastLevel(GetMyHero(), _W) ~= 0  then
    truedamage = CalcMagicDamage(GetMyHero(), Unit, Wdamage[GetCastLevel(GetMyHero(), _W)] + GetBonusAP(GetMyHero()) * 0.4 + GetMaxMana(GetMyHero())*2.5/100)
  elseif Spell == _E and GetCastLevel(GetMyHero(), _E) ~= 0 then
    truedamage = CalcMagicDamage(GetMyHero(), Unit, Edamage[GetCastLevel(GetMyHero(), _E)] + GetBonusAP(GetMyHero()) * 0.3 + GetMaxMana(GetMyHero())*2/100)
  elseif Spell == summonerSpells.ignite and igniteFound and (CanUseSpell(GetMyHero(), summonerSpells.ignite) == READY) then
    truedamage = 50 + 20 * GetLevel(GetMyHero())
  end
  return truedamage
end

function GetBestTarget(Range, Ignore)
  local LessToKill = 100
  local LessToKilli = 0
  local target = nil
  for i, enemy in ipairs(GetEnemyHeroes()) do
    if ValidTarget(enemy, Range) then
      DamageToHero = CalcMagicDamage(GetMyHero(), enemy, 200)
      ToKill = GetCurrentHP(enemy) / DamageToHero
      if ((ToKill < LessToKill) or (LessToKilli == 0)) and (Ignore == nil or (GetNetworkID(Ignore) ~= GetNetworkID(enemy))) then
        LessToKill = ToKill
        LessToKilli = i
        target = enemy
      end
    end
  end
  return target
end

function GetPassiveBuff()
  return PassiveBuff
end

function DrawLines2(t,w,c)
  for i=1, #t-1 do
    DrawLine(t[i].x, t[i].y, t[i+1].x, t[i+1].y, w, c)
  end
end

function DrawCircleNextLvl(x, y, z, radius, width, color, chordlength)
  local quality = chordlength
  radius = radius or 300
  quality = 2 * math.pi / quality
  radius = radius * .92
  local points = { }
  for theta = 0, 2 * math.pi + quality, quality do
    local c = WorldToScreen(0,Vector(x + radius * math.cos(theta), y, z - radius * math.sin(theta)))
    points[#points + 1] = Vector(c.x, c.y)
  end
  DrawLines2(points, width or 1, color or 4294967295)
end

OnDraw (function()
  local shield = (((5 * GetLevel(myHero)) + 20) + (math.ceil(GetMaxMana(myHero) * 0.08)))
  if IsDead(myHero) then 
    return 
  end
  local pos = GetOrigin(myHero)
  if Menu.Drawing.Qrange:Value() then
    DrawCircleNextLvl(pos.x, pos.y, pos.z, Q.range, 1, Menu.misc.qcolor:Value(), 75)
  end
  if Menu.Drawing.WErange:Value() then
    DrawCircleNextLvl(pos.x, pos.y, pos.z, W.range, 1, Menu.misc.wecolor:Value(), 75)
  end
  if Menu.Drawing.DrawStack:Value() and not Charged then
    local barPos = WorldToScreen(0, Vector(pos.x, pos.y, pos.z))
    DrawText("Current Stacks "..tostring(PassiveBuff),25,barPos.x-75,barPos.y, Menu.misc.stack:Value())
  end
  if Menu.Drawing.DrawStack:Value() and Charged then
    local barPos = WorldToScreen(0, Vector(pos.x, pos.y, pos.z))
    DrawText("Shield Active(" ..shield.. ")!",25,barPos.x-75,barPos.y, Menu.misc.stack:Value())
  end
  if Menu.misc.mast:Value() and masterycd then
    local barPos = WorldToScreen(0, Vector(pos.x, pos.y, pos.z))
    DrawText("ThunderLord Cooldown.",20,barPos.x-85,barPos.y+50, Menu.misc.stack:Value())
  end
  if Menu.misc.mast:Value() and not masterycd then
    local barPos = WorldToScreen(0, Vector(pos.x, pos.y, pos.z))
    DrawText("ThunderLord Available!",20,barPos.x-85,barPos.y+50, Menu.misc.stack:Value())
  end
end)

AddGapcloseEvent(_W, 600, true, Menu.misc.gap)