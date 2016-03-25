if GetObjectName(GetMyHero()) ~= "Darius" then return end

local ver = "0.01"

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New version found! " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/Icesythe7/GOS/master/IcyDarius.lua", SCRIPT_PATH .. "IcyDarius.lua", function() PrintChat("Update Complete, please 2x F6!") return end)
    else
        PrintChat("No updates found, IcyDarius version " .. ver .. " Loaded!")
    end
end

GetWebResultAsync("https://raw.githubusercontent.com/Icesythe7/GOS/master/IcyDarius.version", AutoUpdate)

require "Inspired"
require "OpenPredict"

local rDebuff        = {}
local tAD            = (GetBaseDamage(myHero) + GetBonusDmg(myHero))
local wDamage        = (tAD + (tAD * 0.4))
local aaCD           = false
local igniteFound    = false
local summonerSpells = {ignite = {}, flash = {}, heal = {}, barrier = {}}
local ATTACKITEMS    = {3077, 3748, 3144, 3142, 3146, 3153, 3074}
local ANTICCITEMS    = {3140, 3137}
local TIAMAT, TITANIC, CUTLASS, YOUMU, GUNBLADE, BTRK, RAVENOUS, Qss, DERVISH = false, false, false, false, false, false, false, false, false
local TIAMATSLOT, TITANICSLOT, CUTLASSSLOT, YOUMUSLOT, GUNBLADESLOT, BOTRKSLOT, RAVENOUSSLOT, QSSSLOT, DERVISHSLOT, SMITESLOT = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
local skinMeta       = {["Darius"] = {"Classic", "Lord", "Bioforge", "Woad King", "Dunkmaster", "Chroma Pack: Black Iron", "Chroma Pack: Bronze", "Chroma Pack: Copper", "Academy"}}

DariusMenu = Menu("darius", "Icy Darius")
DariusMenu:SubMenu("Combo", "Combo")
DariusMenu.Combo:Boolean("useItems", "Use Items", true)
DariusMenu.Combo:Boolean("Q", "Use Q", true)
DariusMenu.Combo:Boolean("W", "Use W", true)
DariusMenu.Combo:Boolean("E", "Use Smart E", true)
DariusMenu:SubMenu("Harass", "Harass")
DariusMenu.Harass:Boolean("Q", "Use Q", true)
DariusMenu:SubMenu("Laneclear", "Laneclear")
DariusMenu.Laneclear:Boolean("Q", "Use Q", true)
DariusMenu.Laneclear:Boolean("W", "Use W", true)
DariusMenu:SubMenu("ksteal", "Killsteal")
DariusMenu.ksteal:Boolean("R", "Use R", true)
DariusMenu:SubMenu("misc", "Misc")
DariusMenu.misc:DropDown('skin', GetObjectName(myHero).. " Skins", 1, skinMeta[GetObjectName(myHero)], HeroSkinChanger, true)
DariusMenu.misc.skin.callback = function(model) HeroSkinChanger(GetMyHero(), model - 1) PrintChat(skinMeta[GetObjectName(myHero)][model] .." ".. GetObjectName(myHero) .. " Loaded!") end
DariusMenu:SubMenu("draws", "Drawing")
DariusMenu.draws:Boolean("qdraw", "Draw Q", true)
DariusMenu.draws:Boolean("edraw", "Draw E", true)
DariusMenu.draws:Boolean("rdraw", "Draw R", true)
DariusMenu.draws:Boolean("tdraw", "Draw Stack Text", true)
DariusMenu.draws:Boolean("rhpdraw", "Draw R Damage", true)

OnLoad (function()
	if not igniteFound then
    	if GetCastName(myHero, SUMMONER_1):lower():find("summonerdot") then
      		igniteFound = true
      		summonerSpells.ignite = SUMMONER_1
      		DariusMenu.ksteal:Boolean("ignite", "Auto Ignite", true)
    	elseif GetCastName(myHero, SUMMONER_2):lower():find("summonerdot") then
      		igniteFound = true
      		summonerSpells.ignite = SUMMONER_2
      		DariusMenu.ksteal:Boolean("ignite", "Auto Ignite", true)
    	end
	end
end)

