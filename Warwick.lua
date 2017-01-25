if myHero.charName ~= "Warwick" then
   return
end

--SexySexyPrint by Azero--
function SexyPrint(message)
	local sexyName = "<font color=\"#FF5733\">[<b><i>Warwick</i></b>]</font>"
  	local fontColor = "3393FF"
  	print(sexyName .. " <font color=\"#" .. fontColor .. "\">" .. message .. "</font>")
end

local version = "0.01"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.githubusercontent.com"
local UPDATE_PATH = "/Icesythe7/GOS/master/Warwick.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

if AUTOUPDATE then
	local ServerData = GetWebResult(UPDATE_HOST,"/Icesythe7/GOS/master/Warwick.version")
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

local jungleMinions = minionManager(MINION_JUNGLE, 400, myHero, MINION_SORT_MAXHEALTH_DEC)
local targetMinions = minionManager(MINION_ENEMY, 400, myHero, MINION_SORT_MAXHEALTH_DEC)
local sEnemies = GetEnemyHeroes()
local rRange = 0
local eActive = false
local spellDmg = 
{
  [_Q] =
  function(unit)
    if isReady(_Q) then
      return myHero:CalcMagicDamage(unit, (((myHero:GetSpellData(_Q).level + 5) * (unit.maxHealth / 100)) + (myHero.totalDamage * 1.2) + (myHero.ap * 0.9)))
    end
  end,

  [_R] =
  function(unit)
    if isReady(_R) then
      return myHero:CalcMagicDamage(unit, ((myHero:GetSpellData(_R).level * 175) + (myHero.addDamage * 1.7)))
    end
  end
}
local skinMeta =
{
  ["Warwick"] = {"Classic", "Grey", "Urf the Manatee", "Big Bad", "Tundra Hunter", "Feral", "Firefang", "Hyena", "Marauder"}
} 

