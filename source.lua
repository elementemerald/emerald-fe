--[[
    Emerald FE Admin
    Beta Version v1.0.3a
]]
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local sgui = game:GetService("StarterGui")
function randomString()
	local length = math.random(10,60)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

function GetPlayer(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(game.Players:GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                table.insert(Found,v)
            end
        end   
    elseif strl == "me" then
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name == game.Players.LocalPlayer.Name then
                table.insert(Found,v)
            end
        end  
    else
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found,v)
            end
        end    
    end
    return Found    
end

-- Instances:

local emeraldfe = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local notif = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")

--Properties:

emeraldfe.Name = "emeraldfe"
emeraldfe.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
emeraldfe.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Name = randomString()
Frame.Parent = emeraldfe
Frame.BackgroundColor3 = Color3.new(0.278431, 0.278431, 0.278431)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.781673312, 0, 1, 0)
Frame.Size = UDim2.new(0, 247, 0, 60)

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.new(1, 1, 1)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0, 0, 0.283333331, 0)
Frame_2.Size = UDim2.new(0, 247, 0, 1)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0.0931174085, 0, 0.0166666675, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 17)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Emerald FE Admin"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 14

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0283400808, 0, 0.416666657, 0)
TextBox.Size = UDim2.new(0, 230, 0, 26)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.TextSize = 14

notif.Name = "notif"
notif.Parent = emeraldfe
notif.BackgroundColor3 = Color3.new(0.278431, 0.278431, 0.278431)
notif.BorderSizePixel = 0
notif.Position = UDim2.new(0.346613526, 0, -0.208000004, 0)
notif.Size = UDim2.new(0, 384, 0, 76)

TextLabel_2.Parent = notif
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Position = UDim2.new(0.239583328, 0, 0.0789473653, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 26)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Welcome"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14
TextLabel_2.TextWrapped = true

TextLabel_3.Parent = notif
TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.Position = UDim2.new(0.0703125, 0, 0.513157904, 0)
TextLabel_3.Size = UDim2.new(0, 339, 0, 26)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Thanks for using my FE Admin. ~elementemerald#0001"
TextLabel_3.TextColor3 = Color3.new(1, 1, 1)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14
TextLabel_3.TextWrapped = true

-- Scripts:

mouse.KeyDown:connect(function(k)
	if k == ";" then
		TextBox:CaptureFocus()
		spawn(function()
			repeat TextBox.Text = "" until TextBox.Text == ""
		end)
		Frame:TweenPosition(UDim2.new(0.782, 0, 0.885, 0), "InOut", "Quad", 1, true)
	end
end)

TextBox.FocusLost:connect(function(enterPressed)
	if enterPressed then
		if TextBox.Text == "fly" then
			flying = true
        	repeat wait()
        	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
        	local mouse = game.Players.LocalPlayer:GetMouse()
        	repeat wait() until mouse
        	local plr = game.Players.LocalPlayer
        	local torso = plr.Character.Torso
        	local deb = true
        	local ctrl = {f = 0, b = 0, l = 0, r = 0}
        	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        	local maxspeed = 80
        	local speed = 0
        	 
        	function FlyFunction()
        	local bg = Instance.new("BodyGyro", torso)
        	bg.P = 9e4
        	bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        	bg.cframe = torso.CFrame
        	local bv = Instance.new("BodyVelocity", torso)
        	bv.velocity = Vector3.new(0,0.1,0)
        	bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
	        repeat wait()
	        plr.Character.Humanoid.PlatformStand = true
	        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
	        speed = speed+.5+(speed/maxspeed)
	        if speed > maxspeed then
	        speed = maxspeed
	        end
	        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
	        speed = speed-1
	        if speed < 0 then
	        speed = 0
	        end
	        end
	        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
	        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
	        lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
	        elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
	        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
	        else
	        bv.velocity = Vector3.new(0,0.1,0)
	        end
	        bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
	        until not flying
	        ctrl = {f = 0, b = 0, l = 0, r = 0}
	        lastctrl = {f = 0, b = 0, l = 0, r = 0}
	        speed = 0
	        bg:Destroy()
	        bv:Destroy()
	        plr.Character.Humanoid.PlatformStand = false
	        end
	        mouse.KeyDown:connect(function(key)
	        if key:lower() == "w" then
	        ctrl.f = 1
	        elseif key:lower() == "s" then
	        ctrl.b = -1
	        elseif key:lower() == "a" then
	        ctrl.l = -1
	        elseif key:lower() == "d" then
	        ctrl.r = 1
	        end
	        end)
	        mouse.KeyUp:connect(function(key)
	        if key:lower() == "w" then
	        ctrl.f = 0
	        elseif key:lower() == "s" then
	        ctrl.b = 0
	        elseif key:lower() == "a" then
	        ctrl.l = 0
	        elseif key:lower() == "d" then
	        ctrl.r = 0
	        end
	        end)
	        FlyFunction()
			TextBox.Text = ""
			Frame:TweenPosition(UDim2.new(0.782, 0, 1, 0), "InOut", "Quad", 1)
		elseif TextBox.Text == "unfly" then
			flying = false
		elseif TextBox.Text == "ctrltp" then
			sgui:SetCore("SendNotification", { Title = "Emerald FE Admin Notification", Text = "Ctrl Click TP Activated" })
			ctrl = true
			mouse.Button1Down:connect(function()
				if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
				if not ctrl then return end
				if not mouse.Target then return end
				plr.Character:MoveTo(mouse.Hit.p)
			end)
		elseif string.sub(TextBox.Text, 1, 13) == ("disablectrltp") then
			ctrl = false
		elseif string.sub(TextBox.Text, 1, 5) == ("goto ") then
			for i,v in pairs(GetPlayer(string.sub(TextBox.Text, 6))) do
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
			end
		elseif string.sub(TextBox.Text, 1, 5) == ("view ") then
			for i,v in pairs(GetPlayer(string.sub(TextBox.Text, 6))) do
                game.Workspace.CurrentCamera.CameraSubject = game.Players[v.Name].Character.Head
			end
		elseif string.sub(TextBox.Text, 1, 6) == ("unview") then
            game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Head
		elseif string.sub(TextBox.Text, 1, 3) == ("ws ") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (string.sub(TextBox.Text, 4))
		elseif string.sub(TextBox.Text, 1, 3) == ("jp ") then
		   game.Players.LocalPlayer.Character.Humanoid.JumpPower = (string.sub(TextBox.Text, 4))
		end
		TextBox.Text = ""
		Frame:TweenPosition(UDim2.new(0.782, 0, 1, 0), "InOut", "Quad", 1, true)
	end
	Frame:TweenPosition(UDim2.new(0.782, 0, 1, 0), "InOut", "Quad", 1, true)
end)

local function AISOJC_fake_script() -- notif.LocalScript 
	local script = Instance.new('LocalScript', notif)

	wait(1.5)
	script.Parent:TweenPosition(UDim2.new(0.347, 0, 0.017, 0), "InOut", "Quad", 1)
	wait(3)
	script.Parent:TweenPosition(UDim2.new(0.347, 0, -0.208, 0), "InOut", "Quad", 1)
end
coroutine.wrap(AISOJC_fake_script)()
