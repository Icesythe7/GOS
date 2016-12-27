if myHero.charName ~= "Ziggs" then 
	return
end

--SexySexyPrint by Azero--
function SexyPrint(message) 
	local sexyName = "<font color=\"#FF5733\">[<b><i>Da Bomb</i></b>]</font>"
	local fontColor = "3393FF"
	print(sexyName .. " <font color=\"#" .. fontColor .. "\">" .. message .. "</font>")
end

local version = "0.01"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.githubusercontent.com"
local UPDATE_PATH = "/Icesythe7/GOS/master/DaBomb.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

if AUTOUPDATE then
	local ServerData = GetWebResult(UPDATE_HOST,"/Icesythe7/GOS/master/DaBomb.version")
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

UPL:AddSpell(_Q, { speed = 1700, delay = 0.25, range = 850, width = 140, collision = false, aoe = true, type = "circular" })
UPL:AddSpell(_Q -1, { speed = 1700, delay = 0.25, range = 1400, width = 140, collision = false, aoe = true, type = "circular" })
UPL:AddSpell(_W, { speed = 1750, delay = 0.25, range = 1000, width = 325, collision = false, aoe = true, type = "circular" })
UPL:AddSpell(_E, { speed = 1750, delay = 0.25, range = 900, width = 325, collision = false, aoe = true, type = "circular" })
UPL:AddSpell(_R, { speed = math.huge, delay = 0.375, range = 5000, width = 550, collision = false, aoe = true, type = "circular" })

local jungleMinions = minionManager(MINION_JUNGLE, 850, myHero, MINION_SORT_MAXHEALTH_DEC)
local targetMinions = minionManager(MINION_ENEMY, 1400, myHero, MINION_SORT_MAXHEALTH_DEC)
local sEnemies = GetEnemyHeroes()
local tower = nil
local canJump = false
local satchel = nil
local DashTarget = nil
local dashstartx = nil
local dashstarty = nil
local dashx = nil
local dashz = nil
local dashy = nil
local DashEndTime = nil
local DashStartTime = nil
local EStart = nil
local GetDash = false
local dashKnown = false
local skinMeta = 
{
	["Ziggs"] = {"Classic", "Mad Scientist", "Major", "Pool Party", "Snow Day", "Master Arcanist"}
}