OnUpdateBuff (function(unit, buff)
	if not unit or not buff then
		return
	end
	if buff.Name:lower() == "dariushemo" and GetTeam(buff) ~= (GetTeam(myHero)) and myHero.type == unit.type then
      	rDebuff[unit.networkID] = buff.Count
    end
end)

OnRemoveBuff (function(unit, buff)
	if not unit or not buff then
		return
	end
	if buff.Name:lower() == "dariushemo" and GetTeam(buff) ~= (GetTeam(myHero)) and myHero.type == unit.type then
      	rDebuff[unit.networkID] = 0
    end
end)

OnProcessSpellComplete (function(unit, spell)
	if unit and spell and unit.isMe and spell.name:lower():find("attack") then
        aaCD = true
        DelayAction(function() aaCD = false end, (1/(GetBaseAttackSpeed(myHero) * GetAttackSpeed(myHero))))
    end
end)

OnTick (function()
	Killsteal()
	Items()
	if IOW:Mode() == "Combo" then
		Combo()
	end
	if IOW:Mode() == "Harass" then
		Harass()
	end
	if IOW:Mode() == "LaneClear" then
		Laneclear()
	end
end)

function Combo()
	local target = GetCurrentTarget()
	if ValidTarget(target, 600) then
		--local ListCC = 3, 5, 8, 10, 11, 21, 22, 24, 28, 29
   		--if Menu.Combo.useItems:Value() and ImCC() then
    		--CastQSS()
    		--CastDervish()
    	--end
		if aaCD then
			CastTITANIC()
			CastTiamat()
			CastRAVENOUS()
			CastYoumu()
			CastBOTRK(target)
			CastCutlass(target)
		end
		if DariusMenu.Combo.Q:Value() and GetDistance(myHero, target) <= 425 and Ready(_Q) then 
			CastSpell(_Q) 
		end
		if DariusMenu.Combo.W:Value() and GetDistance(myHero, target) <= 255 and Ready(_W) and aaCD then 
			CastSpell(_W) 
		end
		if DariusMenu.Combo.E:Value() and GetDistance(myHero, target) <= 540 and not IsInDistance(target, 325) and Ready(_E) then
			local Apprehend = { delay = 0.25, speed = math.huge, width = 300, range = 540, angle = 35 }
			local pI = GetConicAOEPrediction(target, Apprehend)
			if pI and pI.hitChance >= 0.25 then
    			CastSkillShot(_E, pI.castPos)
			end  
		end
	end
end

function Harass()
	local target = GetCurrentTarget()
	if aaCD then
		CastTITANIC()
		CastTiamat()
		CastRAVENOUS()
	end
	if DariusMenu.Harass.Q:Value() and GetDistance(myHero, target) <= 425 and Ready(_Q) then 
		CastSpell(_Q) 
	end
end

function Laneclear()
	if aaCD then
		CastTITANIC()
		CastTiamat()
		CastRAVENOUS()
	end
	for i, minion in pairs(minionManager.objects) do
		if DariusMenu.Laneclear.Q:Value() and ValidTarget(minion, 425) and Ready(_Q) then
			CastSpell(_Q)
		end
		if DariusMenu.Laneclear.W:Value() and ValidTarget(minion, 255) and aaCD then
			CastSpell(_W)
		end
	end
end

function Killsteal()
	for _, enemy in pairs(GetEnemyHeroes()) do
		if rDebuff ~= nil then 
			local realHP = (GetCurrentHP(enemy) + GetDmgShield(enemy) + (GetHPRegen(enemy) * 0.25))
			local rStacks = rDebuff[enemy.networkID] or 0
			local rDamage = (((GetSpellData(myHero, _R).level * 100) + (GetBonusDmg(myHero) * 0.75)) + (rStacks * ((GetSpellData(myHero, _R).level * 20) + (GetBonusDmg(myHero) * 0.15))))
			if ValidTarget(enemy, 460) and rDamage >= realHP and Ready(_R) and DariusMenu.ksteal.R:Value() then 
				CastTargetSpell(enemy, _R)
			end
		end
		if igniteFound and DariusMenu.ksteal.ignite:Value() and Ready(summonerSpells.ignite) then
    		local iDamage = (50 + (20 * GetLevel(myHero)))
    		local realHPi = (GetCurrentHP(enemy) + GetDmgShield(enemy) + (GetHPRegen(enemy) * 0.05))
        	if ValidTarget(enemy, 600) and realHPi <= iDamage then
          		CastTargetSpell(enemy, summonerSpells.ignite)
          	end
		end
	end
