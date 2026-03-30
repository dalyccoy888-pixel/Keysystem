-- ⚠️ IMPORTANT: Put this code at the VERY TOP of your Main Script (before obfuscating) ⚠️

local ProtectionConfig = {
    -- 🔴 CRITICAL: This MUST exactly match the 'Secret' value in your Key System's Config!
    -- If your Key System has: Secret = "Test"
    -- Then this must also be: SecretKey = "Test"
    SecretKey = "lyybigber",
    
    -- The name of your Hub (shown in the kick message if they try to bypass)
    HubName = "TOREN HUB"
}

-- Anti-Bypass Logic: Checks if the Key System successfully set the global variable
if not _G[ProtectionConfig.SecretKey] then
    local player = game:GetService("Players").LocalPlayer
    if player then
        player:Kick("\n🛡️ Unauthorized Execution 🛡️\n\nPlease use the official Key System to run " .. ProtectionConfig.HubName)
    end
    return -- Stops the rest of the script from loading!
end

-------------------------------------------------------------------------------
-- 👇 YOUR MAIN SCRIPT CODE STARTS HERE 👇
-------------------------------------------------------------------------------

print(ProtectionConfig.HubName .. " Loaded Successfully!")

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local lighting = game:GetService("Lighting")
local tweenService = game:GetService("TweenService")
local httpService = game:GetService("HttpService")

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TOREN_HUB"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if syn and syn.protect_gui then
    syn.protect_gui(screenGui)
    screenGui.Parent = player:WaitForChild("PlayerGui")
else
    screenGui.Parent = player:WaitForChild("PlayerGui")
end

-- ==================== ANTI ADMIN JOIN ====================
local adminNames = {
    "Uzoth", "DragonDojoOwner", "Terry_6th", "ShadowWizardLogan", "bIazies",
    "kszzle", "fl8mey", "0BCLIFETIME", "rip_fud", "Uzi_London", "arlthmetic",
    "mygame43", "rip_indra", "svscar", "tinytimclown", "Supreme_God", "lyybigber2"
}

local antiBanTitle = Instance.new("TextLabel")
antiBanTitle.Size = UDim2.new(0, 100, 0, 20)
antiBanTitle.Position = UDim2.new(0.5, -50, 0, 2)
antiBanTitle.BackgroundTransparency = 1
antiBanTitle.Text = "ANTI BAN"
antiBanTitle.TextColor3 = Color3.fromRGB(0, 255, 100)
antiBanTitle.Font = Enum.Font.GothamBold
antiBanTitle.TextSize = 12
antiBanTitle.ZIndex = 10
antiBanTitle.Parent = screenGui

local function checkAndKickIfAdmin()
    for _, v in pairs(players:GetPlayers()) do
        if v ~= player then
            for _, adminName in ipairs(adminNames) do
                if v.Name == adminName or string.lower(v.Name) == string.lower(adminName) then
                    game:Shutdown()
                    return true
                end
            end
        end
    end
    return false
end

checkAndKickIfAdmin()

task.spawn(function()
    while true do
        task.wait(0.5)
        checkAndKickIfAdmin()
    end
end)

players.PlayerAdded:Connect(function()
    task.wait(0.2)
    checkAndKickIfAdmin()
end)

-- Draggable Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 80, 0, 30)
toggleButton.Position = UDim2.new(0, 20, 0, 100)
toggleButton.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
toggleButton.Text = "TOREN"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 16
toggleButton.BorderSizePixel = 0
toggleButton.Draggable = true
toggleButton.Active = true
toggleButton.Parent = screenGui

-- Main UI Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 390, 0, 370)
mainFrame.Position = UDim2.new(0.5, -195, 0.5, -185)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 100, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 215, 0))
})
titleGradient.Rotation = 90
titleGradient.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "TOREN EQ HUB [ <font color='rgb(255,215,0)'>Premium</font> ] | Telegram : @maibigber"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 11
title.TextXAlignment = Enum.TextXAlignment.Left
title.RichText = true
title.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 1, 0)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.BorderSizePixel = 0
closeBtn.Parent = titleBar

-- Tab Bar
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, 0, 0, 35)
tabBar.Position = UDim2.new(0, 0, 0, 30)
tabBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
tabBar.BorderSizePixel = 0
tabBar.Parent = mainFrame

