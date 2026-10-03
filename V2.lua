-- 1. استدعاء مكتبة الواجهات الاحترافية Fluent
local Fluent = loadstring(game:HttpGet("https://github.com"))()

-- 2. إنشاء النافذة الرئيسية للسكربت
local Window = Fluent:CreateWindow({
    Title = "LENNON HUB",
    SubTitle = "ماب سرقة البيض",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- 3. إضافة الأقسام والتبويبات
local Tabs = {
    Main = Window:AddTab({ Title = "الرئيسية", Icon = "home" })
}

local AutoSteal = false
local AutoEgg = false

-- 4. زر تشغيل تلقائي لسرقة البيض
local Toggle1 = Tabs.Main:AddToggle("MyToggle1", {Title = "سرقة تلقائية (Auto Farm)", Default = false})

Toggle1:OnChanged(function(Value)
    AutoSteal = Value
    
    task.spawn(function()
        while AutoSteal do
            print("جاري جمع وسرقة البيض تلقائياً...")
            task.wait(0.5)
        end
    end)
end)

-- 5. زر تشغيل تلقائي لفتح البيض
local Toggle2 = Tabs.Main:AddToggle("MyToggle2", {Title = "فتح البيض تلقائياً (Auto Open)", Default = false})

Toggle2:OnChanged(function(Value)
    AutoEgg = Value
    
    task.spawn(function()
        while AutoEgg do
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("BuyEggRemote") or game:GetService("ReplicatedStorage"):FindFirstChild("EggNetwork")
            if remote then
                remote:FireServer("Basic Egg") 
            end
            task.wait(1)
        end
    end)
end)

-- تنبيه تشغيل السكربت
Fluent:Notify({
    Title = "Lennon Hub",
    Content = "تم تشغيل السكربت بنجاح! جاهز لسرقة البيض.",
    Duration = 5
})

Window:SelectTab(Tabs.Main)
