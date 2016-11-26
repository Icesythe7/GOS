if myHero.charName ~= "TwistedFate" then
	return
end

--SexyPrint by Azero--
function SexyPrint(message) 
	local sexyName = "<font color=\"#FF5733\">[<b><i>Card Slut</i></b>]</font>"
	local fontColor = "3393FF"
	print(sexyName .. " <font color=\"#" .. fontColor .. "\">" .. message .. "</font>")
end 

local version = "0.1"
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

targetMinions = minionManager(MINION_ENEMY, 1000, myHero, MINION_SORT_MAXHEALTH_DEC)
jungleMinions = minionManager(MINION_JUNGLE, 1000, myHero, MINION_SORT_MAXHEALTH_DEC)

local selected = "GoldCardLock"
local picking = false
local locked = false
local t = {[5]=true,[11]=true,[24]=true}
local tcc = nil
local lastUse = 0
local lastUse2 = 0
local CastingUltimate = false
local igniteFound    = false
local summonerSpells = {ignite = {}, flash = {}, heal = {}, barrier = {}, smite = {}}
local skinMeta = 
{
	["TwistedFate"] = {"Classic", "Pax", "Jack of Hearts", "The Magnificent", "Tango", "High Noon", "Musketeer", "Underworld", "Red Card", "Cutpurse"}
}

