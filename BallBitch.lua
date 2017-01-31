if myHero.charName ~= "Orianna" then
	return
end

-- http://bol-tools.com/ tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("zkcoidJZDxlZR45F")

--SexySexyPrint by Azero--
function SexyPrint(message)
   local sexyName = "<font color=\"#FF5733\">[<b><i>Ball Bitch</i></b>]</font>"
   local fontColor = "3393FF"
   print(sexyName .. " <font color=\"#" .. fontColor .. "\">" .. message .. "</font>")
end

local version = "0.02"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.githubusercontent.com"
local UPDATE_PATH = "/Icesythe7/GOS/master/BallBitch.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

if AUTOUPDATE then
	local ServerData = GetWebResult(UPDATE_HOST,"/Icesythe7/GOS/master/BallBitch.version")
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

UPL:AddSpell(_Q, {speed = 1150, delay = 0.25, range = 815, width = 140, collision = false, aoe = true, type = "linear"})

local ts = TargetSelector(TARGET_LESS_CAST, 900)
local enemies = GetEnemyHeroes()
local allies = GetAllyHeroes()
local jungleMinions = minionManager(MINION_JUNGLE, 815, myHero, MINION_SORT_MAXHEALTH_DEC)
local targetMinions = minionManager(MINION_ENEMY, 1100, myHero, MINION_SORT_MAXHEALTH_DEC)
local hasBall = true
local ballPos = myHero
local spellDmg = 
{

	[_Q] =
  	function(unit)
    	if isReady(_Q) then
      		return myHero:CalcMagicDamage(unit, (((myHero:GetSpellData(_Q).level * 30) + 30) + (myHero.ap * 0.5)))
    	end
  	end,

  	[_W] =
  	function(unit)
    	if isReady(_W) then
      		return myHero:CalcMagicDamage(unit, (((myHero:GetSpellData(_W).level * 45) + 25) + (myHero.ap * 0.7)))
    	end
  	end,

  	[_E] =
  	function(unit)
    	if isReady(_E) then
      		return myHero:CalcMagicDamage(unit, (((myHero:GetSpellData(_E).level * 30) + 30) + (myHero.ap * 0.3)))
    	end
  	end,

  	[_R] =
  	function(unit)
    	if isReady(_R) then
      		return myHero:CalcMagicDamage(unit, (((myHero:GetSpellData(_R).level * 75) + 75) + (myHero.ap * 0.7)))
    	end
  	end
}
local skinMeta = 
{
	["Orianna"] = {"Classic", "Gothic", "Sewn Chaos", "Bladecraft", "TPA", "Winter Wonder", "Heartseeker"}
}

