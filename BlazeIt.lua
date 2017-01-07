if myHero.charName ~= "Brand" then
	return 
end

-- http://bol-tools.com/ tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("6BtXkHMlOFAYfZsA")

--SexyPrint by Azero--
function SexyPrint(message) 
	local sexyName = "<font color=\"#FF5733\">[<b><i>Blaze It</i></b>]</font>"
	local fontColor = "3393FF"
	print(sexyName .. " <font color=\"#" .. fontColor .. "\">" .. message .. "</font>")
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

local version = "0.12"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.githubusercontent.com"
local UPDATE_PATH = "/Icesythe7/GOS/master/BlazeIt.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

if AUTOUPDATE then
	local ServerData = GetWebResult(UPDATE_HOST,"/Icesythe7/GOS/master/BlazeIt.version")
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

UPL:AddSpell(_Q, {speed = 1600, delay = 0.25, range = 1050, width = 60, collision = true, aoe = false, type = "linear"})
UPL:AddSpell(_W, {speed = math.huge, delay = 0.875, range = 900, width = 240, collision = false, aoe = true, type = "circular"})
local targetMinions = minionManager(MINION_ENEMY, 1050, myHero, MINION_SORT_MAXHEALTH_DEC)
local jungleMinions = minionManager(MINION_JUNGLE, 1050, myHero, MINION_SORT_MAXHEALTH_DEC)
local skinMeta = 
{
	["Brand"] = {"Classic", "Apocalyptic", "Vandal", "Cryocore", "Zombie", "Spirit Fire"}
}

local spellDmg = 
{
	[_Q] =
	function(unit)
		if isReady(_Q) then
			return myHero:CalcMagicDamage(unit, (((myHero:GetSpellData(_Q).level * 30) + 50) + (myHero.ap * 0.55)))
		end
	end,

	[_W] =
	function(unit)
		if isReady(_W) then
			return myHero:CalcMagicDamage(unit, (((myHero:GetSpellData(_W).level * 45) + 30) + (myHero.ap * 0.6)))
		end
	end,

	[_E] =
	function(unit)
		if isReady(_E) then
			return myHero:CalcMagicDamage(unit, (((myHero:GetSpellData(_E).level * 20) + 50) + (myHero.ap * 0.35)))
		end
	end,

	[_R] =
	function(unit)
		if isReady(_R) then
			return myHero:CalcMagicDamage(unit, (((myHero:GetSpellData(_R).level * 100) + (myHero.ap * 0.25)) * GetBounces(unit)))
		end
	end
}

