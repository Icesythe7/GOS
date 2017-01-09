if myHero.charName ~= "TwistedFate" then
	return
end

-- http://bol-tools.com/ tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
TrackerLoad("3pu4L8bbQLCJ3Qj2")

--SexyPrint by Azero--
function SexyPrint(message) 
	local sexyName = "<font color=\"#FF5733\">[<b><i>Card Slut</i></b>]</font>"
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

local version = "1.23"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.githubusercontent.com"
local UPDATE_PATH = "/Icesythe7/GOS/master/CardSlut.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

if AUTOUPDATE then
	local ServerData = GetWebResult(UPDATE_HOST,"/Icesythe7/GOS/master/CardSlut.version")
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

UPL:AddSpell(_Q, {speed = 1000, delay = 0.25, range = 1450, width = 80, collision = false, aoe = false, type = "linear"})
local targetMinions = minionManager(MINION_ENEMY, 1000, myHero, MINION_SORT_MAXHEALTH_DEC)
local jungleMinions = minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_MAXHEALTH_DEC)
local bCard = false
local gCard = false
local rCard = false
local picking = false
local locked = false
local t = {[5]=true,[11]=true,[24]=true,[29]=true,[30]=true}
local toSelect = {[1]=false,[2]=false,[3]=false}
local tcc = nil
local CastingUltimate = false
local igniteFound    = false
local lastRotate = false
local summonerSpells = {ignite = {}, flash = {}, heal = {}, barrier = {}, smite = {}}
local skinMeta = 
{
	["TwistedFate"] = {"Classic", "Pax", "Jack of Hearts", "The Magnificent", "Tango", "High Noon", "Musketeer", "Underworld", "Red Card", "Cutpurse"}
}

