require("Inspired") 

local skinMeta = {

  -- A
["Aatrox"]       = {"Classic", "Justicar", "Mecha", "Sea Hunter"},
["Ahri"]         = {"Classic", "Dynasty", "Midnight", "Foxfire", "Popstar", "Challenger", "Academy"},
["Akali"]        = {"Classic", "Stinger", "Crimson", "All-star", "Nurse", "Blood Moon", "Silverfang", "Headhunter"},
["Alistar"]      = {"Classic", "Black", "Golden", "Matador", "Longhorn", "Unchained", "Infernal", "Sweeper", "Marauder"},
["Amumu"]        = {"Classic", "Pharaoh", "Vancouver", "Emumu", "Re-Gifted", "Almost-Prom King", "Little Knight", "Sad Robot", "Surprise Party"},
["Anivia"]       = {"Classic", "Team Spirit", "Bird of Prey", "Noxus Hunter", "Hextech", "Blackfrost", "Prehistoric"},
["Annie"]        = {"Classic", "Goth", "Red Riding", "Annie in Wonderland", "Prom Queen", "Frostfire", "Reverse", "FrankenTibbers", "Panda", "Sweetheart"},
["Ashe"]         = {"Classic", "Freljord", "Sherwood Forest", "Woad", "Queen", "Amethyst", "Heartseeker", "Marauder"},
["Azir"]         = {"Classic", "Galactic", "Gravelord"},
  -- B  
["Bard"]         = {"Classic", "Elderwood", "Chroma Pack: Marigold", "Chroma Pack: Ivy", "Chroma Pack: Sage", "Snow Day"},
["Blitzcrank"]   = {"Classic", "Rusty", "Goalkeeper", "Boom Boom", "Piltover Customs", "Definitely Not", "iBlitzcrank", "Riot", "Chroma Pack: Molten", "Chroma Pack: Cobalt", "Chroma Pack: Gunmetal", "Battle Boss"},
["Brand"]        = {"Classic", "Apocalyptic", "Vandal", "Cryocore", "Zombie", "Spirit Fire"},
["Braum"]        = {"Classic", "Dragonslayer", "El Tigre", "Lionheart"},
  -- C  
["Caitlyn"]      = {"Classic", "Resistance", "Sheriff", "Safari", "Arctic Warfare", "Officer", "Headhunter", "Chroma Pack: Pink", "Chroma Pack: Green", "Chroma Pack: Blue"},
["Cassiopeia"]   = {"Classic", "Desperada", "Siren", "Mythic", "Jade Fang", "Chroma Pack: Day", "Chroma Pack: Dusk", "Chroma Pack: Night"},
["Chogath"]      = {"Classic", "Nightmare", "Gentleman", "Loch Ness", "Jurassic", "Battlecast Prime", "Prehistoric"},
["Corki"]        = {"Classic", "UFO", "Ice Toboggan", "Red Baron", "Hot Rod", "Urfrider", "Dragonwing", "Fnatic"},
  -- D
["Darius"]       = {"Classic", "Lord", "Bioforge", "Woad King", "Dunkmaster", "Chroma Pack: Black Iron", "Chroma Pack: Bronze", "Chroma Pack: Copper", "Academy"},
["Diana"]        = {"Classic", "Dark Valkyrie", "Lunar Goddess"},
["DrMundo"]      = {"Classic", "Toxic", "Mr. Mundoverse", "Corporate Mundo", "Mundo Mundo", "Executioner Mundo", "Rageborn Mundo", "TPA Mundo", "Pool Party"},
["Draven"]       = {"Classic", "Soul Reaver", "Gladiator", "Primetime", "Pool Party"},
  -- E 
["Ekko"]         = {"Classic", "Sandstorm", "Academy"},
["Elise"]        = {"Classic", "Death Blossom", "Victorious", "Blood Moon"},
["Evelynn"]      = {"Classic", "Shadow", "Masquerade", "Tango", "Safecracker"},
["Ezreal"]       = {"Classic", "Nottingham", "Striker", "Frosted", "Explorer", "Pulsefire", "TPA", "Debonair", "Ace of Spades"},
  -- F 
["FiddleSticks"] = {"Classic", "Spectral", "Union Jack", "Bandito", "Pumpkinhead", "Fiddle Me Timbers", "Surprise Party", "Dark Candy", "Risen"},
["Fiora"]        = {"Classic", "Royal Guard", "Nightraven", "Headmistress", "PROJECT"},
["Fizz"]         = {"Classic", "Atlantean", "Tundra", "Fisherman", "Void", "Chroma Pack: Orange", "Chroma Pack: Black", "Chroma Pack: Red", "Cottontail"},
  -- G  
["Galio"]        = {"Classic", "Enchanted", "Hextech", "Commando", "Gatekeeper", "Debonair"},
["Gangplank"]    = {"Classic", "Spooky", "Minuteman", "Sailor", "Toy Soldier", "Special Forces", "Sultan", "Captain"},
["Garen"]        = {"Classic", "Sanguine", "Desert Trooper", "Commando", "Dreadknight", "Rugged", "Steel Legion", "Chroma Pack: Garnet", "Chroma Pack: Plum", "Chroma Pack: Ivory", "Rogue Admiral"},
["Gnar"]         = {"Classic", "Dino", "Gentleman", "Snow Day"},
["Gragas"]       = {"Classic", "Scuba", "Hillbilly", "Santa", "Gragas, Esq.", "Vandal", "Oktoberfest", "Superfan", "Fnatic", "Caskbreaker"},
["Graves"]       = {"Classic", "Hired Gun", "Jailbreak", "Mafia", "Riot", "Pool Party", "Cutthroat"},
  -- H 
["Hecarim"]      = {"Classic", "Blood Knight", "Reaper", "Headless", "Arcade", "Elderwood"},
["Heimerdinger"] = {"Classic", "Alien Invader", "Blast Zone", "Piltover Customs", "Snowmerdinger", "Hazmat"},
  -- I 
["Illaoi"]       = {"Classic", "Void Bringer"},
["Irelia"]       = {"Classic", "Nightblade", "Aviator", "Infiltrator", "Frostblade", "Order of the Lotus"},
  -- J 
["Janna"]        = {"Classic", "Tempest", "Hextech", "Frost Queen", "Victorious", "Forecast", "Fnatic"},
["JarvanIV"]     = {"Classic", "Commando", "Dragonslayer", "Darkforge", "Victorious", "Warring Kingdoms", "Fnatic"},
["Jax"]          = {"Classic", "The Mighty", "Vandal", "Angler", "PAX", "Jaximus", "Temple", "Nemesis", "SKT T1", "Chroma Pack: Cream", "Chroma Pack: Amber", "Chroma Pack: Brick", "Warden"},
["Jayce"]        = {"Classic", "Full Metal", "Debonair", "Forsaken"},
["Jinx"]         = {"Classic", "Mafia", "Firecracker", "Slayer"},
  -- K 
["Kalista"]      = {"Classic", "Blood Moon", "Championship"},
["Karma"]        = {"Classic", "Sun Goddess", "Sakura", "Traditional", "Order of the Lotus", "Warden"},
["Karthus"]      = {"Classic", "Phantom", "Statue of", "Grim Reaper", "Pentakill", "Fnatic", "Chroma Pack: Burn", "Chroma Pack: Blight", "Chroma Pack: Frostbite"},
["Kassadin"]     = {"Classic", "Festival", "Deep One", "Pre-Void", "Harbinger", "Cosmic Reaver"},
["Katarina"]     = {"Classic", "Mercenary", "Red Card", "Bilgewater", "Kitty Cat", "High Command", "Sandstorm", "Slay Belle", "Warring Kingdoms"},
["Kayle"]        = {"Classic", "Silver", "Viridian", "Unmasked", "Battleborn", "Judgment", "Aether Wing", "Riot"},
["Kennen"]       = {"Classic", "Deadly", "Swamp Master", "Karate", "Kennen M.D.", "Arctic Ops"},
["Khazix"]       = {"Classic", "Mecha", "Guardian of the Sands"},
["Kindred"]      = {"Classic", "Shadowfire"},
["KogMaw"]       = {"Classic", "Caterpillar", "Sonoran", "Monarch", "Reindeer", "Lion Dance", "Deep Sea", "Jurassic", "Battlecast"},
  -- L 
["Leblanc"]      = {"Classic", "Wicked", "Prestigious", "Mistletoe", "Ravenborn"},
["LeeSin"]       = {"Classic", "Traditional", "Acolyte", "Dragon Fist", "Muay Thai", "Pool Party", "SKT T1", "Chroma Pack: Black", "Chroma Pack: Blue", "Chroma Pack: Yellow", "Knockout"},
["Leona"]        = {"Classic", "Valkyrie", "Defender", "Iron Solari", "Pool Party", "Chroma Pack: Pink", "Chroma Pack: Azure", "Chroma Pack: Lemon", "PROJECT"},
["Lissandra"]    = {"Classic", "Bloodstone", "Blade Queen"},
["Lucian"]       = {"Classic", "Hired Gun", "Striker", "Chroma Pack: Yellow", "Chroma Pack: Red", "Chroma Pack: Blue", "PROJECT"},
["Lulu"]         = {"Classic", "Bittersweet", "Wicked", "Dragon Trainer", "Winter Wonder", "Pool Party"},
["Lux"]          = {"Classic", "Sorceress", "Spellthief", "Commando", "Imperial", "Steel Legion", "Star Guardian"},
  -- M 
["Malphite"]     = {"Classic", "Shamrock", "Coral Reef", "Marble", "Obsidian", "Glacial", "Mecha", "Ironside"},
["Malzahar"]     = {"Classic", "Vizier", "Shadow Prince", "Djinn", "Overlord", "Snow Day"},
["Maokai"]       = {"Classic", "Charred", "Totemic", "Festive", "Haunted", "Goalkeeper"},
["MasterYi"]     = {"Classic", "Assassin", "Chosen", "Ionia", "Samurai Yi", "Headhunter", "Chroma Pack: Gold", "Chroma Pack: Aqua", "Chroma Pack: Crimson", "PROJECT"},
["MissFortune"]  = {"Classic", "Cowgirl", "Waterloo", "Secret Agent", "Candy Cane", "Road Warrior", "Mafia", "Arcade", "Captain"},
["Mordekaiser"]  = {"Classic", "Dragon Knight", "Infernal", "Pentakill", "Lord", "King of Clubs"},
["Morgana"]      = {"Classic", "Exiled", "Sinful Succulence", "Blade Mistress", "Blackthorn", "Ghost Bride", "Victorious", "Chroma Pack: Toxic", "Chroma Pack: Pale", "Chroma Pack: Ebony"},
  -- N 
["Nami"]         = {"Classic", "Koi", "River Spirit", "Urf", "Chroma Pack: Sunbeam", "Chroma Pack: Smoke", "Chroma Pack: Twilight"},
["Nasus"]        = {"Classic", "Galactic", "Pharaoh", "Dreadknight", "Riot K-9", "Infernal", "Archduke", "Chroma Pack: Burn", "Chroma Pack: Blight", "Chroma Pack: Frostbite",},
["Nautilus"]     = {"Classic", "Abyssal", "Subterranean", "AstroNautilus", "Warden"},
["Nidalee"]      = {"Classic", "Snow Bunny", "Leopard", "French Maid", "Pharaoh", "Bewitching", "Headhunter", "Warring Kingdoms"},
["Nocturne"]     = {"Classic", "Frozen Terror", "Void", "Ravager", "Haunting", "Eternum"},
["Nunu"]         = {"Classic", "Sasquatch", "Workshop", "Grungy", "Nunu Bot", "Demolisher", "TPA", "Zombie"},
  -- O 
["Olaf"]         = {"Classic", "Forsaken", "Glacial", "Brolaf", "Pentakill", "Marauder"},
["Orianna"]      = {"Classic", "Gothic", "Sewn Chaos", "Bladecraft", "TPA", "Winter Wonder"},
  -- P 
["Pantheon"]     = {"Classic", "Myrmidon", "Ruthless", "Perseus", "Full Metal", "Glaive Warrior", "Dragonslayer", "Slayer"},
["Poppy"]        = {"Classic", "Noxus", "Lollipoppy", "Blacksmith", "Ragdoll", "Battle Regalia", "Scarlet Hammer"},
  -- Q 
["Quinn"]        = {"Classic", "Phoenix", "Woad Scout", "Corsair"},
  -- R 
["Rammus"]       = {"Classic", "King", "Chrome", "Molten", "Freljord", "Ninja", "Full Metal", "Guardian of the Sands"},
["Reksai"]       = {"Classic", "Eternum", "Pool Party"},
["Renekton"]     = {"Classic", "Galactic", "Outback", "Bloodfury", "Rune Wars", "Scorched Earth", "Pool Party", "Scorched Earth", "Prehistoric"},
["Rengar"]       = {"Classic", "Headhunter", "Night Hunter", "SSW"},
["Riven"]        = {"Classic", "Redeemed", "Crimson Elite", "Battle Bunny", "Championship", "Dragonblade", "Arcade"},
["Rumble"]       = {"Classic", "Rumble in the Jungle", "Bilgerat", "Super Galaxy"},
["Ryze"]         = {"Classic", "Human", "Tribal", "Uncle", "Triumphant", "Professor", "Zombie", "Dark Crystal", "Pirate", "Whitebeard"},
  -- S 
["Sejuani"]      = {"Classic", "Sabretusk", "Darkrider", "Traditional", "Bear Cavalry", "Poro Rider"},
["Shaco"]        = {"Classic", "Mad Hatter", "Royal", "Nutcracko", "Workshop", "Asylum", "Masked", "Wild Card"},
["Shen"]         = {"Classic", "Frozen", "Yellow Jacket", "Surgeon", "Blood Moon", "Warlord", "TPA"},
["Shyvana"]      = {"Classic", "Ironscale", "Boneclaw", "Darkflame", "Ice Drake", "Championship"},
["Singed"]       = {"Classic", "Riot Squad", "Hextech", "Surfer", "Mad Scientist", "Augmented", "Snow Day", "SSW"},
["Sion"]         = {"Classic", "Hextech", "Barbarian", "Lumberjack", "Warmonger"},
["Sivir"]        = {"Classic", "Warrior Princess", "Spectacular", "Huntress", "Bandit", "PAX", "Snowstorm", "Warden", "Victorious"},
["Skarner"]      = {"Classic", "Sandscourge", "Earthrune", "Battlecast Alpha", "Guardian of the Sands"},
["Sona"]         = {"Classic", "Muse", "Pentakill", "Silent Night", "Guqin", "Arcade", "DJ"},
["Soraka"]       = {"Classic", "Dryad", "Divine", "Celestine", "Reaper", "Order of the Banana"},
["Swain"]        = {"Classic", "Northern Front", "Bilgewater", "Tyrant"},
["Syndra"]       = {"Classic", "Justicar", "Atlantean", "Queen of Diamonds", "Snow Day"},
  -- T 
["TahmKench"]    = {"Classic", "Master Chef"},
["Talon"]        = {"Classic", "Renegade", "Crimson Elite", "Dragonblade", "SSW"},
["Taric"]        = {"Classic", "Emerald", "Armor of the Fifth Age", "Bloodstone"},
["Teemo"]        = {"Classic", "Happy Elf", "Recon", "Badger", "Astronaut", "Cottontail", "Super", "Panda", "Omega Squad"},
["Thresh"]       = {"Classic", "Deep Terror", "Championship", "Blood Moon", "SSW"},
["Tristana"]     = {"Classic", "Riot Girl", "Earnest Elf", "Firefighter", "Guerilla", "Buccaneer", "Rocket Girl", "Chroma Pack: Navy", "Chroma Pack: Purple", "Chroma Pack: Orange", "Dragon Trainer"},
["Trundle"]      = {"Classic", "Lil' Slugger", "Junkyard", "Traditional", "Constable"},
["Tryndamere"]   = {"Classic", "Highland", "King", "Viking", "Demonblade", "Sultan", "Warring Kingdoms", "Nightmare"},
["TwistedFate"]  = {"Classic", "PAX", "Jack of Hearts", "The Magnificent", "Tango", "High Noon", "Musketeer", "Underworld", "Red Card", "Cutpurse"},
["Twitch"]       = {"Classic", "Kingpin", "Whistler Village", "Medieval", "Gangster", "Vandal", "Pickpocket", "SSW"},
  -- U 
["Udyr"]         = {"Classic", "Black Belt", "Primal", "Spirit Guard", "Definitely Not"},
["Urgot"]        = {"Classic", "Giant Enemy Crabgot", "Butcher", "Battlecast"},
  -- V 
["Varus"]        = {"Classic", "Blight Crystal", "Arclight", "Arctic Ops", "Heartseeker", "Swiftbolt"},
["Vayne"]        = {"Classic", "Vindicator", "Aristocrat", "Dragonslayer", "Heartseeker", "SKT T1", "Arclight", "Chroma Pack: Green", "Chroma Pack: Red", "Chroma Pack: Silver"},
["Veigar"]       = {"Classic", "White Mage", "Curling", "Veigar Greybeard", "Leprechaun", "Baron Von", "Superb Villain", "Bad Santa", "Final Boss"},
["Velkoz"]       = {"Classic", "Battlecast", "Arclight"},
["Vi"]           = {"Classic", "Neon Strike", "Officer", "Debonair", "Demon"},
["Viktor"]       = {"Classic", "Full Machine", "Prototype", "Creator"},
["Vladimir"]     = {"Classic", "Count", "Marquis", "Nosferatu", "Vandal", "Blood Lord", "Soulstealer", "Academy"},
["Volibear"]     = {"Classic", "Thunder Lord", "Northern Storm", "Runeguard", "Captain"},
  -- W 
["Warwick"]      = {"Classic", "Grey", "Urf the Manatee", "Big Bad", "Tundra Hunter", "Feral", "Firefang", "Hyena", "Marauder"},
["MonkeyKing"]   = {"Classic", "Volcanic", "General", "Jade Dragon", "Underworld"},
  -- X 
["Xerath"]       = {"Classic", "Runeborn", "Battlecast", "Scorched Earth", "Guardian of the Sands"},
["XinZhao"]      = {"Classic", "Commando", "Imperial", "Viscero", "Winged Hussar", "Warring Kingdoms", "Secret Agent"},
  -- Y 
["Yasuo"]        = {"Classic", "High Noon", "PROJECT"},
["Yorick"]       = {"Classic", "Undertaker", "Pentakill"},
  -- Z 
["Zac"]          = {"Classic", "Special Weapon", "Pool Party", "Chroma Pack: Orange", "Chroma Pack: Bubblegum", "Chroma Pack: Honey"},
["Zed"]          = {"Classic", "Shockblade", "SKT T1", "PROJECT"},
["Ziggs"]        = {"Classic", "Mad Scientist", "Major", "Pool Party", "Snow Day", "Master Arcanist"},
["Zilean"]       = {"Classic", "Old Saint", "Groovy", "Shurima Desert", "Time Machine", "Blood Moon"},
["Zyra"]         = {"Classic", "Wildfire", "Haunted", "SKT T1"},

}

