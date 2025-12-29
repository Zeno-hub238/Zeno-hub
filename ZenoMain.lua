local SG = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", SG)
Main.Size = UDim2.new(0, 400, 0, 250)
Main.Position = UDim2.new(0.5, -200, 0.5, -125)
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local Icon = Instance.new("ImageLabel", Main)
Icon.Size = UDim2.new(0, 100, 0, 100)
Icon.Position = UDim2.new(0, 10, 0, 10)
Icon.Image = "rbxassetid://10829037401" -- รูปคนยืนแอ็ค
Icon.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(0, 200, 0, 50)
Title.Position = UDim2.new(0, 120, 0, 20)
Title.Text = "ZENO-HUB"
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.TextSize = 25
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1
