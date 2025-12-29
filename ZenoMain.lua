local SG = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", SG)
Main.Size = UDim2.new(0, 400, 0, 300) -- ปรับขนาดให้ใหญ่ขึ้นเล็กน้อย
Main.Position = UDim2.new(0.5, -200, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.Active = true
Main.Draggable = true -- ทำให้ลากเมนูไปมาได้

-- รูปคนยืนแอ็ค
local Icon = Instance.new("ImageLabel", Main)
Icon.Size = UDim2.new(0, 80, 0, 80)
Icon.Position = UDim2.new(0, 10, 0, 10)
Icon.Image = "rbxassetid://10829037401"
Icon.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(0, 200, 0, 40)
Title.Position = UDim2.new(0, 100, 0, 20)
Title.Text = "ZENO-HUB | MOBILE"
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1

-- ฟังก์ชันสร้างปุ่ม (เพื่อให้เมนูมีปุ่มกดได้)
local function CreateButton(name, pos, callback)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0, 250, 0, 40)
    btn.Position = UDim2.new(0.5, -125, 0, pos)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    
    btn.MouseButton1Click:Connect(callback)
end

-- เพิ่มปุ่มต่างๆ
CreateButton("Lock Head (Aimbot)", 100, function()
    print("Aimbot Activated!")
    -- ใส่โค้ดล็อกหัวตรงนี้
end)

CreateButton("Player ESP (Highlight)", 150, function()
    print("ESP Activated!")
    -- ใส่โค้ดมองทะลุตรงนี้
end)

CreateButton("Close Menu", 220, function()
    SG:Destroy()
end)