local SkinObjects = {

["Orianna"]      = {"TheDoomBall"},
["Elise"]        = {"Spiderling"},
["Zac"]          = {"RebirthBlob"},
["Heimerdinger"] = {"H-28G Evolution Turret"},
["Teemo"]        = {"Noxious Trap"},
["Annie"]        = {"Tibbers"},
["Maokai"]       = {"DoABarrelRoll"},
["JarvanIV"]     = {"Beacon", "JarvanIVWall"},
["Malzahar"]     = {"Portal to the Void", "Voidling"},
["Shaco"]        = {"Jack In The Box"},
["Olaf"]         = {"HiddenMinion"},
["Nidalee"]      = {"Noxious Trap"},

}

local menuTable = {

["Orders"] = {"Disabled","QWE","QEW","WQE","WEQ","EQW","EWQ"}

}

local orderTable = {
  
[1] = {nil},
[2] = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}, 
[3] = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W},
[4] = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E},
[5] = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q},
[6] = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W},
[7] = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q},

}

local orderChat = {
  
[1] = "Disabled",
[2] = "QWE", 
[3] = "QEW",
[4] = "WQE",
[5] = "WEQ",
[6] = "EQW",
[7] = "EWQ",

}

local res = GetResolution()
local myHero = GetMyHero()
local globalTick = 0