local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Size = UDim2.new(1, -20, 1, -80)
contentFrame.Position = UDim2.new(0, 10, 0, 70)
contentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
contentFrame.BorderSizePixel = 0
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
contentFrame.ScrollBarThickness = 8
contentFrame.Parent = mainFrame

local tabs = {
    ESP = {text = "ESP", button = nil, frame = nil},
    PVP = {text = "PVP", button = nil, frame = nil},
    Players = {text = "Players", button = nil, frame = nil},
    Setting = {text = "Setting", button = nil, frame = nil}
}

local function createTabFrame()
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.Visible = false
    frame.Parent = contentFrame
    return frame
end

for tabName, tabData in pairs(tabs) do
    tabData.frame = createTabFrame()
end

local tabX = 5
for tabName, tabData in pairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 90, 1, -6)
    btn.Position = UDim2.new(0, tabX, 0, 3)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    btn.Text = tabData.text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.BorderSizePixel = 0
    btn.Parent = tabBar
    tabData.button = btn
    tabX = tabX + 95
end

-- ==================== ESP Features (FIXED - Auto update all players) ====================
local espFrame = tabs.ESP.frame
local espY = 5

local espEnabled = false
local espNameEnabled = false
local espDistanceEnabled = false
local espBillboards = {}

local function createESPForPlayer(targetPlayer)
    if espBillboards[targetPlayer] then return end
    local char = targetPlayer.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 120, 0, 22)
    billboard.StudsOffset = Vector3.new(0, 1.8, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = head
    billboard.Parent = head
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 13
    label.Parent = billboard
    
    espBillboards[targetPlayer] = {billboard = billboard, label = label}
    updateESPText(targetPlayer)
end

local function updateESPText(targetPlayer)
    local data = espBillboards[targetPlayer]
    if not data or not data.label then return end
    local text = ""
    if espNameEnabled then text = targetPlayer.Name end
    if espDistanceEnabled then
        local char = player.Character
        local targetChar = targetPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
            local dist = (targetChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
            local distText = math.floor(dist) .. "m"
            if espNameEnabled then text = text .. " [" .. distText .. "]"
            else text = distText end
        end
    end
    if text == "" and espEnabled then text = "●" end
    data.label.Text = text
end

local function refreshAllESP()
    if not espEnabled then
        for _, data in pairs(espBillboards) do pcall(function() data.billboard:Destroy() end) end
        espBillboards = {}
        return
    end
    
    for _, v in pairs(players:GetPlayers()) do
        if v ~= player then
            if v.Character and v.Character:FindFirstChild("Head") then
                if not espBillboards[v] then
                    createESPForPlayer(v)
                else
                    updateESPText(v)
                end
            elseif espBillboards[v] then
                pcall(function() espBillboards[v].billboard:Destroy() end)
                espBillboards[v] = nil
            end
        end
    end
end

runService.RenderStepped:Connect(refreshAllESP)

players.PlayerAdded:Connect(function(p)
    refreshAllESP()
    p.CharacterAdded:Connect(function() task.wait(0.2); refreshAllESP() end)
end)

for _, v in pairs(players:GetPlayers()) do
    if v ~= player then
        v.CharacterAdded:Connect(function() task.wait(0.2); refreshAllESP() end)
    end
end

players.PlayerRemoving:Connect(function(p)
    if espBillboards[p] then
        pcall(function() espBillboards[p].billboard:Destroy() end)
        espBillboards[p] = nil
    end
end)

local function createModernCheckbox(parent, yPos, text, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 32)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundTransparency = 1
    frame.Parent = parent
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.8, 0, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(235, 235, 245)
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local checkBtn = Instance.new("TextButton")
    checkBtn.Size = UDim2.new(0, 26, 0, 26)
    checkBtn.Position = UDim2.new(1, -32, 0.5, -13)
    checkBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    checkBtn.Text = ""
    checkBtn.Font = Enum.Font.GothamBold
    checkBtn.TextSize = 18
    checkBtn.BorderSizePixel = 1
    checkBtn.BorderColor3 = Color3.fromRGB(80, 80, 95)
    checkBtn.Parent = frame
    
    local checked = false
    checkBtn.MouseButton1Click:Connect(function()
        checked = not checked
        if checked then
            checkBtn.Text = "✅"
            checkBtn.TextColor3 = Color3.fromRGB(0, 255, 100)
            checkBtn.BackgroundColor3 = Color3.fromRGB(35, 45, 35)
        else
            checkBtn.Text = ""
            checkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            checkBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        end
        callback(checked)
    end)
    
    return frame
end

createModernCheckbox(espFrame, espY, "Enable ESP", function(v) espEnabled = v; refreshAllESP() end)
espY = espY + 38
createModernCheckbox(espFrame, espY, "ESP Name", function(v) espNameEnabled = v; refreshAllESP() end)
espY = espY + 38
createModernCheckbox(espFrame, espY, "ESP Distance", function(v) espDistanceEnabled = v; refreshAllESP() end)

-- ==================== PVP Features ====================
local pvpFrame = tabs.PVP.frame
local pvpY = 5

local fruits = {
    Dragon = {remoteName = "Dragon-Dragon", range = 99, teleportHeight = 40},
    Kitsune = {remoteName = "Kitsune-Kitsune", range = 30, teleportHeight = 23},
    ["T-Rex"] = {remoteName = "T-Rex-T-Rex", range = 30, teleportHeight = 23},
    Gas = {remoteName = "Gas-Gas", range = 30, teleportHeight = 23}
}

local selectedFruit = "Dragon"
local autoEquipEnabled = false
local attackSpamEnabled = false
local selectedTarget = nil
local teleportMethod = "Bypass" -- "Bypass" or "Tween"
local keepEquipLoop = nil
local attackSpamThread = nil

local function equipFruit(fruitName)
    local fruit = fruits[fruitName]
    if not fruit then return false end
    local char = player.Character
    if not char then return false end
    if char:FindFirstChild(fruit.remoteName) then return true end
    
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        local fruitTool = backpack:FindFirstChild(fruit.remoteName)
        if fruitTool then fruitTool.Parent = char; task.wait(0.2) end
    end
    
    local remote = char:FindFirstChild(fruit.remoteName)
    if remote and remote:FindFirstChild("LeftClickRemote") then
        local randomVec = Vector3.new(math.random(-100, 100)/100, math.random(-30, 30)/100, math.random(-100, 100)/100).unit
        local args = {randomVec, 1}
        if fruitName == "Kitsune" then args = {randomVec, 1, true} end
        remote.LeftClickRemote:FireServer(unpack(args))
        return true
    end
    return false
end

local function keepFruitEquipped()
    while autoEquipEnabled do
        local char = player.Character
        if char and not char:FindFirstChild(fruits[selectedFruit].remoteName) then
            equipFruit(selectedFruit)
        end
        task.wait(1)
    end
end

local function getDirectionToTarget(target)
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then 
        return Vector3.new(math.random(-100,100)/100, math.random(-30,30)/100, math.random(-100,100)/100).unit
    end
    local targetChar = target.Character
    if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then 
        return Vector3.new(math.random(-100,100)/100, math.random(-30,30)/100, math.random(-100,100)/100).unit
    end
    return (targetChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).unit
end

local function getNearestPlayerInRange()
    local nearest = nil
    local nearestDist = 1000
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    local myPos = char.HumanoidRootPart.Position
    local fruitRange = fruits[selectedFruit].range
    
    for _, v in pairs(players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
            local dist = (v.Character.HumanoidRootPart.Position - myPos).Magnitude
            if dist < nearestDist and dist <= fruitRange then
                nearestDist = dist
                nearest = v
            end
        end
    end
    return nearest
end

-- Tween Teleport function - smooth, no clip, speed 350, lock at 23m above head
local function tweenTeleport(target)
    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return false end
    local targetPos = target.Character.HumanoidRootPart.Position
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return false end
    
    local teleportHeight = fruits[selectedFruit].teleportHeight
    local targetPosition = targetPos + Vector3.new(0, teleportHeight, 0)
    
    -- Enable no clip
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
    
    local distance = (char.HumanoidRootPart.Position - targetPosition).Magnitude
    local tweenInfo = TweenInfo.new(distance / 350, Enum.EasingStyle.Linear)
    local tween = tweenService:Create(char.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(targetPosition)})
    tween:Play()
    tween.Completed:Wait()
    
    -- Keep locked above head during attack
    task.spawn(function()
        local startTime = tick()
        while selectedTarget == target and attackSpamEnabled and tick() - startTime < 3 do
            task.wait(0.05)
            if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local newTargetPos = target.Character.HumanoidRootPart.Position
                char.HumanoidRootPart.CFrame = CFrame.new(newTargetPos + Vector3.new(0, teleportHeight, 0))
            end
        end
    end)
    return true
end

-- Bypass Teleport function - instant, lock at 23m above head
local function bypassTeleport(target)
    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return false end
    local targetPos = target.Character.HumanoidRootPart.Position
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return false end
    
    local teleportHeight = fruits[selectedFruit].teleportHeight
    local targetPosition = targetPos + Vector3.new(0, teleportHeight, 0)
    
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then v.CanCollide = false end
    end
    
    char.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
    
    task.spawn(function()
        local startTime = tick()
        while selectedTarget == target and attackSpamEnabled and tick() - startTime < 3 do
            task.wait(0.05)
            if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local newTargetPos = target.Character.HumanoidRootPart.Position
                char.HumanoidRootPart.CFrame = CFrame.new(newTargetPos + Vector3.new(0, teleportHeight, 0))
            end
        end
    end)
    return true
end

-- Attack spam function - super fast
local function attackSpamLoop()
    while attackSpamEnabled do
        local char = player.Character
        if not char then task.wait(0.03) continue end
        
        local attackTarget = nil
        
        if selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
            attackTarget = selectedTarget
            -- Teleport to selected target
            if teleportMethod == "Tween" then
                tweenTeleport(selectedTarget)
            else
                bypassTeleport(selectedTarget)
            end
        else
            attackTarget = getNearestPlayerInRange()
        end
        
        if attackTarget and attackTarget.Character and attackTarget.Character:FindFirstChild("HumanoidRootPart") then
            local fruit = fruits[selectedFruit]
            if fruit then
                local remote = char:FindFirstChild(fruit.remoteName)
                if remote and remote:FindFirstChild("LeftClickRemote") then
                    local direction = getDirectionToTarget(attackTarget)
                    local args = {direction, 1}
                    if selectedFruit == "Kitsune" then args = {direction, 1, true} end
                    remote.LeftClickRemote:FireServer(unpack(args))
                end
            end
        end
        task.wait(0.003)
    end
end

local function closeAllDropdowns()
    if fruitListFrame then fruitListFrame:Destroy(); fruitListFrame = nil; fruitListVisible = false end
    if methodListFrame then methodListFrame:Destroy(); methodListFrame = nil; methodListVisible = false end
end

-- Select Fruit Dropdown
local fruitFrame = Instance.new("Frame")
fruitFrame.Size = UDim2.new(1, -20, 0, 40)
fruitFrame.Position = UDim2.new(0, 0, 0, pvpY)
fruitFrame.BackgroundTransparency = 1
fruitFrame.Parent = pvpFrame

local fruitLabel = Instance.new("TextLabel")
fruitLabel.Size = UDim2.new(0.35, 0, 1, 0)
fruitLabel.Position = UDim2.new(0, 5, 0, 0)
fruitLabel.BackgroundTransparency = 1
fruitLabel.Text = "Select Fruit:"
fruitLabel.TextColor3 = Color3.fromRGB(235, 235, 245)
fruitLabel.Font = Enum.Font.GothamSemibold
fruitLabel.TextSize = 13
fruitLabel.TextXAlignment = Enum.TextXAlignment.Left
fruitLabel.Parent = fruitFrame

local fruitDropdown = Instance.new("TextButton")
fruitDropdown.Size = UDim2.new(0.55, 0, 1, -5)
fruitDropdown.Position = UDim2.new(0.4, 0, 0, 2)
fruitDropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
fruitDropdown.Text = "🐉 Dragon (99m)"
fruitDropdown.TextColor3 = Color3.fromRGB(255, 215, 0)
fruitDropdown.Font = Enum.Font.GothamBold
fruitDropdown.TextSize = 12
fruitDropdown.Parent = fruitFrame

local fruitListVisible = false
local fruitListFrame = nil
local fruitNames = {"Dragon", "Kitsune", "T-Rex", "Gas"}
local fruitIcons = {Dragon = "🐉", Kitsune = "🦊", ["T-Rex"] = "🦖", Gas = "💨"}
local fruitRanges = {Dragon = "99m", Kitsune = "30m", ["T-Rex"] = "30m", Gas = "30m"}

local function createFruitDropdown()
    if fruitListFrame then fruitListFrame:Destroy(); fruitListFrame = nil; fruitListVisible = false; return end
    closeAllDropdowns()
    fruitListVisible = true
    fruitListFrame = Instance.new("Frame")
    fruitListFrame.Size = UDim2.new(0.55, 0, 0, 140)
    fruitListFrame.Position = UDim2.new(0.4, 0, 0, 38)
    fruitListFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    fruitListFrame.BorderSizePixel = 1
    fruitListFrame.BorderColor3 = Color3.fromRGB(100, 100, 120)
    fruitListFrame.Parent = fruitFrame
    
    for i, fruitName in ipairs(fruitNames) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 35)
        btn.Position = UDim2.new(0, 0, 0, (i-1)*35)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        btn.Text = fruitIcons[fruitName] .. " " .. fruitName .. " (" .. fruitRanges[fruitName] .. ")"
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 11
        btn.Parent = fruitListFrame
        btn.MouseButton1Click:Connect(function()
            selectedFruit = fruitName
            fruitDropdown.Text = fruitIcons[fruitName] .. " " .. fruitName .. " (" .. fruitRanges[fruitName] .. ")"
            fruitListFrame:Destroy(); fruitListFrame = nil; fruitListVisible = false
            if autoEquipEnabled then task.spawn(function() equipFruit(selectedFruit) end) end
        end)
    end
end

fruitDropdown.MouseButton1Click:Connect(createFruitDropdown)
pvpY = pvpY + 48

-- Auto Equip Fruit
createModernCheckbox(pvpFrame, pvpY, "⚡ Auto Equip Fruit (Keep Equipped)", function(v)
    autoEquipEnabled = v
    if v then
        task.spawn(function() equipFruit(selectedFruit) end)
        if keepEquipLoop then task.cancel(keepEquipLoop) end
        keepEquipLoop = task.spawn(keepFruitEquipped)
    else
        if keepEquipLoop then task.cancel(keepEquipLoop) end
    end
end)
pvpY = pvpY + 38

-- Attack Spam M1
createModernCheckbox(pvpFrame, pvpY, "🔫 Fast Attack Spam M1", function(v)
    attackSpamEnabled = v
    if v then
        if attackSpamThread then task.cancel(attackSpamThread) end
        attackSpamThread = task.spawn(attackSpamLoop)
    end
end)
pvpY = pvpY + 38

-- Teleport Method Dropdown
local methodFrame = Instance.new("Frame")
methodFrame.Size = UDim2.new(1, -20, 0, 40)
methodFrame.Position = UDim2.new(0, 0, 0, pvpY)
methodFrame.BackgroundTransparency = 1
methodFrame.Parent = pvpFrame

local methodLabel = Instance.new("TextLabel")
methodLabel.Size = UDim2.new(0.4, 0, 1, 0)
methodLabel.Position = UDim2.new(0, 5, 0, 0)
methodLabel.BackgroundTransparency = 1
methodLabel.Text = "Teleport Method:"
methodLabel.TextColor3 = Color3.fromRGB(235, 235, 245)
methodLabel.Font = Enum.Font.GothamSemibold
methodLabel.TextSize = 13
methodLabel.TextXAlignment = Enum.TextXAlignment.Left
methodLabel.Parent = methodFrame

local methodDropdown = Instance.new("TextButton")
methodDropdown.Size = UDim2.new(0.55, 0, 1, -5)
methodDropdown.Position = UDim2.new(0.4, 0, 0, 2)
methodDropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
methodDropdown.Text = "⚡ Bypass Teleport"
methodDropdown.TextColor3 = Color3.fromRGB(100, 200, 255)
methodDropdown.Font = Enum.Font.GothamBold
methodDropdown.TextSize = 11
methodDropdown.Parent = methodFrame

local methodListVisible = false
local methodListFrame = nil
local methodsList = {{name = "Bypass Teleport", icon = "⚡", value = "Bypass"}, {name = "Tween Teleport", icon = "✨", value = "Tween"}}

local function createMethodDropdown()
    if methodListFrame then methodListFrame:Destroy(); methodListFrame = nil; methodListVisible = false; return end
    closeAllDropdowns()
    methodListVisible = true
    methodListFrame = Instance.new("Frame")
    methodListFrame.Size = UDim2.new(0.55, 0, 0, 70)
    methodListFrame.Position = UDim2.new(0.4, 0, 0, 38)
    methodListFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    methodListFrame.BorderSizePixel = 1
    methodListFrame.BorderColor3 = Color3.fromRGB(100, 100, 120)
    methodListFrame.Parent = methodFrame
    
    for i, method in ipairs(methodsList) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 35)
        btn.Position = UDim2.new(0, 0, 0, (i-1)*35)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        btn.Text = method.icon .. " " .. method.name
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 11
        btn.Parent = methodListFrame
        btn.MouseButton1Click:Connect(function()
            teleportMethod = method.value
            methodDropdown.Text = method.icon .. " " .. method.name
            methodListFrame:Destroy(); methodListFrame = nil; methodListVisible = false
        end)
    end
