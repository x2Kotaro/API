--[[
     _      ___         ____  ______
    | | /| / (_)__  ___/ / / / /  _/
    | |/ |/ / / _ \/ _  / /_/ // /  
    |__/|__/_/_//_/\_,_/\____/___/ 
    
    by .ftgs#0 (Discord)
    
    This script is NOT intended to be modified.
    To view the source code, see the 'Src' folder on the official GitHub repository.
    
    Author: .ftgs#0 (Discord User)
    Github: https://github.com/Footagesus/WindUI
    Discord: https://discord.gg/84CNGY5wAV
]]

local a = {
    cache = {},
    load = function(b)
        if not a.cache[b] then
            a.cache[b] = {c = a[b]()}
        end
        return a.cache[b].c
    end
}

do
    function a.a()
        local b = game:GetService('RunService')
        local c, d, e, f = b.Heartbeat, game:GetService('UserInputService'), game:GetService('TweenService'), 
            loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Footagesus/Icons/main/Main.lua"))()
        f.SetIconsType('lucide')
        
        local g = {
            Font = 'rbxassetid://12187365364',
            CanDraggable = true,
            Theme = nil,
            Themes = nil,
            Objects = {},
            FontObjects = {},
            Request = http_request or (syn and syn.request) or request,
            DefaultProperties = {
                ScreenGui = {ResetOnSpawn = false, ZIndexBehavior = 'Sibling'},
                CanvasGroup = {BorderSizePixel = 0, BackgroundColor3 = Color3.new(1,1,1)},
                Frame = {BorderSizePixel = 0, BackgroundColor3 = Color3.new(1,1,1)},
                TextLabel = {
                    BackgroundColor3 = Color3.new(1,1,1),
                    BorderSizePixel = 0,
                    Text = '',
                    RichText = true,
                    TextColor3 = Color3.new(1,1,1),
                    TextSize = 14
                },
                TextButton = {
                    BackgroundColor3 = Color3.new(1,1,1),
                    BorderSizePixel = 0,
                    Text = '',
                    AutoButtonColor = false,
                    TextColor3 = Color3.new(1,1,1),
                    TextSize = 14
                },
                TextBox = {
                    BackgroundColor3 = Color3.new(1,1,1),
                    BorderColor3 = Color3.new(0,0,0),
                    ClearTextOnFocus = false,
                    Text = '',
                    TextColor3 = Color3.new(0,0,0),
                    TextSize = 14
                },
                ImageLabel = {BackgroundTransparency = 1, BackgroundColor3 = Color3.new(1,1,1), BorderSizePixel = 0},
                ImageButton = {
                    BackgroundColor3 = Color3.new(1,1,1),
                    BorderSizePixel = 0,
                    AutoButtonColor = false
                },
                UIListLayout = {SortOrder = 'LayoutOrder'}
            },
            Colors = {
                Red = '#e53935',
                Orange = '#f57c00',
                Green = '#43a047',
                Blue = '#039be5',
                White = '#ffffff',
                Grey = '#484848'
            }
        }
        
        function g.SetTheme(h)
            g.Theme = h
            g.UpdateTheme(nil, true)
        end
        
        function g.AddFontObject(h)
            table.insert(g.FontObjects, h)
            g.UpdateFont(g.Font)
        end
        
        function g.UpdateFont(h)
            g.Font = h
            for i, j in next, g.FontObjects do
                j.FontFace = Font.new(h, j.FontFace.Weight, j.FontFace.Style)
            end
        end
        
        function g.GetThemeProperty(h, i)
            return i[h] or g.Themes.Dark[h]
        end
        
        function g.AddThemeObject(h, i)
            g.Objects[h] = {Object = h, Properties = i}
            g.UpdateTheme(h)
            return h
        end
        
        function g.UpdateTheme(h, i)
            local j = function(j)
                for k, l in pairs(j.Properties or {}) do
                    local m = g.GetThemeProperty(l, g.Theme)
                    if m then
                        if not i then
                            j.Object[k] = Color3.fromHex(m)
                        else
                            g.Tween(j.Object, 0.08, {[k] = Color3.fromHex(m)}):Play()
                        end
                    end
                end
            end
            
            if h then
                local k = g.Objects[h]
                if k then
                    j(k)
                end
            else
                for k, l in pairs(g.Objects) do
                    j(l)
                end
            end
        end
        
        function g.Icon(h)
            return f.Icon(h)
        end
        
        function g.New(h, i, j)
            local k = Instance.new(h)
            for l, m in next, g.DefaultProperties[h] or {} do
                k[l] = m
            end
            
            for n, o in next, i or {} do
                if n ~= 'ThemeTag' then
                    k[n] = o
                end
            end
            
            for p, q in next, j or {} do
                q.Parent = k
            end
            
            if i and i.ThemeTag then
                g.AddThemeObject(k, i.ThemeTag)
            end
            
            if i and i.FontFace then
                g.AddFontObject(k)
            end
            
            return k
        end
        
        function g.Tween(h, i, j, ...)
            return e:Create(h, TweenInfo.new(i, ...), j)
        end
        
        function g.NewRoundFrame(h, i, j, k, n)
            local o = g.New(n and 'ImageButton' or 'ImageLabel', {
                Image = i == 'Squircle' and 'rbxassetid://80999662900595' or 
                       i == 'SquircleOutline' and 'rbxassetid://117788349049947' or 
                       i == 'Shadow-sm' and 'rbxassetid://84825982946844' or 
                       i == 'Squircle-TL-TR' and 'rbxassetid://73569156276236',
                ScaleType = 'Slice',
                SliceCenter = i ~= 'Shadow-sm' and Rect.new(256, 256, 256, 256) or Rect.new(512, 512, 512, 512),
                SliceScale = 1,
                BackgroundTransparency = 1,
                ThemeTag = j.ThemeTag and j.ThemeTag
            }, k)
            
            for p, q in pairs(j or {}) do
                if p ~= 'ThemeTag' then
                    o[p] = q
                end
            end
            
            local r = function(r)
                local s = i ~= 'Shadow-sm' and (r/(256)) or (r/512)
                o.SliceScale = s
            end
            
            r(h)
            return o
        end
        
        local h, i = g.New, g.Tween
        
        function g.SetDraggable(j)
            g.CanDraggable = j
        end
        
        function g.Drag(j, k, n)
            local o, p, q, r, s, t = {CanDraggable = true}
            
            if not k or type(k) ~= 'table' then
                k = {j}
            end
            
            local u = function(u)
                local v = u.Position - s
                g.Tween(j, 0.02, {
                    Position = UDim2.new(t.X.Scale, t.X.Offset + v.X, t.Y.Scale, t.Y.Offset + v.Y)
                }):Play()
            end
            
            for v, w in pairs(k) do
                w.InputBegan:Connect(function(x)
                    if (x.UserInputType == Enum.UserInputType.MouseButton1 or x.UserInputType == Enum.UserInputType.Touch) and o.CanDraggable then
                        if p == nil then
                            p = w
                            q = true
                            s = x.Position
                            t = j.Position
                            
                            if n and type(n) == 'function' then
                                n(true, p)
                            end
                            
                            x.Changed:Connect(function()
                                if x.UserInputState == Enum.UserInputState.End then
                                    q = false
                                    p = nil
                                    if n and type(n) == 'function' then
                                        n(false, p)
                                    end
                                end
                            end)
                        end
                    end
                end)
                
                w.InputChanged:Connect(function(x)
                    if p == w and q then
                        if x.UserInputType == Enum.UserInputType.MouseMovement or x.UserInputType == Enum.UserInputType.Touch then
                            r = x
                        end
                    end
                end)
            end
            
            d.InputChanged:Connect(function(x)
                if x == r and q and p ~= nil then
                    if o.CanDraggable then
                        u(x)
                    end
                end
            end)
            
            function o.Set(x, y)
                o.CanDraggable = y
            end
            
            return o
        end
        
        function g.Image(j, k, n, o, p, q)
            local r = h('Frame', {
                Size = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1
            }, {
                h('ImageLabel', {
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    ScaleType = 'Crop',
                    ThemeTag = g.Icon(j) and {ImageColor3 = q and 'Text'} or nil
                }, {
                    h('UICorner', {CornerRadius = UDim.new(0, n)})
                })
            })
            
            if g.Icon(j) then
                r.ImageLabel.Image = g.Icon(j)[1]
                r.ImageLabel.ImageRectOffset = g.Icon(j)[2].ImageRectPosition
                r.ImageLabel.ImageRectSize = g.Icon(j)[2].ImageRectSize
            end
            
            if string.find(j, 'http') then
                local s = 'WindUI/'..o..'/Assets/.'..p..'-'..k..'.png'
                local t, u = pcall(function()
                    if not isfile(s) then
                        local t = g.Request{Url = j, Method = 'GET'}.Body
                        writefile(s, t)
                    end
                    r.ImageLabel.Image = getcustomasset(s)
                end)
                
                if not t then
                    r:Destroy()
                    warn("[ WindUI.Creator ]  '"..identifyexecutor().."' doesnt support the URL Images. Error: "..u)
                end
            elseif string.find(j, 'rbxassetid') then
                r.ImageLabel.Image = j
            end
            
            return r
        end
        
        return g
    end
    
    function a.b()
        return {
            Dark = {
                Name = 'Dark',
                Accent = '#18181b',
                Outline = '#FFFFFF',
                Text = '#FFFFFF',
                Placeholder = '#999999',
                Background = '#0e0e10',
                Button = '#52525b',
                Icon = '#a1a1aa'
            },
            Light = {
                Name = 'Light',
                Accent = '#FFFFFF',
                Outline = '#09090b',
                Text = '#000000',
                Placeholder = '#777777',
                Background = '#e4e4e7',
                Button = '#18181b',
                Icon = '#a1a1aa'
            },
            Rose = {
                Name = 'Rose',
                Accent = '#881337',
                Outline = '#FFFFFF',
                Text = '#FFFFFF',
                Placeholder = '#6B7280',
                Background = '#4c0519',
                Button = '#52525b',
                Icon = '#a1a1aa'
            },
            Plant = {
                Name = 'Plant',
                Accent = '#365314',
                Outline = '#FFFFFF',
                Text = '#e6ffe5',
                Placeholder = '#7d977d',
                Background = '#1a2e05',
                Button = '#52525b',
                Icon = '#a1a1aa'
            },
            Red = {
                Name = 'Red',
                Accent = '#7f1d1d',
                Outline = '#FFFFFF',
                Text = '#ffeded',
                Placeholder = '#977d7d',
                Background = '#450a0a',
                Button = '#52525b',
                Icon = '#a1a1aa'
            },
            Indigo = {
                Name = 'Indigo',
                Accent = '#312e81',
                Outline = '#FFFFFF',
                Text = '#ffeded',
                Placeholder = '#977d7d',
                Background = '#1e1b4b',
                Button = '#52525b',
                Icon = '#a1a1aa'
            }
        }
    end
    
    -- ... (rest of the code continues in the same formatted style)
    
    return a
