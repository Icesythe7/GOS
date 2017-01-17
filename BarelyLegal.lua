if myHero.charName ~= "Annie" then 
	return
end

-- http://bol-tools.com/ tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("FW7uB5AVuFLAYQxD")

--SexySexyPrint by Azero--
function SexyPrint(message)
  local sexyName = "<font color=\"#FF5733\">[<b><i>Barely Legal</i></b>]</font>"
  local fontColor = "3393FF"
  print(sexyName .. " <font color=\"#" .. fontColor .. "\">" .. message .. "</font>")
end

local version = "0.02"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.githubusercontent.com"
local UPDATE_PATH = "/Icesythe7/GOS/master/BarelyLegal.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

if AUTOUPDATE then
	local ServerData = GetWebResult(UPDATE_HOST,"/Icesythe7/GOS/master/BarelyLegal.version")
	if ServerData then
		ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
		if ServerVersion then
			if tonumber(version) < ServerVersion then
				SexyPrint("New version available "..ServerVersion)
				SexyPrint("Updating, please don't press F9")
				DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () SexyPrint("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 2)
				return
			else
				SexyPrint("You have got the latest version ("..ServerVersion..")")
			end
		end
	else
		SexyPrint("Error downloading version info")
	end
end

if not _G.UOLloaded then
  if FileExist(LIB_PATH .. "/UOL.lua") then
      require("UOL")
    else 
      SexyPrint("Downloading UOL, please don't press F9")
      DelayAction(function() DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/UOL.lua".."?rand="..math.random(1,10000), LIB_PATH.."UOL.lua", function () SexyPrint("Successfully downloaded UOL. Press F9 twice.") end) end, 3) 
      return
    end
end

if not _G.UPLloaded then
  if FileExist(LIB_PATH .. "/UPL.lua") then
    require("UPL")
    _G.UPL = UPL()
  else
    SexyPrint("Downloading UPL, please don't press F9")
    DelayAction(function() DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/UPL.lua".."?rand="..math.random(1,10000), LIB_PATH.."UPL.lua", function () SexyPrint("Successfully downloaded UPL. Press F9 twice.") end) end, 3)
    return
  end
end

UPL:AddSpell(_W, { speed = math.huge, delay = 0.25, range = 600, width = 140, collision = false, aoe = true, type = "cone" }) --double check values later
UPL:AddSpell(_R, { speed = math.huge, delay = 0.25, range = 600, width = 150, collision = false, aoe = true, type = "circular" })

local targetMinions = minionManager(MINION_ENEMY, 650, myHero, MINION_SORT_MAXHEALTH_DEC)
local jungleMinions = minionManager(MINION_JUNGLE, 650, myHero, MINION_SORT_MAXHEALTH_DEC)
local summonerSpells = {ignite = {}, flash = {}, heal = {}, barrier = {}, smite = {}}
local flashFound = false
local igniteFound = false
local sEnemies = GetEnemyHeroes()
local lastUse = os.clock()
local SelectedTarget = nil
local tibbs = nil
local sActive = false
local lastFR = false
local spellDmg = 
{
  [_Q] =
  function(unit)
    if isReady(_Q) then
      return myHero:CalcMagicDamage(unit, (((myHero:GetSpellData(_Q).level * 35) + 45) + (myHero.ap * 0.8)))
    end
  end,

  [_W] =
  function(unit)
    if isReady(_W) then
      return myHero:CalcMagicDamage(unit, (((myHero:GetSpellData(_W).level * 45) + 25) + (myHero.ap * 0.85)))
    end
  end,

  [_R] =
  function(unit)
    if isReady(_R) and tibbs == nil then
      return myHero:CalcMagicDamage(unit, ((myHero:GetSpellData(_R).level * 125) + 25) + (myHero.ap * 0.65))
    end
  end
}
local skinMeta =
{
  ["Annie"] = {"Classic", "Goth", "Red Riding", "Annie in Wonderland", "Prom Queen", "Frostfire", "Reverse", "FrankenTibbers", "Panda", "Sweetheart", "Hextech"}
}

function Annie()
	Annie = scriptConfig("Barely Legal Annie", "Barely Legal Annie")

	Annie:addSubMenu("Combo", "cSet")
		Annie.cSet:addParam("noAA", "Disable AA if Q Ready", SCRIPT_PARAM_ONOFF, true)
		Annie.cSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Annie.cSet:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, true)
		Annie.cSet:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)
		Annie.cSet:addParam("useR", "Use R", SCRIPT_PARAM_ONOFF, true)

	Annie:addSubMenu("Harass", "hSet")
		Annie.hSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Annie.hSet:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, true)
		Annie.hSet:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)

	Annie:addSubMenu("LastHit", "lhSet")
		Annie.lhSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Annie.lhSet:addParam("noAA", "Disable AA if Q ready", SCRIPT_PARAM_ONOFF, true)

	Annie:addSubMenu("LaneClear", "lSet")
		Annie.lSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Annie.lSet:addParam("noAA", "Disable AA if Q ready", SCRIPT_PARAM_ONOFF, false)
		Annie.lSet:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, true)
		Annie.lSet:addParam("hitW", "Minimum #Minions Hit W", SCRIPT_PARAM_SLICE, 3, 1, 6)

	Annie:addSubMenu("JungleClear", "jSet")
		Annie.jSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Annie.jSet:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, true)

	Annie:addSubMenu("Misc", "misc")
		Annie.misc:addParam("saveS", "Save Stun", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey("L"))
		Annie.misc:permaShow("saveS")
		Annie.misc:addParam("FRcombo", "Flash R Combo", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("Z"))
		Annie.misc:addParam("Flee", "Flee Key", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("G"))
		Annie.misc:addParam("skins", myHero.charName .. " Skins", SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
  		Annie.misc:setCallback("skins", StartSkin)

	Annie:addSubMenu("Prediction", "Pred")
		UPL:AddToMenu(Annie.Pred)

	Annie:addSubMenu("Orbwalker", "Orbwalker")
		UOL:AddToMenu(Annie.Orbwalker)

	Annie:addSubMenu("Drawing", "Drawing") 
  		Annie.Drawing:addParam("lfps", "Low FPS Circles", SCRIPT_PARAM_ONOFF, true)
  		Annie.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Annie.Drawing:addParam("Qrange", "Draw Q Range", SCRIPT_PARAM_ONOFF, true)
  		Annie.Drawing:addParam("Qcolor", "--> Q Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Annie.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Annie.Drawing:addParam("Rrange", "Draw R Range", SCRIPT_PARAM_ONOFF, true)
  		Annie.Drawing:addParam("Rcolor", "--> R Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Annie.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Annie.Drawing:addParam("FRrange", "Draw Flash R Range", SCRIPT_PARAM_ONOFF, true)
  		Annie.Drawing:addParam("FRcolor", "--> Flash R Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Annie.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Annie.Drawing:addParam("eDamage", "Draw Enemy Damage", SCRIPT_PARAM_ONOFF, true)
end

function OnLoad()
	Annie()
	for i = 1, myHero.buffCount do
		local buff = myHero:getBuff(i)
		if buff and buff ~= nil and buff.name == "pyromania_particle" then
			sActive = true
		end
	end
	for i = 1, objManager.maxObjects do
    	local object = objManager:GetObject(i)
    	if object and object.valid and object.name == "Tibbers" then
    		tibbs = object
    	end
	end
	if not flashFound then
    	if myHero:GetSpellData(SUMMONER_1).name:lower() == "summonerflash" then
        	flashFound = true
            summonerSpells.flash = SUMMONER_1
        elseif myHero:GetSpellData(SUMMONER_2).name:lower() == "summonerflash" then
            flashFound = true
            summonerSpells.flash = SUMMONER_2
        end
    end
    if not igniteFound then
    	if myHero:GetSpellData(SUMMONER_1).name:lower() == "summonerdot" then
        	igniteFound = true
            summonerSpells.ignite = SUMMONER_1
        elseif myHero:GetSpellData(SUMMONER_2).name:lower() == "summonerdot" then
            igniteFound = true
            summonerSpells.ignite = SUMMONER_2
        end
    end
	DelayAction(function() SexyPrint("Version " ..version.. " Loaded!") end, 2)
	StartSkin()
end

function StartSkin()
	local id = (Annie.misc.skins - 1)
  	SetSkin(myHero, id)
  	if tibbs ~= nil then
  		SetSkin(tibbs, id)
  	end
end

function isReady(slot)
    return myHero:CanUseSpell(slot) == READY
end

function isLevel(slot)
	if myHero:GetSpellData(slot).level > 0 then
    	return true
  	else
    	return false
  	end
end

function isBetween(min, max, unit, unit2)
	local distance = GetDistanceSqr(unit, unit2)
  	if distance >= min * min and distance <= max * max then
    	return true
  	else
    	return false
  	end
end

function GetDamage(spell, unit)
	if spell == "ALL" then
    	local sum = 0
    	for spell, func in pairs(spellDmg) do
      		sum = sum + (func(unit) or 0)
    	end
    	return sum
  	else
    	return spellDmg[spell](unit) or 0
  	end
end

function GetMinionsHit(Pos, radius)
	local count = 0
  	for i, minion in pairs(targetMinions.objects) do
    	if GetDistanceSqr(minion, Pos) < radius * radius then
      		count = count + 1
    	end
  	end
 	return count
end

function moveToCursor()
	if GetDistance(mousePos) > 1 then
    	local moveToPos = myHero + (Vector(mousePos) - myHero):normalized() * 300
    	myHero:MoveTo(moveToPos.x, moveToPos.z)
  	end
end

function findClosestEnemy(obj)
	local closestEnemy = nil
  	local currentEnemy = nil
  	for i, currentEnemy in pairs(sEnemies) do
    	if ValidTarget(currentEnemy) then
      		if closestEnemy == nil then
        		closestEnemy = currentEnemy
      		end
      		if GetDistanceSqr(currentEnemy.pos, obj) < GetDistanceSqr(closestEnemy.pos, obj) then
        		closestEnemy = currentEnemy
      		end
    	end
  	end
 	return closestEnemy
end

function GetTarget(range)
	local orb = UOL:GetActiveOrb()
  	if orb == "Pewalk" then
    	return _Pewalk.GetTarget(range)
  	elseif orb == "SAC" then 
    	_G.AutoCarry.Crosshair:SetSkillCrosshairRange(range)
    	return _G.AutoCarry.SkillsCrosshair.target
  	elseif orb == "MMA" then
    	return _G.MMA_Target(range)
  	elseif orb == "NOW" then
    	return _G.NebelwolfisOrbWalker:GetTarget() 
  	elseif orb == "SxOrb" then 
    	return SxOrb:GetTarget(range) 
  	elseif orb == "SOW" then 
    	return SOWVP:GetTarget(range) 
  	elseif orb == "BFW" then 
    	return Orbwalk_GetTarget(range) 
  	else
    	return nil
  	end
end
--Credits Hellsing--
function OnWndMsg(Msg, Key)
	if Msg == WM_LBUTTONDOWN then
		local minD = 0
		local starget = nil
		for i, enemy in pairs(sEnemies) do
			if ValidTarget(enemy) then
				if GetDistanceSqr(enemy, mousePos) <= minD * minD or starget == nil then
					minD = GetDistanceSqr(enemy, mousePos)
					starget = enemy
				end
			end
		end
		if starget and minD < 100 * 100 then
			if SelectedTarget and starget.charName == SelectedTarget.charName then
				SelectedTarget = nil
			else
				SelectedTarget = starget
				SexyPrint("New target selected for Flash R Combo: "..starget.charName)
			end
		end
	end
end

function OnCreateObj(o)
	if o and o.valid and o.name == "Tibbers" then 
		tibbs = o
		SetSkin(o, Annie.misc.skins - 1)
	end
end

function OnDeleteObj(o)
	if o and o.valid and o.name == "Tibbers" then
		tibbs = nil
	end
end

function OnUpdateBuff(unit, buff)
	if unit and unit.isMe and buff and buff ~= nil then
		if buff.name == "pyromania_particle" then
			sActive = true
		end
	end
end

function OnRemoveBuff(unit, buff)
	if unit and unit.isMe and buff and buff ~= nil then
		if buff.name == "pyromania_particle" then
			sActive = false
		end
	end
end

function OnTick()
	if myHero.dead then
    	return
 	end
  	targetMinions:update()
  	UOL:SetAttacks(true)
	if UOL:GetOrbWalkMode() == "Combo" then
		Combo()
	elseif UOL:GetOrbWalkMode() == "Harass" then
		Harass()
	elseif UOL:GetOrbWalkMode() == "LaneClear" then
		Laneclear()
		Jungleclear()
	elseif UOL:GetOrbWalkMode() == "LastHit" then
		Lasthit()
	end
	if Annie.misc.FRcombo then
		FlashTibbs()
	end
	if Annie.misc.Flee then
		Flee()
	end
end

function Flee()
	moveToCursor()
  	local target = findClosestEnemy(myHero)
  	if target and ValidTarget(target) then
  		if isReady(_Q) and sActive and GetDistanceSqr(target) < 625 * 625 then
  			CastSpell(_Q, target)
  		end
  	end
end

function Combo()
	if SelectedTarget ~= nil then
		SelectedTarget = nil
	end
	local target = GetTarget(1100)
	if target and ValidTarget(target) then
		if Annie.cSet.noAA and isReady(_Q) then
			UOL:SetAttacks(false)
		else
			UOL:SetAttacks(true)
		end
		local distance = GetDistanceSqr(target)
		if CountEnemyHeroInRange(300, target) >= 2 then 
			if Annie.cSet.useR and isReady(_R) and tibbs == nil and distance  <= 600 * 600 then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_R, myHero, target)
    			if CastPosition and HitChance > 0 then
      				CastSpell(_R, CastPosition.x, CastPosition.z)
    			end
			end
			if Annie.cSet.useW and isReady(_W) and distance <= 600 * 600 then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
    			if CastPosition and HitChance > 0 then
      				CastSpell(_W, CastPosition.x, CastPosition.z)
    			end
			end
			if Annie.cSet.useQ and isReady(_Q) and distance <= 625 * 625 then
				CastSpell(_Q, target)
			end
			if Annie.cSet.useE and isReady(_E) and distance <= 625 * 625 then
				CastSpell(_E)
			end
		else 
			if Annie.cSet.useR and isReady(_R) and tibbs == nil and distance  <= 600 * 600 then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_R, myHero, target)
    			if CastPosition and HitChance > 0 then
      				CastSpell(_R, CastPosition.x, CastPosition.z)
    			end
			end
			if Annie.cSet.useQ and isReady(_Q) and distance <= 625 * 625 then
				CastSpell(_Q, target)
			end
			if Annie.cSet.useW and isReady(_W) and distance <= 600 * 600 then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
    			if CastPosition and HitChance > 0 then
      				CastSpell(_W, CastPosition.x, CastPosition.z)
    			end
			end
			if Annie.cSet.useE and isReady(_E) and distance <= 625 * 625 then
				CastSpell(_E)
			end
		end
	end
end

function Harass()
	if SelectedTarget ~= nil then
		SelectedTarget = nil
	end
	local target = GetTarget(1100)
	if target and ValidTarget(target) then
		local distance = GetDistanceSqr(target)
		if Annie.hSet.useQ and isReady(_Q) and distance <= 625 * 625 then
			CastSpell(_Q, target)
		end
		if Annie.hSet.useW and isReady(_W) and distance <= 600 * 600 then
			local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
    		if CastPosition and HitChance > 0 then
      			CastSpell(_W, CastPosition.x, CastPosition.z)
    		end
		end
		if Annie.hSet.useE and isReady(_E) and distance <= 625 * 625 then
			CastSpell(_E)
		end
	end
end

function Lasthit()
	if Annie.lhSet.useQ then
		for i, targetMinion in pairs(targetMinions.objects) do
			if not Annie.misc.saveS then
				if Annie.lhSet.noAA and isReady(_Q) then
					UOL:SetAttacks(false)
				else
					UOL:SetAttacks(true)
				end
			elseif Annie.misc.saveS then 
				if Annie.lhSet.noAA and isReady(_Q) and not sActive then
					UOL:SetAttacks(false)
				elseif Annie.misc.saveS and Annie.lhSet.noAA and sActive then
					UOL:SetAttacks(true)
				end
			end
			if targetMinion ~= nil and ValidTarget(targetMinion) and GetDistanceSqr(targetMinion) <= 625 * 625 then
				if not Annie.misc.saveS and isReady(_Q) and GetDamage(_Q, targetMinion) > targetMinion.health then
					CastSpell(_Q, targetMinion)
				elseif Annie.misc.saveS and not sActive and isReady(_Q) and GetDamage(_Q, targetMinion) > targetMinion.health then
					CastSpell(_Q, targetMinion)
				end
			end
		end
	end
end

function Laneclear()
	for i, targetMinion in pairs(targetMinions.objects) do
		if targetMinion ~= nil and ValidTarget(targetMinion) then
			if not Annie.misc.saveS then
				if Annie.lSet.noAA and isReady(_Q) then
					UOL:SetAttacks(false)
				else
					UOL:SetAttacks(true)
				end
			elseif Annie.misc.saveS then 
				if Annie.lSet.noAA and isReady(_Q) and not sActive then
					UOL:SetAttacks(false)
				elseif Annie.misc.saveS and Annie.lSet.noAA and sActive then
					UOL:SetAttacks(true)
				end
			end
			local distance = GetDistanceSqr(targetMinion)
			if Annie.lSet.useQ and not Annie.misc.saveS and isReady(_Q) and distance <= 625 * 625 and GetDamage(_Q, targetMinion) > targetMinion.health then
				CastSpell(_Q, targetMinion)
			elseif Annie.lSet.useQ and Annie.misc.saveS and not sActive and isReady(_Q) and distance <= 625 * 625 and GetDamage(_Q, targetMinion) > targetMinion.health then
				CastSpell(_Q, targetMinion)
			end
			if Annie.lSet.useW and not Annie.misc.saveS and isReady(_W) and distance <= 600 * 600 and GetMinionsHit(targetMinion, 140) >= Annie.lSet.hitW then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, targetMinion)
    			if CastPosition and HitChance > 0 then
      				CastSpell(_W, CastPosition.x, CastPosition.z)
    			end
			elseif Annie.lSet.useW and Annie.misc.saveS and not sActive and isReady(_W) and distance <= 600 * 600 and GetMinionsHit(targetMinion, 140) >= Annie.lSet.hitW then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, targetMinion)
    			if CastPosition and HitChance > 0 then
      				CastSpell(_W, CastPosition.x, CastPosition.z)
    			end
			end
		end
	end