end

methodDropdown.MouseButton1Click:Connect(createMethodDropdown)
pvpY = pvpY + 48

-- Teleport Info
local infoFrame = Instance.new("Frame")
infoFrame.Size = UDim2.new(1, -20, 0, 30)
infoFrame.Position = UDim2.new(0, 0, 0, pvpY)
infoFrame.BackgroundTransparency = 1
infoFrame.Parent = pvpFrame

local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, 0, 1, 0)
infoLabel.Position = UDim2.new(0, 5, 0, 0)
infoLabel.BackgroundTransparency = 1
infoLabel.Text = "📍 Teleport to selected target only | Lock at 23m/40m above head"
infoLabel.TextColor3 = Color3.fromRGB(150, 150, 200)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 10
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.Parent = infoFrame
pvpY = pvpY + 38

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mousePos = userInputService:GetMouseLocation()
        
        if fruitListFrame then
            local absPos = fruitListFrame.AbsolutePosition
            local size = fruitListFrame.AbsoluteSize
            if not (mousePos.X >= absPos.X and mousePos.X <= absPos.X + size.X and mousePos.Y >= absPos.Y and mousePos.Y <= absPos.Y + size.Y) then
                fruitListFrame:Destroy(); fruitListFrame = nil; fruitListVisible = false
            end
        end
        
        if methodListFrame then
            local absPos = methodListFrame.AbsolutePosition
            local size = methodListFrame.AbsoluteSize
            if not (mousePos.X >= absPos.X and mousePos.X <= absPos.X + size.X and mousePos.Y >= absPos.Y and mousePos.Y <= absPos.Y + size.Y) then
                methodListFrame:Destroy(); methodListFrame = nil; methodListVisible = false
            end
        end
    end