OnTick (function() 
  GetskilllvlUp  = (GetCastLevel(myHero,_Q) + GetCastLevel(myHero,_W) + GetCastLevel(myHero,_E) + GetCastLevel(myHero,_R) + 1)
  GetskilllvlUp2 = (GetskilllvlUp - 1)
  if GetskilllvlUp > GetLevel(myHero) then
    GetskilllvlUp = (GetskilllvlUp - 1)
  end

  if GetLevel(myHero) > GetskilllvlUp2 then
    canlvlSpell = true
  else 
    canlvlSpell = false
  end

  if Config.levelorder:Value() ~= 1 and canlvlSpell then
    local Ticker = GetTickCount()
    if (globalTick + math.random(300,1000)) < Ticker then
        --print("Current skill level-up " .. GetskilllvlUp .. ". Champion current level " .. GetLevel(myHero) .. ".")    
        LevelSpell(levelspellorder[GetskilllvlUp])
        globalTick = Ticker
    end
  end

  if not canlvlSpell then
    --print("No spells available to level.")
  end
end)

bubbles = ""
bubblesTimer = 0
staticString = ""
dummyj = 0
animationUpdate = 0

local function bubble(msg)
    staticString = msg
    bubblesTimer = GetTickCount()
    dummyj = 1
end