end

function Jungleclear()
	jungleMinions:update()
  	for i, jungleMinion in pairs(jungleMinions.objects) do
    	if jungleMinion.name:find("Plant") then
      		return
    	end
    	local distance = GetDistance(jungleMinion)
    	if jungleMinion ~= nil and ValidTarget(jungleMinion) then
    		if Annie.jSet.useQ and isReady(_Q) and distance <= 625 * 625 then
    			CastSpell(_Q, jungleMinion)
    		end
    		if Annie.jSet.useW and isReady(_W) and distance <= 600 * 600 then
    			local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, jungleMinion)
    			if CastPosition and HitChance > 0 then
      				CastSpell(_W, CastPosition.x, CastPosition.z)
    			end
    		end
    	end
    end
end

function FlashTibbs()
	moveToCursor()
	if not flashFound then
		if lastUse < os.clock() then
			SexyPrint("Summoner Flash Not Found!")
			lastUse = os.clock() + 5
		end
	elseif flashFound then
		local target = SelectedTarget
		if target ~= nil and ValidTarget(target) then
			local distance = GetDistanceSqr(target)
			if isReady(summonerSpells.flash) and isReady(_R) and tibbs == nil and isBetween(650, 1025, myHero, target) then
				CastSpell(summonerSpells.flash, target.x, target.z)
				lastFR = true
				DelayAction(function() lastFR = false end, 2)
			elseif not lastFR and not isReady(summonerSpells.flash) and not isReady(_R) and tibbs == nil and lastUse < os.clock() then
				SexyPrint("Flash and R are not Ready!")
				SelectedTarget = nil
				lastUse = os.clock() + 5
			elseif not lastFR and isReady(summonerSpells.flash) and not isReady(_R) and tibbs == nil and lastUse < os.clock() then
				SexyPrint("R is not Ready!")
				SelectedTarget = nil
				lastUse = os.clock() + 5
			elseif not lastFR and not isReady(summonerSpells.flash) and isReady(_R) and tibbs == nil and lastUse < os.clock() then
				SexyPrint("Flash is not Ready!")
				SelectedTarget = nil
				lastUse = os.clock() + 5
			end
			if lastFR and isReady(_R) and tibbs == nil and distance <= 600 * 600 then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_R, myHero, target)
    			if CastPosition and HitChance > 0 then
      				CastSpell(_R, CastPosition.x, CastPosition.z)
    			end
			end
			if igniteFound and lastFR and isReady(summonerSpells.ignite) and distance <= 600 * 600 then
				CastSpell(summonerSpells.ignite, target)
			end
			if lastFR and isReady(_W) and distance <= 600 * 600 then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
    			if CastPosition and HitChance > 0 then
      				CastSpell(_W, CastPosition.x, CastPosition.z)
    			end
			end
			if lastFR and isReady(_Q) and distance <= 625 * 625 then
				CastSpell(_Q, target)
			end
		elseif not lastFR and lastUse < os.clock() then
			SexyPrint("No Target or Target is Immune!")
			SexyPrint("Left Click an Enemy to set the Target.")
			SelectedTarget = nil
			lastUse = os.clock() + 5
		end
	end
