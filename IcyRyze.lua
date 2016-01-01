if GetObjectName(GetMyHero()) ~= "Ryze" then return end
function file_exists(path)
  assert(type(path) == "string", "file_exists: wrong argument types (<string> expected for path)")
  local file = io.open(path, "r")
  if file then file:close() return true else return false end
end

if file_exists(COMMON_PATH.. "OpenPredict.lua") then
require 'Inspired'
require 'OpenPredict'
require 'DeftLib'
require 'DamageLib'

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ToUpdate = {}
ToUpdate.Version = 0.01
ToUpdate.UseHttps = true
ToUpdate.Host = "raw.githubusercontent.com"
ToUpdate.VersionPath = "/Icesythe7/GOS/master/IcyRyze.version"
ToUpdate.ScriptPath =  "/Icesythe7/GOS/master/IcyRyze.lua"
ToUpdate.SavePath = SCRIPT_PATH.."/IcyRyze.lua"
ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) PrintChat("<font color='#eb4d33'>[Icy Ryze]: </font><font color='#00FFFF'> Updated to ("..NewVersion..") Please Reload with 2x F6.</font>") end
ToUpdate.CallbackNoUpdate = function(OldVersion) PrintChat("<font color='#eb4d33'>[Icy Ryze]: </font><font color='#00FFFF'> No Updates Found! Version " ..ToUpdate.Version.. " Loaded! Good luck " ..GetObjectBaseName(GetMyHero()).. ".</font>") end
ToUpdate.CallbackNewVersion = function(NewVersion) PrintChat("<font color='#eb4d33'>[Icy Ryze]: </font><font color='#00FFFF'> New Version found ("..NewVersion.."). Please wait until its downloaded</font>") end
ToUpdate.CallbackError = function(NewVersion) PrintChat("<font color='#eb4d33'>[Icy Ryze]: </font><font color='#00FFFF'> Error while Downloading. Please try again.</font>") end
local Q = {range = 885, delay = 0.26 , speed = 1700, radius = 60, ready = false}
local W = {range = 585, ready = false}
local E = {range = 585, ready = false}
local R = {ready = false}
local Ignite = {slot = nil, ready = false, range = 590}
_IGNITE = nil
local Qdamage = {60, 85, 110, 135, 160}
local Qdamagemana = {2, 2.5, 3, 3.5, 4}
local Wdamage = {80, 100, 120, 140, 160}
local Edamage = {36, 52, 68, 84, 100}
local MainCombo = {_Q, _W, _E, _R,_IGNITE}
local PassiveBuff = 0
local Charged = false
local masterycd = false

Menu = MenuConfig("Icy Ryze", "Ryze")

--[[Combo]]
Menu:Menu("Combo", "Combo")
Menu.Combo:Boolean("useQ", "Use Q (Over Load)", true)
Menu.Combo:Boolean("useW", "Use W (Rune Prison)", true)
Menu.Combo:Boolean("useE", "Use E (Spell Flux)", true)
Menu.Combo:Boolean("useR", "Use R (Desperate Power)", true)
Menu.Combo:Boolean("useRww", "Only R if Target Is Rooted", true)

--[[Harassing]]
Menu:Menu("Harass", "Harass")
Menu.Harass:Boolean("UseQ", "Use Q", true)
Menu.Harass:Boolean("UseQMl", "Use Q last hit minion", true)
Menu.Harass:Boolean("UseWM", "Use W last hit minion", true)
Menu.Harass:Boolean("UseEM", "Use E last hit minion", true)
Menu.Harass:Slider("mMin", "Minimum Mana For Spells",  10, 0, 100, 1)

--[[Farming]]
Menu:Menu("Farm", "Lane Clear")
Menu.Farm:Boolean("UseQ", "Use Q To Lane Clear", true)
Menu.Farm:Boolean("UseW", "Use W To Lane Clear", true)
Menu.Farm:Boolean("UseE", "Use E To Lane Clear", true)
Menu.Farm:Boolean("UseR", "Use R In Lane Clear", false)
Menu.Farm:Slider("useEPL", "Min %Mana For Lane Clear", 50,0,100,1)