--credits Deftsu--
local antiGapClosers = 
{
	["AatroxQ"]                        = {Name = "Aatrox",       spellname = "Q | Dark Flight"},
    ["AhriTumble"]                     = {Name = "Ahri",         spellname = "R | Spirit Rush"},
    ["AkaliShadowDance"]               = {Name = "Akali",        spellname = "R | Shadow Dance"},
    ["AlphaStrike"]                    = {Name = "MasterYi",     spellname = "Q | Alpha Strike"},
    ["BandageToss"]                    = {Name = "Amumu",        spellname = "Q | Bandage Toss"},
    ["Crowstorm"]                      = {Name = "FiddleSticks", spellname = "R | Crowstorm "},
    ["DianaTeleport"]                  = {Name = "Diana",        spellname = "R | Lunar Rush"},
    ["EliseSpiderEDescent"]            = {Name = "Elise",        spellname = "E | Rappel"},
    ["EliseSpiderQCast"]               = {Name = "Elise",        spellname = "Q | Venomous Bite"},
    ["FioraQ"]                         = {Name = "Fiora",        spellname = "Q | Lunge"},
    ["FizzPiercingStrike"]             = {Name = "Fizz",         spellname = "E | Urchin Strike"},
    ["GarenQ"]                         = {Name = "Garen",        spellname = "Q | Decisive Strike"},
    ["GnarBigE"]                       = {Name = "Gnar",         spellname = "E | Crunch"},
    ["GnarE"]                          = {Name = "Gnar",         spellname = "E | Hop"},
    ["GragasE"]                        = {Name = "Gragas",       spellname = "E | Body Slam"},
    ["GravesMove"]                     = {Name = "Graves",       spellname = "E | Quickdraw"},
    ["Headbutt"]                       = {Name = "Alistar",      spellname = "W | Headbutt"},
    ["HecarimUlt"]                     = {Name = "Hecarim",      spellname = "R | Onslaught of Shadows"},
    ["IreliaGatotsu"]                  = {Name = "Irelia",       spellname = "Q | Bladesurge"},
    ["JarvanIVCataclysm"]              = {Name = "JarvanIV",     spellname = "R | Cataclysm"},
    ["JarvanIVDragonStrike"]           = {Name = "JarvanIV",     spellname = "Q | Dragon Strike"},
    ["JaxLeapStrike"]                  = {Name = "Jax",          spellname = "Q | Leap Strike"},
    ["JayceToTheSkies"]                = {Name = "Jayce",        spellname = "W | To The Skies!"},
    ["KatarinaE"]                      = {Name = "Katarina",     spellname = "E | Shunpo"},
    ["KennenLightningRush"]            = {Name = "Kennen",       spellname = "E | Lightning Rush"},
    ["KhazixE"]                        = {Name = "Khazix",       spellname = "E | Leap"},
    ["LeblancSlide"]                   = {Name = "Leblanc",      spellname = "W | Distortion"},
    ["LeblancSlideM"]                  = {Name = "Leblanc",      spellname = "R | Distortion"},
    ["LeonaZenithBlade"]               = {Name = "Leona",        spellname = "E | Zenith Blade"},
    ["LissandraE"]                     = {Name = "Lissandra",    spellname = "E | Glacial Path"},
    ["LucianE"]                        = {Name = "Lucian",       spellname = "E | Relentless Pursuit"},
    ["MaokaiUnstableGrowth"]           = {Name = "Maokai",       spellname = "W | Twisted Advance"},
    ["MonkeyKingNimbus"]               = {Name = "MonkeyKing",   spellname = "E | Nimbus Strike"},
    ["NautilusAnchorDrag"]             = {Name = "Nautilus",     spellname = "Q | Dredge Line"},
    ["Pantheon_LeapBash"]              = {Name = "Pantheon",     spellname = "W | Aegis of Zeonia"},
    ["PoppyHeroicCharge"]              = {Name = "Poppy",        spellname = "E | Heroic Charge"},
    ["QuinnE"]                         = {Name = "Quinn",        spellname = "E | Vault"},
    ["RenektonSliceAndDice"]           = {Name = "Renekton",     spellname = "E | Slice"},
    ["RiftWalk"]                       = {Name = "Kassadin",     spellname = "R | Riftwalk"},
    ["RivenTriCleave"]                 = {Name = "Riven",        spellname = "Q | Broken Wings"},
    ["RocketJump"]                     = {Name = "Tristana",     spellname = "W | Rocket Jump"},
    ["SejuaniArcticAssault"]           = {Name = "Sejuani",      spellname = "Q | Arctic Assault"},
    ["ShenShadowDash"]                 = {Name = "Shen",         spellname = "E | Shadow Dash"},
    ["TalonCutThroat"]                 = {Name = "Talon",        spellname = "E | Cutthroat"},
    ["UFSlash"]                        = {Name = "Malphite",     spellname = "R | Unstoppable Force"},
    ["UdyrBearStance"]                 = {Name = "Udyr",         spellname = "E | Bear Stance"},
    ["Valkyrie"]                       = {Name = "Corki",        spellname = "W | Valkyrie"},
    ["ViQ"]                            = {Name = "Vi",           spellname = "Q | Vault Breaker"},
    ["VolibearQ"]                      = {Name = "Volibear",     spellname = "Q | Rolling Thunder"},
    ["XenZhaoSweep"]                   = {Name = "XinZhao",      spellname = "E | Crescent Sweep"},
    ["YasuoDashWrapper"]               = {Name = "Yasuo",        spellname = "E | Sweeping Blade"},
    ["blindmonkqtwo"]                  = {Name = "LeeSin",       spellname = "Q | Resonating Strike"},
    ["khazixelong"]                    = {Name = "Khazix",       spellname = "E | Leap"},
    ["reksaieburrowed"]                = {Name = "RekSai",       spellname = "E | Tunnel"},
    ["TryndamereE"]                    = {Name = "Tryndamere",   spellname = "E | Spinning Slash"}
}

