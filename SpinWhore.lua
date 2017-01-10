if myHero.charName ~= "Garen" then
	return 
end

--SexyPrint by Azero--
function SexyPrint(message) 
	local sexyName = "<font color=\"#FF5733\">[<b><i>Spin Whore</i></b>]</font>"
	local fontColor = "3393FF"
	print(sexyName .. " <font color=\"#" .. fontColor .. "\">" .. message .. "</font>")
end 

local version = "0.01"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.githubusercontent.com"
local UPDATE_PATH = "/Icesythe7/GOS/master/SpinWhore.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

if AUTOUPDATE then
	local ServerData = GetWebResult(UPDATE_HOST,"/Icesythe7/GOS/master/SpinWhore.version")
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

local targetMinions = minionManager(MINION_ENEMY, 650, myHero, MINION_SORT_MAXHEALTH_DEC)
local jungleMinions = minionManager(MINION_JUNGLE, 650, myHero, MINION_SORT_MAXHEALTH_DEC)
local qActive = false
local eActive = false
local skinMeta = 
{
	["Garen"] = {"Classic", "Sanguine", "Desert Trooper", "Commando", "Dreadknight", "Rugged", "Steel Legion", "Chroma Pack: Garnet", "Chroma Pack: Plum", "Chroma Pack: Ivory", "Rogue Admiral"}
}
local rPercent = 
{
	[1] = 0.275, [2] = 0.325, [3] = 0.395
}
local spellDmg = 
{
	[_Q] =
	function(unit)
		if (isReady(_Q) or qActive) then
			return myHero:CalcDamage(unit, (((myHero:GetSpellData(_Q).level * 25) + 5) + (myHero.totalDamage * 1.4)))
		end
	end,

	[_R] =
	function(unit)
		if isReady(_R) and isVillian(unit) then
			return ((myHero:GetSpellData(_R).level * 175) + ((unit.maxHealth - unit.health) * (rPercent[myHero:GetSpellData(_R).level])))
		elseif isReady(_R) and not isVillian(unit) then
			return myHero:CalcMagicDamage(unit, ((myHero:GetSpellData(_R).level * 175) + ((unit.maxHealth - unit.health) * (rPercent[myHero:GetSpellData(_R).level]))))
		end
	end
}