--[[Kill Steal]]
Menu:Menu("KillSteal", "Kill Steal")
Menu.KillSteal:Boolean("KS", "Kill Steal Enable", true)
Menu.KillSteal:Boolean("UseQ", "Use Q for KS", true)
Menu.KillSteal:Boolean("UseW", "Use W for KS", true)
Menu.KillSteal:Boolean("UseE", "Use E for KS", true)

--[[Drawing]]
Menu:Menu("Drawing", "Drawing")
Menu.Drawing:Boolean("Qrange", "Draw Q range", true)
Menu.Drawing:Boolean("WErange", "Draw W/E range", true)
Menu.Drawing:Boolean("DrawStack", "Draw Stack", true)

--[[ColorPick]]
Menu:Menu("misc", "Misc")
Menu.misc:Slider("pred", "Q Hit Chance", 3,0,10,1)
Menu.misc:Info("info", "         0 = Low - 10 = High")
Menu.misc:Boolean("mast", "ThunderLord Mastery?", false)
Menu.misc:ColorPick("qcolor", "Q Color", {255,255,0,0})
Menu.misc:ColorPick("wecolor", "W/E Color", {255,255,255,0})
Menu.misc:ColorPick("stack", "Stack Color", {255,255,0,0})
Menu:Info("Version", "Version                               "..ToUpdate.Version)
if GetCastName(myHero, SUMMONER_1) =="summonerdot" then
  _IGNITE = SUMMONER_1
elseif GetCastName(myHero, SUMMONER_2) =="summonerdot" then
  _IGNITE = SUMMONER_2
else
  _IGNITE = nil
end
MenuLoaded = true



function GetComboDamage(Combo, Unit)
  local totaldamage = 0
  for i, spell in ipairs(Combo) do
    totaldamage = totaldamage + GetDamage(spell, Unit)
  end
  return totaldamage
end

CalcMagicDamage = function(self, t, dmg) if not dmg then dmg = self.totalDamage end local enemy = type(t) == "table" and t.object or t local armor = GetMagicResist(enemy) local perc = GetMagicPenPercent(self) local flat = GetMagicPenFlat(self) armor = (armor*(perc))-flat return (dmg*(armor >= 0 and (100/(100+armor)) or (2-(100/(100-armor))))) end

function GetDamage(Spell, Unit)
  local truedamage = 0
  if Spell == _Q and GetCastLevel(GetMyHero(), _Q) ~= 0 then
    truedamage = CalcMagicDamage(GetMyHero(), Unit, Qdamage[GetCastLevel(GetMyHero(), _Q)] + GetBonusAP(GetMyHero()) * 0.55 + Qdamagemana[GetCastLevel(GetMyHero(), _Q)]* GetMaxMana(GetMyHero())/100)
  elseif Spell == _W and GetCastLevel(GetMyHero(), _W) ~= 0  then
    truedamage = CalcMagicDamage(GetMyHero(), Unit, Wdamage[GetCastLevel(GetMyHero(), _W)] + GetBonusAP(GetMyHero()) * 0.4 + GetMaxMana(GetMyHero())*2.5/100)
  elseif Spell == _E and GetCastLevel(GetMyHero(), _E) ~= 0 then
    truedamage = CalcMagicDamage(GetMyHero(), Unit, Edamage[GetCastLevel(GetMyHero(), _E)] + GetBonusAP(GetMyHero()) * 0.3 + GetMaxMana(GetMyHero())*2/100)
  elseif Spell == _IGNITE and _IGNITE and (CanUseSpell(GetMyHero(), _IGNITE) == READY) then
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