function BlazeIt()
	Blaze = scriptConfig("Blaze It", "Blaze It")

	Blaze:addSubMenu("Combo", "cSet")
		Blaze.cSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Blaze.cSet:addParam("qMode", "Q Mode", SCRIPT_PARAM_LIST, 1, {"Stun Only", "Always"})
		Blaze.cSet:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, true)
		Blaze.cSet:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)
		Blaze.cSet:addParam("useR", "Use R", SCRIPT_PARAM_ONOFF, true)
		Blaze.cSet:addParam("rMode", "R Mode", SCRIPT_PARAM_LIST, 3, {"Can Kill", "#Enemies", "Both"})
		Blaze.cSet:addParam("rMode2", "#Enemies to Ult", SCRIPT_PARAM_SLICE, 2, 1, 5)

	Blaze:addSubMenu("Harass", "hSet")
		Blaze.hSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Blaze.hSet:addParam("qMode", "Q Mode", SCRIPT_PARAM_LIST, 1, {"Stun Only", "Always"})
		Blaze.hSet:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, true)
		Blaze.hSet:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)

	Blaze:addSubMenu("LaneClear", "lSet")
		Blaze.lSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, false)
		Blaze.lSet:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, true)
		Blaze.lSet:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)

	Blaze:addSubMenu("JungleClear", "jSet")
		Blaze.jSet:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Blaze.jSet:addParam("qMode", "Q Mode", SCRIPT_PARAM_LIST, 1, {"Stun Only", "Always"})
		Blaze.jSet:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, true)
		Blaze.jSet:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)

	Blaze:addSubMenu("Misc", "misc")
		Blaze.misc:addParam("skins", myHero.charName .. " Skins", SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
  		Blaze.misc:setCallback("skins", StartSkin)

	Blaze:addSubMenu("Prediction", "Pred")
		UPL:AddToMenu(Blaze.Pred)

	Blaze:addSubMenu("Orbwalker", "Orbwalker")
		UOL:AddToMenu(Blaze.Orbwalker)

	Blaze:addSubMenu("Drawing", "Drawing") 
  		Blaze.Drawing:addParam("lfps", "Low FPS Circles", SCRIPT_PARAM_ONOFF, true)
  		Blaze.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Blaze.Drawing:addParam("Qrange", "Draw Q Range", SCRIPT_PARAM_ONOFF, true)
  		Blaze.Drawing:addParam("Qcolor", "--> Q Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Blaze.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Blaze.Drawing:addParam("Wrange", "Draw W Range", SCRIPT_PARAM_ONOFF, true)
  		Blaze.Drawing:addParam("Wcolor", "--> W Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Blaze.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Blaze.Drawing:addParam("Erange", "Draw E Range", SCRIPT_PARAM_ONOFF, true)
  		Blaze.Drawing:addParam("Ecolor", "--> E Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Blaze.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Blaze.Drawing:addParam("Rrange", "Draw R Range", SCRIPT_PARAM_ONOFF, true)
  		Blaze.Drawing:addParam("Rcolor", "--> R Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Blaze.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
end

function OnLoad()
	BlazeIt()
	SexyPrint("Version " ..version.. " Loaded!")
	StartSkin()
end

function StartSkin()
	local id = (Blaze.misc.skins - 1)
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

function OnFire(target)
    for i = 1, target.buffCount do
        local buff = target:getBuff(i)
        if buff ~= nil and buff.name and buff.startT <= GetInGameTimer() and buff.endT >= GetInGameTimer() then
            if buff.name:lower() == "brandablaze" then 
            	return true 
            end
        end
    end
    return false
end

function TableMerge(t1, t2)
    for i = 1, #t2 do
        t1[#t1 + 1] = t2[i]
    end
    return t1
end

function GetRAoeNear(unit)
	local obj = TableMerge(targetMinions.objects, GetEnemyHeroes())
	local obj2 = TableMerge(obj, jungleMinions.objects)
	local count = 0
  	for i, target in pairs(obj2) do
  		if not target.name:find("Plant") then
    		if GetDistanceSqr(target, unit) < 450 * 450 and target.charName ~= unit.charName then
      			count = count + 1
    		end
    	end
  	end
  	return count
end

function GetBounces(unit)
	local m = GetRAoeNear(unit)
	local bounces = 1
	if m >= 1 then 
		bounces = 3
	end
	return bounces
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
		return SxOrb:GetTarget(range) --test
	elseif orb == "SOW" then 
		return SOWVP:GetTarget(range) 
	elseif orb == "BFW" then 
		return Orbwalk_GetTarget(range) --test
	else
		return nil
	end
end

function OnTick()
	if myHero.dead then
		return 
	end
	targetMinions:update()
	jungleMinions:update()
	if UOL:GetOrbWalkMode() == "Combo" then
		Combo()
	elseif UOL:GetOrbWalkMode() == "Harass" then
		Harass()
	elseif UOL:GetOrbWalkMode() == "LaneClear" then
		Laneclear()
		Jungleclear()
	end
end

function Combo()
	local target = GetTarget(1100)
	if target ~= nil and ValidTarget(target) then
		local distance = GetDistanceSqr(target)
		if CountEnemyHeroInRange(450, target) >= 2 then
			if OnFire(target) then
				if Blaze.cSet.useE and isReady(_E) and distance <= 625 * 625 then 
					CastSpell(_E, target)
				end
				if Blaze.cSet.useQ and isReady(_Q) and distance <= 1050 * 1050 then 
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
					if CastPosition and HitChance > 0 then 
						CastSpell(_Q, CastPosition.x, CastPosition.z)
					end
				end
				if Blaze.cSet.useW and isReady(_W) and distance <= 900 * 900 then
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
					if CastPosition and HitChance > 0 then 
						CastSpell(_W, CastPosition.x, CastPosition.z)
					end
				end
				if Blaze.cSet.useR and (Blaze.cSet.rMode == 2 or Blaze.cSet.rMode == 3) and CountEnemyHeroInRange(450, target) >= Blaze.cSet.rMode2 then
					CastSpell(_R, target)
				end
				if Blaze.cSet.useR and (Blaze.cSet.rMode == 1 or Blaze.cSet.rMode == 3) and GetDamage(_R, target) > target.health then
					CastSpell(_R, target)
				end
			else
				if Blaze.cSet.useW and isReady(_W) and distance <= 900 * 900 then
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
					if CastPosition and HitChance > 0 then 
						CastSpell(_W, CastPosition.x, CastPosition.z)
					end
				end
				if Blaze.cSet.useQ and Blaze.cSet.qMode == 2 and isReady(_Q) and distance <= 1050 * 1050 then 
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
					if CastPosition and HitChance > 0 then 
						CastSpell(_Q, CastPosition.x, CastPosition.z)
					end
				end
				if Blaze.cSet.useE and isReady(_E) and distance <= 625 * 625 then 
					CastSpell(_E, target)
				end
				if Blaze.cSet.useR and (Blaze.cSet.rMode == 2 or Blaze.cSet.rMode == 3) and CountEnemyHeroInRange(450, target) >= Blaze.cSet.rMode2 then
					CastSpell(_R, target)
				end
				if Blaze.cSet.useR and (Blaze.cSet.rMode == 1 or Blaze.cSet.rMode == 3) and GetDamage(_R, target) > target.health then
					CastSpell(_R, target)
				end
			end
		else
			if OnFire(target) then
				if Blaze.cSet.useQ and isReady(_Q) and distance <= 1050 * 1050 then 
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
					if CastPosition and HitChance > 0 then 
						CastSpell(_Q, CastPosition.x, CastPosition.z)
					end
				end
				if Blaze.cSet.useW and isReady(_W) and distance <= 900 * 900 then
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
					if CastPosition and HitChance > 0 then 
						CastSpell(_W, CastPosition.x, CastPosition.z)
					end
				end
				if Blaze.cSet.useE and isReady(_E) and distance <= 625 * 625 then 
					CastSpell(_E, target)
				end
				if Blaze.cSet.useR and (Blaze.cSet.rMode == 2 or Blaze.cSet.rMode == 3) and CountEnemyHeroInRange(450, target) >= Blaze.cSet.rMode2 then
					CastSpell(_R, target)
				end
				if Blaze.cSet.useR and (Blaze.cSet.rMode == 1 or Blaze.cSet.rMode == 3) and GetDamage(_R, target) > target.health then
					CastSpell(_R, target)
				end
			else
				if Blaze.cSet.useW and isReady(_W) and distance <= 900 * 900 then
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
					if CastPosition and HitChance > 0 then 
						CastSpell(_W, CastPosition.x, CastPosition.z)
					end
				end
				if Blaze.cSet.useE and isReady(_E) and distance <= 625 * 625 then 
					CastSpell(_E, target)
				end
				if Blaze.cSet.useQ and Blaze.cSet.qMode == 2 and isReady(_Q) and distance <= 1050 * 1050 then 
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
					if CastPosition and HitChance > 0 then 
						CastSpell(_Q, CastPosition.x, CastPosition.z)
					end
				end
				if Blaze.cSet.useR and (Blaze.cSet.rMode == 2 or Blaze.cSet.rMode == 3) and CountEnemyHeroInRange(450, target) >= Blaze.cSet.rMode2 then
					CastSpell(_R, target)
				end
				if Blaze.cSet.useR and (Blaze.cSet.rMode == 1 or Blaze.cSet.rMode == 3) and GetDamage(_R, target) > target.health then
					CastSpell(_R, target)
				end
			end
		end
	end
end

function Harass()
	local target = GetTarget(1100)
	if target ~= nil and ValidTarget(target) then
		local distance = GetDistanceSqr(target)
		if OnFire(target) then
			if Blaze.hSet.useQ and isReady(_Q) and distance <= 1050 * 1050 then 
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
				if CastPosition and HitChance > 0 then 
					CastSpell(_Q, CastPosition.x, CastPosition.z)
				end
			end
			if Blaze.hSet.useW and isReady(_W) and distance <= 900 * 900 then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
				if CastPosition and HitChance > 0 then 
					CastSpell(_W, CastPosition.x, CastPosition.z)
				end
			end
			if Blaze.hSet.useE and isReady(_E) and distance <= 625 * 625 then 
				CastSpell(_E, target)
			end
		else
			if Blaze.hSet.useQ and Blaze.hSet.qMode == 2 and isReady(_Q) and distance <= 1050 * 1050 then 
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
				if CastPosition and HitChance > 0 then 
					CastSpell(_Q, CastPosition.x, CastPosition.z)
				end
			end
			if Blaze.hSet.useW and isReady(_W) and distance <= 900 * 900 then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
				if CastPosition and HitChance > 0 then 
					CastSpell(_W, CastPosition.x, CastPosition.z)
				end
			end
			if Blaze.hSet.useE and isReady(_E) and distance <= 625 * 625 then 
				CastSpell(_E, target)
			end
		end
	end
end

function Laneclear()
end

function Jungleclear()
  	for i, jungleMinion in pairs(jungleMinions.objects) do
    	if jungleMinion.name:find("Plant") then
      		return
    	end
    	if jungleMinion ~= nil and ValidTarget(jungleMinion) then
    		local distance = GetDistanceSqr(jungleMinion)
    		if OnFire(jungleMinion) then
    			if Blaze.jSet.useW and isReady(_W) and distance <= 900 * 900 then
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, jungleMinion)
					if CastPosition and HitChance > 0 then 
						CastSpell(_W, CastPosition.x, CastPosition.z)
					end
				end
				if Blaze.jSet.useE and isReady(_E) and distance <= 625 * 625 then 
					CastSpell(_E, jungleMinion)
				end
				if Blaze.jSet.useQ and isReady(_Q) and distance <= 1050 * 1050 then 
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, jungleMinion)
					if CastPosition and HitChance > 0 then 
						CastSpell(_Q, CastPosition.x, CastPosition.z)
					end
				end
			else
				if Blaze.jSet.useW and isReady(_W) and distance <= 900 * 900 then
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, jungleMinion)
					if CastPosition and HitChance > 0 then 
						CastSpell(_W, CastPosition.x, CastPosition.z)
					end
				end
				if Blaze.jSet.useE and isReady(_E) and distance <= 625 * 625 then 
					CastSpell(_E, jungleMinion)
				end
				if Blaze.jSet.useQ and Blaze.jSet.qMode == 2 and isReady(_Q) and distance <= 1050 * 1050 then 
					local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, jungleMinion)
					if CastPosition and HitChance > 0 then 
						CastSpell(_Q, CastPosition.x, CastPosition.z)
					end
				end
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

function OnDraw()
	if myHero.dead then 
		return 
	end
	if Blaze.Drawing.lfps then
		if Blaze.Drawing.Qrange and isReady(_Q) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 1050, ARGB(Blaze.Drawing.Qcolor[1], Blaze.Drawing.Qcolor[2], Blaze.Drawing.Qcolor[3], Blaze.Drawing.Qcolor[4]))
  		elseif Blaze.Drawing.Qrange and not isReady(_Q) and isLevel(_Q) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 1050, ARGB(255, 255, 0, 0))
  		end
  		if Blaze.Drawing.Wrange and isReady(_W) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 900, ARGB(Blaze.Drawing.Wcolor[1], Blaze.Drawing.Wcolor[2], Blaze.Drawing.Wcolor[3], Blaze.Drawing.Wcolor[4]))
  		elseif Blaze.Drawing.Wrange and not isReady(_W) and isLevel(_W) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 900, ARGB(255, 255, 0, 0))
  		end
  		if Blaze.Drawing.Erange and isReady(_E) then 
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 625, ARGB(Blaze.Drawing.Ecolor[1], Blaze.Drawing.Ecolor[2], Blaze.Drawing.Ecolor[3], Blaze.Drawing.Ecolor[4]))
  		elseif Blaze.Drawing.Erange and not isReady(_E) and isLevel(_E) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 625, ARGB(255, 255, 0, 0))
  		end
  		if Blaze.Drawing.Rrange and isReady(_R) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 750, ARGB(Blaze.Drawing.Rcolor[1], Blaze.Drawing.Rcolor[2], Blaze.Drawing.Rcolor[3], Blaze.Drawing.Rcolor[4]))
  		elseif Blaze.Drawing.Rrange and not isReady(_R) and isLevel(_R) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 750, ARGB(255,255,0,0))
  		end
	else
  		if Blaze.Drawing.Qrange and isReady(_Q) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 1050, ARGB(Blaze.Drawing.Qcolor[1], Blaze.Drawing.Qcolor[2], Blaze.Drawing.Qcolor[3], Blaze.Drawing.Qcolor[4]))
  		elseif Blaze.Drawing.Qrange and not isReady(_Q) and isLevel(_Q) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 1050, ARGB(255, 255, 0, 0))
  		end
  		if Blaze.Drawing.Wrange and isReady(_W) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 900, ARGB(Blaze.Drawing.Wcolor[1], Blaze.Drawing.Wcolor[2], Blaze.Drawing.Wcolor[3], Blaze.Drawing.Wcolor[4]))
  		elseif Blaze.Drawing.Wrange and not isReady(_W) and isLevel(_W) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 900, ARGB(255, 255, 0, 0))
  		end
  		if Blaze.Drawing.Erange and isReady(_E)  then 
    		DrawCircle(myHero.x, myHero.y, myHero.z, 625, ARGB(Blaze.Drawing.Ecolor[1], Blaze.Drawing.Ecolor[2], Blaze.Drawing.Ecolor[3], Blaze.Drawing.Ecolor[4]))
  		elseif Blaze.Drawing.Erange and not isReady(_E) and isLevel(_E) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 625, ARGB(255, 255, 0, 0))
  		end
  		if Blaze.Drawing.Rrange and isReady(_R) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 750, ARGB(Blaze.Drawing.Rcolor[1], Blaze.Drawing.Rcolor[2], Blaze.Drawing.Rcolor[3], Blaze.Drawing.Rcolor[4]))
  		elseif Blaze.Drawing.Rrange and not isReady(_R) and isLevel(_R) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 750, ARGB(255,255,0,0))
  		end
  	end
end