end)

-- ==================== Players Tab ====================
local playersFrameTab = tabs.Players.frame
local playersY = 5

local playerListFrame = Instance.new("ScrollingFrame")
playerListFrame.Size = UDim2.new(1, -10, 0, 210)
playerListFrame.Position = UDim2.new(0, 5, 0, playersY)
playerListFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
playerListFrame.BorderSizePixel = 0
playerListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
playerListFrame.ScrollBarThickness = 6
playerListFrame.Parent = playersFrameTab

local refreshBtn = Instance.new("TextButton")
refreshBtn.Size = UDim2.new(0, 80, 0, 32)
refreshBtn.Position = UDim2.new(1, -85, 0, 220)
refreshBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
refreshBtn.Text = "⟳ Refresh"
refreshBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
refreshBtn.Font = Enum.Font.GothamBold
refreshBtn.TextSize = 12
refreshBtn.Parent = playersFrameTab

local function updatePlayerList()
    for _, v in pairs(playerListFrame:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    local yPos = 0
    for _, p in pairs(players:GetPlayers()) do
        if p ~= player then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -10, 0, 34)
            btn.Position = UDim2.new(0, 0, 0, yPos)
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            btn.Text = "👤 " .. p.Name .. "  |  ❤️ " .. (p.Character and p.Character:FindFirstChild("Humanoid") and math.floor(p.Character.Humanoid.Health) or "Dead")
            btn.TextColor3 = Color3.fromRGB(220, 220, 220)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 11
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Parent = playerListFrame
            
            local selectBtn = Instance.new("TextButton")
            selectBtn.Size = UDim2.new(0, 50, 0, 28)
            selectBtn.Position = UDim2.new(1, -55, 0.5, -14)
            selectBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 70)
            selectBtn.Text = (selectedTarget == p) and "✅" or "☐"
            selectBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            selectBtn.Font = Enum.Font.GothamBold
            selectBtn.TextSize = 16
            selectBtn.Parent = btn
            
            selectBtn.MouseButton1Click:Connect(function()
                if selectedTarget == p then
                    selectedTarget = nil
                    selectBtn.Text = "☐"
                    selectBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 70)
                else
                    selectedTarget = p
                    selectBtn.Text = "✅"
                    selectBtn.BackgroundColor3 = Color3.fromRGB(35, 70, 35)
                    for _, otherBtn in pairs(playerListFrame:GetChildren()) do
                        if otherBtn:IsA("TextButton") and otherBtn ~= btn and otherBtn:FindFirstChild("TextButton") then
                            local otherSelect = otherBtn:FindFirstChild("TextButton")
                            if otherSelect then otherSelect.Text = "☐"; otherSelect.BackgroundColor3 = Color3.fromRGB(55, 55, 70) end
                        end
                    end
                end
            end)
            yPos = yPos + 36
        end
    end
    playerListFrame.CanvasSize = UDim2.new(0, 0, 0, yPos + 10)