function Garen()
	Garen = scriptConfig("Garen", "Garen")

	Garen:addSubMenu("Combo", "cSet")
		Garen.cSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Garen.cSet:addParam("qrange", "Range to Activate Q", SCRIPT_PARAM_SLICE, 700, 300, 1000)
		Garen.cSet:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, true)
		Garen.cSet:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)
		Garen.cSet:addParam("useR", "Use R if can Kill", SCRIPT_PARAM_ONOFF, true)

	Garen:addSubMenu("Harass", "hSet")
		Garen.hSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Garen.hSet:addParam("qrange", "Range to Activate Q", SCRIPT_PARAM_SLICE, 700, 300, 1000)
		Garen.hSet:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)

	Garen:addSubMenu("LastHit", "lhSet")
		Garen.lhSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)

	Garen:addSubMenu("LaneClear", "lSet")
		Garen.lSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Garen.lSet:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)

	Garen:addSubMenu("JungleClear", "jSet")
		Garen.jSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Garen.jSet:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)

	Garen:addSubMenu("Misc", "misc")
		Garen.misc:addParam("Flee", "Flee Key", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("G"))
		Garen.misc:addParam("rsteal", "R KillSteal", SCRIPT_PARAM_ONOFF, true)
		Garen.misc:addParam("skins", myHero.charName .. " Skins", SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
  		Garen.misc:setCallback("skins", StartSkin)

	Garen:addSubMenu("Orbwalker", "Orbwalker")
		UOL:AddToMenu(Garen.Orbwalker)

	Garen:addSubMenu("Drawing", "Drawing") 
  		Garen.Drawing:addParam("lfps", "Low FPS Circles", SCRIPT_PARAM_ONOFF, true)
  		Garen.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Garen.Drawing:addParam("Erange", "Draw E Radius", SCRIPT_PARAM_ONOFF, true)
  		Garen.Drawing:addParam("Ecolor", "--> E Radius Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Garen.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Garen.Drawing:addParam("Rrange", "Draw R Range", SCRIPT_PARAM_ONOFF, true)
  		Garen.Drawing:addParam("Rcolor", "--> R Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Garen.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Garen.Drawing:addParam("eDamage", "Draw Enemy Damage", SCRIPT_PARAM_ONOFF, true)
end

function OnLoad()
	Garen()
	StartSkin()
	SexyPrint("Loaded!")
end

function StartSkin()
	local id = (Garen.misc.skins - 1)
	SetSkin(myHero, id)
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

function isVillian(target)
    for i = 1, target.buffCount do
        local buff = target:getBuff(i)
        if buff ~= nil and buff.name and buff.startT <= GetInGameTimer() and buff.endT >= GetInGameTimer() then
            if buff.name:lower() == "garenpassiveenemytarget" then
            	return true 
            end
        end
    end
    return false
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

function MoveToCursor()
  if GetDistance(mousePos) > 1 then
    local moveToPos = myHero + (Vector(mousePos) - myHero):normalized() * 300
    myHero:MoveTo(moveToPos.x, moveToPos.z)
  end 
end

function Flee()
	MoveToCursor()
	if isReady(_Q) and not qActive then
		CastSpell(_Q)
		UOL:ResetAA()
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

function OnProcessSpell(unit, spell)
	if unit.isMe then
		if spell.name == "GarenQ" then
			qActive = true
		elseif spell.name == "GarenE" then 
			eActive = true
		end
	end
end

function OnRemoveBuff(unit, buff)
	if unit ~= nil and buff ~= nil and unit.isMe then
		if buff.name == "GarenQ" then
			qActive = false
		elseif buff.name == "GarenE" then 
			eActive = false
		end
	end
end

function OnTick()
	if myHero.dead then
		return 
	end
	if eActive then
		UOL:SetAttacks(false)
	else
		UOL:SetAttacks(true)
	end
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
	if Garen.misc.Flee then
		Flee()
	end
	if Garen.misc.rsteal then
		Killsteal()
	end
end

function Combo()
	local target = GetTarget(1000)
	if target ~= nil and ValidTarget(target) then
		local distance = GetDistanceSqr(target)
		if Garen.cSet.useR and isReady(_R) and distance < 400 * 400 and GetDamage(_R, target) > target.health then
			CastSpell(_R, target)
		end
		if Garen.cSet.useW and isReady(_W) and distance < 500 * 500 then
			CastSpell(_W)
		end
		if Garen.cSet.useQ and isReady(_Q) and not eActive and distance < Garen.cSet.qrange * Garen.cSet.qrange then
			CastSpell(_Q)
			UOL:ResetAA()
		elseif Garen.cSet.useE and isReady(_E) and not qActive and not eActive and distance <= 325 * 325 then
			CastSpell(_E)
		end
	end
end

function Harass()
	local target = GetTarget(1000)
	if target ~= nil and ValidTarget(target) then
		local distance = GetDistanceSqr(target)
		if Garen.hSet.useQ and isReady(_Q) and not eActive and distance < Garen.hSet.qrange * Garen.hSet.qrange then
			CastSpell(_Q)
			UOL:ResetAA()
		elseif Garen.hSet.useE and isReady(_E) and not qActive and distance <= 325 * 325 then
			CastSpell(_E)
		end
	end
end

function Lasthit()
	targetMinions:update()
	if Garen.lhSet.useQ then
		for i, targetMinion in pairs(targetMinions.objects) do
			if (isReady(_Q) or qActive) and targetMinion ~= nil and ValidTarget(targetMinion) and GetDistanceSqr(targetMinion) <= 300 * 300 and GetDamage(_Q, targetMinion) > targetMinion.health then
				UOL:ForceTarget(targetMinion)
				if not qActive then
					UOL:ForceTarget(targetMinion)
					CastSpell(_Q)
					UOL:ResetAA()
				end
			end
		end
	end
end

function Laneclear()
	targetMinions:update()
	for i, targetMinion in pairs(targetMinions.objects) do
		if targetMinion ~= nil and ValidTarget(targetMinion) then
			local distance = GetDistanceSqr(targetMinion)
			if Garen.lSet.useQ and isReady(_Q) and not eActive and distance < 300 * 300 then
				CastSpell(_Q)
				UOL:ResetAA()
			elseif Garen.lSet.useE and isReady(_E) and not qActive and distance < 325 * 325 then
				CastSpell(_E)
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
    		local distance = GetDistanceSqr(jungleMinion)
    		if Garen.jSet.useQ and isReady(_Q) and not eActive and not qActive and distance < 300 * 300 then
    			CastSpell(_Q)
    			UOL:ResetAA()
    		elseif Garen.jSet.useE and isReady(_E) and not eActive and not qActive and distance < 325 * 325 then
    			CastSpell(_E)
    		end
    	end
    end
end

function Killsteal()
	for _, enemy in pairs(GetEnemyHeroes()) do
		if enemy ~= nil and ValidTarget(enemy) then
			if isReady(_R) and GetDistanceSqr(enemy) < 400 * 400 and GetDamage(_R, enemy) > enemy.health then
				CastSpell(_R, enemy)
			end
    	end
	end
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

function OnDraw()
	if myHero.dead then
    	return
  	end
  	if Garen.Drawing.lfps then
  		if Garen.Drawing.Erange and (isReady(_E) or eActive) then 
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 325, ARGB(Garen.Drawing.Ecolor[1], Garen.Drawing.Ecolor[2], Garen.Drawing.Ecolor[3], Garen.Drawing.Ecolor[4]))
  		elseif Garen.Drawing.Erange and not isReady(_E) and isLevel(_E) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 325, ARGB(255, 255, 0, 0))
  		end
  		if Garen.Drawing.Rrange and isReady(_R) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 400, ARGB(Garen.Drawing.Rcolor[1], Garen.Drawing.Rcolor[2], Garen.Drawing.Rcolor[3], Garen.Drawing.Rcolor[4]))
  		elseif Garen.Drawing.Rrange and not isReady(_R) and isLevel(_R) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 400, ARGB(255,255,0,0))
  		end
	else
  		if Garen.Drawing.Erange and (isReady(_E) or eActive)  then 
    		DrawCircle(myHero.x, myHero.y, myHero.z, 325, ARGB(Garen.Drawing.Ecolor[1], Garen.Drawing.Ecolor[2], Garen.Drawing.Ecolor[3], Garen.Drawing.Ecolor[4]))
  		elseif Garen.Drawing.Erange and not isReady(_E) and isLevel(_E) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 325, ARGB(255, 255, 0, 0))
  		end
  		if Garen.Drawing.Rrange and isReady(_R) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 400, ARGB(Garen.Drawing.Rcolor[1], Garen.Drawing.Rcolor[2], Garen.Drawing.Rcolor[3], Garen.Drawing.Rcolor[4]))
  		elseif Garen.Drawing.Rrange and not isReady(_R) and isLevel(_R) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 400, ARGB(255,255,0,0))
  		end
  	end
  	if Garen.Drawing.eDamage then
		for i, enemy in pairs(GetEnemyHeroes()) do
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