--credits Deftsu--
local autoInterupt =
{
	["CaitlynAceintheHole"]         = {Name = "Caitlyn",      spellname = "R | Ace in the Hole"},
    ["Crowstorm"]                   = {Name = "FiddleSticks", spellname = "R | Crowstorm"},
    ["Drain"]                       = {Name = "FiddleSticks", spellname = "W | Drain"},
    ["GalioIdolOfDurand"]           = {Name = "Galio",        spellname = "R | Idol of Durand"},
    ["ReapTheWhirlwind"]            = {Name = "Janna",        spellname = "R | Monsoon"},
    ["KarthusFallenOne"]            = {Name = "Karthus",      spellname = "R | Requiem"},
    ["KatarinaR"]                   = {Name = "Katarina",     spellname = "R | Death Lotus"},
    ["LucianR"]                     = {Name = "Lucian",       spellname = "R | The Culling"},
    ["AlZaharNetherGrasp"]          = {Name = "Malzahar",     spellname = "R | Nether Grasp"},
    ["Meditate"]                    = {Name = "MasterYi",     spellname = "W | Meditate"},
    ["MissFortuneBulletTime"]       = {Name = "MissFortune",  spellname = "R | Bullet Time"},
    ["AbsoluteZero"]                = {Name = "Nunu",         spellname = "R | Absoulte Zero"},
    ["PantheonRJump"]               = {Name = "Pantheon",     spellname = "R | Jump"},
    ["PantheonRFall"]               = {Name = "Pantheon",     spellname = "R | Fall"},
    ["ShenStandUnited"]             = {Name = "Shen",         spellname = "R | Stand United"},
    ["Destiny"]                     = {Name = "TwistedFate",  spellname = "R | Destiny"},
    ["UrgotSwap2"]                  = {Name = "Urgot",        spellname = "R | Hyper-Kinetic Position Reverser"},
    ["VarusQ"]                      = {Name = "Varus",        spellname = "Q | Piercing Arrow"},
    ["VelkozR"]                     = {Name = "Velkoz",       spellname = "R | Lifeform Disintegration Ray"},
    ["InfiniteDuress"]              = {Name = "Warwick",      spellname = "R | Infinite Duress"},
    ["XerathLocusOfPower2"]         = {Name = "Xerath",       spellname = "R | Rite of the Arcane"}
}