end

function Items()
  if DariusMenu.Combo.useItems:Value() then
    Tiamat()
    Titanic()
    BOTRK()
    Cutlass()
    Youmu()
    Gunblade()
    Ravenous()
    QSS()
    Dervish()
  end
end

function Tiamat()
  local slot = GetItemSlot(myHero, ATTACKITEMS[1])
  if (slot ~= 0) then
    TIAMAT = true
    TIAMATSLOT = slot
  else
    TIAMAT = false
  end
end

function Titanic()
  local slot = GetItemSlot(myHero, ATTACKITEMS[2])
  if (slot ~= 0) then
    TITANIC = true
    TITANICSLOT = slot
  else
    TITANIC = false
  end
end

function Cutlass()
  local slot = GetItemSlot(myHero, ATTACKITEMS[3])
  if (slot ~= 0) then
    CUTLASS = true
    CUTLASSSLOT = slot
  else
    CUTLASS = false
  end
end

function Youmu()
  local slot = GetItemSlot(myHero, ATTACKITEMS[4])
  if (slot ~= 0) then
    YOUMU = true
    YOUMUSLOT = slot
  else
    YOUMU = false
  end
end

function Gunblade()
  local slot = GetItemSlot(myHero, ATTACKITEMS[5])
  if (slot ~= 0) then
    GUNBLADE = true
    GUNBLADESLOT = slot
  else
    GUNBLADE = false
  end
end

function BOTRK()
  local slot = GetItemSlot(myHero, ATTACKITEMS[6])
  if (slot ~= 0) then
    BTRK = true
    BOTRKSLOT = slot
  else
    BTRK = false
  end
end

function Ravenous()
  local slot = GetItemSlot(myHero, ATTACKITEMS[7])
  if (slot ~= 0) then
    RAVENOUS = true
    RAVENOUSSLOT = slot
  else
    RAVENOUS = false
  end
end

function QSS()
  local slot = GetItemSlot(myHero, ANTICCITEMS[1])
  if (slot ~= 0) then
    Qss = true
    QSSSLOT = slot
  else
    Qss = false
  end
end

function Dervish()
  local slot = GetItemSlot(myHero, ANTICCITEMS[2])
  if (slot ~= 0) then
    DERVISH = true
    DERVISHSLOT = slot
  else
    DERVISH = false
  end
end

function CastTiamat()
  	if TIAMAT and Ready(TIAMATSLOT) then
      	CastSpell(TIAMATSLOT)
    end
end

function CastYoumu()
  	if YOUMU and Ready(YOUMUSLOT) then
      	CastSpell(YOUMUSLOT)
  	end
end

function CastBOTRK(target)
  	if BOTRK and GetDistance(myHero, target) <= 550 and Ready(BOTRKSLOT) then
      	CastTargetSpell(target, BOTRKSLOT)
    end
end

function CastTITANIC()
  	if TITANIC and Ready(TITANICSLOT) then
     	CastSpell(TITANICSLOT)
    end
end

function CastCutlass(target)
  	if CUTLASS and GetDistance(myHero, target) <= 550 and Ready(CUTLASSSLOT) then
      	CastTargetSpell(target, CUTLASSSLOT)
    end
end

function CastRAVENOUS()
  	if RAVENOUS and Ready(RAVENOUSSLOT) then
      	CastSpell(RAVENOUSSLOT)
    end
end

function CastGunblade(target)
  	if GUNBLADE and GetDistance(myHero, target) <= 700 and Ready(GUNBLADESLOT) then
      	CastTargetSpell(target, GUNBLADESLOT)
    end