end

function GetHPBarPos(enemy)
    enemy.barData = {PercentageOffset = {x = -0.05, y = 0}}
    local barPos = GetUnitHPBarPos(enemy)
    local barPosOffset = GetUnitHPBarOffset(enemy)
    local barOffset = { x = enemy.barData.PercentageOffset.x, y = enemy.barData.PercentageOffset.y }
    local barPosPercentageOffset = { x = enemy.barData.PercentageOffset.x, y = enemy.barData.PercentageOffset.y }
    local BarPosOffsetX = -50
    local BarPosOffsetY = 46
    local CorrectionY = 39
    local StartHpPos = 31 
    barPos.x = math.floor(barPos.x + (barPosOffset.x - 0.5 + barPosPercentageOffset.x) * BarPosOffsetX + StartHpPos)
    barPos.y = math.floor(barPos.y + (barPosOffset.y - 0.5 + barPosPercentageOffset.y) * BarPosOffsetY + CorrectionY)
    local StartPos = Vector(barPos.x , barPos.y, 0)
    local EndPos = Vector(barPos.x + 108 , barPos.y , 0)    
    return Vector(StartPos.x, StartPos.y, 0), Vector(EndPos.x, EndPos.y, 0)
end

function DrawCircleNextLvl(x, y, z, radius, width, color, chordlength)
	radius = radius or 300
  	quality = math.max(8,math.floor(180/math.deg((math.asin((chordlength/(2*radius)))))))
  	quality = 2 * math.pi / quality
  	local points = {}
  	for theta = 0, 2 * math.pi + quality, quality do
    	local c = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(theta), y, z - radius * math.sin(theta)))
    	points[#points + 1] = D3DXVECTOR2(c.x, c.y)
  	end
  	DrawLines2(points, width or 1, color or 4294967295)
end

function DrawCircle2(x, y, z, radius, color)
  	local vPos1 = Vector(x, y, z)
  	local vPos2 = Vector(cameraPos.x, cameraPos.y, cameraPos.z)
  	local tPos = vPos1 - (vPos1 - vPos2):normalized() * radius
  	local sPos = WorldToScreen(D3DXVECTOR3(tPos.x, tPos.y, tPos.z))
  	if OnScreen({ x = sPos.x, y = sPos.y }, { x = sPos.x, y = sPos.y })  then
    	DrawCircleNextLvl(x, y, z, radius, 1, color, 75)
  	end
end

function OnDraw()
	if myHero.dead then
    	return
  	end
  	if Annie.Drawing.lfps then
    	if Annie.Drawing.Qrange and isReady(_Q) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, 625, ARGB(Annie.Drawing.Qcolor[1], Annie.Drawing.Qcolor[2], Annie.Drawing.Qcolor[3], Annie.Drawing.Qcolor[4]))
    	elseif Annie.Drawing.Qrange and not isReady(_Q) and isLevel(_Q) then
     		DrawCircle2(myHero.x, myHero.y, myHero.z, 625, ARGB(255, 255, 0, 0))
    	end
    	if Annie.Drawing.Rrange and isReady(_R) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, 600, ARGB(Annie.Drawing.Rcolor[1], Annie.Drawing.Rcolor[2], Annie.Drawing.Rcolor[3], Annie.Drawing.Rcolor[4]))
    	elseif Annie.Drawing.Rrange and not isReady(_R) and isLevel(_R) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, 600, ARGB(255,255,0,0))
    	end
    	if flashFound and Annie.Drawing.FRrange and isReady(_R) and isReady(summonerSpells.flash) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, 1025, ARGB(Annie.Drawing.FRcolor[1], Annie.Drawing.FRcolor[2], Annie.Drawing.FRcolor[3], Annie.Drawing.FRcolor[4]))
    	elseif flashFound and Annie.Drawing.FRrange and (not isReady(_R) or not isReady(summonerSpells.flash)) and isLevel(_R) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, 1025, ARGB(255, 255, 0, 0))
    	end
    	if SelectedTarget ~= nil and ValidTarget(SelectedTarget) then
			DrawCircle2(SelectedTarget.x, SelectedTarget.y, SelectedTarget.z, 100, ARGB(255, 255, 0, 0))
		end
  	else
    	if Annie.Drawing.Qrange and isReady(_Q) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 625, ARGB(Annie.Drawing.Qcolor[1], Annie.Drawing.Qcolor[2], Annie.Drawing.Qcolor[3], Annie.Drawing.Qcolor[4]))
    	elseif Annie.Drawing.Qrange and not isReady(_Q) and isLevel(_Q) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 625, ARGB(255, 255, 0, 0))
    	end
    	if Annie.Drawing.Rrange and isReady(_R) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 600, ARGB(Annie.Drawing.Rcolor[1], Annie.Drawing.Rcolor[2], Annie.Drawing.Rcolor[3], Annie.Drawing.Rcolor[4]))
    	elseif Annie.Drawing.Rrange and not isReady(_R) and isLevel(_R) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 600, ARGB(255,255,0,0))
    	end
    	if flashFound and Annie.Drawing.FRrange and isReady(_R) and isReady(summonerSpells.flash) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 1025, ARGB(Annie.Drawing.FRcolor[1], Annie.Drawing.FRcolor[2], Annie.Drawing.FRcolor[3], Annie.Drawing.FRcolor[4]))
    	elseif flashFound and Annie.Drawing.FRrange and (not isReady(_R) or not isReady(summonerSpells.flash)) and isLevel(_R) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 1025, ARGB(255, 255, 0, 0))
    	end
    	if SelectedTarget ~= nil and ValidTarget(SelectedTarget) then
			DrawCircle(SelectedTarget.x, SelectedTarget.y, SelectedTarget.z, 100, ARGB(255, 255, 0, 0))
		end
  	end
  	if Annie.Drawing.eDamage then
	    for i, enemy in pairs(sEnemies) do
	    	if enemy and enemy.visible and not enemy.dead then
	        	local myDmg = GetDamage("ALL", enemy)
	        	local textLabel = nil
	        	local line = 2
	        	local linePosA  = {x = 0, y = 0 }
	        	local linePosB  = {x = 0, y = 0 }
	        	local TextPos   = {x = 0, y = 0 }
	        	local p = WorldToScreen(D3DXVECTOR3(enemy.x, enemy.y, enemy.z))
	        	if OnScreen(p.x, p.y) then
	          		if myDmg >= enemy.health then
	            		myDmg = enemy.health - 1
	            		textLabel = "Killable"
	          		else
	            		textLabel = "Damage"
	          		end
	          		myDmg = math.round(myDmg)
	          		local StartPos, EndPos = GetHPBarPos(enemy)
	          		local Real_X = StartPos.x + 24
	          		local Offs_X = (Real_X + ((enemy.health - myDmg) / enemy.maxHealth) * (EndPos.x - StartPos.x - 2))
	          		if Offs_X < Real_X then
	            		Offs_X = Real_X 
	          		end 
	          		local mytrans = 350 - math.round(255*((enemy.health-myDmg)/enemy.maxHealth))
	          		if mytrans >= 255 then 
	            		mytrans = 254 
	          		end
	          		local my_bluepart = math.round(400*((enemy.health-myDmg)/enemy.maxHealth))
	          		if my_bluepart >= 255 then 
	            		my_bluepart = 254 
	          		end
	          		linePosA.x = Offs_X-150
	          		linePosA.y = (StartPos.y-(30+(line*15)))    
	          		linePosB.x = Offs_X-150
	          		linePosB.y = (StartPos.y-10)
	          		TextPos.x = Offs_X-148
	          		TextPos.y = (StartPos.y-(30+(line*15)))
	          		if myDmg > 0 then
	            		DrawLine(linePosA.x, linePosA.y, linePosB.x, linePosB.y, 1, ARGB(mytrans, 255, my_bluepart, 0))
	            		DrawText(tostring(myDmg).." "..tostring(textLabel), 15, TextPos.x, TextPos.y , ARGB(mytrans, 255, my_bluepart, 0))
	          		end
	        	end
	      	end
	    end
  	end
end