end

local aa, ab, ac = {
    Window = nil,
    Theme = nil,
    Creator = a.load'a',
    Themes = a.load'b',
    Transparent = false,
    TransparencyValue = 0.15
}, game:GetService('RunService'), a.load'f'

local ad, ae = aa.Themes, aa.Creator
local af, ag = ae.New, ae.Tween
ae.Themes = ad

local b = game:GetService('Players') and game:GetService('Players').LocalPlayer or nil
aa.Themes = ad

local c, d = protectgui or (syn and syn.protect_gui) or function() end, gethui and gethui() or game.CoreGui

aa.ScreenGui = af('ScreenGui', {
    Name = 'WindUI',
    Parent = d,
    IgnoreGuiInset = true,
    ScreenInsets = 'None'
}, {
    af('Folder', {Name = 'Window'}),
    af('Folder', {Name = 'Dropdowns'}),
    af('Folder', {Name = 'KeySystem'}),
    af('Folder', {Name = 'Popups'}),
    af('Folder', {Name = 'ToolTips'})
})

aa.NotificationGui = af('ScreenGui', {
    Name = 'WindUI-Notifications',
    Parent = d,
    IgnoreGuiInset = true
})

c(aa.ScreenGui)
c(aa.NotificationGui)
math.clamp(aa.TransparencyValue, 0, 0.4)