end

function CastQSS()
  	if QSS and Ready(QSSSLOT) then
      	CastSpell(QSSSLOT)
    end
end

function CastDervish()
  	if DERVISH and Ready(DERVISHSLOT) then
      	CastSpell(DERVISHSLOT)
  	end
end

OnDraw (function()
	if not IsDead(myHero) then
		if DariusMenu.draws.qdraw:Value() and Ready(_Q) then
			DrawCircle(GetOrigin(myHero), 425, 2, 1, ARGB(255, 255, 20, 147))
		end
		if DariusMenu.draws.edraw:Value() and Ready(_E) then
			DrawCircle(GetOrigin(myHero), 540, 2, 1, ARGB(255, 245, 86, 7))
		end
		if DariusMenu.draws.tdraw:Value() and Ready(_R) then
			DrawCircle(GetOrigin(myHero), 460, 2, 1, ARGB(255, 242, 0, 141))
		end
		if DariusMenu.draws.rhpdraw:Value()  then 
			for _, enemy in pairs(GetEnemyHeroes()) do
				local realHP = (GetCurrentHP(enemy) + GetDmgShield(enemy) + (GetHPRegen(enemy) * 0.25))
				local barPos = GetHPBarPos(enemy)
				local rStacks = rDebuff[enemy.networkID] or 0
				local rDamage = (((GetSpellData(myHero, _R).level * 100) + (GetBonusDmg(myHero) * 0.75)) + (rStacks * ((GetSpellData(myHero, _R).level * 20) + (GetBonusDmg(myHero) * 0.15)))) 
				if rDebuff[enemy.networkID] ~= nil and ValidTarget(enemy, 2000) then
	      			if rDebuff[enemy.networkID] == 0 then
				    	DrawTextA(""..rDebuff[enemy.networkID].."", 40, barPos.x+135, barPos.y-17, ARGB(255, 0, 255, 0))
					elseif rDebuff[enemy.networkID] == 1 then
				    	DrawTextA(""..rDebuff[enemy.networkID].."", 40, barPos.x+135, barPos.y-17, ARGB(255, 173, 255, 47))
					elseif rDebuff[enemy.networkID] == 2 then
				    	DrawTextA(""..rDebuff[enemy.networkID].."", 40, barPos.x+135, barPos.y-17, ARGB(255, 255, 255, 0))
					elseif rDebuff[enemy.networkID] == 3 then
				    	DrawTextA(""..rDebuff[enemy.networkID].."", 40, barPos.x+135, barPos.y-17, ARGB(255, 255, 165, 0))
					elseif rDebuff[enemy.networkID] == 4 then
				    	DrawTextA(""..rDebuff[enemy.networkID].."", 40, barPos.x+135, barPos.y-17, ARGB(255, 139, 69, 0))
					elseif rDebuff[enemy.networkID] == 5 and realHP > rDamage then
     					DrawTextA("Max Stacks", 40, barPos.x+135, barPos.y-17, ARGB(255, 255, 0, 0))
     				elseif realHP <= rDamage and Ready(_R) then
     					DrawTextA("Finish Him!!!", 40, barPos.x+135, barPos.y-17, ARGB(255, 255, 0, 0))
					end
				end
			end 
		end
		for _, enemy in pairs(GetEnemyHeroes()) do
			local realHP = (GetCurrentHP(enemy) + GetDmgShield(enemy) + (GetHPRegen(enemy) * 0.25))
			local rStacks = rDebuff[enemy.networkID] or 0
			local rDamage = (((GetSpellData(myHero, _R).level * 100) + (GetBonusDmg(myHero) * 0.75)) + (rStacks * ((GetSpellData(myHero, _R).level * 20) + (GetBonusDmg(myHero) * 0.15)))) 
			if myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level ~= 0 and DariusMenu.draws.rhpdraw:Value() and ValidTarget(enemy, 2000) then
				DrawDmgOverHpBar(enemy, realHP, rDamage, 0, ARGB(255, 0, 255, 0))
			end
		end
	end
end)