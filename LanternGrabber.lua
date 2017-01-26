--SexySexyPrint by Azero--
function SexyPrint(message)
   local sexyName = "<font color=\"#FF5733\">[<b><i>Grabber</i></b>]</font>"
   local fontColor = "3393FF"
   print(sexyName .. " <font color=\"#" .. fontColor .. "\">" .. message .. "</font>")
end

local version = "0.01"
local lantern = nil

function Grabber()
	Grabber = scriptConfig("Grabber", "Grabber")
  		Grabber:addSubMenu("Settings", "Settings")
  		Grabber.Settings:addParam("Grab", "Grab Lantern Key", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("G"))
  		Grabber.Settings:addParam("Move", "Auto Move to Lantern", SCRIPT_PARAM_ONOFF, true)
  	Grabber:addSubMenu("Drawing", "Draw")
  		Grabber.Draw:addParam("Circle", "Draw Lantern Radius", SCRIPT_PARAM_ONOFF, true)
  		Grabber.Draw:addParam("Line", "Draw Line to Lantern", SCRIPT_PARAM_ONOFF, true)
end

function OnLoad()
	Grabber()
	DelayAction(function() SexyPrint("Version " ..version.. " Loaded!") end, 2)
end

function OnTick()
	if myHero.dead then 
		return 
	end
	if Grabber.Settings.Grab and lantern ~= nil then
		local distance = GetDistanceSqr(lantern)
		if Grabber.Settings.Move and distance > 250 ^ 2 then
			MoveToObj(lantern)
		elseif Grabber.Settings.Move and distance < 250 ^ 2 then
			lantern:Interact()
		elseif not Grabber.Settings.Move and distance < 250 ^ 2 then
			lantern:Interact()
		end
	end
end

function MoveToObj(obj)
	if GetDistanceSqr(obj) > 250 ^ 2 then
    	local moveToPos = myHero + (Vector(obj) - myHero):normalized() * 250
    	myHero:MoveTo(moveToPos.x, moveToPos.z)
  	end
end

function OnCreateObj(obj)
	if obj and obj ~= nil and obj.valid and obj.team == myHero.team then
		if obj.name == "ThreshLantern" then
			lantern = obj
		end
	end
end

function OnDeleteObj(obj)
	if obj and obj ~= nil and obj.valid and obj.team == myHero.team then
		if obj.name == "ThreshLantern" then
			lantern = nil
		end
	end
end

function OnDraw()
	if (myHero.dead or lantern == nil) then 
		return 
	end
	if Grabber.Draw.Circle then
		DrawCircle(lantern.x, lantern.y, lantern.z, 250, ARGB(255,255,0,0))
	end
	if Grabber.Draw.Line then
		DrawLine3D(myHero.x, myHero.y, myHero.z, lantern.x, lantern.y, lantern.z, 2, ARGB(255,255,0,0))
	end
end