function Warwick()
	Warwick = scriptConfig("Warwick", "Warwick")

	Warwick:addSubMenu("Combo", "cSet")
		Warwick.cSet:addParam("useQ", "Q Mode", SCRIPT_PARAM_LIST, 3, {"Off", "Lunge", "Leap"})
		Warwick.cSet:addParam("useE", "E Mode", SCRIPT_PARAM_LIST, 2, {"Off", "Instant", "Max"})
		Warwick.cSet:addParam("useR", "Use R", SCRIPT_PARAM_ONOFF, true)

	Warwick:addSubMenu("Harass", "hSet")
		Warwick.hSet:addParam("useQ", "Q Mode", SCRIPT_PARAM_LIST, 2, {"Off", "Lunge", "Leap"})
		Warwick.hSet:addParam("useE", "E Mode", SCRIPT_PARAM_LIST, 3, {"Off", "Instant", "Max"})

	Warwick:addSubMenu("LastHit", "lhSet")
		Warwick.lhSet:addParam("useQ", "Q Mode", SCRIPT_PARAM_LIST, 2, {"Off", "Lunge", "Leap"})

	Warwick:addSubMenu("LaneClear", "lSet")
		Warwick.lSet:addParam("useQ", "Q Mode", SCRIPT_PARAM_LIST, 2, {"Off", "Lunge", "Leap"})

	Warwick:addSubMenu("JungleClear", "jSet")
		Warwick.jSet:addParam("useQ", "Q Mode", SCRIPT_PARAM_LIST, 2, {"Off", "Lunge", "Leap"})
		Warwick.jSet:addParam("useE", "E Mode", SCRIPT_PARAM_LIST, 3, {"Off", "Instant", "Max"})

	Warwick:addSubMenu("Misc", "misc")
		Warwick.misc:addParam("Flee", "Flee Key", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("G"))
		Warwick.misc:addParam("skins", myHero.charName .. " Skins", SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
  		Warwick.misc:setCallback("skins", StartSkin)

	Warwick:addSubMenu("Prediction", "Pred")
		UPL:AddToMenu(Warwick.Pred)

	Warwick:addSubMenu("Orbwalker", "Orbwalker")
		UOL:AddToMenu(Warwick.Orbwalker)

	Warwick:addSubMenu("Drawing", "Drawing") 
  		Warwick.Drawing:addParam("lfps", "Low FPS Circles", SCRIPT_PARAM_ONOFF, true)
  		Warwick.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Warwick.Drawing:addParam("Qrange", "Draw Q Range", SCRIPT_PARAM_ONOFF, true)
  		Warwick.Drawing:addParam("Qcolor", "--> Q Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Warwick.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Warwick.Drawing:addParam("Erange", "Draw E Range", SCRIPT_PARAM_ONOFF, true)
  		Warwick.Drawing:addParam("Ecolor", "--> E Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Warwick.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Warwick.Drawing:addParam("Rrange", "Draw R Range", SCRIPT_PARAM_ONOFF, true)
  		Warwick.Drawing:addParam("Rcolor", "--> R Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Warwick.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Warwick.Drawing:addParam("eDamage", "Draw Enemy Damage", SCRIPT_PARAM_ONOFF, true)
end

function OnLoad()
	Warwick()
	StartSkin()
	DelayAction(function() SexyPrint("Version " ..version.. " Loaded!") end, 2)
end

function StartSkin()
	local id = (Warwick.misc.skins - 1)
  	SetSkin(myHero, id)
end

function isReady(slot)
    return (myHero:CanUseSpell(slot) == READY)
end

function isLevel(slot)
	return (myHero:GetSpellData(slot).level > 0)
end

function isBetween(min, max, unit, unit2)
	local distance = GetDistanceSqr(unit, unit2)
  	return (distance >= min * min and distance <= max * max) 
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

function OnUpdateBuff(unit, buff)
	if unit and unit.isMe then
		if buff.name == "WarwickE" then
			eActive = true
		end
	end
end

function OnRemoveBuff(unit, buff)
	if unit and unit.isMe then
		if buff.name == "WarwickE" then
			eActive = false
		end
	end
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

function OnTick()
	if myHero.dead then 
		return 
	end
	rRange = (math.round(myHero.ms * 1.88)) -- kinda off but meh
	UPL:AddSpell(_R, {speed = 2000, delay = 0.1, range = rRange, width = 300, collision = false, aoe = false, type = "linear"}) --prolly not the right width but hasnt failed yet :)
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
end

function Combo()
	if isReady(_R) then
		local target = GetTarget(rRange + 500)
		if target and ValidTarget(target) then
			local distance = GetDistanceSqr(target)
			if Warwick.cSet.useR and isReady(_R) and distance <= rRange ^ 2 then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_R, myHero, target)
    			if CastPosition and HitChance > 0 then
      				CastSpell(_R, CastPosition.x, CastPosition.z)
    			end
			end
		end
	else
		local target = GetTarget(400)
		if target and ValidTarget(target) then
			local distance = GetDistanceSqr(target)
			if Warwick.cSet.useQ == 2 and isReady(_Q) and distance <= 350 ^ 2 then
    			CastSpell(_Q, target)
    			CastSpell2(_Q, D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
    		elseif Warwick.cSet.useQ == 3 and isReady(_Q) and distance <= 350 ^ 2 then
    			CastSpell(_Q, target)
    		end
    		if Warwick.cSet.useE == 2 and not eActive and isReady(_E) and distance <= 375 ^ 2 then
    			CastSpell(_E)
    		elseif Warwick.cSet.useE == 2 and eActive and isReady(_E) and distance <= 375 ^ 2 then
    			CastSpell(_E)
    		elseif Warwick.cSet.useE == 3 and not eActive and isReady(_E) and distance <= 375 ^ 2 then
    			CastSpell(_E)
    		end
		end
	end
end

function Harass()
	local target = GetTarget(400)
	if target and ValidTarget(target) then
		local distance = GetDistanceSqr(target)
		if Warwick.hSet.useQ == 2 and isReady(_Q) and distance <= 350 ^ 2 then
    		CastSpell(_Q, target)
    		CastSpell2(_Q, D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
    	elseif Warwick.hSet.useQ == 3 and isReady(_Q) and distance <= 350 ^ 2 then
    		CastSpell(_Q, target)
    	end
    	if Warwick.hSet.useE == 2 and not eActive and isReady(_E) and distance <= 375 ^ 2 then
    		CastSpell(_E)
    	elseif Warwick.hSet.useE == 2 and eActive and isReady(_E) and distance <= 375 ^ 2 then
    		CastSpell(_E)
    	elseif Warwick.hSet.useE == 3 and not eActive and isReady(_E) and distance <= 375 ^ 2 then
    		CastSpell(_E)
    	end
	end
end

function Lasthit()
	if Warwick.lhSet.useQ == (2 or 3) then
		targetMinions:update()
		for i, targetMinion in pairs(targetMinions.objects) do
			if targetMinion ~= nil and ValidTarget(targetMinion) and GetDistanceSqr(targetMinion) <= 350 ^ 2 then
				if Warwick.lhSet.useQ == 2 and isReady(_Q) and GetDamage(_Q, targetMinion) > targetMinion.health then
    				CastSpell(_Q, targetMinion)
    				CastSpell2(_Q, D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
    			elseif Warwick.lhSet.useQ == 3 and isReady(_Q) and GetDamage(_Q, targetMinion) > targetMinion.health then
    				CastSpell(_Q, targetMinion)
    			end
			end
		end
	end
end

function Laneclear()
	if Warwick.lSet.useQ == (2 or 3) then
		targetMinions:update()
		for i, targetMinion in pairs(targetMinions.objects) do
			if targetMinion ~= nil and ValidTarget(targetMinion) and GetDistanceSqr(targetMinion) <= 350 ^ 2 then
				if Warwick.lhSet.useQ == 2 and isReady(_Q) and GetDamage(_Q, targetMinion) > targetMinion.health then
    				CastSpell(_Q, targetMinion)
    				CastSpell2(_Q, D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
    			elseif Warwick.lhSet.useQ == 3 and isReady(_Q) and GetDamage(_Q, targetMinion) > targetMinion.health then
    				CastSpell(_Q, targetMinion)
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
    	if jungleMinion ~= nil and ValidTarget(jungleMinion) then
    		local distance = GetDistance(jungleMinion)
    		if Warwick.jSet.useQ == 2 and isReady(_Q) and distance <= 350 ^ 2 then
    			CastSpell(_Q, jungleMinion)
    			CastSpell2(_Q, D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
    		elseif Warwick.jSet.useQ == 3 and isReady(_Q) and distance <= 350 ^ 2 then
    			CastSpell(_Q, jungleMinion)
    		end
    		if Warwick.jSet.useE == 2 and not eActive and isReady(_E) and distance <= 375 ^ 2 then
    			CastSpell(_E)
    		elseif Warwick.jSet.useE == 2 and eActive and isReady(_E) and distance <= 375 ^ 2 then
    			CastSpell(_E)
    		elseif Warwick.jSet.useE == 3 and not eActive and isReady(_E) and distance <= 375 ^ 2 then
    			CastSpell(_E)
    		end
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
  	if Warwick.Drawing.lfps then
    	if Warwick.Drawing.Qrange and isReady(_Q) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, 350, ARGB(Warwick.Drawing.Qcolor[1], Warwick.Drawing.Qcolor[2], Warwick.Drawing.Qcolor[3], Warwick.Drawing.Qcolor[4]))
    	elseif Warwick.Drawing.Qrange and not isReady(_Q) and isLevel(_Q) then
     		DrawCircle2(myHero.x, myHero.y, myHero.z, 350, ARGB(255, 255, 0, 0))
    	end
    	if Warwick.Drawing.Erange and isReady(_E) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, 375, ARGB(Warwick.Drawing.Ecolor[1], Warwick.Drawing.Ecolor[2], Warwick.Drawing.Ecolor[3], Warwick.Drawing.Ecolor[4]))
    	elseif Warwick.Drawing.Erange and not isReady(_E) and isLevel(_E) then
     		DrawCircle2(myHero.x, myHero.y, myHero.z, 375, ARGB(255, 255, 0, 0))
    	end
    	if Warwick.Drawing.Rrange and isReady(_R) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, rRange, ARGB(Warwick.Drawing.Rcolor[1], Warwick.Drawing.Rcolor[2], Warwick.Drawing.Rcolor[3], Warwick.Drawing.Rcolor[4]))
    	elseif Warwick.Drawing.Rrange and not isReady(_R) and isLevel(_R) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, rRange, ARGB(255,255,0,0))
    	end
  	else
    	if Warwick.Drawing.Qrange and isReady(_Q) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 350, ARGB(Warwick.Drawing.Qcolor[1], Warwick.Drawing.Qcolor[2], Warwick.Drawing.Qcolor[3], Warwick.Drawing.Qcolor[4]))
    	elseif Warwick.Drawing.Qrange and not isReady(_Q) and isLevel(_Q) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 350, ARGB(255, 255, 0, 0))
    	end
    	if Warwick.Drawing.Erange and isReady(_E) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 375, ARGB(Warwick.Drawing.Ecolor[1], Warwick.Drawing.Ecolor[2], Warwick.Drawing.Ecolor[3], Warwick.Drawing.Ecolor[4]))
    	elseif Warwick.Drawing.Erange and not isReady(_E) and isLevel(_E) then
     		DrawCircle(myHero.x, myHero.y, myHero.z, 375, ARGB(255, 255, 0, 0))
    	end
    	if Warwick.Drawing.Rrange and isReady(_R) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, rRange, ARGB(Warwick.Drawing.Rcolor[1], Warwick.Drawing.Rcolor[2], Warwick.Drawing.Rcolor[3], Warwick.Drawing.Rcolor[4]))
    	elseif Warwick.Drawing.Rrange and not isReady(_R) and isLevel(_R) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, rRange, ARGB(255,255,0,0))
    	end
  	end
  	if Warwick.Drawing.eDamage then
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