function Ziggs()
	Tmenu = scriptConfig("Da Bomb", "Ziggs")

  	Tmenu:addSubMenu("[Da Bomb] Combo Settings", "ComboSettings")
  		Tmenu.ComboSettings:addParam("UseQ", "Use Q in 'Combo'", SCRIPT_PARAM_ONOFF, true)
  		Tmenu.ComboSettings:addParam("UseW", "Use W in 'Combo'", SCRIPT_PARAM_ONOFF, false)
  		Tmenu.ComboSettings:addParam("UseE", "Use E in 'Combo'", SCRIPT_PARAM_ONOFF, true)
  
  	Tmenu:addSubMenu("[Da Bomb] Harass Settings", "HarassSettings")
  		Tmenu.HarassSettings:addParam("UseQ", "Auto Q 'Harass'", SCRIPT_PARAM_ONKEYTOGGLE, false, GetKey("L"))

  	Tmenu:addSubMenu("[Da Bomb] LaneClear Settings", "ClearSettings")
  		Tmenu.ClearSettings:addParam("UseQ", "Use Q in 'LaneClear'", SCRIPT_PARAM_ONOFF, true)
  		Tmenu.ClearSettings:addParam("Qhit", "Minimum #Minions Hit Q", SCRIPT_PARAM_SLICE, 3, 1, 6)
  		Tmenu.ClearSettings:addParam("UseW", "Use W in 'LaneClear'", SCRIPT_PARAM_ONOFF, false)
  		Tmenu.ClearSettings:addParam("Whit", "Minimum #Minions Hit W", SCRIPT_PARAM_SLICE, 3, 1, 6)
  		Tmenu.ClearSettings:addParam("UseE", "Use E in 'LaneClear'", SCRIPT_PARAM_ONOFF, true)
  		Tmenu.ClearSettings:addParam("Ehit", "Minimun #Minions Hit E", SCRIPT_PARAM_SLICE, 3, 1, 6)

  	Tmenu:addSubMenu("[Da Bomb] Jungle Settings", "JungleSettings")
  		Tmenu.JungleSettings:addParam("UseQ", "Use Q in 'Jungle'", SCRIPT_PARAM_ONOFF, true)
  		Tmenu.JungleSettings:addParam("UseW", "Use W in 'Jungle'", SCRIPT_PARAM_ONOFF, false)
  		Tmenu.JungleSettings:addParam("UseE", "Use E in 'Jungle'", SCRIPT_PARAM_ONOFF, true)

  	Tmenu:addSubMenu("[Da Bomb] Anti-GapClosers", "anti")
  		for i, name in pairs(antiGapClosers) do
  			for _, enemy in pairs(GetEnemyHeroes()) do
  				if name.Name == enemy.charName then
  					Tmenu.anti:addParam(name.Name, name.Name.." > "..name.spellname, SCRIPT_PARAM_ONOFF, true)
  				end
  			end
  		end

  	Tmenu:addSubMenu("[Da Bomb] Auto-Interupts", "auto")
  		for i, name in pairs(autoInterupt) do
  			for _, enemy in pairs(GetEnemyHeroes()) do
  				if name.Name == enemy.charName then
  					Tmenu.auto:addParam(i, name.Name.." > "..name.spellname, SCRIPT_PARAM_ONOFF, true)
  				end
  			end
  		end

  	Tmenu:addSubMenu("[Da Bomb] Misc", "Misc")
  		Tmenu.Misc:addParam("Flee", "Flee Key", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("G"))
  		Tmenu.Misc:addParam("exe", "Auto Execute Towers", SCRIPT_PARAM_ONOFF, true)
  		Tmenu.Misc:addParam("UseR", "R Killsteal(not recommended)", SCRIPT_PARAM_ONOFF, false)
  		Tmenu.Misc:addParam("RRange", "R KS Max Range", SCRIPT_PARAM_SLICE, 2000, 0, 5000)
  		Tmenu.Misc:addParam("skins", myHero.charName .. " Skins", SCRIPT_PARAM_LIST, 1, skinMeta[myHero.charName])
  		Tmenu.Misc:setCallback("skins", StartSkin)

  	Tmenu:addSubMenu("[Da Bomb] Drawing", "Drawing") 
  		Tmenu.Drawing:addParam("lfps", "Low FPS Circles", SCRIPT_PARAM_ONOFF, true)
  		Tmenu.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Tmenu.Drawing:addParam("Qrange", "Draw Q", SCRIPT_PARAM_ONOFF, true)
  		Tmenu.Drawing:addParam("Qcolor", "--> Q Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Tmenu.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Tmenu.Drawing:addParam("Wrange", "Draw W", SCRIPT_PARAM_ONOFF, true)
  		Tmenu.Drawing:addParam("Wcolor", "--> W Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Tmenu.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Tmenu.Drawing:addParam("Erange", "Draw E", SCRIPT_PARAM_ONOFF, true)
  		Tmenu.Drawing:addParam("Ecolor", "--> E Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Tmenu.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  		Tmenu.Drawing:addParam("Rrange", "Draw R", SCRIPT_PARAM_ONOFF, false)
  		Tmenu.Drawing:addParam("Rcolor", "--> R Range Color", SCRIPT_PARAM_COLOR, {255, 186, 85, 211})
  		Tmenu.Drawing:addParam("info2", " ", SCRIPT_PARAM_INFO, "")
  	Tmenu:addSubMenu("[Da Bomb] Prediction", "pred")
  		UPL:AddToMenu(Tmenu.pred)

  	Tmenu:addSubMenu("[Da Bomb] Orbwalker", "Orbwalker")
end

--Credits Ralphlol--
function CheckOrbwalk()
	if _G.Reborn_Loaded and not _G.Reborn_Initialised then
    	DelayAction(CheckOrbwalk, 1)
  	elseif _G.Reborn_Initialised then
    	Tmenu.Orbwalker:addParam("info11","SAC Detected", SCRIPT_PARAM_INFO, "")
    	sacUsed = true
  	elseif _G.MMA_IsLoaded then
    	Tmenu.Orbwalker:addParam("info11","MMA Detected", SCRIPT_PARAM_INFO, "")
    	mmaUsed = true
  	elseif _Pewalk then
    	Tmenu.Orbwalker:addParam("info11","Pewalk Detected", SCRIPT_PARAM_INFO, "")
    	pewUsed = true
  	elseif _G.NebelwolfisOrbWalkerLoaded then
    	Tmenu.Orbwalker:addParam("info11","Nebel Orb Detected", SCRIPT_PARAM_INFO, "")
    	norbUsed = true
  	else
    	if FileExist(LIB_PATH.."Nebelwolfi's Orb Walker.lua") then
    		require "Nebelwolfi's Orb Walker"
      		if NebelwolfisOrbWalkerClass then
        		NebelwolfisOrbWalkerClass(Tmenu.Orbwalker)
        		norbUsed = true
      		end
    	else
        	SexyPrint("Download an orbwalker to use the script!")
    	end
  	end
end

DelayAction(CheckOrbwalk, 4)

function OnLoad()
	Ziggs()
	SexyPrint("Version " ..version.. " Loaded!")
	StartSkin()
end

function StartSkin()
	local id = (Tmenu.Misc.skins - 1)
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

function isBetween(min, max, unit, unit2)
	local distance = GetDistance(unit, unit2)
  	if distance >= min and distance <= max then
    	return true
  	else
    	return false
  	end
end

function GetDamage(Spell, Unit)
	local truedamage = 0
	if Spell == _Q and isReady(_Q) then
		truedamage = myHero:CalcMagicDamage(Unit, (((myHero:GetSpellData(_Q).level * 45) + 30) + (myHero.ap * 0.65)))
	elseif Spell == _W and isReady(_W) then
		truedamage = myHero:CalcMagicDamage(Unit, (((myHero:GetSpellData(_W).level * 35) + 35) + (myHero.ap * 0.35)))
	elseif Spell == _E and isReady(_E) then
		truedamage = myHero:CalcMagicDamage(Unit, (((myHero:GetSpellData(_E).level * 25) + 15) + (myHero.ap * 0.3)))
	elseif Spell == _R and isReady(_R) then
		truedamage = myHero:CalcMagicDamage(Unit, (((myHero:GetSpellData(_R).level * 100) + 100) + (myHero.ap * 0.733)))
	end
	return truedamage
end

function isCombo()
	if sacUsed and _G.AutoCarry.Keys.AutoCarry then
    	return true
  	elseif sxorbUsed and SxOrb.isFight then
    	return true
  	elseif mmaUsed and _G.MMA_IsOrbwalking() then
    	return true
  	elseif norbUsed and _G.NebelwolfisOrbWalker.Config.k.Combo then
    	return true
  	elseif pewUsed and _Pewalk.GetActiveMode()["Carry"] then
    	return true
  	else
    	return false
  	end
end

function isHarass()
  	if sacUsed and _G.AutoCarry.Keys.MixedMode then
    	return true
  	elseif sxorbUsed and SxOrb.isHarass then
    	return true
  	elseif mmaUsed and _G.MMA_IsDualCarrying() then
    	return true
  	elseif norbUsed and _G.NebelwolfisOrbWalker.Config.k.Harass then
    	return true
  	elseif pewUsed and _Pewalk.GetActiveMode()["Mixed"] then
    	return true
  	else
    	return false
  	end
end

function isLaneclear()
  	if sacUsed and _G.AutoCarry.Keys.LaneClear then
    	return true
  	elseif sxorbUsed and SxOrb.isLaneClear then
    	return true
  	elseif mmaUsed and _G.MMA_IsLaneClearing() then
    	return true
  	elseif norbUsed and _G.NebelwolfisOrbWalker.Config.k.LaneClear then
    	return true
  	elseif pewUsed and _Pewalk.GetActiveMode()["LaneClear"] then
    	return true
  	else
    	return false
  	end
end

function GetBombableTarget(range)
  	if sacUsed then
  		_G.AutoCarry.Crosshair:SetSkillCrosshairRange(range)
    	return _G.AutoCarry.SkillsCrosshair.target
  	elseif mmaUsed then
    	return _G.MMA_Target(range)
  	elseif norbUsed then
    	return _G.NebelwolfisOrbWalker:GetTarget(range)
  	elseif pewUsed then
    	return _Pewalk.GetTarget(range)
  	else
    	return nil
  	end
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

function Jump()
    local x,y,z = (Vector(myHero) - Vector(mousePos)):normalized():unpack()
    if canJump then
    	CastSpell(_W)
    else
      	CastSpell(_W, myHero.x + (x * 80), myHero.z + (z * 80))
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

function OnCreateObj(o)
	if o and o.valid and o.name == "Ziggs_Base_W_Countdown.troy" then
		canJump = true
		satchel = o
	end
	if o and o.valid and o.name == "Ziggs_Turret_Marker_Red.troy" then
		tower = o
	end
end

function OnDeleteObj(o)
	if o and o.valid and o.name == "Ziggs_Base_W_Countdown.troy" then
		canJump = false
		satchel = nil
	end
	if o and o.valid and o.name == "Ziggs_Turret_Marker_Red.troy" then
		tower = nil
	end
end

function OnTick()
	if myHero.dead then 
		return
	end
  	if isCombo() then
    	Combo()
  	end
  	if isLaneclear() then
  		Laneclear()
    	Jungleclear()
  	end
  	if Tmenu.HarassSettings.UseQ and isReady(_Q) then
  		Harass()
  	end
  	if Tmenu.Misc.exe and isReady(_W) and tower ~= nil then
  		Execute()
  	end
  	if Tmenu.Misc.UseR and isReady(_R) then
  		KillSteal()
  	end
	if Tmenu.Misc.Flee then
		Flee()
	end
	if DashEndTime ~= nil then
		if DashEndTime < GetGameTimer() then
			DashTarget = nil
			dashstartx = nil
			dashstarty = nil
			dashx = nil
			dashz = nil
			dashy = nil
			DashEndTime = nil
			DashStartTime = nil
			EStart = nil
			GetDash = false
			dashKnown = false
		end
	end
end

function Flee()
	moveToCursor()
	local target = findClosestEnemy(myHero)
	if isReady(_E) and CountEnemyHeroInRange(900, myHero) > 0 and ValidTarget(target) and target ~= nil then
		local CastPosition, HitChance, HeroPosition = UPL:Predict(_E, myHero, target)
    	if CastPosition and HitChance > 0 then
      		CastSpell(_E, CastPosition.x, CastPosition.z)
      	end
	end
	if isReady(_W) then
		Jump()
	end
end

function Execute()
	if GetDistance(tower) < 1000 and satchel == nil then
		CastSpell(_W, tower.x, tower.z)
	elseif satchel ~= nil and GetDistance(satchel, tower) < 300 then
		CastSpell(_W)
	end
end

function PullWithW(unit)
	local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, unit)
	if CastPosition then
		local x,y,z = (Vector(CastPosition) - Vector(myHero)):normalized():unpack()
		local posX = CastPosition.x + (x * 80)
		local posY = CastPosition.y + (y * 80)
		local posZ = CastPosition.z + (z * 80)
		CastSpell(_W, posX, posZ)
		DashTarget = unit
		GetDash = true
		if satchel ~= nil and GetDistance(unit, satchel) < 300 then
			CastSpell(_W)
			DashTarget = unit
			GetDash = true
		end
	end
end

function PushWithW(unit)
	local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, unit)
	if CastPosition then
		local x,y,z = (Vector(CastPosition) - Vector(myHero)):normalized():unpack()
		local posX = CastPosition.x - (x * 80)
		local posY = CastPosition.y - (y * 80)
		local posZ = CastPosition.z - (z * 80)
		CastSpell(_W, posX, posZ)
		DashTarget = unit
		GetDash = true
		if satchel ~= nil and GetDistance(unit, satchel) < 300 then
			CastSpell(_W)
			DashTarget = unit
			GetDash = true
		end
	end
end

function OnNewPath(unit, startpos, endpos, isDash, dashSpeed)
	if DashTarget ~= nil and unit == DashTarget and GetDash then
		dashstartx = unit.x
		dashstarty = unit.y
		dashx = endpos.x
		dashz = endpos.z
		dashy = endpos.y
		DashStartTime = GetGameTimer()
        DashEndTime = DashStartTime + (GetDistance(startpos, endpos) / dashSpeed)
        dashKnown = true
	end	
end

function KillSteal()
	for _, enemy in pairs(GetEnemyHeroes()) do
		local realHPi = (enemy.health + (enemy.hpRegen * 0.05))
		if enemy and ValidTarget(enemy) and GetDistance(enemy) < Tmenu.Misc.RRange and GetDamage(_R, enemy) > realHPi then
			local CastPosition, HitChance, HeroPosition = UPL:Predict(_R, myHero, enemy)
    		if CastPosition and HitChance > 0 then
      			CastSpell(_R, CastPosition.x, CastPosition.z)
      		end
		end
	end
end

function OnProcessSpell(unit, spell)
	if unit and unit.team ~= myHero.team and GetDistance(unit) < 1000 then
		for i, name in pairs(autoInterupt) do
  			if name.Name == unit.charName and spell.name == i and Tmenu.auto[spell.name] and isReady(_W) then
  				CastSpell(_W, unit.x, unit.z)
  				DelayAction(function() CastSpell(_W) end, 0.5)
  			end
  		end
	end
end

function Combo()
	local target = GetBombableTarget()
	local distance = GetDistance(myHero, target)
	if CountEnemyHeroInRange(1200, myHero) == 1 and Tmenu.ComboSettings.UseE and Tmenu.ComboSettings.UseQ and Tmenu.ComboSettings.UseW and isReady(_Q) and isReady(_W) and isReady(_E) then
		local target = GetBombableTarget(1450)
    	local distance = GetDistance(myHero, target)
		if target ~= nil and ValidTarget(target) and distance < 950 then
			PullWithW(target)
			if dashKnown then
				CastSpell(_E, dashx, dashz)
				DelayAction(function() CastSpell(_Q, dashx, dashz) end, 0.1)
			end
		end
	end
	if target ~= nil and ValidTarget(target) and Tmenu.ComboSettings.UseE and isReady(_E) and distance < 900 then
		local CastPosition, HitChance, HeroPosition = UPL:Predict(_E, myHero, target)
    	if CastPosition and HitChance > 0 then
      		CastSpell(_E, CastPosition.x, CastPosition.z)
      	end
    end
    if isReady(_Q) then
    	local target = GetBombableTarget(1450)
    	local distance = GetDistance(myHero, target)
    	if target ~= nil and ValidTarget(target) and Tmenu.ComboSettings.UseQ and distance < 850 then
    		local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
    		if CastPosition and HitChance > 0 then
      			CastSpell(_Q, CastPosition.x, CastPosition.z)
      		end
    	elseif target ~= nil and ValidTarget(target) and Tmenu.ComboSettings.UseQ and isBetween(851, 1400, myHero, target) then
      		local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q - 1, myHero, target)
    		if CastPosition and HitChance > 0 then
      			CastSpell(_Q, CastPosition.x, CastPosition.z)
      		end
    	end
    end
    if target ~= nil and ValidTarget(target) and Tmenu.ComboSettings.UseW and isReady(_W) and distance < 1000 and satchel == nil then
    	local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, target)
    	if CastPosition and HitChance > 0 then
      		CastSpell(_W, CastPosition.x, CastPosition.z)
      	end
    end
    if Tmenu.ComboSettings.UseW and isReady(_W) and satchel ~= nil and GetDistance(satchel, target) < 325 then
    	CastSpell(_W)
    end