function Nmenu()
	Nmenu = scriptConfig("Card Slut", "TF")

	Nmenu:addSubMenu("[Card Slut] Key Bindings", "KeyBindings")
	Nmenu.KeyBindings:addParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
	Nmenu.KeyBindings:addParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("V"))
	Nmenu.KeyBindings:addParam("PickGold", "Pick Gold Card", SCRIPT_PARAM_ONKEYDOWN, false, 112)
	Nmenu.KeyBindings:addParam("PickRed", "Pick Red Card", SCRIPT_PARAM_ONKEYDOWN, false, 113)
	Nmenu.KeyBindings:addParam("PickBlue", "Pick Blue Card", SCRIPT_PARAM_ONKEYDOWN, false, 114)

	Nmenu:addSubMenu("[Card Slut] Combo Settings", "ComboSettings")
	Nmenu.ComboSettings:addParam("UseQ", "Use Q in 'Combo'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.ComboSettings:addParam("UseQ2", "Q on stunned only", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey("Z"))
	Nmenu.ComboSettings:addParam("UseW", "Use W in 'Combo'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.ComboSettings:addParam("SelectCard", "Select card to use in 'Combo'", SCRIPT_PARAM_LIST, 1, {"Smart", "Gold", "Red", "Blue"})
	Nmenu.ComboSettings:addParam("ManaManager", "Mana Manager (Blue Card) under", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)

	Nmenu:addSubMenu("[Card Slut] Harass Settings", "HarassSettings")
	Nmenu.HarassSettings:addParam("UseQ", "Use Q to 'Harass'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.HarassSettings:addParam("UseW", "Use W to 'Harass'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.HarassSettings:addParam("HarassOnly", "Harass with", SCRIPT_PARAM_LIST, 3, {"Gold", "Red", "Blue"})
	Nmenu.HarassSettings:addParam("AutoHarass", "Auto Harass Toggle", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey("J"))
	Nmenu.HarassSettings:addParam("AutoQ", "Auto Q 'Harass'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.HarassSettings:addParam("AutoW", "Auto W 'Harass'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.HarassSettings:addParam("AutoWselect", "Auto Harass with", SCRIPT_PARAM_LIST, 3, {"Gold", "Red", "Blue"})

	Nmenu:addSubMenu("[Card Slut] Laneclear Settings", "LaneSettings")
	Nmenu.LaneSettings:addParam("Laneclear", "Laneclear Key", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("V"))
	Nmenu.LaneSettings:addParam("UseQ", "Use Q in 'Laneclear'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.LaneSettings:addParam("UseW", "Use W in 'Laneclear'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.LaneSettings:addParam("SelectCard", "Select card to use in 'Laneclear'", SCRIPT_PARAM_LIST, 1, {"Smart", "Red", "Blue", "Gold"})
	Nmenu.LaneSettings:addParam("ManaManager", "Mana Manager (Blue Card) under", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)
	Nmenu.LaneSettings:addParam("ManaManager2", "Do not use (Wild Cards) under", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)

	Nmenu:addSubMenu("[Card Slut] Jungleclear Settings", "JungleSettings")
	Nmenu.JungleSettings:addParam("Jungleclear", "Jungleclear Key", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("V"))
	Nmenu.JungleSettings:addParam("UseQ", "Use Q in 'Jungleclear'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.JungleSettings:addParam("UseW", "Use W in 'Jungleclear'", SCRIPT_PARAM_ONOFF, true)
	Nmenu.JungleSettings:addParam("SelectCard", "Select card to use in 'Jungleclear'", SCRIPT_PARAM_LIST, 1, {"Smart", "Red", "Blue", "Gold"})
	Nmenu.JungleSettings:addParam("ManaManager", "Mana Manager (Blue Card) under", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)
	Nmenu.JungleSettings:addParam("ManaManager2", "Do not use (Wild Cards) under", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)

	Nmenu:addSubMenu("[Card Slut] Ultimate Settings", "UltSettings")
	Nmenu.UltSettings:addParam("AutoSelect", "Auto Pick Card when casting ultimate", SCRIPT_PARAM_ONOFF, true)
	Nmenu.UltSettings:addParam("SelectCard", "Select Card", SCRIPT_PARAM_LIST, 1, {"Gold", "Red", "Blue"})

	Nmenu:addSubMenu("[Card Slut] Drawing", "Drawing")
	Nmenu.Drawing:addParam("Qrange", "Draw Q", SCRIPT_PARAM_ONOFF, true)
	Nmenu.Drawing:addParam("Rrange", "Draw R", SCRIPT_PARAM_ONOFF, true)
	
	Nmenu:addSubMenu("[Card Slut] Misc", "Misc")
	Nmenu.Misc:addParam("skins", myHero.charName .. " Skins", SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
	Nmenu.Misc:setCallback("skins", StartSkin)
	Nmenu.Misc:addParam("AutoQS", "Auto Q on CC targets", SCRIPT_PARAM_ONOFF, true)

	Nmenu:addSubMenu("[Card Slut] Permashow Settings", "PSSettings")
	Nmenu.PSSettings:addParam("permashow", "Enable/Disable ALL", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow1", "Combo (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow2", "Harass (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow3", "Auto Harass Toggle (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow4", "Q on Stun Only (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow5", "Pick Gold Card (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow6", "Pick Red Card (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("permashow7", "Pick Blue Card (Permashow)", SCRIPT_PARAM_ONOFF, true)
	Nmenu.PSSettings:addParam("WarningSpace", "-------------------------------------------------------------------", 5, "")
	Nmenu.PSSettings:addParam("Warning", "Warning: All changes requires a Reload", 5, "")

	Nmenu:addSubMenu("[Card Slut] Target Selector", "TSet")

	Nmenu:addParam("Space","", 5, "")
	Nmenu:addParam("Author","Author: Bing", 5, "")
	Nmenu:addParam("Version","Version: "..version.."", 5, "")

	VP = VPrediction()
    ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1200, DAMAGE_PHYSICAL)
    ts.name = "Focus"
	Nmenu.TSet:addTS(ts)


	if Nmenu.PSSettings.permashow and Nmenu.PSSettings.permashow1 then Nmenu.KeyBindings:permaShow("Combo") end
	if Nmenu.PSSettings.permashow and Nmenu.PSSettings.permashow2 then Nmenu.KeyBindings:permaShow("Harass") end
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
    if _G.MMA_GameFileNotification ~= nil then
		SexyPrint("MMA Successfully integrated.")
	elseif _G.Reborn_Loaded then
		SexyPrint("SAC Successfully integrated.")
	else
		SexyPrint("Orbwalker not found: SxOrbWalk integrated.")
		Nmenu:addSubMenu("[Card Slut] Orbwalker", "SxOrb")
		SxOrb:LoadToMenu(Nmenu.SxOrb)
	end
end

function OnLoad()
	if _G.MMA_GameFileNotification == nil and not _G.Reborn_Loaded then 
		require 'SxOrbWalk' 
	end
	require 'VPrediction'
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

function GetCustomTarget()
	ts:update()
	if _G.MMA_GameFileNotification ~= nil and ValidTarget(_G.MMA_Target) then return _G.MMA_ConsideredTarget(1200) end
	if _G.AutoCarry and ValidTarget(_G.AutoCarry.Crosshair:GetTarget()) then _G.AutoCarry.Crosshair:SetSkillCrosshairRange(1200) return _G.AutoCarry.Crosshair:GetTarget() end
	if _G.MMA_GameFileNotification == nil and not _G.Reborn_Loaded then return ts.target end
	return ts.target
end

function OnTick()
	if myHero.dead then
		return
	end
	targetMinions:update()
	jungleMinions:update()
	if Nmenu.KeyBindings.Combo then
		Combo()
	end
	if Nmenu.KeyBindings.Harass then
		Harass()
	end
	if Nmenu.LaneSettings.Laneclear then
		Laneclear()
	end
	if Nmenu.JungleSettings.Jungleclear then
		Jungleclear()
	end
	if igniteFound and Nmenu.Misc.ign then
		KillSteal()
	end
	if isReady(_W) and GetTickCount()-lastUse <= 2300 then
		if myHero:GetSpellData(_W).name == selected then 
			CastSpell(_W) 
		end
	end
	if isReady(_W) and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then 
		if Nmenu.KeyBindings.PickGold then 
			selected = "GoldCardLock"
		elseif Nmenu.KeyBindings.PickBlue then 
			selected = "BlueCardLock"
		elseif Nmenu.KeyBindings.PickRed then 
			selected = "RedCardLock"
		else 
			return 
		end	
		CastSpellEx(_W)
		lastUse = GetTickCount()
	end
end

function OnApplyBuff(unit, source, buff)
	if unit.isMe then
		if buff.name == "pickacard_tracker" then 
			picking = true
		end
		if buff.name == "GoldCardPreAttack" then
			locked = true
		end
	end
end

function OnUpdateBuff(unit, buff)
	if Nmenu.Misc.AutoQS and unit ~= nil and unit.valid and isReady(_Q) and GetDistance(unit, myHero) <= 1440 and unit.type == myHero.type and unit.team ~= myHero.team and t[buff.type] then
		CastSpell(_Q, unit.x, unit.z)
		SexyPrint("Casted Q on CC'd target  " ..unit.charName.. "!")
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
		end
		if buff.name == "GoldCardPreAttack" then
			locked = false
		end
	end
end

function Combo()
	Target = GetCustomTarget()
	if Nmenu.ComboSettings.UseW and isReady(_W) and ValidTarget(Target) then
		if Nmenu.ComboSettings.SelectCard == 1 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
			local AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(Target, 0, 80, 600, 2000, myHero)
			if nTargets >= 2 then
				selected = "RedCardLock"
				if GetDistance(Target, myHero) <= 1200 then
					CastSpell(_W)
				end
				lastUse = GetTickCount()
				elseif (myHero.mana / myHero.maxMana > Nmenu.ComboSettings.ManaManager /100) then
					selected = "GoldCardLock"
					if GetDistance(Target, myHero) <= 1200 then
						CastSpell(_W)
					end
					lastUse = GetTickCount()
				elseif (myHero.mana / myHero.maxMana < Nmenu.ComboSettings.ManaManager /100) then
					selected = "BlueCardLock"
					if GetDistance(Target, myHero) <= 1200 then
						CastSpell(_W)
					end
					lastUse = GetTickCount()
				end
			elseif Nmenu.ComboSettings.SelectCard == 2 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
				selected = "GoldCardLock"
				if GetDistance(Target, myHero) <= 1200 then
					CastSpell(_W)
				end
				lastUse = GetTickCount()
			elseif Nmenu.ComboSettings.SelectCard == 3 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
				selected = "RedCardLock"
				if GetDistance(Target, myHero) <= 1200 then
					CastSpell(_W)
				end
				lastUse = GetTickCount()
			elseif Nmenu.ComboSettings.SelectCard == 4 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
				selected = "BlueCardLock"
				if GetDistance(Target, myHero) <= 1200 then
					CastSpell(_W)
				end
				lastUse = GetTickCount()
			end
		end
		if Nmenu.ComboSettings.UseQ and Nmenu.ComboSettings.UseQ2 and isReady(_Q) and ValidTarget(Target) and GetDistance(Target, myHero) <= 1440 and Target.charName == tcc then
			CastSpell(_Q, Target.x, Target.z)
		elseif Nmenu.ComboSettings.UseQ and Nmenu.ComboSettings.UseQ2 and isReady(_Q) and ValidTarget(Target) and GetDistance(Target, myHero) <= 1440 and not isReady(_W) and not picking and not locked then
			local AOECastPosition, MainTargetHitChance, nTargets = VP:GetLineAOECastPosition(Target, 0, 80, 600, 2000, myHero)
			CastSpell(_Q, AOECastPosition.x, AOECastPosition.z)
		elseif not Nmenu.ComboSettings.UseQ2 and Nmenu.ComboSettings.UseQ and isReady(_Q) and ValidTarget(Target) and GetDistance(Target, myHero) and not picking and not locked then
			local AOECastPosition, MainTargetHitChance, nTargets = VP:GetLineAOECastPosition(Target, 0, 80, 600, 2000, myHero)
			if nTargets >= 1 and MainTargetHitChance >= 3 then
				if GetDistance(Target, myHero) <= 1440 then
					CastSpell(_Q, AOECastPosition.x, AOECastPosition.z)
				end
			end
		end
	end

function Harass()
	Target = GetCustomTarget()
	if Nmenu.KeyBindings.Harass then
		if isReady(_Q) and Nmenu.HarassSettings.UseQ then
			if ValidTarget(Target) and GetDistance(Target, myHero) then
				local AOECastPosition, MainTargetHitChance, nTargets = VP:GetLineAOECastPosition(Target, 0, 80, 600, 2000, myHero)
				if nTargets >= 1 and MainTargetHitChance >= 2 then
					if GetDistance(Target, myHero) <= 1440 then
						CastSpell(_Q, AOECastPosition.x, AOECastPosition.z)
					end
				end
			end
		end
		if isReady(_W) and Nmenu.HarassSettings.UseW and ValidTarget(Target) then
			if Nmenu.HarassSettings.HarassOnly == 1 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
				selected = "GoldCardLock"
				if GetDistance(Target, myHero) <= 1200 then
					CastSpell(_W)
				end
				lastUse = GetTickCount()
			elseif Nmenu.HarassSettings.HarassOnly == 2 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
				selected = "RedCardLock"
				if GetDistance(Target, myHero) <= 1200 then
					CastSpell(_W)
				end
				lastUse = GetTickCount()
			elseif Nmenu.HarassSettings.HarassOnly == 3 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
				selected = "BlueCardLock"
				if GetDistance(Target, myHero) <= 1200 then
					CastSpell(_W)
				end
				lastUse = GetTickCount()
			end
		end
	end
	if Nmenu.HarassSettings.AutoHarass then
		if isReady(_Q) and Nmenu.HarassSettings.AutoQ and ValidTarget(Target) then
			if GetDistance(Target, myHero) then
			    local AOECastPosition, MainTargetHitChance, nTargets = VP:GetLineAOECastPosition(Target, 0, 80, 600, 2000, myHero)
				if nTargets >= 1 and MainTargetHitChance >= 2 then
					if GetDistance(Target, myHero) <= 1440 then
						CastSpell(_Q, AOECastPosition.x, AOECastPosition.z)
					end
				end
			end
		end
		if isReady(_W) and Nmenu.HarassSettings.AutoW and ValidTarget(Target) then
			if Nmenu.HarassSettings.AutoWselect == 1 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
				selected = "GoldCardLock"
				if GetDistance(Target, myHero) <= 1200 then
					CastSpell(_W)
				end
				lastUse = GetTickCount()
			elseif Nmenu.HarassSettings.AutoWselect == 2 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
				selected = "RedCardLock"
				if GetDistance(Target, myHero) <= 1200 then
					CastSpell(_W)
				end
				lastUse = GetTickCount()
			elseif Nmenu.HarassSettings.AutoWselect == 3 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
				selected = "BlueCardLock"
				if GetDistance(Target, myHero) <= 1200 then
					CastSpell(_W)
				end
				lastUse = GetTickCount()
			end
		end
	end
end

function Laneclear()
	for i, targetMinion in pairs(targetMinions.objects) do
		if targetMinion ~= nil then
			if Nmenu.LaneSettings.UseQ and isReady(_Q) then
				local AOECastPosition, MainTargetHitChance, nTargets = VP:GetLineAOECastPosition(targetMinion, 0, 80, 600, 2000, myHero)
				if nTargets >= 1 and (myHero.mana / myHero.maxMana > Nmenu.LaneSettings.ManaManager2 /100) then
					if GetDistance(targetMinion, myHero) <= 1440 then
						CastSpell(_Q, targetMinion.x, targetMinion.z)
					end
				end
			end
    		if Nmenu.LaneSettings.UseW and isReady(_W) then
    			if Nmenu.LaneSettings.SelectCard == 1 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
					local AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(targetMinion, 0, 80, 600, 2000, myHero)
					if nTargets >= 1 and (myHero.mana / myHero.maxMana > Nmenu.LaneSettings.ManaManager /100) then
						selected = "RedCardLock"
						if GetDistance(targetMinion, myHero) <= 800 then
							CastSpell(_W, targetMinion.x, targetMinion.z)
						end
						lastUse = GetTickCount()
					elseif (myHero.mana / myHero.maxMana < Nmenu.LaneSettings.ManaManager /100) then
						selected = "BlueCardLock"
						if GetDistance(targetMinion, myHero) <= 800 then
							CastSpell(_W, targetMinion.x, targetMinion.z)
						end
						lastUse = GetTickCount()
					end
				elseif Nmenu.LaneSettings.SelectCard == 2 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
					selected = "RedCardLock"
					if GetDistance(targetMinion, myHero) <= 800 then
						CastSpell(_W, targetMinion.x, targetMinion.z)
					end
					lastUse = GetTickCount()
				elseif Nmenu.LaneSettings.SelectCard == 3 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
					selected = "BlueCardLock"
					if GetDistance(targetMinion, myHero) <= 800 then
						CastSpell(_W, targetMinion.x, targetMinion.z)
					end
					lastUse = GetTickCount()
				elseif Nmenu.LaneSettings.SelectCard == 4 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
					selected = "GoldCardLock"
					if GetDistance(targetMinion, myHero) <= 800 then
						CastSpell(_W, targetMinion.x, targetMinion.z)
					end
					lastUse = GetTickCount()
				end
			end
    	end
    end
end

function Jungleclear()
	for i, jungleMinion in pairs(jungleMinions.objects) do
		if jungleMinion ~= nil then
			if Nmenu.JungleSettings.UseQ and isReady(_Q) then
				local AOECastPosition, MainTargetHitChance, nTargets = VP:GetLineAOECastPosition(jungleMinion, 0, 80, 600, 2000, myHero)
				if nTargets >= 1 and (myHero.mana / myHero.maxMana > Nmenu.JungleSettings.ManaManager2 /100) then
					if GetDistance(jungleMinion, myHero) <= 1440 then
						CastSpell(_Q, jungleMinion.x, jungleMinion.z)
					end
				end
			end
			if Nmenu.JungleSettings.UseW and isReady(_W) then
				if Nmenu.JungleSettings.SelectCard == 1 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
					local AOECastPosition, MainTargetHitChance, nTargets = VP:GetCircularAOECastPosition(jungleMinion, 0, 80, 600, 2000, myHero)
					if nTargets >= 1 and (myHero.mana / myHero.maxMana > Nmenu.JungleSettings.ManaManager /100) then
						selected = "RedCardLock"
						if GetDistance(jungleMinion, myHero) <= 800 then
							CastSpell(_W, jungleMinion.x, jungleMinion.z)
						end
						lastUse = GetTickCount()
					elseif (myHero.mana / myHero.maxMana < Nmenu.LaneSettings.ManaManager /100) then
						selected = "BlueCardLock"
						if GetDistance(jungleMinion, myHero) <= 800 then
							CastSpell(_W, jungleMinion.x, jungleMinion.z)
						end
						lastUse = GetTickCount()
					end
				elseif Nmenu.JungleSettings.SelectCard == 2 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
					selected = "RedCardLock"
					if GetDistance(jungleMinion, myHero) <= 800 then
						CastSpell(_W, jungleMinion.x, jungleMinion.z)
					end
					lastUse = GetTickCount()
				elseif Nmenu.JungleSettings.SelectCard == 3 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
					selected = "BlueCardLock"
					if GetDistance(jungleMinion, myHero) <= 800 then
						CastSpell(_W, jungleMinion.x, jungleMinion.z)
					end
					lastUse = GetTickCount()
				elseif Nmenu.JungleSettings.SelectCard == 4 and myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
					selected = "GoldCardLock"
					if GetDistance(jungleMinion, myHero) <= 800 then
						CastSpell(_W, jungleMinion.x, jungleMinion.z)
					end
					lastUse = GetTickCount()
				end
			end
		end
	end
end

function OnProcessSpell(unit, spell)
	if unit.isMe then
		if spell.name == "Destiny" then
			CastingUltimate = true
		elseif spell.name == "Gate" then 
			CastingUltimate = false
			if isReady(_W) and Nmenu.UltSettings.AutoSelect then
				if myHero:GetSpellData(_W).name == "PickACard" and GetTickCount()-lastUse2 >= 2400 and GetTickCount()-lastUse >= 500 then
					if Nmenu.UltSettings.SelectCard == 1 then
						selected = "GoldCardLock"
						CastSpell(_W)
					elseif Nmenu.UltSettings.SelectCard == 2 then
						selected = "RedCardLock"
						CastSpell(_W)
					elseif Nmenu.UltSettings.SelectCard == 3 then
						selected = "BlueCardLock"
						CastSpell(_W)
					end
					lastUse = GetTickCount()
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