local function displayBubble(delay,msg)
    DelayAction(bubble, delay, msg)
end

local function OnScreen(x, y)
    return x > 0 and x <= res.x and y > 0 and y <= res.y
end

local function drawRect(x, y, width, height, thickness, color)
    if thickness == 0 then
        return
    end
    x = x - 1
    y = y - 1
    width = width + 2
    height = height + 2
    local halfThick = math.floor(thickness/2)
    DrawLine(x - halfThick, y, x + width + halfThick, y, thickness, color)
    DrawLine(x, y + halfThick, x, y + height - halfThick, thickness, color)
    DrawLine(x + width, y + halfThick, x + width, y + height - halfThick, thickness, color)
    DrawLine(x - halfThick, y + height, x + width + halfThick, y + height, thickness, color)
end

local function drawFilledRect(x, y, width, height, thickness, color, backgroundColor)
    DrawLine(x, y + (height/2), x + width+1, y + (height/2), height+1, backgroundColor)
    drawRect(x, y, width, height, thickness, color)
end

local function GetTextArea(str, size)
  return { x = str:len() * size * 0.375, y = size * 1.25 }
end

OnTick(function()
    if GetTickCount() - bubblesTimer > 9000 then 
        dummyj = 1
    end
    if staticString ~= nil and GetTickCount() - animationUpdate > 40 and dummyj <= string.len(staticString) then
        bubbles = string.sub(staticString, 1, dummyj)
        dummyj = dummyj + 1
        animationUpdate = GetTickCount()
    end
end)

