local SG = Instance.new("ScreenGui", game:GetService("CoreGui"))
SG.Name = "ZenoHub_Final_V2"

-- [[ ตัวแปรหลัก ]]
local Main = Instance.new("Frame", SG)
Main.Size = UDim2.new(0, 500, 0, 320)
Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

-- [[ 1. ปุ่มย่อเมนู (รูปคนยืนแอ็คตอนจิ๋ว) ]]
local MinimizedBtn = Instance.new("ImageButton", SG)
MinimizedBtn.Size = UDim2.new(0, 60, 0, 60)
MinimizedBtn.Position = UDim2.new(0, 20, 0.5, -30) -- อยู่ฝั่งซ้ายกลางจอ
MinimizedBtn.Image = "rbxassetid://10829037401" -- รูปคนยืนแอ็ค
MinimizedBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MinimizedBtn.Visible = false -- ซ่อนไว้ตอนเริ่ม
MinimizedBtn.Active = true
MinimizedBtn.Draggable = true -- ลากปุ่มจิ๋วไปมาได้

-- แถบ Sidebar ข้างซ้าย
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 150, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Sidebar.BorderSizePixel = 0

-- รูปคนยืนแอ็คในเมนูหลัก
local Icon = Instance.new("ImageLabel", Sidebar)
Icon.Size = UDim2.new(0, 80, 0, 80)
Icon.Position = UDim2.new(0.5, -40, 0, 15)
Icon.Image = "rbxassetid://10829037401"
Icon.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Sidebar)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 100)
Title.Text = "ZENO-HUB"
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.BackgroundTransparency = 1

-- [[ ระบบ ย่อ/ขยาย เมนู ]]
local function ToggleMenu(state)
    if state == "Minimize" then
        Main.Visible = false
        MinimizedBtn.Visible = true
    else
        Main.Visible = true
        MinimizedBtn.Visible = false
    end
end

-- เมื่อกดปุ่มจิ๋ว ให้ขยายเมนู
MinimizedBtn.MouseButton1Click:Connect(function()
    ToggleMenu("Expand")
end)

-- [[ ปุ่มด้านบนเมนู ( - , X ) ]]
local TopButtons = Instance.new("Frame", Main)
TopButtons.Size = UDim2.new(0, 80, 0, 30)
TopButtons.Position = UDim2.new(1, -85, 0, 5)
TopButtons.BackgroundTransparency = 1

-- ปุ่ม ย่อ ( - )
local MinBtn = Instance.new("TextButton", TopButtons)
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(0, 0, 0, 0)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 25
MinBtn.BackgroundTransparency = 1
MinBtn.MouseButton1Click:Connect(function()
    ToggleMenu("Minimize")
end)

-- [[ ปุ่มปิด (X) และหน้าต่างยืนยัน ]]
local ConfirmFrame = Instance.new("Frame", SG)
ConfirmFrame.Size = UDim2.new(0, 300, 0, 150)
ConfirmFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ConfirmFrame.Visible = false

local ExitBtn = Instance.new("TextButton", ConfirmFrame)
ExitBtn.Size = UDim2.new(0, 120, 0, 40)
ExitBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
ExitBtn.Text = "ปิดสคริปต์"
ExitBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ExitBtn.MouseButton1Click:Connect(function() SG:Destroy() end)

local CancelBtn = Instance.new("TextButton", ConfirmFrame)
CancelBtn.Size = UDim2.new(0, 120, 0, 40)
CancelBtn.Position = UDim2.new(0.55, 0, 0.6, 0)
CancelBtn.Text = "ยกเลิก"
CancelBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
CancelBtn.MouseButton1Click:Connect(function() ConfirmFrame.Visible = false end)

local CloseX = Instance.new("TextButton", TopButtons)
CloseX.Size = UDim2.new(0, 30, 0, 30)
CloseX.Position = UDim2.new(0, 40, 0, 0)
CloseX.Text = "X"
CloseX.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseX.BackgroundTransparency = 1
CloseX.TextSize = 20
CloseX.MouseButton1Click:Connect(function() ConfirmFrame.Visible = true end)

print("Zeno-hub Minimize System Loaded!")