end

function Harass()
	local target = GetBombableTarget(1450)
	local distance = GetDistance(myHero, target)
	if target ~= nil and ValidTarget(target) and distance < 850 then
    	local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
    	if CastPosition and HitChance > 0 then
      		CastSpell(_Q, CastPosition.x, CastPosition.z)
      	end
    elseif target ~= nil and ValidTarget(target) and isBetween(851, 1400, myHero, target) then
      	local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q - 1, myHero, target)
    	if CastPosition and HitChance > 0 then
      		CastSpell(_Q, CastPosition.x, CastPosition.z)
      	end
    end
end

function Laneclear()
	targetMinions:update()
	for i, targetMinion in pairs(targetMinions.objects) do
		local distance = GetDistance(targetMinion, myHero)
		if targetMinion ~= nil and ValidTarget(targetMinion) and Tmenu.ClearSettings.UseE and isReady(_E) and distance < 900 and GetMinionsHit(targetMinion, 300) >= Tmenu.ClearSettings.Ehit then
			local CastPosition, HitChance, HeroPosition = UPL:Predict(_E, myHero, targetMinion)
    		if CastPosition and HitChance > 0 then
      			CastSpell(_E, CastPosition.x, CastPosition.z)
      		end
      	end
      	if targetMinion ~= nil and ValidTarget(targetMinion) and Tmenu.ClearSettings.UseQ and isReady(_Q) and distance < 850 and GetMinionsHit(targetMinion, 140) >= Tmenu.ClearSettings.Qhit then
      		local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, targetMinion)
    		if CastPosition and HitChance > 0 then
      			CastSpell(_Q, CastPosition.x, CastPosition.z)
      		end
      	end
      	if targetMinion ~= nil and ValidTarget(targetMinion) and Tmenu.ClearSettings.UseW and isReady(_W) and distance < 1000 and GetMinionsHit(targetMinion, 300) >= Tmenu.ClearSettings.Whit then
      		local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, targetMinion)
    		if CastPosition and HitChance > 0 then
      			CastSpell(_W, CastPosition.x, CastPosition.z)
      		end
      	end
      	if Tmenu.ClearSettings.UseW and isReady(_W) and satchel ~= nil then
      		CastSpell(_W)
      	end
	end