OnDraw(function()
    local barpos = GetHPBarPos(myHero)
    local heroX = barpos.x + 50
    local heroY = barpos.y - 50
    if myHero ~= nil and IsVisible(myHero) and bubbles ~= nil and GetTickCount() - bubblesTimer < 9000 and OnScreen(heroX, heroY) then
        local xOffset = GetTextArea(bubbles, 20).x
        drawFilledRect(heroX-xOffset/2, heroY-25, xOffset, 20, 0, 822083568, 4294967280 )
        --Close both sides 
        for k=1, 20 do
            local j=k/2
            DrawLine(heroX-xOffset/2-j, heroY-15+(10-math.sqrt(10^2-j^2)), heroX-xOffset/2-j, heroY-15+20-(10-math.sqrt(10^2-j^2)), 1, 4294967280)
            DrawLine(heroX-xOffset/2+xOffset +j, heroY-15+(10-math.sqrt(10^2-j^2)), heroX-xOffset/2+xOffset +j, heroY-15+20-(10-math.sqrt(10^2-j^2)), 1, 4294967280)
        --Close bottom
            DrawLine(heroX-j/2, heroY-15+20, heroX-j/2, heroY-15+20+15-j*3/2, 1, 4294967280)
            DrawLine(heroX+j/2, heroY-15+20, heroX+j/2, heroY-15+20+15-j*3/2, 1, 4294967280)
        end
        DrawText(bubbles,20,heroX-xOffset/2,heroY-15, 0xff000000 )
    end
end)