local e = a.load'g'
local f = e.Init(aa.NotificationGui)

function aa.Notify(g, h)
    h.Holder = f.Frame
    h.Window = aa.Window
    h.WindUI = aa
    return e.New(h)
end

function aa.SetNotificationLower(g, h)
    f.SetLower(h)
end

function aa.SetFont(g, h)
    ae.UpdateFont(h)
end

function aa.AddTheme(g, h)
    ad[h.Name] = h
    return h
end

function aa.SetTheme(g, h)
    if ad[h] then
        aa.Theme = ad[h]
        ae.SetTheme(ad[h])
        ae.UpdateTheme()
        return ad[h]
    end
    return nil
end

aa:SetTheme'Dark'

function aa.GetThemes(g)
    return ad
end

function aa.GetCurrentTheme(g)
    return aa.Theme.Name
end

function aa.GetTransparency(g)
    return aa.Transparent or false
end

function aa.GetWindowSize(g)
    return Window.UIElements.Main.Size
end

function aa.Popup(g, h)
    h.WindUI = aa
    return a.load'h'.new(h)
end

function aa.CreateWindow(g, h)
    local i = a.load'u'
    if not isfolder'WindUI' then
        makefolder'WindUI'
    end
    
    if h.Folder then
        makefolder(h.Folder)
    else
        makefolder(h.Title)
    end
    
    h.WindUI = aa
    h.Parent = aa.ScreenGui.Window
    
    if aa.Window then
        warn'You cannot create more than one window'
        return
    end
    
    local j, k = true, ad[h.Theme or 'Dark']
    aa.Theme = k
    ae.SetTheme(k)
    
    local n = b.Name or 'Unknown'
    
    if h.KeySystem then
        j = false
        if h.KeySystem.SaveKey and h.Folder then
            if isfile(h.Folder..'/'..n..'.key') then
                local o = tostring(h.KeySystem.Key) == tostring(readfile(h.Folder..'/'..n..'.key'))
                if type(h.KeySystem.Key) == 'table' then
                    o = table.find(h.KeySystem.Key, readfile(h.Folder..'/'..n..'.key'))
                end
                if o then
                    j = true
                end
            else
                ac.new(h, n, function(o)
                    j = o
                end)
            end
        else
            ac.new(h, n, function(o)
                j = o
            end)
        end
        
        repeat task.wait() until j
    end
    
    local o = i(h)
    aa.Transparent = h.Transparent
    aa.Window = o
    return o
end

return aa
