Lua
local SG = Instance.new("ScreenGui", game:GetService("CoreGui"))
SG.Name = "ZenoHub_Professional"

-- [[ Main Framework ]]
local Main = Instance.new("Frame", SG)
Main.Size = UDim2.new(0, 550, 0, 350)
Main.Position = UDim2.new(0.5, -275, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

-- ปุ่มย่อเมนู (รูปคนยืนแอ็คตอนจิ๋ว)
local MinimizedBtn = Instance.new("ImageButton", SG)
MinimizedBtn.Size = UDim2.new(0, 65, 0, 65)
MinimizedBtn.Position = UDim2.new(0, 20, 0.5, -32)
MinimizedBtn.Image = "rbxassetid://10829037401"
MinimizedBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MinimizedBtn.Visible = false
MinimizedBtn.Draggable = true

-- Sidebar
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 160, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Sidebar.BorderSizePixel = 0

local ProfileIcon = Instance.new("ImageLabel", Sidebar)
ProfileIcon.Size = UDim2.new(0, 40, 0, 40)
ProfileIcon.Position = UDim2.new(0, 10, 0, 10)
ProfileIcon.Image = "rbxassetid://10829037401"
ProfileIcon.BackgroundTransparency = 1

local ProfileName = Instance.new("TextLabel", Sidebar)
ProfileName.Size = UDim2.new(0, 100, 0, 40)
ProfileName.Position = UDim2.new(0, 55, 0, 10)
ProfileName.Text = "Zeno-hub | PVP"
ProfileName.TextColor3 = Color3.fromRGB(255, 255, 255)
ProfileName.TextXAlignment = Enum.TextXAlignment.Left
ProfileName.Font = Enum.Font.GothamBold
ProfileName.BackgroundTransparency = 1

-- Container สำหรับหน้าต่างๆ
local PageFolder = Instance.new("Folder", Main)
local function CreatePage(name)
    local Page = Instance.new("ScrollingFrame", Main)
    Page.Name = name .. "Page"
    Page.Size = UDim2.new(1, -170, 1, -50)
    Page.Position = UDim2.new(0, 165, 0, 45)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ScrollBarThickness = 2
    return Page
end

-- สร้างหน้าหมวดหมู่ตามรูปตัวอย่าง
local Pages = {
    General = CreatePage("General"),
    Combat = CreatePage("Combat"),
    Visuals = CreatePage("Visuals"),
    Misc = CreatePage("Misc"),
    Settings = CreatePage("Settings")
}
Pages.Combat.Visible = true -- ให้หน้า Combat ขึ้นเป็นหน้าแรก

-- [[ ระบบสลับหน้าและสร้างปุ่ม Sidebar ]]
local TabCount = 0
local function AddTab(name)
    local Btn = Instance.new("TextButton", Sidebar)
    Btn.Size = UDim2.new(0.9, 0, 0, 35)
    Btn.Position = UDim2.new(0.05, 0, 0, 60 + (TabCount * 40))
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Btn.Text = "  " .. name
    Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Font = Enum.Font.Gotham
    Btn.BorderSizePixel = 0
    
    Btn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        Pages[name].Visible = true
    end)
    TabCount = TabCount + 1
end

AddTab("General")
AddTab("Combat")
AddTab("Visuals")
AddTab("Misc")
AddTab("Settings")

-- [[ ปุ่มควบคุมบนหัว ( - , X ) ]]
local MinBtn = Instance.new("TextButton", Main)
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -70, 0, 5)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.BackgroundTransparency = 1
MinBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    MinimizedBtn.Visible = true
end)

MinimizedBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    MinimizedBtn.Visible = false
end)

-- หน้าต่างยืนยันการปิด (Confirm Close)
local Confirm = Instance.new("Frame", SG)
Confirm.Size = UDim2.new(0, 250, 0, 120)
Confirm.Position = UDim2.new(0.5, -125, 0.5, -60)
Confirm.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Confirm.Visible = false

local CloseX = Instance.new("TextButton", Main)
CloseX.Size = UDim2.new(0, 30, 0, 30)
CloseX.Position = UDim2.new(1, -35, 0, 5)
CloseX.Text = "X"
CloseX.TextColor3 = Color3.fromRGB(255, 50, 50)
CloseX.BackgroundTransparency = 1
CloseX.MouseButton1Click:Connect(function() Confirm.Visible = true end)

-- ปุ่มข้างในหน้าจอ Confirm
local Yes = Instance.new("TextButton", Confirm)
Yes.Size = UDim2.new(0, 100, 0, 35)
Yes.Position = UDim2.new(0.1, 0, 0.6, 0)
Yes.Text = "ปิดสคริปต์"
Yes.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Yes.MouseButton1Click:Connect(function() SG:Destroy() end)

local No = Instance.new("TextButton", Confirm)
No.Size = UDim2.new(0, 100, 0, 35)
No.Position = UDim2.new(0.55, 0, 0.6, 0)
No.Text = "ยกเลิก"
No.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
No.MouseButton1Click:Connect(function() Confirm.Visible = false end)