Config = Menu("SkinChanger & Auto-leveler", "Skinchanger")
Config:DropDown('skin', GetObjectName(myHero), 0, skinMeta[GetObjectName(myHero)], HeroSkinChanger, true)
Config.skin:Value(0)
Config.skin.callback = function(model) HeroSkinChanger(GetMyHero(), model - 1) displayBubble(2, {skinMeta[GetObjectName(myHero)][model] .." ".. GetObjectName(myHero) .. " Loaded!"}) end
Config:DropDown("levelorder", "Level Order", 1, menuTable["Orders"], LevelSpell, true)
Config.levelorder:Value(1)
Config.levelorder.callback = function(order) levelspellorder = orderTable[order] displayBubble(2, {"Auto-leveling spells in order " .. orderChat[order] .. "."}) end


local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

function Base64Encode(data)
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

function Base64Decode(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

class "ScriptUpdate"
function ScriptUpdate:__init(LocalVersion,UseHttps, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion,CallbackError)
    self.LocalVersion = LocalVersion
    self.Host = Host
    self.VersionPath = '/GOS/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..VersionPath)..'&rand='..math.random(99999999)
    self.ScriptPath = '/GOS/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..ScriptPath)..'&rand='..math.random(99999999)
    self.SavePath = SavePath
    self.CallbackUpdate = CallbackUpdate
    self.CallbackNoUpdate = CallbackNoUpdate
    self.CallbackNewVersion = CallbackNewVersion
    self.CallbackError = CallbackError
    OnDraw(function() self:OnDraw() end)
    self:CreateSocket(self.VersionPath)
    self.DownloadStatus = 'Connecting to Server for VersionInfo'
    OnTick(function() self:GetOnlineVersion() end)
end

function ScriptUpdate:print(str)
    print('<font color="#FFFFFF">'..os.clock()..': '..str)
end

function DrawLines(t,w,c)
  for i=1, #t-1 do
    DrawLine(t[i].x, t[i].y, t[i+1].x, t[i+1].y, w, c)
  end
end

function ScriptUpdate:OnDraw()
  if self.DownloadStatus ~= 'Downloading Script (100%)' and self.DownloadStatus ~= 'Downloading VersionInfo (100%)'then
      local bP = {['x1'] = res.x - (res.x - 390),['x2'] = res.x - (res.x - 20),['y1'] = res.y / 2,['y2'] = (res.y / 2) + 20,}
    local text = 'Download Status: '..(self.DownloadStatus or 'Unknown')
    DrawLine(bP.x1, bP.y1 + 20, bP.x2,  bP.y1 + 20, 20, ARGB(125, 255, 255, 255))
    local xOff
      if self.File and self.Size then
      local c = math.round(100/self.Size*self.File:len(),2)/100
      xOff = c < 1 and math.ceil(370 * c) or 370
    else
      xOff = 1
    end
    local percent = 1 - xOff / 470
    DrawLine(bP.x2 + xOff, bP.y1 + 20, bP.x2, bP.y1 + 20, 20, ARGB(255, 255 * percent, 255 - (255 * percent), 0))
    DrawLines({{x=bP.x1, y=bP.y1}, {x=bP.x2, y=bP.y1}, {x=bP.x2, y=bP.y2}, {x=bP.x1, y=bP.y2}, {x=bP.x1, y=bP.y1}, }, 3, ARGB(255, 0x0A, 0x0A, 0x0A))
    DrawText(text, 16, res.x - (res.x - 205) - (GetTextArea(text, 16).x / 2), bP.y1 + 1, ARGB(255,10,10,10))
  end
end

function ScriptUpdate:CreateSocket(url)
    if not self.LuaSocket then
        self.LuaSocket = require("socket")
    else
        self.Socket:close()
        self.Socket = nil
        self.Size = nil
        self.RecvStarted = false
    end
    self.LuaSocket = require("socket")
    self.Socket = self.LuaSocket.tcp()
    self.Socket:settimeout(0, 'b')
    self.Socket:settimeout(99999999, 't')
    self.Socket:connect('plebleaks.com', 80)
    self.Url = url
    self.Started = false
    self.LastPrint = ""
    self.File = ""
end

function ScriptUpdate:Base64Encode(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x)
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

function ScriptUpdate:GetOnlineVersion()
    if self.GotScriptVersion then return end

    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
        self.Started = true
        self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: plebleaks.com\r\n\r\n")
    end
    if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
        self.RecvStarted = true
        self.DownloadStatus = 'Downloading VersionInfo (0%)'
    end

    self.File = self.File .. (self.Receive or self.Snipped)
    if self.File:find('</s'..'ize>') then
        if not self.Size then
            self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
        end
        if self.File:find('<scr'..'ipt>') then
            local _,ScriptFind = self.File:find('<scr'..'ipt>')
            local ScriptEnd = self.File:find('</scr'..'ipt>')
            if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
            local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
            self.DownloadStatus = 'Downloading VersionInfo ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
        end
    end
    if self.File:find('</scr'..'ipt>') then
        self.DownloadStatus = 'Downloading VersionInfo (100%)'
        local a,b = self.File:find('\r\n\r\n')
        self.File = self.File:sub(a,-1)
        self.NewFile = ''
        for line,content in ipairs(self.File:split('\n')) do
            if content:len() > 5 then
                self.NewFile = self.NewFile .. content
            end
        end
        local HeaderEnd, ContentStart = self.File:find('<scr'..'ipt>')
        local ContentEnd, _ = self.File:find('</sc'..'ript>')
        if not ContentStart or not ContentEnd then
            if self.CallbackError and type(self.CallbackError) == 'function' then
                self.CallbackError()
            end
        else
            self.OnlineVersion = (Base64Decode(self.File:sub(ContentStart + 1,ContentEnd-1)))
            self.OnlineVersion = tonumber(self.OnlineVersion)
            if self.OnlineVersion > self.LocalVersion then
                if self.CallbackNewVersion and type(self.CallbackNewVersion) == 'function' then
                    self.CallbackNewVersion(self.OnlineVersion,self.LocalVersion)
                end
                self:CreateSocket(self.ScriptPath)
                self.DownloadStatus = 'Connect to Server for ScriptDownload'
                OnTick(function() self:DownloadUpdate() end)
            else
                if self.CallbackNoUpdate and type(self.CallbackNoUpdate) == 'function' then
                    self.CallbackNoUpdate(self.LocalVersion)
                end
            end
        end
        self.GotScriptVersion = true
    end
end

function ScriptUpdate:DownloadUpdate()
    if self.GotScriptUpdate then return end
    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
        self.Started = true
        self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: plebleaks.com\r\n\r\n")
    end
    if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
        self.RecvStarted = true
        self.DownloadStatus = 'Downloading Script (0%)'
    end

    self.File = self.File .. (self.Receive or self.Snipped)
    if self.File:find('</si'..'ze>') then
        if not self.Size then
            self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
        end
        if self.File:find('<scr'..'ipt>') then
            local _,ScriptFind = self.File:find('<scr'..'ipt>')
            local ScriptEnd = self.File:find('</scr'..'ipt>')
            if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
            local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
            self.DownloadStatus = 'Downloading Script ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
        end
    end
    if self.File:find('</scr'..'ipt>') then
        self.DownloadStatus = 'Downloading Script (100%)' 
        local a,b = self.File:find('\r\n\r\n')
        self.File = self.File:sub(a,-1)
        self.NewFile = ''
        for line,content in ipairs(self.File:split('\n')) do
            if content:len() > 5 then
                self.NewFile = self.NewFile .. content
            end
        end
        local HeaderEnd, ContentStart = self.NewFile:find('<sc'..'ript>')
        local ContentEnd, _ = self.NewFile:find('</scr'..'ipt>')
        if not ContentStart or not ContentEnd then
            if self.CallbackError and type(self.CallbackError) == 'function' then
                self.CallbackError()
            end
        else
            local newf = self.NewFile:sub(ContentStart+1,ContentEnd-1)
            local newf = newf:gsub('\r','')
            if newf:len() ~= self.Size then
                if self.CallbackError and type(self.CallbackError) == 'function' then
                    self.CallbackError()
                end
                return
            end
            local newf = Base64Decode(newf)
            local f = io.open(self.SavePath,"w+b")
                f:write(newf)
                f:close()
                if self.CallbackUpdate and type(self.CallbackUpdate) == 'function' then
                    self.CallbackUpdate(self.OnlineVersion,self.LocalVersion)
                end
        end
        self.GotScriptUpdate = true
    end
end

local PopUp1 = false

if not GetSave("SkinChangerUpdate").entry then
    GetSave("SkinChangerUpdate").entry = 1
end
local mySavedShit = GetSave("SkinChangerUpdate").entry

if mySavedShit == 1 then
  GetSave("SkinChangerUpdate").entry = 0
  PopUp1 = true
end

local ToUpdate = {}
    ToUpdate.Version = 0.11
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/Icesythe7/GOS/master/SkinChanger.Version"
    ToUpdate.ScriptPath =  "/Icesythe7/GOS/master/SkinChanger.lua"
    ToUpdate.SavePath = SCRIPT_PATH.."/SkinChanger.lua"
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) GetSave("SkinChangerUpdate").entry = 1 GetSave("SkinChangerUpdate"):Save() displayBubble(2, {"SkinChanger: Updated to ("..NewVersion..") Please Reload with 2x F6. "}) end
    ToUpdate.CallbackNoUpdate = function(OldVersion) displayBubble(2, {"SkinChanger: No Updates Found! Version " ..ToUpdate.Version.. " Loaded, Good Luck " .. GetObjectBaseName(GetMyHero()) .. "!    "}) end
    ToUpdate.CallbackNewVersion = function(NewVersion) displayBubble(2, {"SkinChanger: New Version found ("..NewVersion.."). Please wait until its downloaded  "}) end
    ToUpdate.CallbackError = function(NewVersion) displayBubble(2, {"SkinChanger: Error while Downloading. Please try again.  "}) end
    ScriptUpdate(ToUpdate.Version,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)

 