end

function Jungleclear()
	jungleMinions:update()
	for i, jungleMinion in pairs(jungleMinions.objects) do
		if jungleMinion.name:find("Plant") then
			return 
		end
		local distance = GetDistance(jungleMinion, myHero)
		if jungleMinion ~= nil and ValidTarget(jungleMinion) and Tmenu.JungleSettings.UseE and isReady(_E) and distance < 900 then
			local CastPosition, HitChance, HeroPosition = UPL:Predict(_E, myHero, jungleMinion)
    		if CastPosition and HitChance > 0 then
      			CastSpell(_E, CastPosition.x, CastPosition.z)
      		end
		end
		if jungleMinion ~= nil and ValidTarget(jungleMinion) and Tmenu.JungleSettings.UseQ and isReady(_Q) and distance < 850 then
			local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, jungleMinion)
    		if CastPosition and HitChance > 0 then
      			CastSpell(_Q, CastPosition.x, CastPosition.z)
      		end
		end
		if jungleMinion ~= nil and ValidTarget(jungleMinion) and Tmenu.JungleSettings.UseW and isReady(_W) and distance < 1000 and satchel == nil then
			local CastPosition, HitChance, HeroPosition = UPL:Predict(_W, myHero, jungleMinion)
    		if CastPosition and HitChance > 0 then
      			CastSpell(_W, CastPosition.x, CastPosition.z)
      		end
		end
		if Tmenu.JungleSettings.UseW and isReady(_W) and satchel ~= nil and GetDistance(satchel, jungleMinion) < 325 then
      		CastSpell(_W)
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
  	if DashTarget ~= nil and dashx ~= nil and dashy ~= nil and dashz ~= nil then
  		DrawCircle(dashx, dashy, dashz, 300, ARGB(255, 255, 0, 0))
  	end
  	if Tmenu.Drawing.lfps then
		if Tmenu.Drawing.Qrange and isReady(_Q) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 850, ARGB(Tmenu.Drawing.Qcolor[1], Tmenu.Drawing.Qcolor[2], Tmenu.Drawing.Qcolor[3], Tmenu.Drawing.Qcolor[4]))
  		elseif Tmenu.Drawing.Qrange and not isReady(_Q) and isLevel(_Q) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 850, ARGB(255, 255, 0, 0))
  		end
  		if Tmenu.Drawing.Wrange and isReady(_W) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 1000, ARGB(Tmenu.Drawing.Wcolor[1], Tmenu.Drawing.Wcolor[2], Tmenu.Drawing.Wcolor[3], Tmenu.Drawing.Wcolor[4]))
  		elseif Tmenu.Drawing.Wrange and not isReady(_W) and isLevel(_W) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 1000, ARGB(255, 255, 0, 0))
  		end
  		if Tmenu.Drawing.Erange and isReady(_E) then 
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 900, ARGB(Tmenu.Drawing.Ecolor[1], Tmenu.Drawing.Ecolor[2], Tmenu.Drawing.Ecolor[3], Tmenu.Drawing.Ecolor[4]))
  		elseif Tmenu.Drawing.Erange and not isReady(_E) and isLevel(_E) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 900, ARGB(255, 255, 0, 0))
  		end
  		if Tmenu.Drawing.Rrange and isReady(_R) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 5000, ARGB(Tmenu.Drawing.Rcolor[1], Tmenu.Drawing.Rcolor[2], Tmenu.Drawing.Rcolor[3], Tmenu.Drawing.Rcolor[4]))
  		elseif Tmenu.Drawing.Rrange and not isReady(_R) and isLevel(_R) then
    		DrawCircle2(myHero.x, myHero.y, myHero.z, 5000, ARGB(255,255,0,0))
  		end
	else
  		if Tmenu.Drawing.Qrange and isReady(_Q) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 850, ARGB(Tmenu.Drawing.Qcolor[1], Tmenu.Drawing.Qcolor[2], Tmenu.Drawing.Qcolor[3], Tmenu.Drawing.Qcolor[4]))
  		elseif Tmenu.Drawing.Qrange and not isReady(_Q) and isLevel(_Q) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 850, ARGB(255, 255, 0, 0))
  		end
  		if Tmenu.Drawing.Wrange and isReady(_W) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 1000, ARGB(Tmenu.Drawing.Wcolor[1], Tmenu.Drawing.Wcolor[2], Tmenu.Drawing.Wcolor[3], Tmenu.Drawing.Wcolor[4]))
  		elseif Tmenu.Drawing.Wrange and not isReady(_W) and isLevel(_W) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 1000, ARGB(255, 255, 0, 0))
  		end
  		if Tmenu.Drawing.Erange and isReady(_E) then 
    		DrawCircle(myHero.x, myHero.y, myHero.z, 900, ARGB(Tmenu.Drawing.Ecolor[1], Tmenu.Drawing.Ecolor[2], Tmenu.Drawing.Ecolor[3], Tmenu.Drawing.Ecolor[4]))
  		elseif Tmenu.Drawing.Erange and not isReady(_E) and isLevel(_E) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 900, ARGB(255, 255, 0, 0))
  		end
  		if Tmenu.Drawing.Rrange and isReady(_R) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 5000, ARGB(Tmenu.Drawing.Rcolor[1], Tmenu.Drawing.Rcolor[2], Tmenu.Drawing.Rcolor[3], Tmenu.Drawing.Rcolor[4]))
  		elseif Tmenu.Drawing.Rrange and not isReady(_R) and isLevel(_R) then
    		DrawCircle(myHero.x, myHero.y, myHero.z, 5000, ARGB(255,255,0,0))
  		end
  	end
end