function Orianna()
	Ori = scriptConfig("Ball Bitch", "Orianna")
	
	Ori:addSubMenu("Combo Settings", "ComboSettings")
		Ori.ComboSettings:addParam("UseQ", "Use Q in 'Combo'", SCRIPT_PARAM_ONOFF, true)
	  	Ori.ComboSettings:addParam("UseW", "Use W in 'Combo'", SCRIPT_PARAM_ONOFF, true)
	  	Ori.ComboSettings:addParam("UseE", "Use E in 'Combo'", SCRIPT_PARAM_ONOFF, true)
		Ori.ComboSettings:addParam("UseR", "Use R in 'Combo'", SCRIPT_PARAM_ONOFF, true)

	--[[Ori:addSubMenu("Harass Settings", "HarassSettings")
	  	Ori.HarassSettings:addParam("UseQ", "Use Q in 'Harass'", SCRIPT_PARAM_ONOFF, true)
	  	Ori.HarassSettings:addParam("UseW", "Use W in 'Harass'", SCRIPT_PARAM_ONOFF, true)
	  	Ori.HarassSettings:addParam("UseE", "Use E in 'Harass'", SCRIPT_PARAM_ONOFF, true)]] 

	Ori:addSubMenu("LaneClear Settings", "ClearSettings")
	  	Ori.ClearSettings:addParam("UseQ", "Use Q in 'LaneClear'", SCRIPT_PARAM_ONOFF, true)
	  	Ori.ClearSettings:addParam("UseW", "Use W in 'LaneClear'", SCRIPT_PARAM_ONOFF, true)
	  	Ori.ClearSettings:addParam("Whit", "Minimum #Minions Hit W", SCRIPT_PARAM_SLICE, 3, 1, 6)
	  	Ori.ClearSettings:addParam("UseE", "Use E in 'LaneClear'", SCRIPT_PARAM_ONOFF, true)
	  	Ori.ClearSettings:addParam("Ehit", "Minimun #Minions Hit E", SCRIPT_PARAM_SLICE, 2, 1, 6)

	Ori:addSubMenu("Jungle Settings", "JungleSettings")
	  	Ori.JungleSettings:addParam("UseQ", "Use Q in 'Jungle'", SCRIPT_PARAM_ONOFF, true)
	  	Ori.JungleSettings:addParam("UseW", "Use W in 'Jungle'", SCRIPT_PARAM_ONOFF, true)
	  	Ori.JungleSettings:addParam("UseE", "Use E in 'Jungle'", SCRIPT_PARAM_ONOFF, true)

	Ori:addSubMenu("Misc", "Misc")
	  	Ori.Misc:addParam("Flee", "Flee Key", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("G"))
	  	Ori.Misc:addParam("BlockR", "Block R if will Miss", SCRIPT_PARAM_ONOFF, true)
	  	Ori.Misc:addParam("AutoR", "Auto Ult #Enemies", SCRIPT_PARAM_LIST, 4, {"Off", "1", "2", "3", "4", "5"})
	  	Ori.Misc:addParam("skins", myHero.charName .. " Skins", SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
	  	Ori.Misc:setCallback("skins", StartSkin)

	Ori:addSubMenu("Prediction", "pred")
  		UPL:AddToMenu(Ori.pred)

  	Ori:addSubMenu("Orbwalker", "Orbwalker")
  		UOL:AddToMenu(Ori.Orbwalker)

	Ori:addSubMenu("Drawing", "Drawing")
	  	Ori.Drawing:addParam("lfps", "Low FPS Circles", SCRIPT_PARAM_ONOFF, true)
	  	Ori.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
	  	Ori.Drawing:addParam("Qrange", "Draw Q Range", SCRIPT_PARAM_ONOFF, true)
	  	Ori.Drawing:addParam("Qcolor", "--> Q Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
	  	Ori.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
	  	Ori.Drawing:addParam("Wradius", "Draw W Radius", SCRIPT_PARAM_ONOFF, true)
	  	Ori.Drawing:addParam("Wcolor", "--> W Radius Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
	  	Ori.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
	  	Ori.Drawing:addParam("Erange", "Draw E Range", SCRIPT_PARAM_ONOFF, true)
	  	Ori.Drawing:addParam("Ecolor", "--> E Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
	  	Ori.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
	  	Ori.Drawing:addParam("Rradius", "Draw R Radius", SCRIPT_PARAM_ONOFF, false)
	  	Ori.Drawing:addParam("Rcolor", "--> R Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
	  	Ori.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
	  	Ori.Drawing:addParam("eDamage", "Draw Enemy Damage", SCRIPT_PARAM_ONOFF, true)
end

function OnLoad()
	Orianna()
	if myHero.modelName ~= "Orianna" then
		hasBall = false
		for i, ally in pairs(allies) do
			for i = 1, ally.buffCount do
    			local buff = ally:getBuff(i)
    			if buff and buff.valid and (buff.name == "orianaredactshield" or buff.name == "orianaghost") then 
    				ballPos = ally
    			end
    		end
    	end
		for i = 1, objManager.maxObjects do
    		local obj = objManager:GetObject(i)
    		if obj ~= nil and obj.team == myHero.team and obj.name == "TheDoomBall" then
    			ballPos = obj
    		end
		end
	end
	StartSkin()
	SexyPrint("Version " ..version.. " Loaded!")
end

function StartSkin()
	local id = (Ori.Misc.skins - 1)
	if myHero.modelName == "Orianna" then
  		SetSkin(myHero, id)
  	else 
  		SetSkin(myHero, myHero.modelName, id)
  		SetSkin(ballPos, id)
  	end
end

function isReady(slot)
    return (myHero:CanUseSpell(slot) == READY)
end

function isLevel(slot)
	return (myHero:GetSpellData(slot).level > 0)
end

function CountObjectsOnLineSegment(StartPos, EndPos, width, objects)
	local n = 0
    for i, object in pairs(objects) do
  		if object.valid and not object.dead then
   			local pointSegment, pointLine, isOnSegment = VectorPointProjectionOnLineSegment(StartPos, EndPos, object)
   			local pointSegment3D = {x = pointSegment.x, y = object.y, z = pointSegment.y}
   			if isOnSegment and pointSegment3D and GetDistanceSqr(pointSegment3D, object) < ((object.boundingRadius + width) ^ 2) then
    			n = n + 1
   			end
  		end
    end
    return n
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
    	if GetDistanceSqr(minion, Pos) < radius ^ 2 then
      		count = count + 1
    	end
  	end
  	return count
end

function OnCreateObj(obj)
	if obj.valid and obj.team == myHero.team then
		if obj.type == "MissileClient" and (obj.spellName == "OrianaIzuna" or obj.spellName == "OrianaRedact") then
			ballPos = obj
		elseif obj.name == "TheDoomBall" then
			ballPos = obj
			SetSkin(ballPos, Ori.Misc.skins - 1)
		end
	end
end

function OnUpdateBuff(unit, buff)
	if unit ~= nil and unit.isMe and buff ~= nil and buff.name == "orianaghostself" then
		hasBall = true
		SetSkin(myHero, Ori.Misc.skins - 1)
	end
	if unit ~= nil and unit.team == myHero.team and buff ~= nil and (buff.name == "orianaredactshield" or buff.name == "orianaghost") then
		ballPos = unit
	end
end

function OnRemoveBuff(unit, buff)
	if unit ~= nil and unit.isMe and buff ~= nil and buff.name == "orianaghostself" then
		hasBall = false
		SetSkin(myHero, "OriannaNoBall", Ori.Misc.skins - 1)
	end
end

function OnCastSpell(iSpell, startPos, endPos, targetUnit)
	if Ori.Misc.BlockR and iSpell == 3 and CountEnemyHeroInRange(400, ballPos) == 0 then
		BlockSpell()
		SexyPrint("R Blocked!")
	end
end

function OnTick()
	if myHero.dead then 
		return
	end
	if Ori.Misc.AutoR ~= 1 and isReady(_R) then
		if CountEnemyHeroInRange(400, ballPos) >= (Ori.Misc.AutoR - 1) then
			CastSpell(_R)
		end
	end
	if Ori.Misc.Flee then
		Flee()
	end
	if myHero.modelName == "Orianna" and ballPos ~= myHero then
		ballPos = myHero
	end
	if UOL:GetOrbWalkMode() == "Combo" then
    	Combo()
  	elseif UOL:GetOrbWalkMode() == "LaneClear" then
    	Laneclear()
    	Jungleclear()
  	end
end

function moveToCursor()
	if GetDistance(mousePos) > 1 then
    	local moveToPos = myHero + (Vector(mousePos) - myHero):normalized() * 300
    	myHero:MoveTo(moveToPos.x, moveToPos.z)
  	end
end

function Flee()
	moveToCursor()
	if hasBall and isReady(_W) then
		CastSpell(_W)
	elseif not hasBall and isReady(_E) then
		CastSpell(_E, myHero)
	end
end

function Combo()
	ts:update()
	local target = ts.target
	if target ~= nil and ValidTarget(target) then
		UOL:ForceTarget(target)
    	local distance = GetDistanceSqr(target)
    	if Ori.ComboSettings.UseR and isReady(_R) and (GetDamage(_Q, target) + GetDamage(_W, target) + GetDamage(_R, target)) > target.health and GetDistanceSqr(ballPos, target) < 400 ^ 2 then
    		CastSpell(_R)
    	end
    	if Ori.ComboSettings.UseW and isReady(_W) and GetDistanceSqr(ballPos, target) < 250 ^ 2 then
    		CastSpell(_W)
    	end
    	if Ori.ComboSettings.UseE and isReady(_E) and CountObjectsOnLineSegment(ballPos, myHero, 140, enemies) >= 1 then
    		CastSpell(_E, myHero)
    	end
    	if Ori.ComboSettings.UseQ and isReady(_Q) and distance < 815 ^ 2 then
    		local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, ballPos, target)
        	if CastPosition and HitChance > 0 then
          		CastSpell(_Q, CastPosition.x, CastPosition.z)
        	end
    	end
    	if isReady(_E) and distance < GetDistanceSqr(ballPos, target) then 
    		CastSpell(_E, myHero)
    	end
    end
end

function Laneclear()
	targetMinions:update()
  	for i, targetMinion in pairs(targetMinions.objects) do
    	if targetMinion ~= nil and ValidTarget(targetMinion) then 
      		local distance = GetDistanceSqr(targetMinion)
      		if Ori.ClearSettings.UseQ and isReady(_Q) and distance < 815 ^ 2 then
      			local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, ballPos, targetMinion)
        		if CastPosition and HitChance > 0 then
          			CastSpell(_Q, CastPosition.x, CastPosition.z)
        		end
      		end
      		if Ori.ClearSettings.UseW and isReady(_W) and GetDistanceSqr(ballPos, targetMinion) < 250 ^ 2 and GetMinionsHit(targetMinion, 250) >= Ori.ClearSettings.Whit then
      			CastSpell(_W)
      		end
      		if Ori.ClearSettings.UseE and isReady(_E) and CountObjectsOnLineSegment(ballPos, myHero, 140, targetMinions.objects) >= Ori.ClearSettings.Ehit then
      			CastSpell(_E, myHero)
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
      		if Ori.JungleSettings.UseQ and isReady(_Q) and distance < 815 ^ 2 then
      			local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, ballPos, jungleMinion)
        		if CastPosition and HitChance > 0 then
          			CastSpell(_Q, CastPosition.x, CastPosition.z)
        		end
      		end
      		if Ori.JungleSettings.UseW and isReady(_W) and GetDistanceSqr(ballPos, jungleMinion) < 250 ^ 2 then
      			CastSpell(_W)
      		end
      		if Ori.JungleSettings.UseE and isReady(_E) then
      			CastSpell(_E, myHero)
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
	if Ori.Drawing.lfps then
    	if Ori.Drawing.Qrange and isReady(_Q) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, 815, ARGB(Ori.Drawing.Qcolor[1], Ori.Drawing.Qcolor[2], Ori.Drawing.Qcolor[3], Ori.Drawing.Qcolor[4]))
    	elseif Ori.Drawing.Qrange and not isReady(_Q) and isLevel(_Q) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, 815, ARGB(255, 255, 0, 0))
    	end
    	if Ori.Drawing.Wradius and isReady(_W) then
      		DrawCircle2(ballPos.x, ballPos.y, ballPos.z, 250, ARGB(Ori.Drawing.Wcolor[1], Ori.Drawing.Wcolor[2], Ori.Drawing.Wcolor[3], Ori.Drawing.Wcolor[4]))
    	elseif Ori.Drawing.Wradius and not isReady(_W) and isLevel(_W) then
      		DrawCircle2(ballPos.x, ballPos.y, ballPos.z, 250, ARGB(255, 255, 0, 0))
    	end
    	if Ori.Drawing.Erange and isReady(_E) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, 1100, ARGB(Ori.Drawing.Ecolor[1], Ori.Drawing.Ecolor[2], Ori.Drawing.Ecolor[3], Ori.Drawing.Ecolor[4]))
    	elseif Ori.Drawing.Erange and not isReady(_E) and isLevel(_E) then
      		DrawCircle2(myHero.x, myHero.y, myHero.z, 1100, ARGB(255, 255, 0, 0))
    	end
    	if Ori.Drawing.Rradius and isReady(_R) then
      		DrawCircle2(ballPos.x, ballPos.y, ballPos.z, 400, ARGB(Ori.Drawing.Rcolor[1], Ori.Drawing.Rcolor[2], Ori.Drawing.Rcolor[3], Ori.Drawing.Rcolor[4]))
    	elseif Ori.Drawing.Rradius and not isReady(_R) and isLevel(_R) then
      		DrawCircle2(ballPos.x, ballPos.y, ballPos.z, 400, ARGB(255,255,0,0))
    	end
  	else
    	if Ori.Drawing.Qrange and isReady(_Q) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 815, ARGB(Ori.Drawing.Qcolor[1], Ori.Drawing.Qcolor[2], Ori.Drawing.Qcolor[3], Ori.Drawing.Qcolor[4]))
    	elseif Ori.Drawing.Qrange and not isReady(_Q) and isLevel(_Q) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 815, ARGB(255, 255, 0, 0))
    	end
    	if Ori.Drawing.Wradius and isReady(_W) then
      		DrawCircle(ballPos.x, ballPos.y, ballPos.z, 250, ARGB(Ori.Drawing.Wcolor[1], Ori.Drawing.Wcolor[2], Ori.Drawing.Wcolor[3], Ori.Drawing.Wcolor[4]))
    	elseif Ori.Drawing.Wradius and not isReady(_W) and isLevel(_W) then
      		DrawCircle(ballPos.x, ballPos.y, ballPos.z, 250, ARGB(255, 255, 0, 0))
    	end
    	if Ori.Drawing.Erange and isReady(_E) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 1100, ARGB(Ori.Drawing.Ecolor[1], Ori.Drawing.Ecolor[2], Ori.Drawing.Ecolor[3], Ori.Drawing.Ecolor[4]))
    	elseif Ori.Drawing.Erange and not isReady(_E) and isLevel(_E) then
      		DrawCircle(myHero.x, myHero.y, myHero.z, 1100, ARGB(255, 255, 0, 0))
    	end
    	if Ori.Drawing.Rradius and isReady(_R) then
      		DrawCircle(ballPos.x, ballPos.y, ballPos.z, 400, ARGB(Ori.Drawing.Rcolor[1], Ori.Drawing.Rcolor[2], Ori.Drawing.Rcolor[3], Ori.Drawing.Rcolor[4]))
    	elseif Ori.Drawing.Rradius and not isReady(_R) and isLevel(_R) then
      		DrawCircle(ballPos.x, ballPos.y, ballPos.z, 400, ARGB(255,255,0,0))
    	end
  	end
  	if Ori.Drawing.eDamage then
    	for i, enemy in pairs(enemies) do
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