--[[
OnCreateObj (function(Object)
  if SkinObjects[GetObjectName(myHero)] then
    for _, name in pairs (SkinObjects[GetObjectName(myHero)]) do
      if (GetObjectBaseName(Object) == name) then
        PrintChat(name)
        HeroSkinChanger(Object, 6)
      end
    end
  end
end)
]]

OnDraw (function()
  if PopUp1 then
local w, h1, h2, size = (res.x*0.70), (res.y*.15), (res.y*.9), res.y*.02
    DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(120,205,0,0))
    DrawLine(w, h1, w, h2/1.97, w/1.75, ARGB(120,50,0,0))
    DrawText(tostring("SkinChanger Changelog"), res.y * .028, (res.x/2.4), (res.y*.18), ARGB(255, 0 , 255, 255))
    DrawText(tostring("Ver 0.11:"), res.y*.015, (res.x/2.65), (res.y*.210), ARGB(225, 225, 175, 0))
    DrawText(tostring("               Added Snow Day Syndra, Gnar, and Bard."), res.y*.015, (res.x/2.65), (res.y*.225), ARGB(255, 255, 255, 255))
    DrawText(tostring("Ver 0.10"), res.y*.015, (res.x/2.65), (res.y*.240), ARGB(225, 225, 175, 0))
    DrawText(tostring("               Added Auto-leveling spells(disabled by default) more code cleanup."), res.y*.015, (res.x/2.65), (res.y*.255), ARGB(255, 255, 255, 255))
    DrawText(tostring(""), res.y*.015, (res.x/2.65), (res.y*.270), ARGB(255, 255, 255, 255))
    DrawText(tostring("              ())__CRAYON___)) >"), res.y*.015, (res.x/2.65), (res.y*.285), ARGB(255, 255, 255, 255))
    DrawText(tostring(""), res.y*.015, (res.x/2.65), (res.y*.300), ARGB(255, 255, 255, 255))
    DrawText(tostring("TODO:"), res.y*.015, (res.x/2.65), (res.y*.315), ARGB(225, 225, 175, 0))
    DrawText(tostring("             Fix form changing champs."), res.y*.015, (res.x/2.65), (res.y*.330), ARGB(255, 255, 255, 255))
    DrawText(tostring("             Add ward skins?"), res.y*.015, (res.x/2.65), (res.y*.345), ARGB(255, 255, 255, 255))
    DrawText(tostring("             Skin Objects."), res.y*.015, (res.x/2.65), (res.y*.360), ARGB(255, 255, 255, 255))
    DrawText(tostring("             Particles?"), res.y*.015, (res.x/2.65), (res.y*.375), ARGB(255, 255, 255, 255))
    local w1, w2, h1, h2 = (res.x/2)-50, (res.x/2)+50, (res.y*.70), (res.y*.75)
    DrawLine(w1, h1/1.775, w2, h1/1.775, 50, ARGB(122, 255, 0, 255)) 
    --DrawLine(w*.98, h1*.98, w*.98, h2*.98, w*.1*.98, ARGB(205,255,255,255))
    FillRect(w1+10, (res.y/2)-103, 80, 30, ARGB(255,0,255,255))
    DrawText(tostring("OK"),size, (res.x/2)-size+10, (res.y/2)-100, ARGB(255,0, 0, 0)) 

  end
end)

OnWndMsg (function(a, b)
  if PopUp1 then
    if a == WM_LBUTTONDOWN then
      if CursorIsUnder(res.x*.5-40, res.y*.5-103, 70, 30) then
        PopUp1 = false 
      end
    end
  end
end)