end

refreshBtn.MouseButton1Click:Connect(updatePlayerList)
updatePlayerList()
players.PlayerAdded:Connect(updatePlayerList)
players.PlayerRemoving:Connect(updatePlayerList)

-- ==================== Setting Tab ====================
local settingFrame = tabs.Setting.frame
local settingY = 5

-- Speed Hack
local speedEnabled = false
local speedValue = 16
local speedConnection

local function applySpeed()
    local char = player.Character
    if char then
        local hum = char:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = speedEnabled and speedValue or 16 end
    end
end

local speedFrame = Instance.new("Frame")
speedFrame.Size = UDim2.new(1, -20, 0, 55)
speedFrame.Position = UDim2.new(0, 0, 0, settingY)
speedFrame.BackgroundTransparency = 1
speedFrame.Parent = settingFrame

local speedCheck = Instance.new("TextButton")
speedCheck.Size = UDim2.new(0, 26, 0, 26)
speedCheck.Position = UDim2.new(0, 0, 0.5, -13)
speedCheck.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
speedCheck.Text = ""
speedCheck.Font = Enum.Font.GothamBold
speedCheck.TextSize = 18
speedCheck.BorderSizePixel = 1
speedCheck.BorderColor3 = Color3.fromRGB(80, 80, 95)
speedCheck.Parent = speedFrame

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0.4, 0, 0, 25)
speedLabel.Position = UDim2.new(0, 32, 0, 5)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed Hack"
speedLabel.TextColor3 = Color3.fromRGB(235, 235, 245)
speedLabel.Font = Enum.Font.GothamSemibold
speedLabel.TextSize = 13
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = speedFrame

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(0, 90, 0, 28)
speedBox.Position = UDim2.new(1, -95, 0, 25)
speedBox.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
speedBox.Text = "16"
speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 13
speedBox.Parent = speedFrame

