local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local UI = {}

function UI.Init(AutoFarm, AutoBreak, KillAura, RemoteFinder)
    local Window = OrionLib:MakeWindow({
        Name = "Zenith Hub | 99 Night",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "ZenithConfig"
    })

    -- صفحة التجميع التلقائي
    local AutoFarmTab = Window:MakeTab({
        Name = "التجميع التلقائي",
        Icon = "rbxassetid://6023426915",
        PremiumOnly = false
    })

    AutoFarmTab:AddToggle({
        Name = "تشغيل التجميع التلقائي",
        Default = false,
        Callback = function(Value)
            if Value then
                AutoFarm.Start()
            else
                AutoFarm.Stop()
            end
        end
    })

    AutoFarmTab:AddSlider({
        Name = "سرعة التجميع",
        Min = 1,
        Max = 10,
        Default = 5,
        Increment = 1,
        Suffix = "x",
        Callback = function(Value)
            AutoFarm.SetSpeed(Value)
        end
    })

    -- صفحة التكسير التلقائي
    local AutoBreakTab = Window:MakeTab({
        Name = "التكسير التلقائي",
        Icon = "rbxassetid://6023426915",
        PremiumOnly = false
    })

    AutoBreakTab:AddToggle({
        Name = "تشغيل التكسير التلقائي",
        Default = false,
        Callback = function(Value)
            if Value then
                AutoBreak.Start()
            else
                AutoBreak.Stop()
            end
        end
    })

    -- صفحة القتل التلقائي (KillAura)
    local KillAuraTab = Window:MakeTab({
        Name = "القتل التلقائي",
        Icon = "rbxassetid://6023426915",
        PremiumOnly = false
    })

    KillAuraTab:AddToggle({
        Name = "تشغيل القتل التلقائي",
        Default = false,
        Callback = function(Value)
            if Value then
                KillAura.Start()
            else
                KillAura.Stop()
            end
        end
    })

    KillAuraTab:AddSlider({
        Name = "نطاق القتل",
        Min = 5,
        Max = 50,
        Default = 20,
        Increment = 1,
        Suffix = "متر",
        Callback = function(Value)
            KillAura.SetRange(Value)
        end
    })

    -- صفحة كشف الريموتات
    local RemoteFinderTab = Window:MakeTab({
        Name = "كشف الريموتات",
        Icon = "rbxassetid://6023426915",
        PremiumOnly = false
    })

    RemoteFinderTab:AddButton({
        Name = "بدء الكشف",
        Callback = function()
            RemoteFinder.Scan()
        end
    })

    -- إشعارات احترافية
    OrionLib:MakeNotification({
        Name = "مرحبًا بك في Zenith Hub",
        Content = "تم تفعيل الواجهة بنجاح!",
        Image = "rbxassetid://6023426915",
        Time = 5
    })

    OrionLib:Init()
end

return UI
