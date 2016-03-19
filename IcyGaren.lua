if GetObjectName(GetMyHero()) ~= "Garen" then return end

local ver = "0.01"

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New version found! " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/Icesythe7/GOS/master/IcyGaren.lua", SCRIPT_PATH .. "IcyGaren.lua", function() PrintChat("Update Complete, please 2x F6!") return end)
    else
        PrintChat("No updates found, IcyGaren Loaded!")
    end
end

GetWebResultAsync("https://raw.githubusercontent.com/Icesythe7/GOS/master/IcyGaren.version", AutoUpdate)

require "Inspired"

local eActive = false
local igniteFound = false
local summonerSpells = {ignite = {}, flash = {}, heal = {}, barrier = {}}
local skinMeta = {["Garen"] = {"Classic", "Sanguine", "Desert Trooper", "Commando", "Dreadknight", "Rugged", "Steel Legion", "Chroma Pack: Garnet", "Chroma Pack: Plum", "Chroma Pack: Ivory", "Rogue Admiral"}}

GarenMenu = Menu("garen", "Icy Garen")
GarenMenu:SubMenu("combo", "Combo")
GarenMenu.Combo:Boolean("Q", "Use Q", true)
GarenMenu.Combo:Boolean("W", "Use W", true)
GarenMenu.Combo:Boolean("E", "Use E", true)
GarenMenu.Combo:Boolean("R", "Use R if will kill enemy", true)
GarenMenu:SubMenu("laneclear", "Laneclear")
GarenMenu.laneclear:Boolean("E", "Use E", true)
GarenMenu:SubMenu("ksteal", "Killsteal")
GarenMenu.ksteal:Boolean("R", "Use R", true)
GarenMenu:SubMenu("misc", "Misc")
GarenMenu.misc:DropDown('skin', GetObjectName(myHero).. " Skins", 1, skinMeta[GetObjectName(myHero)], HeroSkinChanger, true)
GarenMenu.misc.skin.callback = function(model) HeroSkinChanger(GetMyHero(), model - 1) PrintChat(skinMeta[GetObjectName(myHero)][model] .." ".. GetObjectName(myHero) .. " Loaded!") end
GarenMenu:SubMenu("draws", "Drawing")
GarenMenu.draws:Boolean("edraw", "Draw E", true)
GarenMenu.draws:Boolean("rdraw", "Draw R", true)

OnLoad (function()
	if not igniteFound then
    	if GetCastName(myHero, SUMMONER_1):lower():find("summonerdot") then
      		igniteFound = true
      		summonerSpells.ignite = SUMMONER_1
      		GarenMenu.ksteal:Boolean("ignite", "Auto Ignite", true)
    	elseif GetCastName(myHero, SUMMONER_2):lower():find("summonerdot") then
      		igniteFound = true
      		summonerSpells.ignite = SUMMONER_2
      		GarenMenu.ksteal:Boolean("ignite", "Auto Ignite", true)
    	end
	end
end)

function numbers()
	rLevel = GetSpellData(myHero, _R).level
	if (rLevel > 0) then 
		if rLevel == 1 then 
			ultbase = 175
			percent = 28.6
		elseif rLevel == 2 then
			ultbase = 350
			percent = 33.3
		elseif rLevel == 3 then
			ultbase = 525
			percent = 40
		end
	end
end

OnTick (function()
	numbers()
	Killsteal()
	if IOW:Mode() == "Combo" then
		Combo()
	end
	if IOW:Mode() == "LaneClear" then
		Laneclear()
	end
end)

OnUpdateBuff (function(unit, buff)
	if not unit or not buff then
		return
	end
  	if unit.isMe then
    	if buff.Name:lower() == "garene" then
      		eActive = true
      	end
    end
end)

OnRemoveBuff (function(unit, buff)
	if not unit or not buff then
		return
	end
  	if unit.isMe then
    	if buff.Name:lower() == "garene" then
      		eActive = false
      	end
    end
end)

function Combo()
	target = GetCurrentTarget()
	if GarenMenu.Combo.Q:Value() and Ready(_Q) and ValidTarget(target, 800) and not eActive then 
		CastSpell(_Q)
	end
	if GarenMenu.Combo.W:Value() and Ready(_W) and ValidTarget(target, 350) then 
		CastSpell(_W)
	end
	if GarenMenu.Combo.E:Value() and Ready(_E) and ValidTarget(target, 350) then 
		CastSpell(_E)
	end
	if (rLevel ~= (nil or 0)) then
		local rDamage = math.ceil(CalcDamage(myHero, target, 0, (ultbase + ((GetMaxHP(target) - GetCurrentHP(target)) * (percent / 100)))))
		if GarenMenu.Combo.R:Value() and (GetCurrentHP(target) <= rDamage) and Ready(_R) and ValidTarget(target, 400) then 
			CastTargetSpell(target, _R)
		end
	end 
end

function Laneclear()
	for i,minion in pairs(minionManager.objects) do
  		if minion.team ~= myHero.team and ValidTarget(minion, 350) and GarenMenu.laneclear.E:Value() and Ready(_E) then
			CastSpell(_E)
		end
	end
end

function Killsteal()
	if igniteFound and GarenMenu.ksteal.ignite:Value() and Ready(summonerSpells.ignite) then
    local iDamage = (50 + (20 * GetLevel(myHero)))
      	for _, enemy in pairs(GetEnemyHeroes()) do
        	if ValidTarget(enemy, 600) and GetCurrentHP(enemy) <= iDamage then
          		CastTargetSpell(enemy, summonerSpells.ignite)
          	end
        end
	end
	if igniteFound and GarenMenu.ksteal.ignite:Value() and Ready(summonerSpells.ignite) and (rLevel ~= (nil or 0)) and Ready(_R) and GarenMenu.ksteal.R:Value() then
    	for _, enemy in pairs(GetEnemyHeroes()) do
    	local riDamage = math.ceil(CalcDamage(myHero, enemy, 0, (ultbase + ((GetMaxHP(enemy) - GetCurrentHP(enemy)) * (percent / 100)))) + (50 + (20 * GetLevel(myHero))))
    		if ValidTarget(enemy, 400) and (GetCurrentHP(enemy) <= riDamage) then
    			CastTargetSpell(enemy, summonerSpells.ignite)
    			DelayAction(function() CastTargetSpell(enemy, _R) end, 0.02)
    		end
    	end
	end
	if (rLevel ~= (nil or 0)) and Ready(_R) and GarenMenu.ksteal.R:Value() then
		for _, enemy in pairs(GetEnemyHeroes()) do
		local rDamage = math.ceil(CalcDamage(myHero, enemy, 0, (ultbase + ((GetMaxHP(enemy) - GetCurrentHP(enemy)) * (percent / 100)))))
			if (GetCurrentHP(enemy) <= rDamage) and Ready(_R) and ValidTarget(enemy, 400) then 
				CastTargetSpell(enemy, _R)
			end
		end
	end
end

OnDraw (function()
	if not IsDead(myHero) then
		if GarenMenu.draws.edraw:Value() and Ready(_E) then
			DrawCircle(GetOrigin(myHero), 350, 2, 1, ARGB(255, 245, 86, 7))
		end
		if GarenMenu.draws.rdraw:Value() and Ready(_R) then
			DrawCircle(GetOrigin(myHero), 400, 2, 1, ARGB(255, 242, 0, 141))
		end
	end
end)