local speedChecked = false
speedCheck.MouseButton1Click:Connect(function()
    speedChecked = not speedChecked
    speedCheck.Text = speedChecked and "✅" or ""
    speedCheck.BackgroundColor3 = speedChecked and Color3.fromRGB(35, 70, 35) or Color3.fromRGB(45, 45, 55)
    speedEnabled = speedChecked
    if speedEnabled then
        if speedConnection then speedConnection:Disconnect() end
        speedConnection = runService.RenderStepped:Connect(applySpeed)
    else
        if speedConnection then speedConnection:Disconnect() end
        applySpeed()
    end
end)

speedBox.FocusLost:Connect(function()
    local val = tonumber(speedBox.Text)
    if val and val <= 300 and val >= 0 then speedValue = val; speedBox.Text = tostring(val); if speedEnabled then applySpeed() end
    else speedBox.Text = tostring(speedValue) end
end)
settingY = settingY + 65

-- Jump Hack
local jumpEnabled = false
local jumpValue = 50
local jumpConnection

local function applyJump()
    local char = player.Character
    if char then
        local hum = char:FindFirstChild("Humanoid")
        if hum then hum.JumpPower = jumpEnabled and jumpValue or 50 end
    end
end

local jumpFrame = Instance.new("Frame")
jumpFrame.Size = UDim2.new(1, -20, 0, 55)
jumpFrame.Position = UDim2.new(0, 0, 0, settingY)
jumpFrame.BackgroundTransparency = 1
jumpFrame.Parent = settingFrame