function Nmenu()
	Nmenu = scriptConfig("Card Slut", "TF")

	Nmenu:addSubMenu("[Card Slut] Key Bindings", "KeyBindings")
	Nmenu.KeyBindings:addParam("PickGold", "Pick Gold Card", SCRIPT_PARAM_ONKEYDOWN, false, 112)
	Nmenu.KeyBindings:addParam("PickRed", "Pick Red Card", SCRIPT_PARAM_ONKEYDOWN, false, 113)
	Nmenu.KeyBindings:addParam("PickBlue", "Pick Blue Card", SCRIPT_PARAM_ONKEYDOWN, false, 114)

	Nmenu:addSubMenu("[Card Slut] Combo Settings", "ComboSettings")
	Nmenu.ComboSettings:addParam("UseQ", "Use Q in 'Combo'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.ComboSettings:addParam("UseQ2", "Q on stunned only", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey("Z"))
	Nmenu.ComboSettings:addParam("UseW", "Use W in 'Combo'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.ComboSettings:addParam("SelectCard", "Select card to use in 'Combo'", SCRIPT_PARAM_LIST, 1, {"Gold", "Blue", "Red"})
	Nmenu.ComboSettings:addParam("CardRange", "Range to Select Card", SCRIPT_PARAM_SLICE, 1200, 600, 1800, 15)

	Nmenu:addSubMenu("[Card Slut] Harass Settings", "HarassSettings")
	Nmenu.HarassSettings:addParam("UseQ", "Use Q to 'Harass'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.HarassSettings:addParam("UseW", "Use W to 'Harass'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.HarassSettings:addParam("HarassOnly", "Harass with", SCRIPT_PARAM_LIST, 2, {"Gold", "Blue", "Red"})
	Nmenu.HarassSettings:addParam("AutoHarass", "Auto Harass Toggle", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey("J"))
	Nmenu.HarassSettings:addParam("AutoQ", "Auto Q 'Harass'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.HarassSettings:addParam("AutoW", "Auto W 'Harass'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.HarassSettings:addParam("AutoWselect", "Auto Harass with", SCRIPT_PARAM_LIST, 2, {"Gold", "Blue", "Red"})
	Nmenu.HarassSettings:addParam("CardRange", "Range to Select Card", SCRIPT_PARAM_SLICE, 1200, 600, 1800, 15)

	Nmenu:addSubMenu("[Card Slut] Laneclear Settings", "LaneSettings")
	Nmenu.LaneSettings:addParam("UseQ", "Use Q in 'Laneclear'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.LaneSettings:addParam("UseW", "W Mode in 'Laneclear'", SCRIPT_PARAM_LIST, 3, {"Off", "On", "[Beta] Rotate"})
	Nmenu.LaneSettings:addParam("Lenemy", "If Rotate Enemy", SCRIPT_PARAM_LIST, 1, {"Gold", "Blue", "Red"})
	Nmenu.LaneSettings:addParam("Cenemy", "Enemy Range to Lock", SCRIPT_PARAM_SLICE, 600, 400, 1800)
	Nmenu.LaneSettings:addParam("SelectCard", "Select card to use in 'Laneclear'", SCRIPT_PARAM_LIST, 1, {"Smart", "Red", "Blue", "Gold"})
	Nmenu.LaneSettings:addParam("ManaManager", "Mana Manager (Blue Card) under", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)
	Nmenu.LaneSettings:addParam("ManaManager2", "Do not use (Wild Cards) under", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)

	Nmenu:addSubMenu("[Card Slut] Jungleclear Settings", "JungleSettings")
	Nmenu.JungleSettings:addParam("UseQ", "Use Q in 'Jungleclear'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.JungleSettings:addParam("UseW", "Use W in 'Jungleclear'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.JungleSettings:addParam("SelectCard", "Select card to use in 'Jungleclear'", SCRIPT_PARAM_LIST, 1, {"Smart", "Red", "Blue", "Gold"})
	Nmenu.JungleSettings:addParam("ManaManager", "Mana Manager (Blue Card) under", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)
	Nmenu.JungleSettings:addParam("ManaManager2", "Do not use (Wild Cards) under", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)

	Nmenu:addSubMenu("[Card Slut] Ultimate Settings", "UltSettings")
	Nmenu.UltSettings:addParam("AutoSelect", "Auto Pick Card when casting ultimate", SCRIPT_PARAM_ONOFF, true)
	Nmenu.UltSettings:addParam("RCast", "When to Select Card", SCRIPT_PARAM_LIST, 2, {"R1", "R2"})
	Nmenu.UltSettings:addParam("SelectCard", "Select Card", SCRIPT_PARAM_LIST, 1, {"Gold", "Red", "Blue"})

	Nmenu:addSubMenu("[Card Slut] Drawing", "Drawing")
	Nmenu.Drawing:addParam("Qrange", "Draw Q", SCRIPT_PARAM_ONOFF, true)
	Nmenu.Drawing:addParam("Rrange", "Draw R", SCRIPT_PARAM_ONOFF, true)
	
	Nmenu:addSubMenu("[Card Slut] Misc", "Misc")
	Nmenu.Misc:addParam("skins", myHero.charName .. " Skins", SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
	Nmenu.Misc:setCallback("skins", StartSkin)
	Nmenu.Misc:addParam("AutoQS", "Auto Q on CC targets", SCRIPT_PARAM_ONOFF, true)

	Nmenu:addSubMenu("[Card Slut] Prediction", "Pred")
	UPL:AddToMenu(Nmenu.Pred)

	Nmenu:addSubMenu("[Card Slut] Orbwalker", "Orbwalker")
	UOL:AddToMenu(Nmenu.Orbwalker)

	Nmenu:addSubMenu("[Card Slut] Permashow Settings", "PSSettings")
	Nmenu.PSSettings:addParam("permashow", "Enable/Disable ALL", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow3", "Auto Harass Toggle (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow4", "Q on Stun Only (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow5", "Pick Gold Card (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow6", "Pick Red Card (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow7", "Pick Blue Card (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("WarningSpace", "-------------------------------------------------------------------", 5, "")
	Nmenu.PSSettings:addParam("Warning", "Warning: All changes requires a Reload", 5, "")

	Nmenu:addParam("Space","", 5, "")
	Nmenu:addParam("Author","Author: Google", 5, "")
	Nmenu:addParam("Version","Version: "..version.."", 5, "")

	if Nmenu.PSSettings.permashow and Nmenu.PSSettings.permashow3 then Nmenu.HarassSettings:permaShow("AutoHarass") end
	if Nmenu.PSSettings.permashow and Nmenu.PSSettings.permashow4 then Nmenu.ComboSettings:permaShow("UseQ2") end
	if Nmenu.PSSettings.permashow and Nmenu.PSSettings.permashow5 then Nmenu.KeyBindings:permaShow("PickGold") end
	if Nmenu.PSSettings.permashow and Nmenu.PSSettings.permashow6 then Nmenu.KeyBindings:permaShow("PickRed") end
	if Nmenu.PSSettings.permashow and Nmenu.PSSettings.permashow7 then Nmenu.KeyBindings:permaShow("PickBlue") end
	
	if not igniteFound then
    	if myHero:GetSpellData(SUMMONER_1).name:lower() == "summonerdot" then
        	igniteFound = true
            summonerSpells.ignite = SUMMONER_1
            Nmenu.Misc:addParam("ign", "Auto Ignite", SCRIPT_PARAM_ONOFF, true)
        elseif myHero:GetSpellData(SUMMONER_2).name:lower() == "summonerdot" then
            igniteFound = true
            summonerSpells.ignite = SUMMONER_2
            Nmenu.Misc:addParam("ign", "Auto Ignite", SCRIPT_PARAM_ONOFF, true)
        end
    end
end

function OnLoad()
	Nmenu()
	SexyPrint("Version " ..version.. " Loaded!")
	StartSkin()
end

function StartSkin()
	local id = (Nmenu.Misc.skins - 1)
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

function OnTick()
	if myHero.dead then
		return
	end
	if UOL:GetOrbWalkMode() == "Combo" then
		Combo()
	end
	if UOL:GetOrbWalkMode() == "Harass" then
		Harass()
	end
	if UOL:GetOrbWalkMode() == "LaneClear" then
		WLaneclear()
		Jungleclear()
	end
	if igniteFound and Nmenu.Misc.ign then
		KillSteal()
	end
	CardPicker()
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

function OnUpdateBuff(unit, buff)
	if Nmenu.Misc.AutoQS and unit ~= nil and unit.valid and isReady(_Q) and GetDistance(unit, myHero) <= 1440 and unit.type == myHero.type and unit.team ~= myHero.team and t[buff.type] then
		CastSpell(_Q, unit.x, unit.z)
	end
	if unit ~= nil and unit.valid and GetDistance(unit, myHero) <= 1440 and unit.type == myHero.type and unit.team ~= myHero.team and t[buff.type] then
		tcc = unit.charName
	end
	if tcc ~= nil and unit ~= nil and unit.charName == tcc and unit.valid and unit.type == myHero.type and unit.team ~= myHero.team and not t[buff.type] then
		tcc = nil
	end
end

function OnRemoveBuff(unit, buff)
	if unit.isMe then
		if buff.name == "pickacard_tracker" then 
			picking = false
			toSelect = {false, false, false}
			lastRotate = false
		end
		if buff.name:find("CardPreAttack") then
			locked = false
		end
	end
end

function OnCreateObj(o)
	if o and o.valid then
		if o.name == "TwistedFate_Base_W_BlueCard.troy" then
			bCard = true
		elseif o.name == "TwistedFate_Base_W_RedCard.troy" then
			rCard = true
		elseif o.name == "TwistedFate_Base_W_GoldCard.troy" then
			gCard = true
		end
	end
end

function OnDeleteObj(o)
	if o and o.valid then
		if o.name == "TwistedFate_Base_W_BlueCard.troy" then
			bCard = false
		elseif o.name == "TwistedFate_Base_W_RedCard.troy" then
			rCard = false
		elseif o.name == "TwistedFate_Base_W_GoldCard.troy" then
			gCard = false
		end
	end
end

function CardPicker()
	if not picking then
		if isReady(_W) and Nmenu.KeyBindings.PickGold then
			toSelect[1] = true
			CastSpell(_W)
		elseif isReady(_W) and Nmenu.KeyBindings.PickBlue then
			toSelect[2] = true
			CastSpell(_W)
		elseif isReady(_W) and Nmenu.KeyBindings.PickRed then
			toSelect[3] = true
			CastSpell(_W)
		end
	elseif picking then
		if toSelect[1] and gCard then
			CastSpellEx(_W)
		elseif toSelect[2] and bCard then
			CastSpellEx(_W)
		elseif toSelect[3] and rCard then
			CastSpellEx(_W)
		else 
			return
		end
	end
end

function Combo()
	local Target = GetTarget(1500)
	if Target ~= nil and Nmenu.ComboSettings.UseW and isReady(_W) and myHero:GetSpellData(_W).name == "PickACard" and ValidTarget(Target) then
		if GetDistance(Target, myHero) <= Nmenu.ComboSettings.CardRange then
			toSelect[Nmenu.ComboSettings.SelectCard] = true
			CastSpell(_W)
		end
	end
	if Target ~= nil and Nmenu.ComboSettings.UseQ and Nmenu.ComboSettings.UseQ2 and isReady(_Q) and ValidTarget(Target) and GetDistance(Target, myHero) <= 1440 and Target.charName == tcc then
		CastSpell(_Q, Target.x, Target.z)
	elseif Target ~= nil and Nmenu.ComboSettings.UseQ and Nmenu.ComboSettings.UseQ2 and isReady(_Q) and ValidTarget(Target) and GetDistance(Target, myHero) <= 1440 and not isReady(_W) and not picking and not locked then
		local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, Target)
		if CastPosition and HitChance > 0 then
      		CastSpell(_Q, CastPosition.x, CastPosition.z)
      	end
	elseif not Nmenu.ComboSettings.UseQ2 and Target ~= nil and Nmenu.ComboSettings.UseQ and isReady(_Q) and ValidTarget(Target) and GetDistance(Target, myHero) <= 1440 then
		local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, Target)
		if CastPosition and HitChance > 0 then
			CastSpell(_Q, CastPosition.x, CastPosition.z)
		end
	end
end

function Harass()
	local Target = GetTarget(1500)
	if Target ~= nil and ValidTarget(Target) and GetDistance(Target, myHero) <= 1440 and isReady(_Q) and Nmenu.HarassSettings.UseQ then
		local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, Target)
		if CastPosition and HitChance > 0 then
			CastSpell(_Q, CastPosition.x, CastPosition.z)
		end
	end
	if Target ~= nil and ValidTarget(Target) and isReady(_W) and Nmenu.HarassSettings.UseW and myHero:GetSpellData(_W).name == "PickACard" and GetDistance(Target, myHero) <= Nmenu.HarassSettings.CardRange then
		toSelect[Nmenu.HarassSettings.HarassOnly] = true
		CastSpell(_W)
	end
	if Nmenu.HarassSettings.AutoHarass then
		if Target ~= nil and ValidTarget(Target) and GetDistance(Target, myHero) <= 1440 and isReady(_Q) and Nmenu.HarassSettings.AutoQ then
			local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, Target)
			if CastPosition and HitChance > 0 then
				CastSpell(_Q, CastPosition.x, CastPosition.z)
			end
		end
		if Target ~= nil and ValidTarget(Target) and isReady(_W) and GetDistance(Target, myHero) <= Nmenu.HarassSettings.CardRange and Nmenu.HarassSettings.AutoW and myHero:GetSpellData(_W).name == "PickACard" then
			toSelect[Nmenu.HarassSettings.AutoWselect] = true
			CastSpell(_W)
		end
	end
end

function WLaneclear()
	local target = GetTarget(1500)
	if Nmenu.LaneSettings.UseW == 3 and isReady(_W) and not picking then
		CastSpell(_W)
	elseif Nmenu.LaneSettings.UseW == 3 and picking then 
		if target ~= nil and ValidTarget(target) and GetDistanceSqr(target) < Nmenu.LaneSettings.Cenemy * Nmenu.LaneSettings.Cenemy then
			UOL:ForceTarget(target)
			toSelect[Nmenu.LaneSettings.Lenemy] = true
		else
			Laneclear()
		end
	else
		Laneclear()
	end
end

function Laneclear()
	targetMinions:update()
	for i, targetMinion in pairs(targetMinions.objects) do
		if targetMinion ~= nil and ValidTarget(targetMinion) then
			local distance = GetDistanceSqr(targetMinion)
			if Nmenu.LaneSettings.UseQ and isReady(_Q) then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, targetMinion)
				if (myHero.mana / myHero.maxMana > Nmenu.LaneSettings.ManaManager2 /100) and CastPosition then
					if distance <= 1440 * 1440 then
						CastSpell(_Q, CastPosition.x, CastPosition.z)
					end
				end
			end
			if Nmenu.LaneSettings.UseW == 2 and isReady(_W) then
    			if Nmenu.LaneSettings.SelectCard == 1 and myHero:GetSpellData(_W).name == "PickACard" then
					if (myHero.mana / myHero.maxMana > Nmenu.LaneSettings.ManaManager /100) then
						if distance <= 800 * 800 then
							toSelect[3] = true
							CastSpell(_W)
						end
					elseif (myHero.mana / myHero.maxMana < Nmenu.LaneSettings.ManaManager /100) then
						if distance <= 800 * 800 then
							toSelect[2] = true
							CastSpell(_W)
						end
					end
				elseif Nmenu.LaneSettings.SelectCard == 2 and myHero:GetSpellData(_W).name == "PickACard" then
					if distance <= 800 * 800 then
						toSelect[3] = true
						CastSpell(_W)
					end
				elseif Nmenu.LaneSettings.SelectCard == 3 and myHero:GetSpellData(_W).name == "PickACard" then
					if distance <= 800 * 800 then
						toSelect[2] = true
						CastSpell(_W)
					end
				elseif Nmenu.LaneSettings.SelectCard == 4 and myHero:GetSpellData(_W).name == "PickACard" then
					if distance <= 800 * 800 then
						toSelect[1] = true
						CastSpell(_W)
					end
				end
			elseif Nmenu.LaneSettings.UseW == 3 and isReady(_W) then
				if not picking and isReady(_W) then 
					CastSpell(_W)
				elseif picking and lastRotate then 
					if Nmenu.LaneSettings.SelectCard == 1 then
						if (myHero.mana / myHero.maxMana > Nmenu.LaneSettings.ManaManager /100) then
							if distance <= 800 * 800 then
								toSelect[3] = true
							end
						elseif (myHero.mana / myHero.maxMana < Nmenu.LaneSettings.ManaManager /100) then
							if distance <= 800 * 800 then
								toSelect[2] = true
							end
						end
					elseif Nmenu.LaneSettings.SelectCard == 2 then
						if distance <= 800 * 800 then
							toSelect[3] = true
						end
					elseif Nmenu.LaneSettings.SelectCard == 3 then
						if distance <= 800 * 800 then
							toSelect[2] = true
						end
					elseif Nmenu.LaneSettings.SelectCard == 4 then
						if distance <= 800 * 800 then
							toSelect[1] = true
						end
					end
				end
			end
		end
	end
end

function Jungleclear()
	jungleMinions:update()
	for i, jungleMinion in pairs(jungleMinions.objects) do
		if jungleMinion ~= nil then
			if Nmenu.JungleSettings.UseQ and isReady(_Q) then
				local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, jungleMinion)
				if (myHero.mana / myHero.maxMana > Nmenu.JungleSettings.ManaManager2 /100) and CastPosition then
					if GetDistance(jungleMinion, myHero) <= 1440 then
						CastSpell(_Q, CastPosition.x, CastPosition.z)
					end
				end
			end
			if Nmenu.JungleSettings.UseW and isReady(_W) then
				if Nmenu.JungleSettings.SelectCard == 1 and myHero:GetSpellData(_W).name == "PickACard" then
					if (myHero.mana / myHero.maxMana > Nmenu.JungleSettings.ManaManager /100) then
						if GetDistance(jungleMinion, myHero) <= 800 then
							toSelect[3] = true
							CastSpell(_W)
						end
					elseif (myHero.mana / myHero.maxMana < Nmenu.LaneSettings.ManaManager /100) then
						if GetDistance(jungleMinion, myHero) <= 800 then
							toSelect[2] = true
							CastSpell(_W)
						end
					end
				elseif Nmenu.JungleSettings.SelectCard == 2 and myHero:GetSpellData(_W).name == "PickACard" then
					if GetDistance(jungleMinion, myHero) <= 800 then
						toSelect[3] = true
						CastSpell(_W)
					end
				elseif Nmenu.JungleSettings.SelectCard == 3 and myHero:GetSpellData(_W).name == "PickACard" then					
					if GetDistance(jungleMinion, myHero) <= 800 then
						toSelect[2] = true
						CastSpell(_W)
					end
				elseif Nmenu.JungleSettings.SelectCard == 4 and myHero:GetSpellData(_W).name == "PickACard" then					
					if GetDistance(jungleMinion, myHero) <= 800 then
						toSelect[1] = true
						CastSpell(_W)
					end
				end
			end
		end
	end
end

function OnProcessSpell(unit, spell)
	if unit.isMe then
		if spell.name == "PickACard" then
			picking = true
			DelayAction(function() if picking then lastRotate = true end end, 3.75)
		elseif (spell.name == "GoldCardLock" or spell.name == "RedCardLock" or spell.name == "BlueCardLock") then
			locked = true
			picking = false 
			lastRotate = false
			toSelect = {false, false, false}
		end
		if spell.name == "Destiny" then
			CastingUltimate = true
			if Nmenu.UltSettings.RCast == 1 then
				if isReady(_W) and Nmenu.UltSettings.AutoSelect then
					if myHero:GetSpellData(_W).name == "PickACard" then
						if Nmenu.UltSettings.SelectCard == 1 then
							toSelect[1] = true
							CastSpell(_W)
						elseif Nmenu.UltSettings.SelectCard == 2 then
							toSelect[3] = true
							CastSpell(_W)
						elseif Nmenu.UltSettings.SelectCard == 3 then
							toSelect[2] = true
							CastSpell(_W)
						end
					end
				end
			end
		elseif spell.name == "Gate" then 
			CastingUltimate = false
			if Nmenu.UltSettings.RCast == 2 then 
				if isReady(_W) and Nmenu.UltSettings.AutoSelect then
					if myHero:GetSpellData(_W).name == "PickACard" then
						if Nmenu.UltSettings.SelectCard == 1 then
							toSelect[1] = true
							CastSpell(_W)
						elseif Nmenu.UltSettings.SelectCard == 2 then
							toSelect[3] = true
							CastSpell(_W)
						elseif Nmenu.UltSettings.SelectCard == 3 then
							toSelect[2] = true
							CastSpell(_W)
						end
					end
				end
			end
		end
	end
end

function KillSteal()
	for _, enemy in pairs(GetEnemyHeroes()) do
		if isReady(summonerSpells.ignite) then
        	local iDamage = (50 + (20 * myHero.level))
        	local realHPi = (enemy.health + (enemy.hpRegen * 0.05))
        	if enemy ~= nil and enemy.valid and GetDistance(enemy) < 600 and realHPi <= iDamage then
          		CastSpell(summonerSpells.ignite, enemy)
        	end
    	end
	end
end

function OnDraw()
	if myHero.dead then
		return
	end
	if Nmenu.Drawing.Qrange and isReady(_Q) then
		DrawCircle(myHero.x, myHero.y, myHero.z, 1450, ARGB(255, 186, 85, 211))
	elseif Nmenu.Drawing.Qrange and not isReady(_Q) and isLevel(_Q) then
		DrawCircle(myHero.x, myHero.y, myHero.z, 1450, ARGB(255, 255, 0, 0))
	end
	if Nmenu.Drawing.Rrange and isReady(_R) then
		DrawCircle(myHero.x, myHero.y, myHero.z, 5500, ARGB(255,255,131,0))
	elseif Nmenu.Drawing.Rrange and not isReady(_R) and isLevel(_R) then
		DrawCircle(myHero.x, myHero.y, myHero.z, 5500, ARGB(255,255,0,0))
	end
end

function OnUnload()
	SetSkin(myHero, - 1)
	SexyPrint("UnLoaded!")
end