OnUpdateBuff (function(unit,buff)
if not unit or not buff or not buff.Count then return end
if unit == GetMyHero() and buff.Name == "ryzepassivestack" then
  PassiveBuff = buff.Count
end
if unit == GetMyHero() and buff.Name == "ryzepassivecharged" then
  Charged = true
end
if unit == GetMyHero() and buff.Name == "masterylordsdecreecooldown" then
  masterycd = true
end
end)

OnRemoveBuff (function(unit,buff)
if unit and unit == GetMyHero() and buff.Name == "ryzepassivestack" then
  PassiveBuff = 0
end
if unit == GetMyHero() and buff.Name == "ryzepassivecharged" then
  Charged = false
end
if unit == GetMyHero() and buff.Name == "masterylordsdecreecooldown" then
  masterycd = false
end
end)

function CheckSpells()
  Q.ready = CanUseSpell(GetMyHero(), _Q) == READY and true or false
  W.ready = CanUseSpell(GetMyHero(), _W) == READY and true or false
  E.ready = CanUseSpell(GetMyHero(), _E) == READY and true or false
  R.ready = CanUseSpell(GetMyHero(), _R) == READY and true or false
  IgniteReady = _IGNITE ~= nil and CanUseSpell(GetMyHero(), _IGNITE) == READY and true or false
end