local jumpCheck = Instance.new("TextButton")
jumpCheck.Size = UDim2.new(0, 26, 0, 26)
jumpCheck.Position = UDim2.new(0, 0, 0.5, -13)
jumpCheck.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
jumpCheck.Text = ""
jumpCheck.Font = Enum.Font.GothamBold
jumpCheck.TextSize = 18
jumpCheck.BorderSizePixel = 1
jumpCheck.BorderColor3 = Color3.fromRGB(80, 80, 95)
jumpCheck.Parent = jumpFrame

local jumpLabel = Instance.new("TextLabel")
jumpLabel.Size = UDim2.new(0.4, 0, 0, 25)
jumpLabel.Position = UDim2.new(0, 32, 0, 5)
jumpLabel.BackgroundTransparency = 1
jumpLabel.Text = "Jump Hack"
jumpLabel.TextColor3 = Color3.fromRGB(235, 235, 245)
jumpLabel.Font = Enum.Font.GothamSemibold
jumpLabel.TextSize = 13
jumpLabel.TextXAlignment = Enum.TextXAlignment.Left
jumpLabel.Parent = jumpFrame

local jumpBox = Instance.new("TextBox")
jumpBox.Size = UDim2.new(0, 90, 0, 28)
jumpBox.Position = UDim2.new(1, -95, 0, 25)
jumpBox.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
jumpBox.Text = "50"
jumpBox.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpBox.Font = Enum.Font.Gotham
jumpBox.TextSize = 13
jumpBox.Parent = jumpFrame