OnTick (function()
if IsDead(GetMyHero()) or not MenuLoaded then return end
CheckSpells()
if IOW:Mode() == "Combo" then
  local qTarget = GetBestTarget(Q.range)
  if qTarget and (GetDistance(qTarget) > 440 or E.ready or Q.ready) and GetCurrentHP(qTarget) > 3*getdmg('AD',qTarget,GetMyHero()) then
    IOW.attacksEnabled = false
  else
    IOW.attacksEnabled = true
  end
  Combo()
elseif IOW:Mode() == "Harass" and ((GetCurrentMana(GetMyHero()) / GetMaxMana(GetMyHero()) * 100) >= Menu.Harass.mMin:Value()) then
  Mixed()
end
if IOW:Mode() == "LaneClear" then
  LaneClear()
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
    if pI and pI.hitChance >= 0.25 and not pI:mCollision(1) then
      CastSkillShot(_Q, pI.castPos)
    end
  end
end

function KillSteal()
  if not Menu.KillSteal.KS:Value() then return end
  local ks = GetBestTarget(Q.range)
  if ks ~= nil and ValidTarget(ks) and not IsImmune(ks, GetMyHero()) then
    if Menu.KillSteal.UseQ:Value() and Q.ready and GetDamage(_Q,ks) > GetCurrentHP(ks) and GetDistance(ks) < Q.range then
      CastQ(ks)
    elseif  Menu.KillSteal.UseW:Value() and W.ready and GetDamage(_W,ks) > GetCurrentHP(ks) and GetDistance(ks) <= W.range then
      CastTargetSpell(ks, _W)
    elseif Menu.KillSteal.UseE:Value() and E.ready and GetDamage(_E,ks) > GetCurrentHP(ks) and GetDistance(ks) <= E.range then
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

  local target = GetBestTarget(W.range)
  if not ValidTarget(target,Q.range) then return end
  if _IGNITE ~= nil and IgniteReady and ValidTarget(target,590) and GetCurrentHP(target) < GetComboDamage({_W,_IGNITE},target) then
    CastTargetSpell(target, _IGNITE)
  end
  if GetDistance(target) <= Q.range then
    if GetPassiveBuff() <= 2 then
      if qSpell and Q.ready then
        CastQ(target)
      end
      if ValidTarget(target,W.range) and wSpell and W.ready then
        CastTargetSpell(target, _W)
      end
      if GetDistance(target) <= E.range and eSpell and E.ready then
        CastTargetSpell(target, _E)
      end
      if R.ready and rSpell then
        if GetDistance(target) <= W.range and GetCurrentHP(target) > GetDamage(_Q,target) + GetDamage(_E,target) then
          if not rwwSpell or (rwwSpell and GotBuff(target, "RyzeW"))  then
            CastSpell(_R)
          end
        end
      end
    elseif GetPassiveBuff() == 3 then
      if qSpell and Q.ready then
        CastQn(target)
      end

      if ValidTarget(target,E.range) and eSpell and E.ready then
        CastTargetSpell(target, _E)
      end
      if ValidTarget(target,W.range) and wSpell and W.ready then
        CastTargetSpell(target, _W)
      end
      if R.ready and rSpell then
        if GetDistance(target) <= W.range and GetCurrentHP(target) > GetDamage(_Q,target) + GetDamage(_E,target) then
          if not rwwSpell or (rwwSpell and GotBuff(target, "RyzeW"))  then
            CastSpell(_R)
          end
        end
      end
    elseif GetPassiveBuff() == 4 then
      if ValidTarget(target,W.range) and wSpell and W.ready then
        CastTargetSpell(target, _W)
      end
      if qSpell and Q.ready then
        CastQn(target)
      end

      if ValidTarget(target,E.range) and eSpell and E.ready then
        CastTargetSpell(target, _E)
      end

      if R.ready and rSpell then
        if GetDistance(target) <= W.range and GetCurrentHP(target) > GetDamage(_Q,target) + GetDamage(_E,target) then
          if not rwwSpell or (rwwSpell and GotBuff(target, "RyzeW"))  then
            CastSpell(_R)
          end
        end
      end
    end
  else
    if ValidTarget(target,W.range) and wSpell and W.ready then
      CastTargetSpell(target, _W)
    end
    if qSpell and Q.ready and ValidTarget(target,Qn.range)then
      CastQn(target)
    end

    if ValidTarget(target,E.range) and eSpell and E.ready then
      CastTargetSpell(target, _E)
    end
  end


  if ValidTarget(target,Q.range) and R.ready and rSpell and GetPassiveBuff() == 4 and not Q.ready and not E.ready and not W.ready then
    CastSpell(_R)
  end
end


function Mixed()
  local qSpell = Menu.Harass.UseQ:Value()
  local qlSpell  = Menu.Harass.UseQMl:Value()
  local minMana = Menu.Farm.useEPL:Value()/100
  local target = GetBestTarget(900)
  if GetCurrentMana(GetMyHero())/GetMaxMana(GetMyHero()) < minMana then return end
  if qSpell and ValidTarget(target,Q.range) and Q.ready and qSpell then
    CastQ(target)
  end
  if qlSpell and Q.ready then
    for i, minion in pairs(minionManager.objects) do
      if ValidTarget(minion,Q.range) and GetDamage(_Q,minion) > GetCurrentHP(minion) then
        CastQ(minion)
      end
    end
  end
  if wSpell and W.ready then
    for i, minion in pairs(minionManager.objects) do
      if ValidTarget(minion,W.range) and GetDamage(_W,minion) > GetCurrentHP(minion) then
        CastTargetSpell(minion, _W)
      end
    end
  end
  if eSpell and E.ready then
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
  if GetCurrentMana(GetMyHero())/GetMaxMana(GetMyHero()) < minMana then return end
  for i, minion in pairs(minionManager.objects) do
    if UseQ and Q.ready and ValidTarget(minion,Q.range) then
      CastQ(minion)
    end
    if UseW and W.ready and ValidTarget(minion,W.range) then
      CastTargetSpell(minion, _W)
    end
    if UseE and E.ready and ValidTarget(minion,E.range) then
      CastTargetSpell(minion, _E)
    end
    if UseR and R.ready and ValidTarget(minion,Q.range) then
      CastSpell(_R)
    end
  end
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
local shield = (((5 * GetLevel(GetMyHero())) + 20) + (math.ceil(GetMaxMana(GetMyHero()) * 0.08)))
if IsDead(GetMyHero()) or not MenuLoaded then return end
local pos = GetOrigin(GetMyHero())
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

AddGapcloseEvent(_W, 600, true, Menu)

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

function Base64Decode(data)
  data = string.gsub(data, '[^'..b..'=]', '')
  return (data:gsub('.', function(x)
  if (x == '=') then return '' end
  local r,f='',(b:find(x)-1)
  for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
  return r;
  end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
  if (#x ~= 8) then return '' end
  local c=0
  for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
  return string.char(c)
  end))
end


class "ScriptUpdate"
function ScriptUpdate:__init(LocalVersion,UseHttps, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion,CallbackError)
  self.LocalVersion = LocalVersion
  self.Host = Host
  self.VersionPath = '/GOS/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..VersionPath)..'&rand='..math.random(99999999)
  self.ScriptPath = '/GOS/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..ScriptPath)..'&rand='..math.random(99999999)
  self.SavePath = SavePath
  self.CallbackUpdate = CallbackUpdate
  self.CallbackNoUpdate = CallbackNoUpdate
  self.CallbackNewVersion = CallbackNewVersion
  self.CallbackError = CallbackError
  OnDraw(function() self:OnDraw() end)
  self:CreateSocket(self.VersionPath)
  self.DownloadStatus = 'Connecting to Server for VersionInfo'
  OnTick(function() self:GetOnlineVersion() end)
end

function ScriptUpdate:print(str)
  print('<font color="#FFFFFF">'..os.clock()..': '..str)
end

function ScriptUpdate:OnDraw()
  if self.DownloadStatus ~= 'Downloading Script (100%)' and self.DownloadStatus ~= 'Downloading VersionInfo (100%)'then
    DrawText('Download Status: '..(self.DownloadStatus or 'Unknown'),50,10,50,ARGB(0xFF,0xFF,0xFF,0xFF))
  end
end

function ScriptUpdate:CreateSocket(url)
  if not self.LuaSocket then
    self.LuaSocket = require("socket")
  else
    self.Socket:close()
    self.Socket = nil
    self.Size = nil
    self.RecvStarted = false
  end
  self.LuaSocket = require("socket")
  self.Socket = self.LuaSocket.tcp()
  self.Socket:settimeout(0, 'b')
  self.Socket:settimeout(99999999, 't')
  self.Socket:connect('plebleaks.com', 80)
  self.Url = url
  self.Started = false
  self.LastPrint = ""
  self.File = ""
end

function ScriptUpdate:Base64Encode(data)
  local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
  return ((data:gsub('.', function(x)
  local r,b='',x:byte()
  for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
  return r;
  end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
  if (#x < 6) then return '' end
  local c=0
  for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
  return b:sub(c+1,c+1)
  end)..({ '', '==', '=' })[#data%3+1])
end

function ScriptUpdate:GetOnlineVersion()
  if self.GotScriptVersion then return end

  self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
  if self.Status == 'timeout' and not self.Started then
    self.Started = true
    self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: plebleaks.com\r\n\r\n")
  end
  if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
    self.RecvStarted = true
    self.DownloadStatus = 'Downloading VersionInfo (0%)'
  end

  self.File = self.File .. (self.Receive or self.Snipped)
  if self.File:find('</s'..'ize>') then
    if not self.Size then
      self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
    end
    if self.File:find('<scr'..'ipt>') then
      local _,ScriptFind = self.File:find('<scr'..'ipt>')
      local ScriptEnd = self.File:find('</scr'..'ipt>')
      if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
      local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
      self.DownloadStatus = 'Downloading VersionInfo ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
    end
  end
  if self.File:find('</scr'..'ipt>') then
    self.DownloadStatus = 'Downloading VersionInfo (100%)'
    local a,b = self.File:find('\r\n\r\n')
    self.File = self.File:sub(a,-1)
    self.NewFile = ''
    for line,content in ipairs(self.File:split('\n')) do
      if content:len() > 5 then
        self.NewFile = self.NewFile .. content
      end
    end
    local HeaderEnd, ContentStart = self.File:find('<scr'..'ipt>')
    local ContentEnd, _ = self.File:find('</sc'..'ript>')
    if not ContentStart or not ContentEnd then
      if self.CallbackError and type(self.CallbackError) == 'function' then
        self.CallbackError()
      end
    else
      self.OnlineVersion = (Base64Decode(self.File:sub(ContentStart + 1,ContentEnd-1)))
      self.OnlineVersion = tonumber(self.OnlineVersion)
      if self.OnlineVersion > self.LocalVersion then
        if self.CallbackNewVersion and type(self.CallbackNewVersion) == 'function' then
          self.CallbackNewVersion(self.OnlineVersion,self.LocalVersion)
        end
        self:CreateSocket(self.ScriptPath)
        self.DownloadStatus = 'Connect to Server for ScriptDownload'
        OnTick(function() self:DownloadUpdate() end)
      else
        if self.CallbackNoUpdate and type(self.CallbackNoUpdate) == 'function' then
          self.CallbackNoUpdate(self.LocalVersion)
        end
      end
    end
    self.GotScriptVersion = true
  end
end

function ScriptUpdate:DownloadUpdate()
  if self.GotScriptUpdate then return end
  self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
  if self.Status == 'timeout' and not self.Started then
    self.Started = true
    self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: plebleaks.com\r\n\r\n")
  end
  if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
    self.RecvStarted = true
    self.DownloadStatus = 'Downloading Script (0%)'
  end

  self.File = self.File .. (self.Receive or self.Snipped)
  if self.File:find('</si'..'ze>') then
    if not self.Size then
      self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
    end
    if self.File:find('<scr'..'ipt>') then
      local _,ScriptFind = self.File:find('<scr'..'ipt>')
      local ScriptEnd = self.File:find('</scr'..'ipt>')
      if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
      local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
      self.DownloadStatus = 'Downloading Script ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
    end
  end
  if self.File:find('</scr'..'ipt>') then
    self.DownloadStatus = 'Downloading Script (100%)'
    local a,b = self.File:find('\r\n\r\n')
    self.File = self.File:sub(a,-1)
    self.NewFile = ''
    for line,content in ipairs(self.File:split('\n')) do
      if content:len() > 5 then
        self.NewFile = self.NewFile .. content
      end
    end
    local HeaderEnd, ContentStart = self.NewFile:find('<sc'..'ript>')
    local ContentEnd, _ = self.NewFile:find('</scr'..'ipt>')
    if not ContentStart or not ContentEnd then
      if self.CallbackError and type(self.CallbackError) == 'function' then
        self.CallbackError()
      end
    else
      local newf = self.NewFile:sub(ContentStart+1,ContentEnd-1)
      local newf = newf:gsub('\r','')
      if newf:len() ~= self.Size then
        if self.CallbackError and type(self.CallbackError) == 'function' then
          self.CallbackError()
        end
        return
      end
      local newf = Base64Decode(newf)
      local f = io.open(self.SavePath,"w+b")
      f:write(newf)
      f:close()
      if self.CallbackUpdate and type(self.CallbackUpdate) == 'function' then
        self.CallbackUpdate(self.OnlineVersion,self.LocalVersion)
      end
    end
    self.GotScriptUpdate = true
  end
end

ScriptUpdate(ToUpdate.Version,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)

OnUnLoad (function()
    print("<font color='#eb4d33'>[Icy Ryze]: </font><font color='#FF0000'> Unloaded!</font>")
  end)

else
  local http = require("socket.http")
  local body, code = http.request("http://plebcode.plebleaks.com/view/raw/82c86d37")
  if not body then error(code) end
  local f = io.open(COMMON_PATH.. "OpenPredict.lua", "wb")
  f:write(body)
  f:close()
  PrintChat("<font color='#eb4d33'>[Icy Ryze]: </font><font color='#00FFFF'> A required library has been downloaded. Please 2x F6 to Re-Load!</font>")
end