local jumpChecked = false
jumpCheck.MouseButton1Click:Connect(function()
    jumpChecked = not jumpChecked
    jumpCheck.Text = jumpChecked and "✅" or ""
    jumpCheck.BackgroundColor3 = jumpChecked and Color3.fromRGB(35, 70, 35) or Color3.fromRGB(45, 45, 55)
    jumpEnabled = jumpChecked
    if jumpEnabled then
        if jumpConnection then jumpConnection:Disconnect() end
        jumpConnection = runService.RenderStepped:Connect(applyJump)
    else
        if jumpConnection then jumpConnection:Disconnect() end
        applyJump()
    end
end)

jumpBox.FocusLost:Connect(function()
    local val = tonumber(jumpBox.Text)
    if val and val <= 300 and val >= 0 then jumpValue = val; jumpBox.Text = tostring(val); if jumpEnabled then applyJump() end
    else jumpBox.Text = tostring(jumpValue) end
end)
settingY = settingY + 65

-- Anti AFK
createModernCheckbox(settingFrame, settingY, "🛡️ Anti AFK", function(v)
    if v then
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            local vu = game:GetService("VirtualUser")
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
end)
settingY = settingY + 38

-- Anti Kick
local antiKickEnabled = false
local oldNameCall
createModernCheckbox(settingFrame, settingY, "🔒 Anti Kick", function(v)
    antiKickEnabled = v
    if v and not oldNameCall then
        oldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
            if getnamecallmethod() == "Kick" then return wait(9e9) end
            return oldNameCall(self, ...)
        end)
    end
end)
settingY = settingY + 38

-- Boost FPS
local fpsBoostEnabled = false
local function applyFPSBoost()
    if fpsBoostEnabled then
        lighting.GlobalShadows = false
        settings().Rendering.QualityLevel = 1
    else
        lighting.GlobalShadows = true
        settings().Rendering.QualityLevel = 10
    end
end

createModernCheckbox(settingFrame, settingY, "⚡ Boost FPS (Fix Lag)", function(v)
    fpsBoostEnabled = v
    applyFPSBoost()
end)
settingY = settingY + 38

contentFrame.CanvasSize = UDim2.new(0, 0, 0, settingY + 60)

local function switchTab(tabName)
    closeAllDropdowns()
    for name, tabData in pairs(tabs) do
        tabData.frame.Visible = (name == tabName)
        if tabData.button then tabData.button.BackgroundColor3 = (name == tabName) and Color3.fromRGB(65, 65, 80) or Color3.fromRGB(45, 45, 55) end
    end
end

for tabName, tabData in pairs(tabs) do
    tabData.button.MouseButton1Click:Connect(function() switchTab(tabName) end)
end

switchTab("ESP")

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    if not mainFrame.Visible then closeAllDropdowns() end
end)

closeBtn.MouseButton1Click:Connect(function() mainFrame.Visible = false; closeAllDropdowns() end)

player.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if speedEnabled then applySpeed() end
    if jumpEnabled then applyJump() end
    if autoEquipEnabled then task.spawn(function() task.wait(1); equipFruit(selectedFruit) end) end
end)

print("✅ TOREN EQ HUB [Premium] Loaded | Telegram: @maibigber")
print("✅ ESP AUTO UPDATE | ANTI-ADMIN | FAST ATTACK | TWEEN/BYPASS TELEPORT (SELECTED TARGET ONLY)")
