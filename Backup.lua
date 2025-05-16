--[[
     _      ___         ____  ______
    | | /| / (_)__  ___/ / / / /  _/
    | |/ |/ / / _ \/ _  / /_/ // /  
    |__/|__/_/_//_/\_,_/\____/___/
    
    This script is modified by Phoenix Version 0.0.1
]]


local a 
a = {
    cache={},
    load = function(b)
        if not a.cache[b] then
          a.cache[b] = {c=a[b]()}
        end 
        return a.cache[b].c 
    end
}

do 
    function a.a()
        local b = game:GetService'RunService'
        local c,d,e,f=b.Heartbeat,game:GetService'UserInputService',game:GetService'TweenService',loadstring(game:HttpGetAsync[[https://raw.githubusercontent.com/Footagesus/Icons/main/Main.lua]])()f.SetIconsType'lucide'
        local g = {
            Font = 'rbxassetid://12187365364',
            CanDraggable = true,
            Theme = nil,
            Themes = nil,
            Objects = {},
            FontObjects = {},
            Request = http_request or (syn and syn.request) or request,
            DefaultProperties = {
                ScreenGui = {ResetOnSpawn = false,ZIndexBehavior = 'Sibling'},
                CanvasGroup = {BorderSizePixel = 0,BackgroundColor3 = Color3.new(1,1,1)},
                Frame = {BorderSizePixel = 0,BackgroundColor3 = Color3.new(1,1,1)},
                TextLabel = {
                BackgroundColor3 = Color3.new(1,1,1),
                BorderSizePixel = 0,Text = '',
                RichText = true,TextColor3 = Color3.new(1,1,1),
                TextSize = 14
                },
                TextButton = {
                    BackgroundColor3=Color3.new(1,1,1),
                    BorderSizePixel = 0,Text = '',
                    AutoButtonColor = false,
                    TextColor3 = Color3.new(1,1,1),TextSize = 14},
                    TextBox = {BackgroundColor3 = Color3.new(1,1,1),
                    BorderColor3 = Color3.new(0,0,0),
                    ClearTextOnFocus = false,Text = '',
                    TextColor3 = Color3.new(0,0,0),
                    TextSize = 14
                 },
                 ImageLabel = {
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.new(1,1,1),
                    BorderSizePixel = 0},
                    ImageButton = {BackgroundColor3=Color3.new(1,1,1),
                    BorderSizePixel=0,AutoButtonColor=false},
                    UIListLayout={SortOrder='LayoutOrder'}
                 },
                 Colors = {
                    Red = '#e53935',
                    Orange='#f57c00',
                    Green='#43a047',
                    Blue='#039be5',
                    White='#ffffff',
                    Grey='#484848'
                    }
                 }

                 function g.SetTheme(h)
                    g.Theme = h
                    g.UpdateTheme(nil,true)
                 end
                 
                 function g.AddFontObject(h)
                    table.insert(g.FontObjects,h)
                    g.UpdateFont(g.Font)
                 end 
                 
                 function g.UpdateFont(h)
                    g.Font = h
                    for i,j in next,g.FontObjects do
                        j.FontFace=Font.new(h,j.FontFace.Weight,j.FontFace.Style)
                    end 
                end 
                
                function g.GetThemeProperty(h,i)
                    return i[h] or g.Themes.Dark[h]
                end 
                
                function 
                    g.AddThemeObject(h,i)g.Objects[h] = {Object = h,Properties = i}
                    g.UpdateTheme(h)
                    return h 
                end 
                
                function g.UpdateTheme(h,i)
                    local j = function(j)
                        for k,l in pairs(j.Properties or{}) do
                            local m = g.GetThemeProperty(l,g.Theme)
                            if m then
                                 if not i then
                                     j.Object[k] = Color3.fromHex(m)
                                    else 
                                    g.Tween(j.Object,0.08,{[k] = Color3.fromHex(m)}):Play()
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
                        for k,l in pairs(g.Objects) do
                            j(l)
                        end 
                    end 
                end 
                function g.Icon(h)
                    return 
                    f.Icon(h)
                end 
                function g.New(h,i,j)
                    local k = Instance.new(h)
                    for l,m in next,g.DefaultProperties[h] or {} do
                         k[l]=m 
                    end 
                        
                    for n,o in next,i or {} do
                        if n ~= 'ThemeTag' then
                            k[n]=o 
                        end 
                    end 
                                
                    for p,q in next,j or {} do
                         q.Parent = k 
                    end
                     
                    if i and i.ThemeTag then
                         g.AddThemeObject(k,i.ThemeTag)
                    end 
                    
                    if i and i.FontFace then
                         g.AddFontObject(k)
                    end

                    return k
                end 
                     
                function g.Tween(h,i,j,...)
                        return e:Create(h,TweenInfo.new(i,...),j)
                    end 
                    
                function g.NewRoundFrame(h,i,j,k,n)
                    local o = g.New(n and 'ImageButton' or 'ImageLabel',{Image = i == 'Squircle' and 'rbxassetid://80999662900595' or  i=='SquircleOutline' and 'rbxassetid://117788349049947' or  i=='Shadow-sm' and 'rbxassetid://84825982946844' or i == 'Squircle-TL-TR' and 'rbxassetid://73569156276236',ScaleType = 'Slice',
                    SliceCenter = i ~= 'Shadow-sm' and Rect.new(256,256,256,256) or Rect.new(512,512,512,512),
                    SliceScale = 1,
                    BackgroundTransparency = 1,
                    ThemeTag = j.ThemeTag and j.ThemeTag,
                    Visible = i == 'Squircle' and false or true
                },k)

                    for p,q in pairs(j or{}) do
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
                
                local h,i = g.New,g.Tween
                
                function g.SetDraggable(j)
                    g.CanDraggable=j
                end 
                
                function g.Drag(j,k,n)
                    local o,p,q,r,s,t = {CanDraggable = true}
                    if not k or type(k)~='table' then
                         k = {j}
                    end
                         
                    local u = function(u)
                        local v = u.Position - s 
                        g.Tween(j,0.02,{Position=UDim2.new(t.X.Scale,t.X.Offset+v.X,t.Y.Scale,t.Y.Offset+v.Y)}):Play()
                    end
                     
                    for v,w in pairs(k) do
                         w.InputBegan:Connect(function(x)
                         if(x.UserInputType == Enum.UserInputType.MouseButton1 or x.UserInputType==Enum.UserInputType.Touch) and o.CanDraggable then
                             if p == nil then
                                 p = w
                                 q = true 
                                 s = x.Position 
                                 t = j.Position 
                                 if n and type(n) == 'function' then
                                     n(true,p)
                                    end
                                     x.Changed:Connect(function()
                                        if x.UserInputState == Enum.UserInputState.End then
                                             q = false p = nil if n and type(n) == 'function' then
                                                 n(false,p)
                                                end 
                                            end 
                                        end)
                                    end 
                                end 
                            end)
                            
                    w.InputChanged:Connect(function(x)
                        if p == w and q then
                            if x.UserInputType == Enum.UserInputType.MouseMovement or x.UserInputType == Enum.UserInputType.Touch then 
                                r=x 
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
            
            function o.Set(x,y)
                o.CanDraggable = y
            end 

               return o 
            end 

            function g.Image(j,k,n,o,p,q)
                local r = h('Frame',{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1} ,{
                    h('ImageLabel',{
                        Size = UDim2.new(1,0,1,0),
                        BackgroundTransparency = 1,
                        ScaleType = 'Crop',
                        ThemeTag = g.Icon(j) and {ImageColor3 = q and 'Text'} or nil
                    },{
                            
                    h('UICorner',{CornerRadius=UDim.new(0,n)})
                })
            })
                            
            if g.Icon(j) then
                 r.ImageLabel.Image = g.Icon(j)[1]
                 r.ImageLabel.ImageRectOffset = g.Icon(j)[2].ImageRectPosition 
                 r.ImageLabel.ImageRectSize = g.Icon(j)[2].ImageRectSize 
            end 
            
            if string.find(j,'http') then
                 local s = 'WindUI/'..o..'/Assets/.'..p..'-'..k..'.png' 
                 local t,u = pcall(function() 
                    if not isfile(s) then
                     local t = g.Request{Url=j,Method='GET'}.Body 
                     writefile(s,t)
                 end
                r.ImageLabel.Image=getcustomasset(s)
            end)

            if not t then
                 r:Destroy()
                 warn("[ WindUI.Creator ]  '"..identifyexecutor().."' doesnt support the URL Images. Error: "..u)
                end 
            elseif
             string.find(j,'rbxassetid') then
                 r.ImageLabel.Image = j 
               end
                return r end
                return g end
                    
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
                    Icon= '#a1a1aa'
            }
        }
    end
         
    function a.c()
        local b,c,d = {},
        {
            lua = {'and','break','or','else','elseif','if','then','until','repeat','while','do','for','in','end','local','return','function','export'},
            rbx = {'game','workspace','script','math','string','table','task','wait','select','next','Enum','tick','assert','shared','loadstring','tonumber','tostring','type','typeof','unpack','Instance','CFrame','Vector3','Vector2','Color3','UDim','UDim2','Ray','BrickColor','OverlapParams','RaycastParams','Axes','Random','Region3','Rect','TweenInfo','collectgarbage','not','utf8','pcall','xpcall','_G','setmetatable','getmetatable','os','pairs','ipairs'},
            operators = {'#','+','-','*','%','/','^','=','~','=','<','>'}
        
           },
            {
                numbers = Color3.fromHex'#FAB387',
                boolean = Color3.fromHex'#FAB387',
                operator = Color3.fromHex'#94E2D5',
                lua = Color3.fromHex'#CBA6F7',
                rbx = Color3.fromHex'#F38BA8',
                str = Color3.fromHex'#A6E3A1',
                comment = Color3.fromHex'#9399B2',
                null = Color3.fromHex'#F38BA8',
                call = Color3.fromHex'#89B4FA',
                self_call = Color3.fromHex'#89B4FA',
                local_property = Color3.fromHex'#CBA6F7'
            }
            
    local e = function(e)
        local f = {}
        for g,h in ipairs(e) do
           f[h] = true
    end
        return f
    end 
             
    local f,g,h = e(c.lua),e(c.rbx),e(c.operators)

    local i = function(i,j)
        local k = i[j] 
        if d[k..'_color'] then
             return d[k..'_color']
        end 
        if tonumber(k) then
             return d.numbers
             elseif k == 'nil' then
                 return d.null
            elseif k:sub(1,2) == '--' then
                  return d.comment 
            elseif h[k] then
                  return d.operator 
            elseif f[k] then
                  return d.lua
            elseif g[k] then
                  return d.rbx
            elseif k:sub(1,1) == '"'or k:sub(1,1) == "'" then
                  return d.str
            elseif k == 'true'or k == 'false' then
                  return d.boolean
            end
                                     
            if i[j+1] == '(' then
                if i[j-1] == ':' then
                    return d.self_call 
                end 
                return d.call
             end
              
             if i[j-1] == '.' then
                if i[j - 2] == 'Enum' then
                   return d.rbx
                end
                return d.local_property
             end
          end
                  
          function b.run(j)
            local k,n,o,p,q = {},'',false,false,false
            
            for r = 1,#j do
                local s = j:sub(r,r) 
                if p then
                    if s == '\n' and not q then
                        table.insert(k,n)
                        table.insert(k,s)
                        n = ''
                        p = false
                    elseif j:sub(r - 1,r) == ']]' and q then
                        n = n..']'
                        table.insert(k,n)
                        n = ''
                        p = false
                        q = false
                    else 
                        n = n..s 
                    end 
                elseif o then
                    if s == o and j:sub(r - 1,r - 1) ~= '\\' or s == '\n' then
                        n = n..s
                        o = false
                    else 
                        n = n..s 
                    end 
                else 
                    if j:sub(r,r+1) == '--' then
                        table.insert(k,n)
                        n = '-'
                        p = true
                        q = j:sub(r+2,r+3)=='[['
                    elseif s == '"' or s == "'" then
                        table.insert(k,n)
                        n = s
                        o = s
                    elseif h[s] then
                        table.insert(k,n)
                        table.insert(k,s)
                        n = ''
                    elseif s:match'[%w_]' then
                        n = n..s
                    else
                        table.insert(k,n)
                        table.insert(k,s)
                        n = '' 
                    end 
                end 
            end 
            
            table.insert(k,n)
            local r = {} 
            
            for s,t in ipairs(k) do
                local u = i(k,s) 
                if u then
                    local v = string.format('<font color = "#%s">%s</font>',u:ToHex(),t:gsub('<','&lt;'):gsub('>','&gt;'))
                    table.insert(r,v)
                else 
                    table.insert(r,t)
                end 
            end 
            return table.concat(r)
        end 
        return b
     end 
     
     function a.d()
        local b,c,d,e,f = game:GetService'UserInputService',game:GetService'TweenService',a.load'c',{},a.load'a'
        local g,h = f.New,f.Tween 
        
        function e.Button(i,j,k,n,o,p)
            n = n or 'Primary'
            local q,r = 10
            if j and j ~= ''then
                r = g('ImageLabel',{
                    Image = f.Icon(j)[1],
                    ImageRectSize = f.Icon(j)[2].ImageRectSize,
                    ImageRectOffset = f.Icon(j)[2].ImageRectPosition,
                    Size = UDim2.new(0,21,0,21),
                    BackgroundTransparency = 1,
                    ThemeTag = {ImageColor3='Icon'}
                })
            end

            local s = g('TextButton',{
                Size = UDim2.new(0,0,1,0),
                AutomaticSize = 'X',
                Parent = o,
                BackgroundTransparency = 1
            },{
                f.NewRoundFrame(q,'Squircle',{
                    ThemeTag = {ImageColor3 = n ~= 'White' and 'Button' or nil},
                    ImageColor3 = n == 'White' and Color3.new(1,1,1) or nil,
                    Size = UDim2.new(1,0,1,0),
                    Name='Squircle',
                    ImageTransparency = n == 'Primary' and 0 or n =='White'and 0 or 1
                }),
                f.NewRoundFrame(q,'Squircle',{
                    ImageColor3 = Color3.new(1,1,1),
                    Size = UDim2.new(1,0,1,0),
                    Name = 'Special',
                    ImageTransparency = n == 'Secondary' and 0.95 or 1
                }),
                f.NewRoundFrame(q,'Shadow-sm',{
                    ImageColor3 = Color3.new(0,0,0),
                    Size = UDim2.new(1,3,1,3),
                    AnchorPoint = Vector2.new(0.5,0.5),
                    Position = UDim2.new(0.5,0,0.5,0),
                    Name = 'Shadow',ImageTransparency = n == 'Secondary' and 0 or 1
                }),
                f.NewRoundFrame(q,'SquircleOutline',{
                    ThemeTag = {ImageColor3 = n ~= 'White' and 'Outline' or nil},
                    Size = UDim2.new(1,0,1,0),ImageColor3 = n == 'White' and Color3.new(0,0,0) or nil,
                    ImageTransparency = n == 'Primary' and 0.95 or 0.85
                }),
                f.NewRoundFrame(q,'Squircle',{
                    Size = UDim2.new(1,0,1,0),
                    Name = 'Frame',
                    ThemeTag = {ImageColor3 = n ~= 'White' and 'Text' or nil},
                    ImageColor3 = n == 'White' and Color3.new(0,0,0) or nil,
                    ImageTransparency = 1
                }, {
                
                g('UIPadding',{PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,12)}),
                g('UIListLayout',{FillDirection='Horizontal',Padding=UDim.new(0,8),
                VerticalAlignment='Center',HorizontalAlignment='Center'}),
                r,
                g('TextLabel',{
                    BackgroundTransparency = 1,
                    FontFace = Font.new(f.Font,Enum.FontWeight.SemiBold),
                    Text = i or 'Button',
                    ThemeTag = {TextColor3 = (n ~= 'Primary' and n ~= 'White') and 'Text'},
                    TextColor3 = n == 'Primary' and Color3.new(1,1,1) or n == 'White' and Color3.new(0,0,0) or nil,
                    AutomaticSize = 'XY',
                    TextSize = 18
                })
            })
        })

        s.MouseEnter:Connect(function()
            h(s.Frame,0.047,{ImageTransparency=0.95}):Play()
        end)
        
        s.MouseLeave:Connect(function()
            h(s.Frame,0.047,{ImageTransparency=1}):Play()
        end)

        s.MouseButton1Up:Connect(function()
            if p then
                p:Close()()
            end
            if k then
                k()
            end 
        end)
        return s
     end 
     
     function e.Input(i,j,k,n)
        local o,p = 10
        if j and j ~= '' then
            p = g('ImageLabel',{
                Image = f.Icon(j)[1],
                ImageRectSize = f.Icon(j)[2].ImageRectSize,
                ImageRectOffset = f.Icon(j)[2].ImageRectPosition,
                Size = UDim2.new(0,21,0,21),
                BackgroundTransparency = 1,
                ThemeTag = {ImageColor3='Icon'}
            })
        end 
        
        local q = g('TextBox',{
            BackgroundTransparency = 1,
            TextSize = 18,
            FontFace = Font.new(f.Font,Enum.FontWeight.Regular),
            Size = UDim2.new(1,p and -29 or 0,1,0),
            PlaceholderText = i,
            ClearTextOnFocus = false,
            ClipsDescendants = true,
            MultiLine = false,
            TextXAlignment = 'Left',
            ThemeTag = {PlaceholderColor3 = 'PlaceholderText',TextColor3 = 'Text'}
        })

        local r = g('Frame',{
            Size = UDim2.new(1,0,0,42),
            Parent=k,
            BackgroundTransparency=1
        },{
            g('Frame',{
                Size = UDim2.new(1,0,1,0),
                BackgroundTransparency=1
            },{
                f.NewRoundFrame(o,'Squircle',{
                    ThemeTag = {ImageColor3 = 'Accent'},
                    Size = UDim2.new(1,0,1,0),
                    ImageTransparency = 0.45
                }),
                f.NewRoundFrame(o,'SquircleOutline',{
                    ThemeTag = {ImageColor3 = 'Outline'},
                    Size = UDim2.new(1,0,1,0),
                    ImageTransparency = 0.9
                }),
                f.NewRoundFrame(o,'Squircle',{
                    Size = UDim2.new(1,0,1,0),
                    Name = 'Frame',
                    ImageColor3 = Color3.new(1,1,1),
                    ImageTransparency = 0.95
                },{
                    g('UIPadding',{
                        PaddingLeft = UDim.new(0,12),
                        PaddingRight = UDim.new(0,12)
                    }),
                    g('UIListLayout',{
                        FillDirection = 'Horizontal',
                        Padding = UDim.new(0,8),
                        VerticalAlignment = 'Center',
                        HorizontalAlignment = 'Left'
                    }),
                    p,
                    q
                })
            })
        })
        
        q.FocusLost:Connect(function()
            if n then
                n(q.Text)
            end
        end)
                 
        return r
    end

    function e.Label(i,j,k)
        local n,o = 10
        if j and j ~= '' then
            o = g('ImageLabel',{
                Image = f.Icon(j)[1],
                ImageRectSize = f.Icon(j)[2].ImageRectSize,
                ImageRectOffset = f.Icon(j)[2].ImageRectPosition,
                Size = UDim2.new(0,21,0,21),
                BackgroundTransparency = 1,
                ThemeTag = {ImageColor3='Icon'}
            })
        end 
        
        local p = g('TextLabel',{
            BackgroundTransparency = 1,
            TextSize = 18,
            FontFace = Font.new(f.Font,Enum.FontWeight.Regular),
            Size = UDim2.new(1,o and -29 or 0,1,0),
            TextXAlignment = 'Left',
            ThemeTag = {TextColor3='Text'},
            Text = i
        })
        
        local q = g('TextButton',{
            Size = UDim2.new(1,0,0,42),
            Parent = k,
            BackgroundTransparency = 1,
            Text = ''
        },{
            g('Frame',{
                Size = UDim2.new(1,0,1,0),
                BackgroundTransparency = 1
            },{
                f.NewRoundFrame(n,'Squircle',{
                    ThemeTag = {ImageColor3 = 'Accent'},
                    Size = UDim2.new(1,0,1,0),
                    ImageTransparency = 0.45
                }),
                f.NewRoundFrame(n,'SquircleOutline',{
                    ThemeTag = {ImageColor3 = 'Outline'},
                    Size = UDim2.new(1,0,1,0),
                    ImageTransparency = 0.9
                }),
                f.NewRoundFrame(n,'Squircle',{
                    Size = UDim2.new(1,0,1,0),
                    Name = 'Frame',
                    ImageColor3 = Color3.new(1,1,1),
                    ImageTransparency = 0.95
                },{
                    g('UIPadding',{
                        PaddingLeft = UDim.new(0,12),
                        PaddingRight = UDim.new(0,12)
                    }),
                    g('UIListLayout',{
                        FillDirection = 'Horizontal',
                        Padding = UDim.new(0,8),
                        VerticalAlignment = 'Center',
                        HorizontalAlignment = 'Left'
                    }),
                    o,p
                })
            })
        })
        return q
    end
    
    function e.Toggle(i,j,k,n)
        local o,p,q={},13
        if j and j ~= '' then
            q = g('ImageLabel',{
                Size = UDim2.new(1,-7,1,-7),
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5,0.5),
                Position = UDim2.new(0.5,0,0.5,0),
                Image = f.Icon(j)[1],
                ImageRectOffset = f.Icon(j)[2].ImageRectPosition,
                ImageRectSize = f.Icon(j)[2].ImageRectSize,
                ImageTransparency = 1,
                ImageColor3 = Color3.new(0,0,0)
        })
    end 

    local r = f.NewRoundFrame(p,'Squircle',{
        ImageTransparency = 0.95,
        ThemeTag = {ImageColor3 = 'Text'},
        Parent = k,
        Size = UDim2.new(0,42,0,26)
    },{
        f.NewRoundFrame(p,'Squircle',{
            Size = UDim2.new(1,0,1,0),
            Name = 'Layer',
            ThemeTag = {ImageColor3='Button'},
            ImageTransparency = 1
        }),
        f.NewRoundFrame(p,'SquircleOutline',{
            Size = UDim2.new(1,0,1,0),
            Name = 'Stroke',
            ImageColor3 = Color3.new(1,1,1),
            ImageTransparency= 1
        },{
            g('UIGradient',{
                Rotation = 90,
                Transparency = NumberSequence.new{
                    NumberSequenceKeypoint.new(0,0),
                    NumberSequenceKeypoint.new(1,1)
                }
            })
        }),
        f.NewRoundFrame(p,'Squircle',{
            Size = UDim2.new(0,18,0,18),
            Position = UDim2.new(0,3,0.5,0),
            AnchorPoint = Vector2.new(0,0.5),
            ImageTransparency = 0,
            ImageColor3 = Color3.new(1,1,1),
            Name = 'Frame'
        },{
            q
        })
    })
    
    function o.Set(s,t)
        if t then
            h(r.Frame,0.1,{
                Position = UDim2.new(1,-22,0.5,0)},
                Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                h(r.Layer,0.1,{ImageTransparency=0}):Play()
                h(r.Stroke,0.1,{ImageTransparency=0.95}):Play()
                if q then
                    h(q,0.1,{ImageTransparency=0}):Play()
                end
            else 
                h(r.Frame,0.1,{Position=UDim2.new(0,4,0.5,0),
                Size = UDim2.new(0,18,0,18)},
                Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                h(r.Layer,0.1,{ImageTransparency=1}):Play()
                h(r.Stroke,0.1,{ImageTransparency=1}):Play()
                if q then
                    h(q,0.1,{ImageTransparency=1}):Play()
                end 
            end 
            task.spawn(function()
                if n then
                    n(t)
                end 
            end)
        end 
        return r,o
     end 
     
     function e.Checkbox(i,j,k,n)
        local o = {}
        j = j or 'check'
        local p , q = 10, g('ImageLabel',{
            Size = UDim2.new(1,-10,1,-10),
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5,0.5),
            Position = UDim2.new(0.5,0,0.5,0),
            Image = f.Icon(j)[1],
            ImageRectOffset = f.Icon(j)[2].ImageRectPosition,
            ImageRectSize = f.Icon(j)[2].ImageRectSize,
            ImageTransparency = 1,
            ImageColor3 = Color3.new(1,1,1)
        })
        
        local r = f.NewRoundFrame(p,'Squircle',{
            ImageTransparency = 0.95,
            ThemeTag = {ImageColor3 = 'Text'},
            Parent = k,
            Size = UDim2.new(0,27,0,27)
        },{
        f.NewRoundFrame(p,'Squircle',{
            Size = UDim2.new(1,0,1,0),
            Name = 'Layer',
            ThemeTag = {ImageColor3='Button'},
            ImageTransparency = 1
        }),
            f.NewRoundFrame(p,'SquircleOutline',{
                Size = UDim2.new(1,0,1,0),
                Name = 'Stroke',
                ImageColor3 = Color3.new(1,1,1),
                ImageTransparency = 1
            },{
                g('UIGradient',{
                    Rotation = 90,
                    Transparency = NumberSequence.new{
                        NumberSequenceKeypoint.new(0,0),
                        NumberSequenceKeypoint.new(1,1)
                    }
                    })
                }),
                q
            })
            
     function o.Set(s,t)
        if t then
            h(r.Layer,0.06,{ImageTransparency=0}):Play()
            h(r.Stroke,0.06,{ImageTransparency=0.95}):Play()
            h(q,0.06,{ImageTransparency=0}):Play()
        else
            h(r.Layer,0.05,{ImageTransparency=1}):Play()
            h(r.Stroke,0.05,{ImageTransparency=1}):Play()
            h(q,0.06,{ImageTransparency=1}):Play()
        end 
        task.spawn(function()
            if n then
                n(t)
            end 
        end)
    end 
    return r,o
 end 
 
     function e.ScrollSlider(i,j,k,n)
        local o = g('Frame',{
            Size = UDim2.new(0,n,1,-k.UIPadding*2),
            BackgroundTransparency = 1,
            Position=UDim2.new(1,-k.UIPadding/3,0,k.UIPadding),
            AnchorPoint=Vector2.new(1,0),
            Parent = j,
            ZIndex=999,
            Active=true
        })
    
     local p = f.NewRoundFrame(n/2,'Squircle',{
        Size = UDim2.new(1,0,0,0),
        ImageTransparency = 0.85,
        ThemeTag = {ImageColor3='Text'},
        Parent = o
     })
    local q,r,s,t = g('Frame',{
        Size = UDim2.new(1,12,1,12),
        Position = UDim2.new(0.5,0,0.5,0),
        AnchorPoint = Vector2.new(0.5,0.5),
        BackgroundTransparency = 1,
        Active=true,
        ZIndex=999,
        Parent = p
     }),function()
        local q = i
        local r,s = q.AbsoluteCanvasSize.Y,q.AbsoluteWindowSize.Y
        local t = math.clamp(s/math.max(r,1),0,1)
        p.Size = UDim2.new(1,0,t,0)
        p.Visible = t < 1 and r > s
    end, function()
        local q,r,s = p.Position.Y.Scale,math.max(i.AbsoluteCanvasSize.Y-i.AbsoluteWindowSize.Y,1),1-p.Size.Y.Scale
        local t = q/s
        i.CanvasPosition=Vector2.new(i.CanvasPosition.X,t * r)
    end, function()
        local q,r = i.CanvasPosition.Y,math.max(i.AbsoluteCanvasSize.Y-i.AbsoluteWindowSize.Y,1)
        local s,t=q/r,1-p.Size.Y.Scale
        s=math.clamp(s,0,t)
        p.Position=UDim2.new(0,0,s,0)
    end 
    
    o.InputBegan:Connect(function(u)
        if (u.UserInputType == Enum.UserInputType.MouseButton1 or u.UserInputType == Enum.UserInputType.Touch)and not(u.Position.Y>=p.AbsolutePosition.Y and u.Position.Y<=p.AbsolutePosition.Y+p.AbsoluteSize.Y)then local v,w,x=o.AbsoluteSize.Y-p.AbsoluteSize.Y,o.AbsolutePosition.Y,p.AbsoluteSize.Y/2
            local y,z=(u.Position.Y-w-x)/v,1-p.Size.Y.Scale
            y = math.clamp(y,0,z)
            p.Position=UDim2.new(0,0,y,0)
            s()
        end 
    end)
    
    q.InputBegan:Connect(function(u)
        if u.UserInputType == Enum.UserInputType.MouseButton1 or u.UserInputType==Enum.UserInputType.Touch then
            local v,w=(u.Position.Y-p.AbsolutePosition.Y)
            w = b.InputChanged:Connect(function(x)
                if x.UserInputType == Enum.UserInputType.MouseMovement or x.UserInputType==Enum.UserInputType.Touch then
                    local y,z = o.AbsoluteSize.Y-p.AbsoluteSize.Y,o.AbsolutePosition.Y
                    local A,B=(x.Position.Y-z-v)/y,1-p.Size.Y.Scale
                    A = math.clamp(A,0,B)
                    p.Position=UDim2.new(0,0,A,0)
                    s()
                end 
            end)
            
    local x 
    x = b.InputEnded:Connect(function(y)
        if y.UserInputType == Enum.UserInputType.MouseButton1 or y.UserInputType == Enum.UserInputType.Touch then
            if w then w:Disconnect() end 
            if x then x:Disconnect() end 
            end 
        end)
    end 
end)

    i:GetPropertyChangedSignal'AbsoluteWindowSize':Connect(r)
    r()
    t()
    i:GetPropertyChangedSignal'CanvasPosition':Connect(function()
        t()
    end)
    return o 
end 

    function e.ToolTip(i,j)
        local k,n,o = {
            Container = nil,
            ToolTipSize = 16
        }, g('TextLabel',{
                AutomaticSize = 'XY',
                TextWrapped = true,
                BackgroundTransparency = 1,
                FontFace = Font.new(f.Font,Enum.FontWeight.Medium),
                Text = i,
                TextSize = 17,
                ThemeTag = {TextColor3='Text'}
            }) ,g('UIScale', {Scale=0.9})
                
                local p = g('CanvasGroup',{
                    AnchorPoint = Vector2.new(0.5,0),
                    AutomaticSize = 'XY',
                    BackgroundTransparency = 1,
                    Parent = j,
                    GroupTransparency = 1,
                    Visible = false
                },{
                    g('UISizeConstraint',{MaxSize = Vector2.new(400,math.huge)}),
                        g('Frame',{
                            AutomaticSize = 'XY',
                            BackgroundTransparency = 1,
                            LayoutOrder = 99,
                            Visible = false
                        },{
                            g('ImageLabel',{
                                Size = UDim2.new(0,k.ToolTipSize,0,k.ToolTipSize/2),
                                BackgroundTransparency = 1,
                                Rotation = 180,
                                Image = 'rbxassetid://89524607682719',
                                ThemeTag = {ImageColor3='Accent'}
                            },{
                                g('ImageLabel',{
                                    Size = UDim2.new(0,k.ToolTipSize,0,k.ToolTipSize/2),
                                    BackgroundTransparency = 1,
                                    LayoutOrder = 99,
                                    ImageTransparency = 0.9,
                                    Image = 'rbxassetid://89524607682719',
                                    ThemeTag = {ImageColor3='Text'}
                                })
                            })
                        }),
                        g('Frame',{
                            AutomaticSize = 'XY',
                            ThemeTag = {BackgroundColor3 = 'Accent'}
                        },{
                            g('UICorner',{CornerRadius = UDim.new(0,16)}),
                            g('Frame',{
                                ThemeTag = {BackgroundColor3 = 'Text'},
                                AutomaticSize = 'XY',
                                BackgroundTransparency = 0.9
                            },{
                                g('UICorner',{CornerRadius=UDim.new(0,16)}),
                                g('UIListLayout',{
                                    Padding = UDim.new(0,12),
                                    FillDirection = 'Horizontal',
                                    VerticalAlignment = 'Center'}),n,
                                    g('UIPadding',{
                                        PaddingTop = UDim.new(0,12),
                                        PaddingLeft = UDim.new(0,12),
                                        PaddingRight = UDim.new(0,12),
                                        PaddingBottom = UDim.new(0,12)
                                    })
                                })
                            }),o,
                            g('UIListLayout',{
                                Padding = UDim.new(0,0),
                                FillDirection = 'Vertical',
                                VerticalAlignment = 'Center',
                                HorizontalAlignment = 'Center'
                            })
                        })
                        
        k.Container = p
        function k.Open(q)
            p.Visible = true
             h(p,0.16,{GroupTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
             h(o,0.18,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
        end 
            
        function k.Close(q)
            h(p,0.2,{GroupTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
            h(o,0.2,{Scale=0.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
            task.wait(0.25)
            p.Visible=false
            p:Destroy()
        end 
        return k 
    end 
    
    function e.Code(i,j,k,n)
        local o = {Radius=12,Padding=10}
        local p = g('TextLabel',{
            Text = '',TextColor3 = Color3.fromHex'#CDD6F4',
            TextTransparency = 0,
            TextSize = 14,
            TextWrapped = false,
            LineHeight = 1.15,
            RichText = true,
            TextXAlignment = 'Left',
            Size = UDim2.new(0,0,0,0),
            BackgroundTransparency = 1,
            AutomaticSize = 'XY'
        },{
            g('UIPadding',{
                PaddingTop = UDim.new(0,o.Padding+3),
                PaddingLeft = UDim.new(0,o.Padding+3),
                PaddingRight = UDim.new(0,o.Padding+3),
                PaddingBottom = UDim.new(0,o.Padding+3)
            })
        })

        p.Font='Code'
        local q,r = g('ScrollingFrame',{
            Size = UDim2.new(1,0,0,0),
            BackgroundTransparency = 1,
            AutomaticCanvasSize = 'X',
            ScrollingDirection = 'X',
            ElasticBehavior = 'Never',
            CanvasSize = UDim2.new(0,0,0,0),
            ScrollBarThickness = 0
        },{p}), g('TextButton',{
            BackgroundTransparency=1,
            Size=UDim2.new(0,30,0,30),
            Position=UDim2.new(1,-o.Padding/2,0,o.Padding/2),
            AnchorPoint = Vector2.new(1,0),
            Visible = n and true or false
        },{
            f.NewRoundFrame(o.Radius-4,'Squircle',{
                ImageColor3 = Color3.fromHex'#ffffff',
                ImageTransparency = 1,
                Size = UDim2.new(1,0,1,0),
                AnchorPoint = Vector2.new(0.5,0.5),
                Position = UDim2.new(0.5,0,0.5,0),
                Name = 'Button'
            },{
                g('UIScale',{Scale=1}),
                g('ImageLabel',{
                    Image = f.Icon'copy'[1],
                    ImageRectSize = f.Icon'copy'[2].ImageRectSize,
                    ImageRectOffset = f.Icon'copy'[2].ImageRectPosition,
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0.5,0.5),
                    Position = UDim2.new(0.5,0,0.5,0),
                    Size = UDim2.new(0,12,0,12),
                    ImageColor3 = Color3.fromHex'#ffffff',
                    ImageTransparency=0.1
                })
            })
        })
        
        r.MouseEnter:Connect(function()
            h(r.Button,0.05,{ImageTransparency=0.95}):Play()
            h(r.Button.UIScale,0.05,{Scale=0.9}):Play()
        end)

        r.InputEnded:Connect(function()
            h(r.Button,0.08,{ImageTransparency=1}):Play()
            h(r.Button.UIScale,0.08,{Scale=1}):Play()
        end)
        
        f.NewRoundFrame(o.Radius,'Squircle',{
            ImageColor3 = Color3.fromHex'#212121',
            ImageTransparency = 0.035,
            Size = UDim2.new(1,0,0,20+(o.Padding*2)),
            AutomaticSize = 'Y',
            Parent=k
        },{
            f.NewRoundFrame(o.Radius,'SquircleOutline',{
                Size = UDim2.new(1,0,1,0),
                ImageColor3 = Color3.fromHex'#ffffff',
                ImageTransparency = 0.955
            }),
            g('Frame',{
                BackgroundTransparency = 1,
                Size = UDim2.new(1,0,0,0),
                AutomaticSize = 'Y'
            },{
                f.NewRoundFrame(o.Radius,'Squircle-TL-TR',{
                    ImageColor3 = Color3.fromHex'#ffffff',
                    ImageTransparency = 0.96,
                    Size = UDim2.new(1,0,0,20+(o.Padding*2)),
                    Visible = j and true or false
                },{
                    g('ImageLabel',{
                        Size = UDim2.new(0,18,0,18),
                        BackgroundTransparency = 1,
                        Image = 'rbxassetid://132464694294269',
                        ImageColor3 = Color3.fromHex'#ffffff',
                        ImageTransparency = 0.2
                    }),
                    g('TextLabel',{
                        Text = j,
                        TextColor3 = Color3.fromHex'#ffffff',
                        TextTransparency = 0.2,
                        TextSize = 16,
                        AutomaticSize = 'Y',
                        FontFace = Font.new(f.Font,Enum.FontWeight.Medium),
                        TextXAlignment = 'Left',
                        BackgroundTransparency = 1,
                        TextTruncate = 'AtEnd',
                        Size = UDim2.new(1,r and-20-(o.Padding*2),0,0)
                    }),
                        g('UIPadding',{
                            PaddingLeft = UDim.new(0,o.Padding+3),
                            PaddingRight = UDim.new(0,o.Padding+3)}),
                            g('UIListLayout',{
                                Padding = UDim.new(0,o.Padding),
                                FillDirection = 'Horizontal',
                                VerticalAlignment = 'Center'
                            })
                        }),q,
                        g('UIListLayout',{
                            Padding = UDim.new(0,0),
                            FillDirection = 'Vertical'
                        })
                    }),r
                })
                
                p:GetPropertyChangedSignal'TextBounds':Connect(function()
                    q.Size = UDim2.new(1,0,0,p.TextBounds.Y+((o.Padding+3)*2))
                end)
                function o.Set(s)
                    p.Text = d.run(s)
                end 
                
                o.Set(i)
                
                r.MouseButton1Click:Connect(function()
                    if n then
                        n()
                        local s = f.Icon'check'
                        r.Button.ImageLabel.Image = s[1]
                        r.Button.ImageLabel.ImageRectSize = s[2].ImageRectSize
                        r.Button.ImageLabel.ImageRectOffset = s[2].ImageRectPosition
                     end 
                    end)
                    return o 
                end 
                return e 
            end 
            
    function a.e()
        local b = a.load'a'
        local c,d,e = b.New,b.Tween,{UICorner = 14,UIPadding = 12,Holder = nil,Window = nil}
        
        function e.Init(f)
            e.Window = f
            return e
        end 
        
        function e.Create(f)
            local g = {UICorner = 19,UIPadding = 16,UIElements = {}}
            
            if f then
                g.UIPadding = 0
            end 
            
            if f then
                g.UICorner = 22
            end
            
            if not f then
                g.UIElements.FullScreen = c('Frame',{
                    ZIndex = 999,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.fromHex'#2a2a2a',
                    Size = UDim2.new(1,0,1,0),
                    Active = false,
                    Visible = false,
                    Parent = f and e.Window or e.Window.UIElements.Main.Main
                },{
                    c('UICorner',{
                        CornerRadius=UDim.new(0,e.Window.UICorner)})
                })
            end 
            
            g.UIElements.Main=c('Frame',{
                ThemeTag = {BackgroundColor3 = 'Accent'},
                AutomaticSize = 'XY',
                BackgroundTransparency = 1,
                Visible = false,
                ZIndex = 99999
            },{
                c('UIPadding',{
                    PaddingTop = UDim.new(0,g.UIPadding),
                    PaddingLeft = UDim.new(0,g.UIPadding),
                    PaddingRight = UDim.new(0,g.UIPadding),
                    PaddingBottom = UDim.new(0,g.UIPadding)
                })
            })
            
            g.UIElements.MainContainer = b.NewRoundFrame(g.UICorner,'Squircle',{
                Visible = false,
                ImageTransparency = f and 0.15 or 0,Parent = f and e.Window or g.UIElements.FullScreen,
                Position = UDim2.new(0.5,0,0.5,0),
                AnchorPoint = Vector2.new(0.5,0.5),
                AutomaticSize = 'XY',
                ThemeTag = {ImageColor3 = 'Accent'},
                ZIndex = 9999
            },{
                g.UIElements.Main,c('UIScale',{Scale = 0.9}),
                b.NewRoundFrame(g.UICorner,'SquircleOutline',{
                    Size = UDim2.new(1,0,1,0),
                    ImageTransparency = 0.9,
                    ThemeTag = {ImageColor3 = 'Outline'}
                },{
                    c('UIGradient',{
                        Rotation=90,
                        Transparency=NumberSequence.new{
                            NumberSequenceKeypoint.new(0,0),
                            NumberSequenceKeypoint.new(1,1)
                        }
                    })
                })
            })
            
            function g.Open(h)
                if not f then
                    g.UIElements.FullScreen.Visible = true
                    g.UIElements.FullScreen.Active = true
                end 
                task.spawn(function()
                    g.UIElements.MainContainer.Visible = true
                    if not f then
                        d(g.UIElements.FullScreen,0.1,{BackgroundTransparency = 0.5}):Play()
                    end 
                        
                    d(g.UIElements.MainContainer,0.1,{ImageTransparency=0}):Play()
                    d(g.UIElements.MainContainer.UIScale,0.1,{Scale=1}):Play()
                    
                    task.spawn(function()
                        task.wait(0.05)
                        g.UIElements.Main.Visible = true
                    end)
                end)
            end 
            
            function g.Close(h)
                if not f then
                    d(g.UIElements.FullScreen,0.1,{BackgroundTransparency=1}):Play()
                    g.UIElements.FullScreen.Active = false
                    task.spawn(function()
                        task.wait(0.1)
                        g.UIElements.FullScreen.Visible = false
                    end)
                end 
                
                g.UIElements.Main.Visible = false
                d(g.UIElements.MainContainer,0.1,{ImageTransparency = 1}):Play()
                d(g.UIElements.MainContainer.UIScale,0.1,{Scale = 0.9}):Play()
                
                task.spawn(function()
                    task.wait(0.1)
                    if not f then
                        g.UIElements.FullScreen:Destroy()
                    else
                        g.UIElements.MainContainer:Destroy()
                    end 
                end)
                
                return function()
                end 
            end 
            return g
         end 
         return e
      end
          
      function a.f()
        local b,c = {},a.load'a'
        local d,e,f = c.New,c.Tween,a.load'd'
        local g,h = f.Button,f.Input
        
        function b.new(i,j,k)
            local n = a.load'e'.Init(i.WindUI.ScreenGui.KeySystem)
            local o,p,q,r = n.Create(true),200,430
            
            if i.KeySystem.Thumbnail and i.KeySystem.Thumbnail.Image then
                q = 430+(p/2)
            end 
            
            o.UIElements.Main.AutomaticSize = 'Y'
            o.UIElements.Main.Size = UDim2.new(0,q,0,0)
            
            local s 
            if i.Icon then 
                local t = {ImageColor3='Text'}
                if string.find(i.Icon,'rbxassetid://') or not c.Icon(tostring(i.Icon))[1] then
                    t = nil
                end 
                
                s = d('ImageLabel',{
                    Size = UDim2.new(0,24,0,24),
                    BackgroundTransparency = 1,
                    LayoutOrder = -1,
                    ThemeTag = t
                })
                
                if string.find(i.Icon,'rbxassetid://') or string.find(i.Icon,'http://www.roblox.com/asset/?id=') then
                    
                    s.Image = i.Icon
                elseif string.find(i.Icon,'http') then
                    local u,v=pcall(function()
                        if not isfile('Venuz Hub/'..Window.Folder..'/Assets/.Icon.png') then
                            local u = request{Url = i.Icon,Method='GET'}.Body
                            writefile('Venuz Hub/'..Window.Folder..'/Assets/.Icon.png',u)
                        end 
                        s.Image=getcustomasset('Venuz Hub/'..Window.Folder..'/Assets/.Icon.png')
                    end)
                    
                    if not u then
                        s:Destroy()
                        warn("[ Venuz Hub ]  '"..identifyexecutor().."' doesnt support the URL Images. Error: "..v)
                    end 
                else 
                    if c.Icon(tostring(i.Icon))[1] then
                        s.Image = c.Icon(i.Icon)[1]
                        s.ImageRectOffset = c.Icon(i.Icon)[2].ImageRectPosition
                        s.ImageRectSize = c.Icon(i.Icon)[2].ImageRectSize 
                    end 
                end 
            end 
            
            local t,u = d('TextLabel',{
                AutomaticSize = 'XY',
                BackgroundTransparency = 1,
                Text = i.Title,
                FontFace = Font.new(c.Font,Enum.FontWeight.SemiBold),
                ThemeTag = {TextColor3 = 'Text'},
                TextSize = 20
            }),
            
            d('TextLabel',{
                AutomaticSize = 'XY',
                BackgroundTransparency = 1,
                Text = 'Key System',
                AnchorPoint = Vector2.new(1,0.5),
                Position = UDim2.new(1,0,0.5,0),
                TextTransparency = 1,
                FontFace = Font.new(c.Font,Enum.FontWeight.Medium),
                ThemeTag = {TextColor3='Text'},
                TextSize = 16
            })
                
            local v = d('Frame',{
                BackgroundTransparency = 1,
                AutomaticSize = 'XY'
            },{
                d('UIListLayout',{
                    Padding = UDim.new(0,14),
                    FillDirection = 'Horizontal',
                    VerticalAlignment = 'Center'
                }),s,t
            })
            
            local w,x,y = d('Frame',{
                AutomaticSize = 'Y',
                Size = UDim2.new(1,0,0,0),
                BackgroundTransparency = 1
            }, {v,u}),(h('Enter Key','key',nil,function(w)r=w end))
            
            if i.KeySystem.Note and i.KeySystem.Note ~= '' then
                y = d('TextLabel',{
                    Size = UDim2.new(1,0,0,0),
                    AutomaticSize = 'Y',
                    FontFace = Font.new(c.Font,Enum.FontWeight.Medium),
                    TextXAlignment = 'Left',
                    Text = i.KeySystem.Note,
                    TextSize = 18,
                    TextTransparency = 0.4,
                    ThemeTag = {TextColor3 = 'Text'},
                    BackgroundTransparency = 1,
                    RichText = true
                })
            end

            local z,A = (d('Frame',{
                Size = UDim2.new(1,0,0,42),
                BackgroundTransparency = 1
            },{
                d('Frame',{
                    BackgroundTransparency=1,
                    AutomaticSize = 'X',
                    Size = UDim2.new(0,0,1,0)
                },{
                    d('UIListLayout',{
                        Padding = UDim.new(0,9),
                        FillDirection = 'Horizontal'
                    })
                })
            }))
            
            if i.KeySystem.Thumbnail and i.KeySystem.Thumbnail.Image then
                local B if i.KeySystem.Thumbnail.Title then
                    B=d('TextLabel',{
                        Text = i.KeySystem.Thumbnail.Title,
                        ThemeTag = {TextColor3='Text'},
                        TextSize = 18,
                        FontFace = Font.new(c.Font,Enum.FontWeight.Medium),
                        BackgroundTransparency = 1,
                        AutomaticSize = 'XY',
                        AnchorPoint = Vector2.new(0.5,0.5),
                        Position = UDim2.new(0.5,0,0.5,0)
                    })
                end 
                
                A = d('ImageLabel',{
                    Image = i.KeySystem.Thumbnail.Image,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0,p,1,0),
                    Parent = o.UIElements.Main,ScaleType='Crop'
                },{
                    B,d('UICorner',{
                        CornerRadius = UDim.new(0,0)
                    })
                })
            end

            local B,C = d('Frame',{
                Size = UDim2.new(1,A and-p or 0,1,0),
                Position = UDim2.new(0,A and p or 0,0,0),
                BackgroundTransparency = 1,
                Parent = o.UIElements.Main
            },{
                d('Frame',{
                    Size = UDim2.new(1,0,1,0),
                    BackgroundTransparency = 1
                },{
                    d('UIListLayout',{
                        Padding = UDim.new(0,18),
                        FillDirection = 'Vertical'
                    }),w,y,x,z,
                    d('UIPadding',{
                        PaddingTop = UDim.new(0,16),
                        PaddingLeft = UDim.new(0,16),
                        PaddingRight = UDim.new(0,16),
                        PaddingBottom = UDim.new(0,16)
                    })
                })
            }), g('Exit', 'log-out', function()o:Close()() end, 'Tertiary' ,z.Frame)
            
            if A then
                C.Parent = A C.Size = UDim2.new(0,0,0,42)
                C.Position = UDim2.new(0,16,1,-16)
                C.AnchorPoint = Vector2.new(0,1)
            end 
            
            if i.KeySystem.URL then
                 g('Get key','key',function()setclipboard(i.KeySystem.URL)end,'Secondary',z.Frame)
            end 
            
            local D = g('Submit','arrow-right',function()
                local D = r
                local E = tostring(i.KeySystem.Key) == tostring(D)
                
                if type(i.KeySystem.Key) == 'table' then
                    E=table.find(i.KeySystem.Key,tostring(D))
                end 
                
                if E then 
                    o:Close()()
                    if i.KeySystem.SaveKey then
                        local F = i.Folder or i.Title
                        writefile(F..'/'..j..'.key',tostring(D))
                    end 
                    
                    task.wait(0.4)
                    k(true)
                else 
                    local F,G = TextBoxHolder.UIStroke.Color,TextBoxHolder.BackgroundColor3 e(TextBoxHolder.UIStroke,0.1,{Color=Color3.fromHex'#ff1e1e',Transparency=0.65}):Play() 
                    e(TextBoxHolder,0.1,{BackgroundColor3=Color3.fromHex'#ff1e1e',Transparency=0.8}):Play()
                    
                    task.wait(0.5)
                    e(TextBoxHolder.UIStroke,0.15,{Color = F,Transparency = 0.9}):Play()
                    e(TextBoxHolder,0.15,{BackgroundColor3 = G,Transparency = 0.95}):Play()
                end 
            end,'Primary',z)
            
            D.AnchorPoint = Vector2.new(1,0.5)
            D.Position = UDim2.new(1,0,0.5,0)
            o:Open()
        end 
        return b 
    end 
    
    function a.g()
        local b = a.load'a'
        local c,d,e = b.New,b.Tween,{
            Size = UDim2.new(0,300,1,-156),
            SizeLower = UDim2.new(0,300,1,-56),
            UICorner = 16,
            UIPadding = 14,
            ButtonPadding = 9,
            Holder = nil,
            NotificationIndex = 0,
            Notifications = {}
        }
    
        function e.Init(f)
            local g={Lower=false}

            function g.SetLower(h)
                g.Lower=h 
                g.Frame.Size=h and e.SizeLower or e.Size 
            end 

            g.Frame=c('Frame',{
                Position = UDim2.new(1,-29,0,56),
                AnchorPoint = Vector2.new(1,0),
                Size = e.Size,Parent = f,
                BackgroundTransparency = 1
            },{
                c('UIListLayout',{
                    HorizontalAlignment = 'Center',
                    SortOrder = 'LayoutOrder',
                    VerticalAlignment = 'Bottom',
                    Padding = UDim.new(0,8)
                }),
                
                c('UIPadding',{PaddingBottom=UDim.new(0,29)})
            })
            
            return g 
        end 
        
        function e.New(f)
            local g = {
                Title = f.Title or'Notification',
                Content = f.Content or nil,
                Icon = f.Icon or nil,
                Background = f.Background,
                Duration = f.Duration or 5,
                Buttons = f.Buttons or{},
                CanClose = true,UIElements = {},
                Closed = false
            }
            
            if g.CanClose == nil then
                g.CanClose = true
            end 
            
            e.NotificationIndex = e.NotificationIndex + 1
            e.Notifications[e.NotificationIndex] = g

            local h,i,j = c('UICorner',{CornerRadius=UDim.new(0,e.UICorner)}),(c('UIStroke',{ThemeTag={Color='Text'},Transparency=1,Thickness=0.6}))
            
            if g.Icon then
                if b.Icon(g.Icon) and b.Icon(g.Icon)[2] then
                    j = c('ImageLabel',{
                        Size = UDim2.new(0,26,0,26),
                        Position = UDim2.new(0,e.UIPadding,0,e.UIPadding),
                        BackgroundTransparency = 1,
                        Image = b.Icon(g.Icon)[1],
                        ImageRectSize = b.Icon(g.Icon)[2].ImageRectSize,
                        ImageRectOffset = b.Icon(g.Icon)[2].ImageRectPosition,
                        ThemeTag = {ImageColor3 = 'Text'}
                    })
                elseif string.find(g.Icon,'rbxassetid') then 
                    j = c('ImageLabel',{
                        Size = UDim2.new(0,26,0,26),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0,e.UIPadding,0,e.UIPadding),
                        Image = g.Icon
                    })
                end 
            end 
            
            local k 
            if g.CanClose then
                k = c('ImageButton',{
                    Image = b.Icon'x'[1],
                    ImageRectSize = b.Icon'x'[2].ImageRectSize,
                    ImageRectOffset = b.Icon'x'[2].ImageRectPosition,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0,16,0,16),
                    Position = UDim2.new(1,-e.UIPadding,0,e.UIPadding),
                    AnchorPoint = Vector2.new(1,0),
                    ThemeTag = {ImageColor3 = 'Text'}
                },{
                    c('TextButton',{
                        Size = UDim2.new(1,8,1,8),
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(0.5,0.5),
                        Position = UDim2.new(0.5,0,0.5,0),
                        Text = ''
                    })
                })
            end 

            local n,o = c('Frame',{
                Size = UDim2.new(1,0,0,3),
                BackgroundTransparency = 0.9,
                ThemeTag = {BackgroundColor3 = 'Text'}
            }),
            
            c('Frame',{
                Size = UDim2.new(1,g.Icon and -28-e.UIPadding or 0,1,0),
                Position = UDim2.new(1,0,0,0),
                AnchorPoint = Vector2.new(1,0),
                BackgroundTransparency = 1,
                AutomaticSize = 'Y'
            },{
                c('UIPadding',{
                    PaddingTop = UDim.new(0,e.UIPadding),
                    PaddingLeft = UDim.new(0,e.UIPadding),
                    PaddingRight = UDim.new(0,e.UIPadding),
                    PaddingBottom = UDim.new(0,e.UIPadding)
                }),
                c('TextLabel',{
                    AutomaticSize = 'Y',
                    Size = UDim2.new(1,-30-e.UIPadding,0,0),
                    TextWrapped = true,
                    TextXAlignment = 'Left',
                    RichText = true,
                    BackgroundTransparency = 1,
                    TextSize = 16,
                    ThemeTag = {TextColor3='Text'},
                    Text = g.Title,
                    FontFace = Font.new(b.Font,Enum.FontWeight.SemiBold)
                }),
                c('UIListLayout',{Padding=UDim.new(0,e.UIPadding/3)})})
            
    if g.Content then
        c('TextLabel',{
            AutomaticSize = 'Y',
            Size = UDim2.new(1,0,0,0),
            TextWrapped = true,
            TextXAlignment = 'Left',
            RichText = true,
            BackgroundTransparency = 1,
            TextTransparency = 0.4,
            TextSize = 15,
            ThemeTag = {TextColor3 = 'Text'},
            Text = g.Content,FontFace = Font.new(b.Font,Enum.FontWeight.Medium),
            Parent = o
        })
    end 
    
    local p = c('CanvasGroup',{
        Size = UDim2.new(1,0,0,0),
        Position = UDim2.new(2,0,1,0),
        AnchorPoint = Vector2.new(0,1),
        AutomaticSize = 'Y',
        BackgroundTransparency = 0.25,
        ThemeTag = {BackgroundColor3 = 'Accent'}
    },{
        c('ImageLabel',{
            Name='Background',Image=g.Background,
            BackgroundTransparency=1,
            Size=UDim2.new(1,0,1,0),
            ScaleType='Crop'
        }),i,h,o,j,k,n
    })
    
    local q = c('Frame',{
        BackgroundTransparency = 1,
        Size = UDim2.new(1,0,0,0),
        Parent = f.Holder
    },{p})
    
    function g.Close(r)
        if not g.Closed then
            g.Closed = true
            d(q,0.45,{Size = UDim2.new(1,0,0,-8)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
            d(p,0.55,{Position = UDim2.new(2,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
            task.wait(0.45)
            q:Destroy()
        end 
    end 

    task.spawn(function()
        task.wait()
        d(q,0.45,{Size = UDim2.new(1,0,0,p.AbsoluteSize.Y)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
        d(p,0.45,{Position = UDim2.new(0,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
        if g.Duration then
            d(n,g.Duration,{Size = UDim2.new(0,0,0,3)},Enum.EasingStyle.Linear,Enum.EasingDirection.InOut):Play()
            task.wait(g.Duration)
            g:Close()
        end 
    end)

    if k then
        k.TextButton.MouseButton1Click:Connect(function()
            g:Close()
        end)
    end 
    return g 
end 
return e 
end 
    function a.h()
        local b,c = {},a.load'a'
        local d,e = c.New,c.Tween 

        function b.new(f)
            local g,h = {
                Title = f.Title or'Dialog',
                Content = f.Content,
                Icon = f.Icon,
                Thumbnail = f.Thumbnail,
                Buttons = f.Buttons
            }, a.load'e'.Init(f.WindUI.ScreenGui.Popups)
            
            local i,j,k = h.Create(true),200,430 
            
            if g.Thumbnail and g.Thumbnail.Image then
                k = 430+(j/2) 
            end 
            
            i.UIElements.Main.AutomaticSize = 'Y'
            i.UIElements.Main.Size = UDim2.new(0,k,0,0)
            
            local n 
            if g.Icon then
                n = c.Image(g.Icon,g.Title,i.UICorner-4,f.WindUI.Window,'Popup')
                n.Size = UDim2.new(0,24,0,24)
                n.LayoutOrder =- 1 
            end 
            
            local o = d('TextLabel',{
                AutomaticSize = 'XY',
                BackgroundTransparency = 1,
                Text = g.Title,
                FontFace = Font.new(c.Font,Enum.FontWeight.SemiBold),
                ThemeTag = {TextColor3='Text'},
                TextSize = 20
            })
            
            local p = d('Frame',{
                BackgroundTransparency = 1,
                AutomaticSize = 'XY'
            },{
                d('UIListLayout',{
                    Padding = UDim.new(0,14),
                    FillDirection = 'Horizontal',
                    VerticalAlignment = 'Center'
                }),n,o
            })
            
            local q,r = (d('Frame',{
                AutomaticSize='Y',
                Size=UDim2.new(1,0,0,0),
                BackgroundTransparency=1
            },{p}))
            
            if g.Content and g.Content ~= '' then
                r = d('TextLabel',{
                    Size = UDim2.new(1,0,0,0),
                    AutomaticSize = 'Y',
                    FontFace = Font.new(c.Font,Enum.FontWeight.Medium),
                    TextXAlignment = 'Left',
                    Text = g.Content,
                    TextSize = 18,
                    TextTransparency = 0.2,
                    ThemeTag = {TextColor3 = 'Text'},
                    BackgroundTransparency = 1,
                    RichText = true
                })
            end 
            
            local s,t = (d('Frame',{
                Size=UDim2.new(1,0,0,42),
                BackgroundTransparency=1
            },{
                d('UIListLayout',{
                    Padding=UDim.new(0,9),
                    FillDirection='Horizontal',
                    HorizontalAlignment='Right'
                })
            }))
            
            if g.Thumbnail and g.Thumbnail.Image then
                local u 
                if g.Thumbnail.Title then
                    u = d('TextLabel',{
                        Text = g.Thumbnail.Title,
                        ThemeTag = {TextColor3='Text'},
                        TextSize = 18,
                        FontFace = Font.new(c.Font,Enum.FontWeight.Medium),
                        BackgroundTransparency = 1,
                        AutomaticSize = 'XY',
                        AnchorPoint = Vector2.new(0.5,0.5),
                        Position = UDim2.new(0.5,0,0.5,0)
                    })
                end 
                
                t = d('ImageLabel',{
                    Image = g.Thumbnail.Image,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0,j,1,0),
                    Parent = i.UIElements.Main,
                    ScaleType = 'Crop'
                },{u,
                d('UICorner',{
                    CornerRadius = UDim.new(0,0)
                })
            })
        end 
        
        local u,v = d('Frame',{
            Size = UDim2.new(1,t and-j or 0,1,0),
            Position = UDim2.new(0,t and j or 0,0,0),
            BackgroundTransparency = 1,
            Parent = i.UIElements.Main
        },{
            d('Frame',{
                Size = UDim2.new(1,0,1,0),
                BackgroundTransparency=1
            },{
                d('UIListLayout',{
                    Padding = UDim.new(0,18),
                    FillDirection = 'Vertical'
            }),q,r,s,
            d('UIPadding',{
                PaddingTop=UDim.new(0,16),
                PaddingLeft=UDim.new(0,16),
                PaddingRight=UDim.new(0,16),
                PaddingBottom=UDim.new(0,16)
            })
        })
    }),a.load'd'.Button
    
    for w,x in next,g.Buttons do
        v(x.Title,x.Icon,x.Callback,x.Variant,s,i)
    end 
    
    i:Open()
end 
return b 
end 

function a.i()
    local b = a.load'a'
    local c,d,e,f = b.New,b.NewRoundFrame,b.Tween,game:GetService'UserInputService'
    
    return function(g)
        local h = {
            Title = g.Title,
            Desc = g.Desc or nil,
            Hover = g.Hover,
            Thumbnail = g.Thumbnail,
            ThumbnailSize = g.ThumbnailSize or 80,
            Image = g.Image,
            ImageSize = g.ImageSize or 22,
            Color = g.Color,
            Scalable = g.Scalable,
            UIPadding = 12,
            UICorner = 12,
            UIElements = {}
        }
        
    local i,j,k,n,o,p = h.ImageSize,h.ThumbnailSize,true,false 
    
    if h.Thumbnail then
        o = b.Image(h.Thumbnail,h.Title,h.UICorner-5,g.Window.Folder,'Thumbnail',false)
        o.Size=UDim2.new(1,0,0,j)
    end 
    
    if h.Image then
        p = b.Image(h.Image,h.Title,h.UICorner-5,g.Window.Folder,'Image',h.Color~='White')
        if h.Color == 'White' then
            p.ImageLabel.ImageColor3 = Color3.new(0,0,0)
        end 
        
        p.Size=UDim2.new(0,i,0,i)
        p.Position=UDim2.new(0,h.UIPadding/2,0,o and j+(h.UIPadding*1.5)or h.UIPadding/2)
    end 
    
    h.UIElements.Main=c('TextButton',{
        Size = UDim2.new(1,0,0,0),
        AutomaticSize = 'Y',
        AnchorPoint = Vector2.new(0.5,0.5),
        Position = UDim2.new(0.5,0,0.5,0),
        Visible = false,BackgroundTransparency=1
    },{
        c('UIScale',{Scale=0.98}),p,o,
        c('Frame',{
            Size = UDim2.new(1,h.Image and -(i+h.UIPadding),0,0),
            AutomaticSize = 'Y',
            AnchorPoint = Vector2.new(0,0),
            Position = UDim2.new(0,p and i+h.UIPadding or 0,0,o and j+h.UIPadding or 0),
            BackgroundTransparency=1,
            Name = 'Title'
        },{
            c('UIListLayout',{Padding=UDim.new(0,7)}),
            c('TextLabel',{
                Text = h.Title,
                ThemeTag = {TextColor3 = not h.Color and'Text'or nil},
                TextColor3 = h.Color and (h.Color=='White'and Color3.new(0,0,0) or Color3.new(1,1,1)),
                TextSize = 16,
                TextWrapped = true,
                RichText = true,
                LayoutOrder = 0,
                Name = 'Title',
                TextXAlignment = 'Left',
                Size = UDim2.new(1,-g.TextOffset,0,0),
                FontFace = Font.new(b.Font,Enum.FontWeight.Medium),
                BackgroundTransparency = 1,
                AutomaticSize = 'Y'
            }),
            c('UIPadding',{
                PaddingTop = UDim.new(0,(h.UIPadding/2)+2),
                PaddingLeft = UDim.new(0,h.UIPadding/2),
                PaddingRight = UDim.new(0,h.UIPadding/2),
                PaddingBottom = UDim.new(0,(h.UIPadding/2)+2)
            })
        }),
        d(h.UICorner,'Squircle',{
            Size = UDim2.new(1,h.UIPadding,1,h.UIPadding),
            Position = UDim2.new(0.5,0,0.5,0),
            AnchorPoint = Vector2.new(0.5,0.5),
            Name = 'MainBackgroundVenuzHub',
            ThemeTag = {ImageColor3=not h.Color and'Text'or nil},
            ImageTransparency = not h.Color and 0.95 or 0.1,
            ImageColor3 = h.Color and Color3.fromHex(b.Colors[h.Color]),
            ZIndex =- 1
        }),
        d(h.UICorner,'Squircle',{
            Size = UDim2.new(1,h.UIPadding,1,h.UIPadding),
            ThemeTag = {ImageColor3 = 'Text'},
            Position = UDim2.new(0.5,0,0.5,0),
            AnchorPoint = Vector2.new(0.5,0.5),
            ImageTransparency = 1,
            Name = 'Highlight',ZIndex =- 1
        }),
        d(h.UICorner,'SquircleOutline',{
            Size=UDim2.new(1,h.UIPadding,1,h.UIPadding),
            ThemeTag={ImageColor3='Text'},
            Position=UDim2.new(0.5,0,0.5,0),
            AnchorPoint=Vector2.new(0.5,0.5),
            ImageTransparency=h.Color=='White'and 0 or 0.95,
            Name='Outline',
            ZIndex=-1
        },{
            c('UIGradient',{
                Rotation = 90,
                Transparency = NumberSequence.new{
                    NumberSequenceKeypoint.new(0,0),
                    NumberSequenceKeypoint.new(1,1)
                }
            })
        }),
        c('Frame',{
            Size = UDim2.new(1,h.UIPadding,1,h.UIPadding),
            BackgroundColor3 = Color3.new(0,0,0),
            Position = UDim2.new(0.5,0,0.5,0),
            AnchorPoint = Vector2.new(0.5,0.5),
            BackgroundTransparency = 1,
            ZIndex = 999999,Name = 'Lock'
        },{
            c('UICorner',{CornerRadius=UDim.new(0,11)}),
            c('ImageLabel',{
                Image = b.Icon'lock'[1],
                ImageRectOffset = b.Icon'lock'[2].ImageRectPosition,
                ImageRectSize = b.Icon'lock'[2].ImageRectSize,
                Size = UDim2.new(0,22,0,22),
                ImageTransparency = 1,
                BackgroundTransparency = 1,
                Active = false
            }),
            c('TextLabel',{
                BackgroundTransparency = 1,
                Text = 'Locked',
                TextTransparency = 1,
                AutomaticSize = 'XY',
                FontFace = Font.new(b.Font,Enum.FontWeight.SemiBold),
                TextSize = 16,
                Active = false,
                TextColor3 = Color3.new(1,1,1)
            }),
            c('UIListLayout',{
                Padding = UDim.new(0,h.UIPadding),
                FillDirection = 'Horizontal',
                VerticalAlignment = 'Center',
                HorizontalAlignment = 'Center'
            })
        }),
        c('UIPadding',{
            PaddingTop=UDim.new(0,h.UIPadding/2),
            PaddingLeft=UDim.new(0,h.UIPadding/2),
            PaddingRight=UDim.new(0,h.UIPadding/2),
            PaddingBottom=UDim.new(0,h.UIPadding/2)
        })
    })
    h.UIElements.MainContainer=c('Frame',{
        Size = UDim2.new(1,0,0,h.UIElements.Main.AbsoluteSize.Y),
        BackgroundTransparency = 1,
        Parent = g.Parent
    },{h.UIElements.Main})

local q = c('TextLabel',{
        Text = h.Desc,
        ThemeTag = {TextColor3 = not h.Color and 'Text' or nil},
        TextColor3 = h.Color and (h.Color == 'White' and Color3.new(0,0,0) or Color3.new(1,1,1)),
        TextTransparency = 0.2,
        TextSize = 15,
        TextWrapped = true,
        LayoutOrder = 9999,
        Name = 'Desc',
        TextXAlignment = 'Left',
        Size = UDim2.new(1,-g.TextOffset,0,0),
        FontFace = Font.new(b.Font,Enum.FontWeight.Medium),
        BackgroundTransparency = 1,
        AutomaticSize = 'Y'
    })
    
    if h.Desc then
        q.Parent = h.UIElements.Main.Title
    end 
    
    if h.Hover then 
        h.UIElements.Main.MouseEnter:Connect(function()
            if k then 
                e(h.UIElements.Main.Highlight,0.047,{ImageTransparency=0.975}):Play()
            end 
        end)
        
        h.UIElements.Main.MouseButton1Down:Connect(function()
            if k then 
                n=true 
                if h.Scalable then 
                    e(h.UIElements.Main.UIScale,0.07,{Scale=0.985},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
                end 
            end 
        end)
        
        h.UIElements.Main.InputEnded:Connect(function()
            if k then 
                e(h.UIElements.Main.Highlight,0.066,{ImageTransparency = 1}):Play()
                if h.Scalable then 
                    e(h.UIElements.Main.UIScale,0.175,{Scale = 1},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
                end 
                task.wait(0.16)
                n = false 
            end 
        end)
    end 
    
    local r = h.UIElements.Main:GetPropertyChangedSignal'AbsoluteSize':Connect(function()
        if not n then 
            h.UIElements.MainContainer.Size = UDim2.new(1,0,0,h.UIElements.Main.AbsoluteSize.Y)
        end 
    end)
    
    function h.SetTitle(s,t)
        h.UIElements.Main.Title.Title.Text = t 
    end 
    
    function h.SetDesc(s,t)
        q.Text = t
        h.Desc = t 
        if not q.Parent then 
            q.Parent = h.UIElements.Main.Title 
        end 
    end 
    
    function h.Show(s)
        h.UIElements.Main.Visible = true 
        e(h.UIElements.Main.UIScale,0.1,{Scale = 1}):Play()
    end 
    
    function h.Destroy(s)
        e(h.UIElements.Main.UIScale,0.15,{Scale = 0.98}):Play()
        r:Disconnect()
        h.UIElements.MainContainer.AutomaticSize = 'None'
        task.wait(0.1)
        h.UIElements.Main.Visible = false
        e(h.UIElements.MainContainer,0.18,{Size = UDim2.new(1,0,0,-6)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
        task.wait(0.23)
        h.UIElements.MainContainer:Destroy()
    end 

    function h.Lock(s)
        e(h.UIElements.Main.Lock,0.08,{BackgroundTransparency = 0.6}):Play()
        e(h.UIElements.Main.Lock.ImageLabel,0.08,{ImageTransparency = 0}):Play()e(h.UIElements.Main.Lock.TextLabel,0.08,{TextTransparency = 0}):Play()
        h.UIElements.Main.Lock.Active = true
        k = false 
    end 
    
    function h.Unlock(s)
        e(h.UIElements.Main.Lock,0.08,{BackgroundTransparency=1}):Play()
        e(h.UIElements.Main.Lock.ImageLabel,0.08,{ImageTransparency=1}):Play()
        e(h.UIElements.Main.Lock.TextLabel,0.08,{TextTransparency=1}):Play()
        h.UIElements.Main.Lock.Active = false
        k = true 
    end 
    
    h:Show()
    return h 
end 
end 

function a.j()
    local b = a.load'a'
    local c,d = b.New,{}
    
    function d.New(e,f)
        local g,h = {
            __type = 'Button',
            Title = f.Title or'Button',
            Desc = f.Desc or nil,
            Locked = f.Locked or false,
            Callback = f.Callback or function()end,
            UIElements = {}
        },true
        g.ButtonFrame=a.load'i'{
            Title = g.Title,
            Desc = g.Desc,
            Parent = f.Parent,
            Window = f.Window,
            TextOffset = 20,
            Hover = true,
            Scalable = true
        }
        g.UIElements.ButtonIcon=c('ImageLabel',{
            Image = b.Icon'mouse-pointer-click'[1],
            ImageRectOffset = b.Icon'mouse-pointer-click'[2].ImageRectPosition,
            ImageRectSize = b.Icon'mouse-pointer-click'[2].ImageRectSize,
            BackgroundTransparency = 1,
            Parent = g.ButtonFrame.UIElements.Main,
            Size = UDim2.new(0,20,0,20),
            AnchorPoint = Vector2.new(1,0.5),
            Position = UDim2.new(1,- g.ButtonFrame.UIPadding/2,0.5,0),
            ThemeTag = {ImageColor3 = 'Text'}
        })
        function g.Lock(i)
            h = false 
            return g.ButtonFrame:Lock()
        end 
        
        function g.Unlock(i)
            h = true
            return g.ButtonFrame:Unlock()
        end 
        
        if g.Locked then
            g:Lock()
        end 
        
        g.ButtonFrame.UIElements.Main.MouseButton1Click:Connect(function()
            if h then
                task.spawn(function()
                    g.Callback()
                end)
            end 
        end)
        return g.__type,g
     end 
     return d
    end 
    
    function a.k()
        local b = a.load'a'
        local c,d,e=b.New,b.Tween,a.load'd'
        local f,g,h = e.Toggle,e.Checkbox,{}
        
        function h.New(i,j)
            local k = {__type='Toggle',
            Title = j.Title or'Toggle',
            Desc = j.Desc or nil,
            Value = j.Value,
            Icon = j.Icon or nil,
            Type = j.Type or'Toggle',
            Callback = j.Callback or function()end,
            UIElements = {}
        }
        
        k.ToggleFrame = a.load'i'{
            Title = k.Title,
            Desc = k.Desc,
            Window = j.Window,
            Parent = j.Parent,
            TextOffset = 44,
            Hover = false
        }
        
        local n = true

        if k.Value == nil then
            k.Value = false
        end 
        
        function k.Lock(o)
            n = false 
            return k.ToggleFrame:Lock()
        end 
        
        function k.Unlock(o)
            n = true 
            return k.ToggleFrame:Unlock()
        end 
        
        if k.Locked then
            k:Lock()
        end 
        
        local o,p,q=(k.Value)
        if k.Type == 'Toggle' then
            p,q = f(o,k.Icon,k.ToggleFrame.UIElements.Main,k.Callback)
        elseif k.Type == 'Checkbox' then
            p,q = g(o,k.Icon,k.ToggleFrame.UIElements.Main,k.Callback)
        else 
            error('Unknown Toggle Type: '..tostring(k.Type))
        end 
        
        p.AnchorPoint = Vector2.new(1,0.5)
        p.Position = UDim2.new(1,-k.ToggleFrame.UIPadding/2,0.5,0)
        
        function k.Set(r,s)
            if n then 
                q:Set(s)
                o = s 
            end 
        end 
        
        k:Set(o)
        k.ToggleFrame.UIElements.Main.MouseButton1Click:Connect(function()
            k:Set(not o)
        end)
        return k.__type,k
     end 
     return h 
    end 
    
    function a.l()
        local b = a.load'a'
        local c,d,e,f = b.New,b.Tween,{},false
        
        function e.New(g,h)
            local i,j,k,n = {
                __type = 'Slider',
                Title = h.Title or'Slider',
                Desc = h.Desc or nil,
                Locked = h.Locked or nil,
                Value = h.Value or{},
                Step = h.Step or 1,
                Callback = h.Callback or function()end,
                UIElements = {},
                IsFocusing = false
            }
            
            local o = i.Value.Default or i.Value.Min or 0 
            local p,q,r = o,(o-(i.Value.Min or 0))/((i.Value.Max or 100)-(i.Value.Min or 0)),true
            
            i.SliderFrame = a.load'i'{
                Title = i.Title,
                Desc = i.Desc,
                Parent = h.Parent,
                TextOffset = 160,
                Hover = false
            }

            i.UIElements.SliderIcon = b.NewRoundFrame(99,'Squircle',{
                ImageTransparency = 0.95,
                Size = UDim2.new(0,126,0,4),
                Name = 'Frame',
                Position = UDim2.new(0.5,0,0.5,0),
                AnchorPoint = Vector2.new(0.5,0.5),
                ThemeTag = {ImageColor3 = 'Text'}
            },{
                b.NewRoundFrame(99,'Squircle',{
                    Name = 'Frame',
                    Size = UDim2.new(q,0,1,0),
                    ImageTransparency = 0.1,
                    ThemeTag = {ImageColor3='Button'}
                },{
                    b.NewRoundFrame(99,'Squircle',{
                        Size = UDim2.new(0,13,0,13),
                        Position = UDim2.new(1,0,0.5,0),
                        AnchorPoint = Vector2.new(0.5,0.5),
                        ThemeTag = {ImageColor3='Text'}
                    })
                })
            })
            
            i.UIElements.SliderContainer=c('Frame',{
                Size = UDim2.new(0,0,0,0),
                AutomaticSize = 'XY',
                AnchorPoint = Vector2.new(1,0.5),
                Position = UDim2.new(1,-i.SliderFrame.UIPadding/2,0.5,0),
                BackgroundTransparency = 1,
                Parent = i.SliderFrame.UIElements.Main
            },{
                c('UIListLayout',{
                    Padding = UDim.new(0,8),
                    FillDirection = 'Horizontal',
                    VerticalAlignment = 'Center'
                }),
                i.UIElements.SliderIcon,c('TextBox',{
                    Size = UDim2.new(0,60,0,0),
                    TextXAlignment = 'Right',
                    Text = tostring(o),
                    ThemeTag = {TextColor3 = 'Text'},
                    TextTransparency = 0.4,
                    AutomaticSize = 'Y',
                    TextSize = 15,
                    FontFace = Font.new(b.Font,Enum.FontWeight.Medium),
                    BackgroundTransparency = 1,
                    LayoutOrder =- 1
                })
            })
            
            function i.Lock(s)
                r = false 
                return i.SliderFrame:Lock()
            end 
            
            function i.Unlock(s)
                r = true 
                return i.SliderFrame:Unlock()
            end 
            
            if i.Locked then 
                i:Lock()
            end 
            
            function i.Set(s,t,u)
                if r then 
                    if not i.IsFocusing and not f and(not u or(u.UserInputType == Enum.UserInputType.MouseButton1 or u.UserInputType == Enum.UserInputType.Touch)) then 
                        t = math.clamp(t,i.Value.Min or 0,i.Value.Max or 100)
                        local v = math.clamp((t-(i.Value.Min or 0))/((i.Value.Max or 100)-(i.Value.Min or 0)),0,1)
                        t = math.floor((i.Value.Min+v*(i.Value.Max-i.Value.Min))/i.Step+0.5)*i.Step
                        
                        if t ~= p then
                            d(i.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(v,0,1,0)}):Play()
                            i.UIElements.SliderContainer.TextBox.Text=tostring(t)
                            p = t 
                            i.Callback(t)
                        end 
                        if u then 
                            j = (u.UserInputType == Enum.UserInputType.Touch)
                            i.SliderFrame.UIElements.Main.Parent.Parent.ScrollingEnabled=false
                            f = true 
                            k = game:GetService'RunService'.RenderStepped:Connect(function()
                            local w = j and u.Position.X or game:GetService'UserInputService':GetMouseLocation().X
                            local x = math.clamp((w-i.UIElements.SliderIcon.AbsolutePosition.X)/i.UIElements.SliderIcon.Size.X.Offset,0,1)
                            t = math.floor((i.Value.Min+x*(i.Value.Max-i.Value.Min))/i.Step+0.5)*i.Step 
                            
                            if t ~= p then 
                                d(i.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(x,0,1,0)}):Play()
                                i.UIElements.SliderContainer.TextBox.Text=tostring(t)
                                p = t 
                                i.Callback(t)
                            end 
                        end)
                        
                        n = game:GetService'UserInputService'.InputEnded:Connect(function(w)
                            if(w.UserInputType == Enum.UserInputType.MouseButton1 or w.UserInputType == Enum.UserInputType.Touch)and u == w then
                                k:Disconnect()
                                n:Disconnect()
                                f = false 
                                i.SliderFrame.UIElements.Main.Parent.Parent.ScrollingEnabled = true 
                            end 
                        end)
                    end 
                end 
            end 
        end 
        
        i.UIElements.SliderContainer.TextBox.FocusLost:Connect(function(s)
            if s then 
                local t=tonumber(i.UIElements.SliderContainer.TextBox.Text)
                if t then 
                    i:Set(t)
                else 
                    i.UIElements.SliderContainer.TextBox.Text=tostring(p)
                end 
            end 
        end)
        
        i.UIElements.SliderContainer.InputBegan:Connect(function(s)
            i:Set(o,s)
        end)
        return i.__type,i 
    end 
    return e 
end 

function a.m()
    local b,c = game:GetService'UserInputService',a.load'a'
    local d,e,f,g = c.New,c.Tween,{UICorner=6,UIPadding=8},a.load'd'
    local h = g.Label 
    
    function f.New(i,j)
        local k,n = {
            __type='Keybind',
            Title = j.Title or 'Keybind',
            Desc = j.Desc or nil,
            Locked = j.Locked or false,
            Value = j.Value or 'F',
            Callback = j.Callback or function()end,
            CanChange = j.CanChange or true,
            Picking = false,
            UIElements = {}
        },true 
        
        k.KeybindFrame=a.load'i'{
            Title = k.Title,
            Desc = k.Desc,
            Parent = j.Parent,
            TextOffset = 85,
            Hover = k.CanChange
        }
        
        k.UIElements.Keybind=h(k.Value,nil,k.KeybindFrame.UIElements.Main)
        k.UIElements.Keybind.Size=UDim2.new(0,24+k.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,0,42)
        k.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
        k.UIElements.Keybind.Position=UDim2.new(1,-k.KeybindFrame.UIPadding/2,0.5,0)d('UIScale',{Parent = k.UIElements.Keybind,Scale=0.85})
        k.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal'TextBounds':Connect(function()
            k.UIElements.Keybind.Size=UDim2.new(0,24+k.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,0,42)
        end)
        
        function k.Lock(o)
            n = false 
            return k.KeybindFrame:Lock()
        end 
        
        function k.Unlock(o)
            n=true 
            return k.KeybindFrame:Unlock()
        end 
        
        if k.Locked then 
            k:Lock()
        end 
        
        k.KeybindFrame.UIElements.Main.MouseButton1Click:Connect(function()
            if n then 
                if k.CanChange then 
                    k.Picking = true 
                    k.UIElements.Keybind.Frame.Frame.TextLabel.Text='...'
                    task.wait(0.2)
                    local o 
                    o = b.InputBegan:Connect(function(p)
                        local q 
                        if p.UserInputType == Enum.UserInputType.Keyboard then 
                            q = p.KeyCode.Name 
                        elseif p.UserInputType == Enum.UserInputType.MouseButton1 then
                            q='MouseLeft'
                        elseif p.UserInputType == Enum.UserInputType.MouseButton2 then 
                            q='MouseRight'
                        end 
                        
                        local r 
                        r = b.InputEnded:Connect(function(s)
                            if s.KeyCode.Name == q or q == 'MouseLeft' and s.UserInputType == Enum.UserInputType.MouseButton1 or q == 'MouseRight' and s.UserInputType == Enum.UserInputType.MouseButton2 then 
                            
                            k.Picking = false 
                            k.UIElements.Keybind.Frame.Frame.TextLabel.Text=q 
                            k.Value = q 
                            o:Disconnect()
                            r:Disconnect()
                        end 
                    end)
                end)
            end 
        end 
    end)
    
    b.InputBegan:Connect(function(o)
        if n then 
            if o.KeyCode.Name == k.Value then 
                k.Callback(o.KeyCode.Name)
            end 
        end 
    end)
    return k.__type,k 
end 
return f 
end 

function a.n()
    local b=a.load'a'
    local c,d,e,f = b.New,b.Tween,{UICorner=8,UIPadding=8},a.load'd'
    local g,h = f.Button,f.Input 
    
    function e.New(i,j)
        local k,n = {
            __type = 'Input',
            Title = j.Title or'Input',
            Desc = j.Desc or nil,
            Locked = j.Locked or false,
            InputIcon = j.InputIcon or false,
            PlaceholderText = j.Placeholder or 'Enter Text...',
            Value = j.Value or'',
            Callback = j.Callback or function()end,
            ClearTextOnFocus = j.ClearTextOnFocus or false,
            UIElements = {}
        },true 
        
        k.InputFrame = a.load'i'{
            Title = k.Title,
            Desc = k.Desc,
            Parent = j.Parent,
            TextOffset = 190,
            Hover = false
        }
        
        local o = h(k.PlaceholderText,k.InputIcon,k.InputFrame.UIElements.Main,function(o)
            k:Set(o)
        end)
        
        o.Size = UDim2.new(0,180,0,42)
        o.AnchorPoint = Vector2.new(1,0.5)
        o.Position = UDim2.new(1,-k.InputFrame.UIPadding/2,0.5,0)
        c('UIScale',{Parent = o,Scale = 0.85})
        
        function k.Lock(p)
            n = false 
            return k.InputFrame:Lock()
        end 
        
        function k.Unlock(p)
            n = true 
            return k.InputFrame:Unlock()
        end 
        
        function k.Set(p,q)
            if n then 
                k.Callback(q)
                o.Frame.Frame.TextBox.Text = q 
                k.Value = q 
            end 
        end 
        
        k:Set(k.Value)
        
        if k.Locked then 
            k:Lock()
        end 
        return k.__type,k 
    end 
    return e 
end 

function a.o()
    local b,c,d,e = game:GetService'UserInputService',game:GetService'Players'.LocalPlayer:GetMouse(),game:GetService'Workspace'.CurrentCamera,a.load'a'
    local f,g,h=e.New,e.Tween,a.load'd'
    local i,j=h.Label,{UICorner = 10,UIPadding = 12,MenuCorner = 14,MenuPadding = 5,TabPadding = 6}
    
    function j.New(k,n)
        local o,p = {
            __type = 'Dropdown',
            Title = n.Title or'Dropdown',
            Desc = n.Desc or nil,
            Locked = n.Locked or false,
            Values = n.Values or{},
            Value = n.Value,
            AllowNone = n.AllowNone,
            Multi = n.Multi,
            Callback = n.Callback or function()end,
            UIElements = {},
            Opened = false,
            Tabs = {}
        },true 
        
        o.DropdownFrame = a.load'i'{
            Title = o.Title,
            Desc = o.Desc,
            Parent = n.Parent,
            TextOffset = 190,
            Hover = false
        }
        
        o.UIElements.Dropdown = i('',nil,o.DropdownFrame.UIElements.Main)
        o.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate = 'AtEnd'
        o.UIElements.Dropdown.Frame.Frame.TextLabel.Size = UDim2.new(1,o.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)
        o.UIElements.Dropdown.Size = UDim2.new(0,180,0,42)o.UIElements.Dropdown.AnchorPoint=Vector2.new(1,0.5)
        o.UIElements.Dropdown.Position = UDim2.new(1,-o.DropdownFrame.UIPadding/2,0.5,0)
        f('UIScale',{Parent = o.UIElements.Dropdown,Scale=0.85})

        local q = f('ImageLabel',{
            Image = e.Icon'chevron-down'[1],
            ImageRectOffset = e.Icon'chevron-down'[2].ImageRectPosition,
            ImageRectSize = e.Icon'chevron-down'[2].ImageRectSize,
            Size = UDim2.new(0,18,0,18),Position = UDim2.new(1,-12,0.5,0),
            ThemeTag = {ImageColor3 = 'Text'},
            AnchorPoint = Vector2.new(1,0.5),
            Parent = o.UIElements.Dropdown.Frame
        })
        
        o.UIElements.UIListLayout = f('UIListLayout',{
            Padding = UDim.new(0,j.MenuPadding/1.5),
            FillDirection = 'Vertical'
        })
        
        o.UIElements.Menu=f('Frame',{
            ThemeTag={BackgroundColor3 = 'Accent'},
            BackgroundTransparency = 0.15,
            Size = UDim2.new(1,0,1,0)
        },{
            f('UICorner',{
                CornerRadius = UDim.new(0,j.MenuCorner)}),
                f('UIStroke',{Thickness = 1,Transparency = 1,ThemeTag = {Color = 'Text'}}),
                f('Frame',{
                    BackgroundTransparency=1,
                    Size = UDim2.new(1,0,1,0),
                    Name = 'CanvasGroup',
                    ClipsDescendants = true
                },{
                    f('UIPadding',{
                        PaddingTop = UDim.new(0,j.MenuPadding),
                        PaddingLeft = UDim.new(0,j.MenuPadding),
                        PaddingRight = UDim.new(0,j.MenuPadding),
                        PaddingBottom = UDim.new(0,j.MenuPadding)
                    }),   
                    f('ScrollingFrame',{
                        Size = UDim2.new(1,0,1,0),
                        ScrollBarThickness = 0,
                        ScrollingDirection = 'Y',
                        AutomaticCanvasSize = 'Y',
                        CanvasSize = UDim2.new(0,0,0,0),
                        BackgroundTransparency = 1
                    },{
                        o.UIElements.UIListLayout
                    })
                })
            })
            
            o.UIElements.MenuCanvas=f('CanvasGroup',{
                Size = UDim2.new(0,190,0,300),
                BackgroundTransparency = 1,
                Position = UDim2.new(-10,0,-10,0),
                Visible = false,
                Active = false,
                GroupTransparency = 1,
                Parent = n.Window.SuperParent.Parent.Dropdowns,
                AnchorPoint = Vector2.new(1,0)
            },{
                o.UIElements.Menu,
                f('UIPadding',{
                    PaddingTop = UDim.new(0,1),
                    PaddingLeft = UDim.new(0,1),
                    PaddingRight = UDim.new(0,1),
                    PaddingBottom = UDim.new(0,1)
                }),
                f('UISizeConstraint',{
                    MinSize=Vector2.new(190,0)})
                })
                
                function o.Lock(r)
                    p = false 
                    return o.DropdownFrame:Lock()
                end 
                
                function o.Unlock(r)
                    p = true 
                    return 
                    o.DropdownFrame:Unlock()
                end 
                
                if o.Locked then 
                    o:Lock()
                end 
                
                local r,s = function()
                    o.UIElements.Menu.CanvasGroup.ScrollingFrame.CanvasSize=UDim2.fromOffset(0,o.UIElements.UIListLayout.AbsoluteContentSize.Y)
                end, function()
                    if #o.Values > 10 then 
                        o.UIElements.MenuCanvas.Size=UDim2.fromOffset(o.UIElements.UIListLayout.AbsoluteContentSize.X,392)
                    else 
                        o.UIElements.MenuCanvas.Size=UDim2.fromOffset(o.UIElements.UIListLayout.AbsoluteContentSize.X,o.UIElements.UIListLayout.AbsoluteContentSize.Y+j.MenuPadding*2+2)
                    end 
                end 
                
                function UpdatePosition()
                    local t = -o.UIElements.Dropdown.AbsoluteSize.Y 
                    if d.ViewportSize.Y-o.UIElements.Dropdown.AbsolutePosition.Y-o.UIElements.Dropdown.AbsoluteSize.Y+t<o.UIElements.MenuCanvas.AbsoluteSize.Y+10 then 
                        t = o.UIElements.MenuCanvas.AbsoluteSize.Y-(d.ViewportSize.Y-o.UIElements.Dropdown.AbsolutePosition.Y)+10 
                    end 
                    o.UIElements.MenuCanvas.Position=UDim2.new(0,o.UIElements.Dropdown.AbsolutePosition.X+o.UIElements.Dropdown.AbsoluteSize.X+1,0,o.UIElements.Dropdown.AbsolutePosition.Y+o.UIElements.Dropdown.AbsoluteSize.Y-t)
                end 
                
                function o.Display(t)
                    local u,v = o.Values,''
                    if o.Multi then 
                        for w,x in next,u do 
                            if table.find(o.Value,x) then 
                                v = v..x..', '
                            end 
                        end 
                        v = v:sub(1,#v-2)
                    else 
                        v = o.Value or''
                    end 
                    o.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(v==''and'--'or v)
                end 
                
                function o.Refresh(t,u)
                    for v,w in next,o.UIElements.Menu.CanvasGroup.ScrollingFrame:GetChildren() do 
                        if not w:IsA'UIListLayout' then 
                            w:Destroy()
                        end 
                    end 
                    
                    o.Tabs={}
                    for x,y in next,u do 
                        local z = {
                            Name = y,
                            Selected = false,
                            UIElements = {}
                        }
                        
                        z.UIElements.TabItem = f('TextButton',{
                            Size = UDim2.new(1,0,0,34),
                            BackgroundTransparency = 1,
                            Parent = o.UIElements.Menu.CanvasGroup.ScrollingFrame,
                            Text = ''
                        },{
                            f('UIPadding',{
                                PaddingTop = UDim.new(0,j.TabPadding),
                                PaddingLeft = UDim.new(0,j.TabPadding),
                                PaddingRight = UDim.new(0,j.TabPadding),
                                PaddingBottom = UDim.new(0,j.TabPadding)
                            }),
                            f('UICorner',{CornerRadius=UDim.new(0,j.MenuCorner-j.MenuPadding)}),
                            f('ImageLabel',{
                                Image = e.Icon'check'[1],
                                ImageRectSize = e.Icon'check'[2].ImageRectSize,
                                ImageRectOffset = e.Icon'check'[2].ImageRectPosition,
                                ThemeTag = {ImageColor3 = 'Text'},
                                ImageTransparency = 1,
                                Size = UDim2.new(0,18,0,18),
                                AnchorPoint = Vector2.new(0,0.5),
                                Position = UDim2.new(0,0,0.5,0),
                                BackgroundTransparency = 1
                            }),
                            f('TextLabel',{
                                Text = y,
                                TextXAlignment = 'Left',
                                FontFace = Font.new(e.Font,Enum.FontWeight.Medium),
                                ThemeTag = {TextColor3 = 'Text',BackgroundColor3 = 'Text'},
                                TextSize = 15,
                                BackgroundTransparency = 1,
                                TextTransparency = 0.4,
                                AutomaticSize = 'Y',
                                TextTruncate = 'AtEnd',
                                Size = UDim2.new(1,-18-j.TabPadding*3,0,0),
                                AnchorPoint = Vector2.new(0,0.5),
                                Position = UDim2.new(0,0,0.5,0)
                            })
                        })
                        
                        if o.Multi then 
                            z.Selected = table.find(o.Value or{},z.Name)
                        else 
                            z.Selected = o.Value == z.Name 
                        end 
                        
                        if z.Selected then 
                            z.UIElements.TabItem.BackgroundTransparency = 0.93 
                            z.UIElements.TabItem.ImageLabel.ImageTransparency = 0.1 
                            z.UIElements.TabItem.TextLabel.Position=UDim2.new(0,18+j.TabPadding,0.5,0)
                            z.UIElements.TabItem.TextLabel.TextTransparency = 0 
                        end 
                        
                        o.Tabs[x] = z
                        o:Display()
                        
                        local A = function()
                            o:Display()
                            task.spawn(function()
                                o.Callback(o.Value)
                            end)
                        end 
                        
                        z.UIElements.TabItem.MouseButton1Click:Connect(function()
                            if o.Multi then 
                                if not z.Selected then 
                                    z.Selected = true 
                                    g(z.UIElements.TabItem,0.1,{BackgroundTransparency=0.93}):Play()
                                    g(z.UIElements.TabItem.ImageLabel,0.1,{ImageTransparency=0.1}):Play()
                                    g(z.UIElements.TabItem.TextLabel,0.1,{Position=UDim2.new(0,18+j.TabPadding,0.5,0),TextTransparency=0}):Play()
                                    table.insert(o.Value,z.Name)
                                else 
                                    if not o.AllowNone and#o.Value == 1 then 
                                        return 
                                    end 
                                    z.Selected = false 
                                    g(z.UIElements.TabItem,0.1,{BackgroundTransparency=1}):Play()
                                    g(z.UIElements.TabItem.ImageLabel,0.1,{ImageTransparency=1}):Play()
                                    g(z.UIElements.TabItem.TextLabel,0.1,{Position=UDim2.new(0,0,0.5,0),TextTransparency=0.4}):Play()
                                    for B,C in ipairs(o.Value) do 
                                        if C == z.Name then 
                                            table.remove(o.Value,B) 
                                            break 
                                        end 
                                    end 
                                end 
                            else 
                                for B,C in next,o.Tabs do 
                                    g(C.UIElements.TabItem,0.1,{BackgroundTransparency = 1}):Play()
                                    g(C.UIElements.TabItem.ImageLabel,0.1,{ImageTransparency = 1}):Play()
                                    g(C.UIElements.TabItem.TextLabel,0.1,{Position=UDim2.new(0,0,0.5,0),TextTransparency = 0.4}):Play()
                                    C.Selected = false 
                                end 
                                
                                z.Selected=true 
                                g(z.UIElements.TabItem,0.1,{BackgroundTransparency=0.93}):Play()
                                g(z.UIElements.TabItem.ImageLabel,0.1,{ImageTransparency=0.1}):Play()
                                g(z.UIElements.TabItem.TextLabel,0.1,{Position=UDim2.new(0,18+j.TabPadding,0.5,0),TextTransparency=0}):Play()
                                o.Value=z.Name 
                            end 
                            A()
                        end)
                        
                        r()
                        s()
                    end 
                end 
                
                o:Refresh(o.Values)
                
                function o.Select(t,u)
                    if u then 
                        o.Value = u 
                    end 
                    o:Refresh(o.Values)
                end 
                
                s()
                
                function o.Open(t)
                    o.Opened = true 
                    o.UIElements.MenuCanvas.Visible = true 
                    o.UIElements.MenuCanvas.Active = true 
                    o.UIElements.Menu.Size = UDim2.new(1,0,0,0)
                    g(o.UIElements.Menu,0.1,{Size=UDim2.new(1,0,1,0)},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()
                    g(q,0.15,{Rotation = 180}):Play()
                    g(o.UIElements.MenuCanvas,0.15,{GroupTransparency = 0}):Play()
                    UpdatePosition()
                end 
                
                function o.Close(t)
                    o.Opened=false 
                    g(o.UIElements.Menu,0.1,{Size = UDim2.new(1,0,0.8,0)},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()
                    g(q,0.15,{Rotation = 0}):Play()
                    g(o.UIElements.MenuCanvas,0.15,{GroupTransparency = 1}):Play()
                    task.wait(0.1)
                    o.UIElements.MenuCanvas.Visible = false 
                    o.UIElements.MenuCanvas.Active = false 
                end 
                
                o.UIElements.Dropdown.MouseButton1Click:Connect(function()
                    if p then 
                        o:Open()
                    end 
                end)
                
                b.InputBegan:Connect(function(t)
                    if t.UserInputType==Enum.UserInputType.MouseButton1 or t.UserInputType==Enum.UserInputType.Touch then 
                        local u,v=o.UIElements.MenuCanvas.AbsolutePosition,o.UIElements.MenuCanvas.AbsoluteSize 
                        if n.Window.CanDropdown and(c.X<u.X or c.X>u.X+v.X or c.Y<(u.Y-20-1)or c.Y>u.Y+v.Y) then 
                            o:Close()
                        end 
                    end 
                end)
                
                o.UIElements.Dropdown:GetPropertyChangedSignal'AbsolutePosition':Connect(UpdatePosition)
                return o.__type,o 
            end 
            return j 
        end 
        
        function a.p()
            local b=a.load'a'
            local c,d,e=b.New,a.load'd',{}
            function e.New(f,g)
                local h = {
                    __type = 'Code',
                    Title = g.Title,
                    Code = g.Code,
                    UIElements = {}
                }
                
                local i = not h.Locked 
                local j = d.Code(h.Code,h.Title,g.Parent,function()
                    if i then 
                        local j,k,n = h.Title or'code',pcall(function()
                            toclipboard(h.Code)
                        end)
                        
                        if k then 
                            g.WindUI:Notify{
                                Title = 'Success',
                                Content = 'The '..j..' copied to your clipboard.',Icon='check',
                                Duration = 5
                            }
                        else 
                            g.WindUI:Notify{
                                Title='Error',
                                Content='The '..j..' is not copied. Error: '..n,
                                Icon='x',
                                Duration = 5
                            }
                        end 
                    end 
                end)
                
                function h.SetCode(k,n)
                    j.Set(n)
                end 
                return h.__type,h 
            end 
            return e 
        end 
        
        function a.q()
            local b = a.load'a'
            local c,d,e,f,g,h = b.New,b.Tween,game:GetService'UserInputService',game:GetService'TouchInputService',game:GetService'RunService',game:GetService'Players'
            local i,j = g.RenderStepped,h.LocalPlayer 
            local k,n=j:GetMouse(),a.load'd'
            local o,p,q = n.Button,n.Input,{UICorner=8,UIPadding=8}
            
            function q.Colorpicker(r,s,t)
                local u = {
                    __type='Colorpicker',
                    Title = s.Title,
                    Desc = s.Desc,
                    Default = s.Default,
                    Callback = s.Callback,
                    Transparency = s.Transparency,
                    UIElements = s.UIElements
                }
                
                function u.SetHSVFromRGB(v,w)
                    local x,y,z = Color3.toHSV(w)
                    u.Hue = x 
                    u.Sat = y 
                    u.Vib = z
                end 
                
                u:SetHSVFromRGB(u.Default)
                local v = a.load'e'.Init(s.Window)
                local w = v.Create()
                u.ColorpickerFrame = w 
                
                local x,y,z = u.Hue,u.Sat,u.Vib
                u.UIElements.Title=c('TextLabel',{
                    Text = u.Title,
                    TextSize = 20,
                    FontFace = Font.new(b.Font,Enum.FontWeight.SemiBold),
                    TextXAlignment = 'Left',
                    Size = UDim2.new(1,0,0,0),
                    AutomaticSize = 'Y',
                    ThemeTag = {TextColor3 = 'Text'},
                    BackgroundTransparency = 1,
                    Parent = w.UIElements.Main
                })
                
                local A = c('ImageLabel',{
                    Size = UDim2.new(0,18,0,18),
                    ScaleType = Enum.ScaleType.Fit,
                    AnchorPoint = Vector2.new(0.5,0.5),
                    BackgroundTransparency = 1,Image = 'http://www.roblox.com/asset/?id=4805639000'
                })
                
                u.UIElements.SatVibMap=c('ImageLabel',{
                    Size = UDim2.fromOffset(160,158),
                    Position = UDim2.fromOffset(0,40),
                    Image = 'rbxassetid://4155801252',
                    BackgroundColor3 = Color3.fromHSV(x,1,1),
                    BackgroundTransparency = 0,
                    Parent = w.UIElements.Main
                },{
                    c('UICorner',{CornerRadius = UDim.new(0,8)}),
                    c('UIStroke',{Thickness = 0.6,ThemeTag = {Color = 'Text'},Transparency=0.8}),A})
                    
                u.UIElements.Inputs=c('Frame',{
                    AutomaticSize = 'XY',
                    Size = UDim2.new(0,0,0,0),
                    Position = UDim2.fromOffset(u.Transparency and 240 or 210,40),
                    BackgroundTransparency = 1,
                    Parent = w.UIElements.Main
                },{
                    c('UIListLayout',{Padding=UDim.new(0,5),FillDirection='Vertical'})
                })
                
                local B = c('Frame',{
                    BackgroundColor3 = u.Default,
                    Size = UDim2.fromScale(1,1),
                    BackgroundTransparency = u.Transparency
                },{
                    c('UICorner',{CornerRadius=UDim.new(0,8)})})
                    
                local C,D = c('ImageLabel',{
                    Image = 'http://www.roblox.com/asset/?id=14204231522',
                    ImageTransparency = 0.45,
                    ScaleType = Enum.ScaleType.Tile,
                    TileSize = UDim2.fromOffset(40,40),
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(85,208),
                    Size = UDim2.fromOffset(75,24),
                    Parent = w.UIElements.Main
                },{
                    c('UICorner',{CornerRadius = UDim.new(0,8)}),
                    c('UIStroke',{Thickness = 1,Transparency = 0.8,ThemeTag = {Color = 'Text'}}),B}),
                    c('Frame',{BackgroundColor3 = u.Default,Size = UDim2.fromScale(1,1),BackgroundTransparency = 0,ZIndex = 9
                },{
                    c('UICorner',{CornerRadius=UDim.new(0,8)})})
                    local E,F = c('ImageLabel',{
                        Image = 'http://www.roblox.com/asset/?id=14204231522',
                        ImageTransparency = 0.45,ScaleType = Enum.ScaleType.Tile,
                        TileSize = UDim2.fromOffset(40,40),
                        BackgroundTransparency = 1,
                        Position = UDim2.fromOffset(0,208),
                        Size = UDim2.fromOffset(75,24),
                        Parent = w.UIElements.Main
                    },{
                        c('UICorner',{CornerRadius=UDim.new(0,8)}),
                        c('UIStroke',{Thickness=1,Transparency=0.8,ThemeTag={Color='Text'}}),D}),{}
                        
                        for G = 0,1,0.1 do 
                            table.insert(F,ColorSequenceKeypoint.new(G,Color3.fromHSV(G,1,1)))
                        end 
                        
                        local G,H=c('UIGradient',{Color=ColorSequence.new(F),Rotation=90}),c('Frame',{
                            Size = UDim2.new(1,0,1,0),
                            Position = UDim2.new(0,0,0,0),
                            BackgroundTransparency = 1
                        })
                        
                        local I,J = c('Frame',{
                            Size = UDim2.new(0,14,0,14),
                            AnchorPoint = Vector2.new(0.5,0.5),
                            Position = UDim2.new(0.5,0,0,0),
                            Parent = H,
                            BackgroundColor3 = u.Default
                        },{
                            c('UIStroke',{Thickness = 2,Transparency = 0.1,ThemeTag = {Color = 'Text'}}),
                            c('UICorner',{CornerRadius = UDim.new(1,0)
                        })
                    }),
                    
                    c('Frame',{
                        Size = UDim2.fromOffset(10,192),
                        Position = UDim2.fromOffset(180,40),
                        Parent = w.UIElements.Main
                    },{
                        c('UICorner',{CornerRadius=UDim.new(1,0)}),G,H})
                        
                        function CreateNewInput(K,L)
                            local M = p(K,nil,u.UIElements.Inputs)
                            c('TextLabel',{
                                BackgroundTransparency = 1,
                                TextTransparency = 0.4,
                                TextSize = 17,
                                FontFace = Font.new(b.Font,Enum.FontWeight.Regular),
                                AutomaticSize='XY',
                                ThemeTag = {TextColor3 = 'Placeholder'},
                                AnchorPoint = Vector2.new(1,0.5),
                                Position = UDim2.new(1,-12,0.5,0),
                                Parent = M.Frame,
                                Text = K
                            })
                            c('UIScale',{Parent = M,Scale = 0.85})
                            M.Frame.Frame.TextBox.Text = L 
                            M.Size = UDim2.new(0,150,0,42)
                            return M 
                        end 
                        
                        local K,L = function(K)
                            return {
                                R = math.floor(K.R*255),
                                G = math.floor(K.G*255),
                                B = math.floor(K.B*255)}
                            end, CreateNewInput('Hex','#'..u.Default:ToHex())
                            
                            local M,N,O,P=CreateNewInput('Red',K(u.Default).R),CreateNewInput('Green',K(u.Default).G),(CreateNewInput('Blue',K(u.Default).B))
                            if u.Transparency then 
                                P = CreateNewInput('Alpha',((1-u.Transparency)*100)..'%')
                            end 
                            
                            local Q,R = c('Frame',{
                                Size = UDim2.new(1,0,0,40),
                                AutomaticSize = 'Y',
                                Position = UDim2.new(0,0,0,254),
                                BackgroundTransparency = 1,
                                Parent = w.UIElements.Main,
                                LayoutOrder = 4
                            },{
                                c('UIListLayout',{Padding = UDim.new(0,8),FillDirection = 'Horizontal',HorizontalAlignment = 'Right'})
                            }),{
                                {
                                    Title = 'Cancel',
                                    Variant = 'Secondary',
                                    Callback = function()end
                                },{
                                    Title = 'Apply',
                                    Icon = 'chevron-right',
                                    Variant = 'Primary',
                                    Callback = function()
                                        t(Color3.fromHSV(u.Hue,u.Sat,u.Vib),u.Transparency)
                                    end
                                }
                            }
                            
                            for S,T in next,R do 
                                o(T.Title,T.Icon,T.Callback,T.Variant,Q,w)
                            end 
                            
                            local U,V,W 
                            if u.Transparency then 
                                local X = c('Frame',{
                                    Size = UDim2.new(1,0,1,0),
                                    Position = UDim2.fromOffset(0,0),
                                    BackgroundTransparency = 1
                                })
                                
                                V = c('ImageLabel',{
                                    Size = UDim2.new(0,14,0,14),
                                    AnchorPoint = Vector2.new(0.5,0.5),
                                    Position = UDim2.new(0.5,0,0,0),
                                    ThemeTag = {BackgroundColor3 = 'Text'},
                                    Parent = X
                                },{
                                    c('UIStroke',{Thickness=2,Transparency=0.1,ThemeTag={Color='Text'}}),
                                    c('UICorner',{CornerRadius=UDim.new(1,0)})
                                })
                                
                                W = c('Frame',{
                                    Size = UDim2.fromScale(1,1)
                                },{
                                    c('UIGradient',{
                                        Transparency = NumberSequence.new{
                                            NumberSequenceKeypoint.new(0,0),
                                            NumberSequenceKeypoint.new(1,1)
                                        },
                                            Rotation = 270
                                        }),
                                        c('UICorner',{CornerRadius = UDim.new(0,6)})
                                    })
                                    
                                    U = c('Frame',{
                                        Size = UDim2.fromOffset(10,192),
                                        Position = UDim2.fromOffset(210,40),
                                        Parent = w.UIElements.Main,
                                        BackgroundTransparency = 1
                                    },{
                                        c('UICorner',{CornerRadius=UDim.new(1,0)}),
                                        c('ImageLabel',{
                                            Image = 'rbxassetid://14204231522',
                                            ImageTransparency = 0.45,
                                            ScaleType = Enum.ScaleType.Tile,
                                            TileSize = UDim2.fromOffset(40,40),
                                            BackgroundTransparency = 1,
                                            Size = UDim2.fromScale(1,1)
                                        },{
                                            c('UICorner',{CornerRadius=UDim.new(1,0)})
                                        }),W,X
                                    })
                                end 
                                
                                function u.Round(X,Y,Z)
                                    if Z == 0 then 
                                        return math.floor(Y) 
                                    end 
                                    Y = tostring(Y)
                                    return Y:find'%.' and tonumber(Y:sub(1,Y:find'%.'+Z)) or Y
                                end 
                                
                                function u.Update(X,Y,Z)
                                    if Y then 
                                        x,y,z = Color3.toHSV(Y)
                                    else 
                                        x,y,z = u.Hue,u.Sat,u.Vib 
                                    end 
                                    
                                    u.UIElements.SatVibMap.BackgroundColor3 = Color3.fromHSV(x,1,1)
                                    A.Position = UDim2.new(y,0,1-z,0)
                                    D.BackgroundColor3 = Color3.fromHSV(x,y,z)
                                    I.BackgroundColor3 = Color3.fromHSV(x,1,1)
                                    I.Position = UDim2.new(0.5,0,x,0)
                                    L.Frame.Frame.TextBox.Text = '#'..Color3.fromHSV(x,y,z):ToHex()
                                    M.Frame.Frame.TextBox.Text = K(Color3.fromHSV(x,y,z)).R 
                                    N.Frame.Frame.TextBox.Text = K(Color3.fromHSV(x,y,z)).G 
                                    O.Frame.Frame.TextBox.Text = K(Color3.fromHSV(x,y,z)).B 

                                    if Z or u.Transparency then 
                                        D.BackgroundTransparency = u.Transparency or Z 
                                        W.BackgroundColor3 = Color3.fromHSV(x,y,z)
                                        V.BackgroundColor3 = Color3.fromHSV(x,y,z)
                                        V.BackgroundTransparency = u.Transparency or Z 
                                        V.Position = UDim2.new(0.5,0,1-u.Transparency or Z,0)
                                        P.Frame.Frame.TextBox.Text = u:Round((1-u.Transparency or Z)*100,0)..'%'
                                    end 
                                end 

                                u:Update(u.Default,u.Transparency)
                                
                                local X,Y = function()
                                    local X = Color3.fromHSV(u.Hue,u.Sat,u.Vib)
                                    return {
                                        R = math.floor(X.r*255),
                                        G = math.floor(X.g*255),
                                        B = math.floor(X.b*255)
                                    }
                                end, function(X,Y,Z) 
                                    return math.clamp(tonumber(X)or 0,Y,Z)
                                end 
                                
                                L.Frame.Frame.TextBox.FocusLost:Connect(function(Z)
                                    if Z then 
                                        local _ = L.Frame.Frame.TextBox.Text:gsub('#','')
                                        local aa,ab = pcall(Color3.fromHex,_)
                                        if aa and typeof(ab) == 'Color3' then 
                                            u.Hue,u.Sat,u.Vib = Color3.toHSV(ab)
                                            u:Update()
                                            u.Default = ab 
                                        end 
                                    end 
                                end)
                                
                                local aa = function(aa,ab)
                                    aa.Frame.Frame.TextBox.FocusLost:Connect(function(Z)
                                        if Z then 
                                            local _,ac=aa.Frame.Frame.TextBox,X()
                                            local ad=Y(_.Text,0,255)
                                            _.Text = tostring(ad)ac[ab]=ad 
                                            local ae = Color3.fromRGB(ac.R,ac.G,ac.B)
                                            u.Hue,u.Sat,u.Vib = Color3.toHSV(ae)
                                            u:Update()
                                        end 
                                    end)
                                end 
                                
                                aa(M,'R')
                                aa(N,'G')
                                aa(O,'B')
                                
                                if u.Transparency then 
                                    P.Frame.Frame.TextBox.FocusLost:Connect(function(ab)
                                        if ab then 
                                            local ac = P.Frame.Frame.TextBox 
                                            local ad = Y(ac.Text,0,100)
                                            ac.Text = tostring(ad)u.Transparency=1-ad*0.01 
                                            u:Update(nil,u.Transparency)
                                        end 
                                    end)
                                end 
                                
                                local ab = u.UIElements.SatVibMap 
                                ab.InputBegan:Connect(function(ac)
                                    if ac.UserInputType == Enum.UserInputType.MouseButton1 or ac.UserInputType == Enum.UserInputType.Touch then 
                                        while e:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do 
                                            local ad = ab.AbsolutePosition.X 
                                            local ae = ad+ab.AbsoluteSize.X 
                                            local Z,_ = math.clamp(k.X,ad,ae),ab.AbsolutePosition.Y 
                                            local af = _+ab.AbsoluteSize.Y 
                                            local ag = math.clamp(k.Y,_,af)
                                            u.Sat = (Z-ad)/(ae-ad)
                                            u.Vib = 1-((ag-_)/(af-_))
                                            u:Update()
                                            i:Wait()
                                        end 
                                    end 
                                end)
                                
                                J.InputBegan:Connect(function(ac)
                                    if ac.UserInputType == Enum.UserInputType.MouseButton1 or ac.UserInputType == Enum.UserInputType.Touch then 
                                        while e:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do 
                                            local ad = J.AbsolutePosition.Y 
                                            local ae = ad + J.AbsoluteSize.Y 
                                            local af = math.clamp(k.Y,ad,ae)
                                            u.Hue=((af-ad)/(ae-ad))
                                            u:Update()i:Wait()
                                        end 
                                    end 
                                end)
                                
                                if u.Transparency then 
                                    U.InputBegan:Connect(function(ac)
                                        if ac.UserInputType == Enum.UserInputType.MouseButton1 or ac.UserInputType == Enum.UserInputType.Touch then 
                                            while e:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do 
                                                local ad = U.AbsolutePosition.Y 
                                                local ae = ad + U.AbsoluteSize.Y 
                                                local af = math.clamp(k.Y,ad,ae)
                                                u.Transparency = 1-((af-ad)/(ae-ad))
                                                u:Update()
                                                i:Wait()
                                            end 
                                        end 
                                    end)
                                end 
                                return u 
                            end 
                            
                            function q.New(aa,ab)
                                local ac,ad = {
                                    __type = 'Colorpicker',
                                    Title = ab.Title or'Colorpicker',
                                    Desc = ab.Desc or nil,
                                    Locked = ab.Locked or false,
                                    Default = ab.Default or Color3.new(1,1,1),
                                    Callback = ab.Callback or function()end,
                                    Window = ab.Window,
                                    Transparency = ab.Transparency,
                                    UIElements = {}
                                },true 
                                
                                ac.ColorpickerFrame=a.load'i'{
                                    Title = ac.Title,
                                    Desc = ac.Desc,
                                    Parent = ab.Parent,
                                    TextOffset = 40,
                                    Hover = false
                                }
                                
                                ac.UIElements.Colorpicker=b.NewRoundFrame(q.UICorner,'Squircle',{
                                    ImageTransparency=0,
                                    Active = true,
                                    ImageColor3 = ac.Default,
                                    Parent = ac.ColorpickerFrame.UIElements.Main,
                                    Size = UDim2.new(0,30,0,30),
                                    AnchorPoint = Vector2.new(1,0.5),
                                    Position = UDim2.new(1,-ac.ColorpickerFrame.UIPadding/2,0.5,0),
                                    ZIndex = 2
                                },nil,true)
                                
                                function ac.Lock(ae)
                                    ad = false 
                                    return ac.ColorpickerFrame:Lock()
                                end 
                                
                                function ac.Unlock(ae)
                                    ad = true 
                                    return ac.ColorpickerFrame:Unlock()
                                end 
                                
                                if ac.Locked then 
                                    ac:Lock()
                                end 
                                
                                function ac.Update(ae,af,ag)
                                    ac.UIElements.Colorpicker.BackgroundTransparency = ag or 0 
                                    ac.UIElements.Colorpicker.BackgroundColor3 = af 
                                    ac.Default = af 
                                    if ag then 
                                        ac.Transparency = ag 
                                    end 
                                end 
                                
                                ac.UIElements.Colorpicker.MouseButton1Click:Connect(function()
                                    if ad then 
                                        q:Colorpicker(ac,function(ae,af)
                                            if ad then 
                                                ac:Update(ae,af)
                                                ac.Default = ae 
                                                ac.Transparency = af 
                                                ac.Callback(ae,af)
                                            end 
                                        end).ColorpickerFrame:Open()
                                    end 
                                end)
                                return ac.__type,ac 
                            end 
                            return q 
                        end
                        
                        function a.r()
                            local aa = a.load'a'
                            local ab,ac,ad = aa.New,aa.Tween,{}
                            
                            function ad.New(ae,af)
                                local ag = {
                                    __type = 'Section',
                                    Title = af.Title or'Section',
                                    TextXAlignment = af.TextXAlignment or'Left',
                                    TextSize = af.TextSize or 19,
                                    UIElements = {}
                                }

                                ag.UIElements.Main = ab('TextLabel',{
                                    BackgroundTransparency = 1,
                                    TextXAlignment = ag.TextXAlignment,
                                    AutomaticSize = 'Y',
                                    TextSize = ag.TextSize,
                                    ThemeTag = {TextColor3 = 'Text'},
                                    FontFace = Font.new(aa.Font,Enum.FontWeight.SemiBold),
                                    Parent = af.Parent,
                                    Size = UDim2.new(1,0,0,0),
                                    Text = ag.Title
                                },{
                                    ab('UIPadding',{
                                        PaddingTop = UDim.new(0,4),
                                        PaddingBottom = UDim.new(0,2)
                                    })
                                })
                                
                                function ag.SetTitle(b,c)
                                    ag.UIElements.Main.Text = c 
                                end 
                                
                                function ag.Destroy(b)
                                    ag.UIElements.Main.AutomaticSize = 'None'
                                    ag.UIElements.Main.Size = UDim2.new(1,0,0,ag.UIElements.Main.TextBounds.Y)
                                    ac(ag.UIElements.Main,0.1,{TextTransparency = 1}):Play()
                                    task.wait(0.1)
                                    ac(ag.UIElements.Main,0.15,{Size = UDim2.new(1,0,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
                                end 
                                return 
                                ag.__type,ag 
                            end 
                            return ad 
                        end 
                        
                        function a.s()
                            local aa,ab,ac = game:GetService'UserInputService',game.Players.LocalPlayer:GetMouse(),a.load'a'
                            local ad,ae,af = ac.New,ac.Tween,a.load'd'
                            local ag,b,c = af.Button,af.ScrollSlider,{
                                Window = nil,
                                WindUI = nil,
                                Tabs = {},
                                Containers = {},
                                SelectedTab = nil,
                                TabCount = 0,
                                ToolTipParent = nil,
                                TabHighlight = nil,
                                OnChangeFunc=function(ag)end
                            }
                            
                            function c.Init(d,e,f,g)
                                c.Window = d 
                                c.WindUI = e 
                                c.ToolTipParent=  f 
                                c.TabHighlight = g 
                                return c 
                            end
                            
                            function c.New(d)
                            local e,f,g = {
                                Title = d.Title or'Tab',
                                Desc = d.Desc,
                                Icon  =d.Icon,
                                Locked = d.Locked,
                                ShowTabTitle = d.ShowTabTitle,
                                Selected = false,
                                Index = nil,
                                Parent = d.Parent,
                                UIElements = {},
                                Elements = {},
                                ContainerFrame = nil
                            }, c.Window,c.WindUI 

                            c.TabCount = c.TabCount + 1 
                            local h = c.TabCount 
                            e.Index = h 
                            
                            e.UIElements.Main = ad('TextButton',{
                                BackgroundTransparency = 1,
                                Size = UDim2.new(1,-7,0,0),
                                AutomaticSize = 'Y',
                                Parent = d.Parent
                            },{
                                ad('UIListLayout',{
                                    SortOrder = 'LayoutOrder',
                                    Padding = UDim.new(0,10),
                                    FillDirection = 'Horizontal',
                                    VerticalAlignment = 'Center'
                                }),
                                ad('TextLabel',{
                                    Text = e.Title,
                                    ThemeTag = {TextColor3 = 'Text'},
                                    TextTransparency = not e.Locked and 0.4 or 0.7,
                                    TextSize = 15,
                                    Size = UDim2.new(1,0,0,0),
                                    FontFace = Font.new(ac.Font,Enum.FontWeight.Medium),
                                    TextWrapped = true,
                                    RichText = true,
                                    AutomaticSize = 'Y',
                                    LayoutOrder = 2,
                                    TextXAlignment = 'Left',
                                    BackgroundTransparency = 1
                                }),

                                ad('UIPadding',{
                                    PaddingTop=UDim.new(0,6),
                                    PaddingBottom=UDim.new(0,6)
                                })
                            })
                            
                            local i,j = 0 
                            if e.Icon and ac.Icon(e.Icon) then 
                                j = ad('ImageLabel',{
                                    ImageTransparency = not e.Locked and 0.5 or 0.7,
                                    Image = ac.Icon(e.Icon)[1],
                                    ImageRectOffset = ac.Icon(e.Icon)[2].ImageRectPosition,
                                    ImageRectSize = ac.Icon(e.Icon)[2].ImageRectSize,
                                    Size = UDim2.new(0,18,0,18),
                                    LayoutOrder = 1,
                                    ThemeTag = {ImageColor3 = 'Text'},
                                    BackgroundTransparency = 1,
                                    Parent = e.UIElements.Main
                                })
                                e.UIElements.Main.TextLabel.Size = UDim2.new(1,-30,0,0)
                                i = -30 
                            elseif e.Icon and string.find(e.Icon,'rbxassetid://') then 
                                j = ad('ImageLabel',{
                                    ImageTransparency = not e.Locked and 0.5 or 0.7,
                                    Image = e.Icon,
                                    Size= UDim2.new(0,18,0,18),
                                    LayoutOrder = 1,
                                    ThemeTag = {ImageColor3 = 'Text'},
                                    BackgroundTransparency = 1,
                                    Parent = e.UIElements.Main
                                })
                                e.UIElements.Main.TextLabel.Size=UDim2.new(1,-30,0,0)
                                i = -30 
                            end 
                            
                            e.UIElements.ContainerFrame=ad('ScrollingFrame',{
                                Size=UDim2.new(1,0,1,e.ShowTabTitle and -((f.UIPadding*2.4)+12) or 0),
                                BackgroundTransparency = 1,
                                ScrollBarThickness = 0,
                                ElasticBehavior = 'Never',
                                CanvasSize = UDim2.new(0,0,0,0),
                                AnchorPoint = Vector2.new(0,1),
                                Position = UDim2.new(0,0,1,0),
                                AutomaticCanvasSize = 'Y',
                                ScrollingDirection = 'Y'
                            },{
                                ad('UIPadding',{
                                    PaddingTop = UDim.new(0,f.UIPadding*1.2),
                                    PaddingLeft = UDim.new(0,f.UIPadding*1.2),
                                    PaddingRight = UDim.new(0,f.UIPadding*1.2),
                                    PaddingBottom = UDim.new(0,f.UIPadding*1.2)
                                }),
                                ad('UIListLayout',{
                                    SortOrder = 'LayoutOrder',
                                    Padding = UDim.new(0,6)
                                })
                            })
                            
                            e.UIElements.ContainerFrameCanvas=ad('Frame',{
                                Size = UDim2.new(1,0,1,0),
                                BackgroundTransparency = 1,
                                Visible = false,Parent = f.UIElements.MainBar,
                                ZIndex = 5
                            },{
                                e.UIElements.ContainerFrame,ad('Frame',{
                                    Size = UDim2.new(1,0,0,((f.UIPadding*2.4)+12)),
                                    BackgroundTransparency = 1,
                                    Visible = e.ShowTabTitle or false,
                                    Name = 'TabTitle'
                                },{
                                    j and j:Clone(),
                                    ad('TextLabel',{
                                        Text = e.Title,
                                        ThemeTag = {TextColor3='Text'},
                                        TextSize = 20,
                                        TextTransparency = 0.1,
                                        Size = UDim2.new(1,0,1,0),
                                        FontFace = Font.new(ac.Font,Enum.FontWeight.SemiBold),
                                        TextTruncate = 'AtEnd',
                                        RichText = true,
                                        LayoutOrder = 2,
                                        TextXAlignment = 'Left',
                                        BackgroundTransparency = 1
                                    }),
                                    ad('UIPadding',{
                                        PaddingTop = UDim.new(0,f.UIPadding*1.2),
                                        PaddingLeft = UDim.new(0,f.UIPadding*1.2),
                                        PaddingRight = UDim.new(0,f.UIPadding*1.2),
                                        PaddingBottom = UDim.new(0,f.UIPadding*1.2)
                                    }),
                                    ad('UIListLayout',{
                                        SortOrder = 'LayoutOrder',
                                        Padding = UDim.new(0,10),
                                        FillDirection = 'Horizontal',
                                        VerticalAlignment = 'Center'
                                    })
                                }),
                                ad('Frame',{
                                    Size = UDim2.new(1,0,0,1),
                                    BackgroundTransparency = 0.9,
                                    ThemeTag = {BackgroundColor3='Text'},
                                    Position = UDim2.new(0,0,0,((f.UIPadding*2.4)+12)),
                                    Visible = e.ShowTabTitle or false
                                })
                            })
                            c.Containers[h] = e.UIElements.ContainerFrameCanvas 
                            c.Tabs[h] = e 
                            e.ContainerFrame = ContainerFrameCanvas 
                            
                            e.UIElements.Main.MouseButton1Click:Connect(function()
                                if not e.Locked then 
                                    c:SelectTab(h)
                                end 
                            end)
                            
                            if e.Desc then 
                                local k,n,o,p = false 
                                local q = function()
                                    k = false 
                                    if o then 
                                        task.cancel(o)
                                        o = nil 
                                    end 
                                    if p then 
                                        p:Disconnect()
                                        p = nil 
                                    end 
                                    if n then 
                                        n:Close()
                                        n = nil
                                    end 
                                end 
                                
                                e.UIElements.Main.InputBegan:Connect(function()
                                    k = true 
                                    o = task.spawn(function()
                                        task.wait(0.35)
                                        if k and not n then 
                                            n = af.ToolTip(e.Desc,c.ToolTipParent)
                                            local r = function()
                                                if n then 
                                                    n.Container.Position = UDim2.new(0,ab.X,0,ab.Y-20)
                                                end 
                                            end 
                                            r()
                                            p = ab.Move:Connect(r)
                                            n:Open()
                                        end 
                                    end)
                                end)
                                e.UIElements.Main.InputEnded:Connect(q)
                            end 
                            
                            local k = {
                                Button = a.load'j',
                                Toggle = a.load'k',
                                Slider = a.load'l',
                                Keybind = a.load'm',
                                Input = a.load'n',
                                Dropdown = a.load'o',
                                Code = a.load'p',
                                Colorpicker = a.load'q',
                                Section = a.load'r'
                            }
                            
                            function e.Paragraph(n,o)
                                o.Parent = e.UIElements.ContainerFrame 
                                o.Window = f 
                                o.Hover = false 
                                o.TextOffset = 0 
                                o.IsButtons = o.Buttons and #o.Buttons > 0 and true or false 
                                local p,q = {
                                    __type='Paragraph',
                                    Title = o.Title or'Paragraph',
                                    Desc = o.Desc or nil,
                                    Locked = o.Locked or false
                                },a.load'i'(o)
                                
                                p.ParagraphFrame = q
                                
                                local DescWrapper = ad('Frame', {
                                    BackgroundColor3 = Color3.new(0, 0, 0),
                                    BackgroundTransparency = 0.6,
                                    AutomaticSize = 'Y',
                                    Size = UDim2.new(1, 0, 0, 0),
                                    LayoutOrder = 9999,
                                    Name = 'DescWrapper'
                                }, {
                                    ad('UICorner', { CornerRadius = UDim.new(0, 8) }),
                                    ad('UIPadding', {
                                        PaddingTop = UDim.new(0, 8),
                                        PaddingBottom = UDim.new(0, 8),
                                        PaddingLeft = UDim.new(0, 12),
                                        PaddingRight = UDim.new(0, 12),
                                    }),
                                    
                                    ad('TextLabel', {
                                        Text = o.Desc,
                                        ThemeTag = {TextColor3 = not o.Color and 'Text' or nil},
                                        TextColor3 = o.Color and (o.Color == 'White' and Color3.new(0,0,0) or Color3.new(1,1,1)),
                                        TextTransparency = 0.2,
                                        TextSize = 15,
                                        TextWrapped = true,
                                        AutomaticSize = 'Y',
                                        BackgroundTransparency = 1,
                                        FontFace = Font.new(ac.Font, Enum.FontWeight.Medium),
                                        Size = UDim2.new(1, 0, 0, 0),
                                        TextXAlignment = 'Left',
                                        LineHeight = 1.35,
                                        Name = 'Desc'
                                    })
                                })
                            
                                local oldDesc = q.UIElements.Main.Title:FindFirstChild("Desc")

                                if oldDesc then
                                    oldDesc:Destroy()
                                end
                                
                                if o.Desc then
                                    DescWrapper.Parent = q.UIElements.Main.Title
                                end
                            
                                if o.Buttons and #o.Buttons > 0 then 
                                    local r = ad('Frame',{
                                        Size = UDim2.new(1,0,0,38),
                                        BackgroundTransparency = 1,
                                        Position = UDim2.new(0,0,0,o.Image and q.ImageSize>q.UIElements.Main.Title.AbsoluteSize.Y and q.ImageSize+q.UIPadding or q.UIElements.Main.Title.AbsoluteSize.Y+q.UIPadding+(o.ThumbnailSize or 0)),
                                        Parent = q.UIElements.Main
                                    },{
                                        ad('UIListLayout',{
                                            Padding=UDim.new(0,10),
                                            FillDirection='Vertical'
                                        })
                                    })
                                    
                                    for s,t in next,o.Buttons do 
                                        local u = ag(t.Title,t.Icon,t.Callback,'White',r)
                                        u.Size=UDim2.new(1,0,0,38)u.AutomaticSize = 'None'
                                    end 
                                end 
                                
                                function p.SetTitle(r,s)
                                    p.ParagraphFrame:SetTitle(s)
                                end 
                                
                                function p.SetDesc(r,s)
                                    local descLabel = p.ParagraphFrame.UIElements.Main.Title:FindFirstChild("DescWrapper")
                                    if descLabel then
                                        descLabel.Desc.Text = s
                                    end
                                end 
                                
                                function p.Destroy(r)
                                    p.ParagraphFrame:Destroy()
                                end 
                                
                                table.insert(e.Elements,p)
                                return p 
                            end 
                            
                            for n,o in pairs(k) do 
                                e[n] = function(p,q)
                                    q.Parent = p.UIElements.ContainerFrame 
                                    q.Window = f 
                                    q.WindUI = g 
                                    local r,s = o:New(q)
                                    table.insert(p.Elements,s)
                                    local t for u,v in pairs(s) do 
                                        if typeof(v) == 'table' and u:match'Frame$' then 
                                            t = v 
                                            break 
                                        end 
                                    end 
                                    
                                    if t then 
                                        function s.SetTitle(w,x)
                                            t:SetTitle(x)
                                        end 
                                        
                                        function s.SetDesc(w,x)
                                            t:SetDesc(x)
                                        end 
                                        
                                        function s.Destroy(w)
                                            t:Destroy()
                                        end 
                                    end 
                                    
                                    return s 
                                end 
                            end 
                            
                            task.spawn(function()
                                local p = ad('Frame',{
                                    BackgroundTransparency=1,
                                    Size = UDim2.new(1,0,1,-f.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
                                    Parent = e.UIElements.ContainerFrame
                                },{
                                    ad('UIListLayout',{
                                        Padding = UDim.new(0,8),
                                        SortOrder = 'LayoutOrder',
                                        VerticalAlignment = 'Center',
                                        HorizontalAlignment = 'Center',
                                        FillDirection = 'Vertical'
                                    }),
                                    ad('ImageLabel',{
                                        Size = UDim2.new(0,48,0,48),
                                        Image = ac.Icon'frown'[1],
                                        ImageRectOffset = ac.Icon'frown'[2].ImageRectPosition,
                                        ImageRectSize = ac.Icon'frown'[2].ImageRectSize,
                                        ThemeTag = {ImageColor3='Text'},
                                        BackgroundTransparency = 1,ImageTransparency=0.4
                                    }),
                                    ad('TextLabel',{
                                        AutomaticSize = 'XY',
                                        Text = 'This tab is empty',
                                        ThemeTag = {TextColor3='Text'},
                                        TextSize = 18,
                                        TextTransparency = 0.4,
                                        BackgroundTransparency = 1,
                                        FontFace = Font.new(ac.Font,Enum.FontWeight.Medium)
                                    })
                                })
                                
                                e.UIElements.ContainerFrame.ChildAdded:Connect(function()
                                    p.Visible = false 
                                end)
                            end)
                            return e 
                        end 
                        
                        function c.OnChange(d,e)
                            c.OnChangeFunc = e 
                        end 
                        
                        function c.SelectTab(d,e)
                            if not c.Tabs[e].Locked then 
                                c.SelectedTab = e for f,g in next,c.Tabs do 
                                    if not g.Locked then 
                                        ae(g.UIElements.Main.TextLabel,0.15,{TextTransparency = 0.45}):Play()
                                        if g.Icon and ac.Icon(g.Icon) then 
                                            ae(g.UIElements.Main.ImageLabel,0.15,{ImageTransparency = 0.5}):Play()
                                        end 
                                        g.Selected = false 
                                    end 
                                end 
                                
                                ae(c.Tabs[e].UIElements.Main.TextLabel,0.15,{TextTransparency = 0}):Play()
                                if c.Tabs[e].Icon and ac.Icon(c.Tabs[e].Icon) then 
                                    ae(c.Tabs[e].UIElements.Main.ImageLabel,0.15,{ImageTransparency = 0.15}):Play()
                                end 
                                
                                c.Tabs[e].Selected = true 
                                ae(c.TabHighlight,0.25,{
                                    Position = UDim2.new(0,0,0,c.Tabs[e].UIElements.Main.AbsolutePosition.Y-c.Tabs[e].Parent.AbsolutePosition.Y),
                                    Size = UDim2.new(1,-7,0,c.Tabs[e].UIElements.Main.AbsoluteSize.Y)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                    task.spawn(function()
                                        for h,i in next,c.Containers do 
                                            i.AnchorPoint = Vector2.new(0,0.05)
                                            i.Visible = false 
                                        end 
                                        c.Containers[e].Visible = true 
                                        ae(c.Containers[e],0.15,{AnchorPoint = Vector2.new(0,0)},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()
                                    end)
                                    
                                    c.OnChangeFunc(e)
                                end 
                            end 
                            return c 
                        end 
                        
                        function a.t()
                            local aa,ab,ac = game:GetService'UserInputService',{Margin=8,Padding=9},a.load'a'
                            local ad,ae = ac.New,ac.Tween 
                            
                            function ab.new(af,ag,b)
                                local c = {
                                    IconSize=14,
                                    Padding=14,
                                    Radius=15,
                                    Width=400,
                                    MaxHeight=380,
                                    Icons = {
                                        Tab = 'table-of-contents',
                                        Paragraph = 'type',
                                        Button = 'square-mouse-pointer',
                                        Toggle='toggle-right',Slider = 'sliders-horizontal',
                                        Keybind = 'command',
                                        Input = 'text-cursor-input',
                                        Dropdown = 'chevrons-up-down',
                                        Code = 'terminal',
                                        Colorpicker = 'palette'}
                                    }
                                    
                                    local d,e,f = ad('TextBox',{
                                        Text = '',
                                        PlaceholderText = 'Search...',
                                        ThemeTag = {PlaceholderColor3='Placeholder',TextColor3='Text'},
                                        Size = UDim2.new(1,-((c.IconSize*2)+(c.Padding*2)),0,0),
                                        AutomaticSize = 'Y',
                                        ClipsDescendants = true,
                                        ClearTextOnFocus = false,
                                        BackgroundTransparency = 1,
                                        TextXAlignment = 'Left',
                                        FontFace = Font.new(ac.Font,Enum.FontWeight.Regular),
                                        TextSize = 17
                                    }),
                                    ad('ImageLabel',{
                                        Image = ac.Icon'x'[1],
                                        ImageRectSize = ac.Icon'x'[2].ImageRectSize,
                                        ImageRectOffset = ac.Icon'x'[2].ImageRectPosition,
                                        BackgroundTransparency = 1,
                                        ThemeTag = {ImageColor3='Text'},
                                        ImageTransparency = 0.2,
                                        Size = UDim2.new(0,c.IconSize,0,c.IconSize)
                                    },{
                                        ad('TextButton',{
                                            Size = UDim2.new(1,8,1,8),
                                            BackgroundTransparency = 1,
                                            Active = true,
                                            ZIndex = 999999999,
                                            AnchorPoint = Vector2.new(0.5,0.5),
                                            Position = UDim2.new(0.5,0,0.5,0),
                                            Text=''
                                        })
                                    }),
                                    ad('ScrollingFrame',{
                                        Size = UDim2.new(1,0,0,0),
                                        AutomaticCanvasSize = 'Y',
                                        ScrollingDirection = 'Y',
                                        ElasticBehavior = 'Never',
                                        ScrollBarThickness = 0,
                                        CanvasSize = UDim2.new(0,0,0,0),
                                        BackgroundTransparency = 1,
                                        Visible = false
                                    },{
                                        ad('UIListLayout',{
                                            Padding = UDim.new(0,0),
                                            FillDirection = 'Vertical'
                                        }),
                                        ad('UIPadding',{
                                            PaddingTop = UDim.new(0,c.Padding),
                                            PaddingLeft = UDim.new(0,c.Padding),
                                            PaddingRight = UDim.new(0,c.Padding),
                                            PaddingBottom = UDim.new(0,c.Padding)
                                        })
                                    })
                                    
                                    local g = ac.NewRoundFrame(c.Radius,'Squircle',{
                                        Size = UDim2.new(1,0,1,0),
                                        ThemeTag = {ImageColor3='Accent'},
                                        ImageTransparency = 0
                                    },{
                                        ad('Frame',{
                                            Size = UDim2.new(1,0,1,0),
                                            BackgroundTransparency = 1,
                                            Visible = false
                                        },{
                                            ad('Frame',{
                                                Size = UDim2.new(1,0,0,46),
                                                BackgroundTransparency = 1
                                            },{
                                                ad('Frame',{
                                                    Size = UDim2.new(1,0,1,0),
                                                    BackgroundTransparency = 1
                                                },{
                                                    ad('ImageLabel',{
                                                        Image = ac.Icon'search'[1],
                                                        ImageRectSize = ac.Icon'search'[2].ImageRectSize,
                                                        ImageRectOffset = ac.Icon'search'[2].ImageRectPosition,
                                                        BackgroundTransparency = 1,
                                                        ThemeTag = {ImageColor3 = 'Text'},
                                                        ImageTransparency = 0.2,
                                                        Size = UDim2.new(0,c.IconSize,0,c.IconSize)
                                                    }),d,e,
                                                    ad('UIListLayout',{
                                                        Padding = UDim.new(0,c.Padding),
                                                        FillDirection = 'Horizontal',
                                                        VerticalAlignment = 'Center'
                                                    }),
                                                    ad('UIPadding',{
                                                        PaddingLeft = UDim.new(0,c.Padding),
                                                        PaddingRight = UDim.new(0,c.Padding)
                                                    })
                                                })
                                            }),
                                            ad('Frame',{
                                                BackgroundTransparency = 1,
                                                AutomaticSize = 'Y',
                                                Size = UDim2.new(1,0,0,0),
                                                Name = 'Results'
                                            },{
                                                ad('Frame',{
                                                    Size = UDim2.new(1,0,0,1),
                                                    ThemeTag = {BackgroundColor3='Outline'},
                                                    BackgroundTransparency = 0.9,
                                                    Visible = false
                                                }),f,
                                                ad('UISizeConstraint',{
                                                    MaxSize = Vector2.new(c.Width,c.MaxHeight)
                                                })
                                            }),
                                            ad('UIListLayout',{
                                                Padding = UDim.new(0,0),
                                                FillDirection = 'Vertical'
                                            })
                                        })
                                    })
                                    
                                    local h,i,j = ad('Frame',{
                                        Size = UDim2.new(0,c.Width,0,0),
                                        AutomaticSize = 'Y',
                                        Parent = ag,
                                        BackgroundTransparency = 1,
                                        Position = UDim2.new(0.5,0,0.5,0),
                                        AnchorPoint = Vector2.new(0.5,0.5),
                                        Visible = false,
                                        ZIndex = 99999999
                                    },{
                                        ad('UIScale',{
                                            Scale = 0.9
                                        }),g,
                                        ac.NewRoundFrame(c.Radius,'SquircleOutline',{
                                            Size = UDim2.new(1,0,1,0),
                                            ThemeTag = {ImageColor3='Outline'},
                                            ImageTransparency=0.9
                                        })
                                    }),
                                    
                                    function(h,i,j,k,n,o)
                                        local p = ad('TextButton',{
                                            Size = UDim2.new(1,0,0,0),
                                            AutomaticSize = 'Y',
                                            BackgroundTransparency = 1,Parent=k or nil
                                        },{
                                            ac.NewRoundFrame(c.Radius-4,'Squircle',{
                                                Size = UDim2.new(1,0,0,0),
                                                Position = UDim2.new(0.5,0,0.5,0),
                                                AnchorPoint = Vector2.new(0.5,0.5),
                                                ThemeTag = {ImageColor3 = 'Text'},
                                                ImageTransparency = 1,Name='Main'
                                            },{
                                                ad('UIPadding',{
                                                    PaddingTop = UDim.new(0,c.Padding-2),
                                                    PaddingLeft = UDim.new(0,c.Padding),
                                                    PaddingRight = UDim.new(0,c.Padding),
                                                    PaddingBottom = UDim.new(0,c.Padding-2)
                                                }),
                                                ad('ImageLabel',{
                                                    Image = ac.Icon(j)[1],
                                                    ImageRectSize = ac.Icon(j)[2].ImageRectSize,
                                                    ImageRectOffset = ac.Icon(j)[2].ImageRectPosition,
                                                    BackgroundTransparency = 1,
                                                    ThemeTag = {ImageColor3 = 'Text'},
                                                    ImageTransparency = 0.2,
                                                    Size = UDim2.new(0,c.IconSize,0,c.IconSize)
                                                }),
                                                ad('Frame',{
                                                    Size = UDim2.new(1,-c.IconSize-c.Padding,0,0),
                                                    BackgroundTransparency = 1
                                                },{
                                                    ad('TextLabel',{
                                                        Text = h,
                                                        ThemeTag = {TextColor3 = 'Text'},
                                                        TextSize = 17,
                                                        BackgroundTransparency = 1,
                                                        TextXAlignment = 'Left',
                                                        FontFace = Font.new(ac.Font,Enum.FontWeight.Medium),
                                                        Size = UDim2.new(1,0,0,0),
                                                        TextTruncate = 'AtEnd',
                                                        AutomaticSize = 'Y',
                                                        Name = 'Title'
                                                    }),
                                                    ad('TextLabel',{
                                                        Text = i or '',
                                                        Visible = i and true or false,
                                                        ThemeTag = {TextColor3 = 'Text'},
                                                        TextSize = 15,
                                                        TextTransparency = 0.2,
                                                        BackgroundTransparency = 1,
                                                        TextXAlignment = 'Left',
                                                        FontFace = Font.new(ac.Font,Enum.FontWeight.Medium),
                                                        Size = UDim2.new(1,0,0,0),
                                                        TextTruncate = 'AtEnd',
                                                        AutomaticSize = 'Y',
                                                        Name = 'Desc'
                                                    }) or nil,
                                                    ad('UIListLayout',{
                                                        Padding = UDim.new(0,6),
                                                        FillDirection = 'Vertical'
                                                    })
                                                }),
                                                ad('UIListLayout',{
                                                    Padding = UDim.new(0,c.Padding),
                                                    FillDirection = 'Horizontal'
                                                })},true),
                                                ad('Frame',{
                                                    Name = 'ParentContainer',
                                                    Size = UDim2.new(1,-c.Padding,0,0),
                                                    AutomaticSize = 'Y',
                                                    BackgroundTransparency = 1,
                                                    Visible = n
                                                },{
                                                    ac.NewRoundFrame(99,'Squircle',{
                                                        Size = UDim2.new(0,2,1,0),
                                                        BackgroundTransparency = 1,
                                                        ThemeTag = {ImageColor3 = 'Text'},
                                                        ImageTransparency = 0.9
                                                    }),
                                                    ad('Frame',{
                                                        Size = UDim2.new(1,-c.Padding-2,0,0),
                                                        Position = UDim2.new(0,c.Padding+2,0,0),
                                                        BackgroundTransparency = 1
                                                    },{
                                                        ad('UIListLayout',{
                                                            Padding = UDim.new(0,0),
                                                            FillDirection = 'Vertical'
                                                        })
                                                    })
                                                }),
                                                ad('UIListLayout',{
                                                    Padding = UDim.new(0,0),
                                                    FillDirection = 'Vertical',
                                                    HorizontalAlignment = 'Right'
                                                })
                                            })
                                            
                                            p.Main.Size = UDim2.new(1,0,0,p.Main.Frame.Desc.Visible and (((c.Padding-2)*2)+p.Main.Frame.Title.TextBounds.Y+6+p.Main.Frame.Desc.TextBounds.Y)or(((c.Padding-2)*2)+p.Main.Frame.Title.TextBounds.Y))
                                            p.Main.MouseEnter:Connect(function()
                                                ae(p.Main,0.04,{ImageTransparency = 0.95}):Play()
                                            end)
                                            
                                            p.Main.InputEnded:Connect(function()
                                                ae(p.Main,0.08,{ImageTransparency=1}):Play()
                                            end)
                                            
                                            p.Main.MouseButton1Click:Connect(function()
                                                if o then 
                                                    o()
                                                end 
                                            end)
                                            return p 
                                        end,
                                        
                                        function(h,i)
                                            if not i or i == '' then 
                                                return false 
                                            end
                                             
                                            if not h or h == '' then 
                                                return false 
                                            end 
                                            
                                            local j,k = string.lower(h),string.lower(i)
                                            return string.find(j,k,1,true) ~= nil
                                         end 
                                         
                                         local k = function(k)
                                            if not k or k == '' then 
                                                return {} 
                                            end 
                                            
                                        local n = {} 
                                        for o,p in next,af.Tabs do 
                                            local q,r = j(p.Title or'',k),{}
                                            for s,t in next,p.Elements do 
                                                if t.__type ~= 'Section' then 
                                                    local u,v = j(t.Title or'',k),j(t.Desc or'',k)
                                                    if u or v then 
                                                        r[s] = {
                                                            Title = t.Title,
                                                            Desc = t.Desc,
                                                            Original = t,
                                                            __type = t.__type
                                                        }
                                                    end 
                                                end 
                                            end 
                                            
                                        if q or next(r) ~= nil then 
                                            n[o] = {
                                                Tab = p,
                                                Title = p.Title,
                                                Icon = p.Icon,
                                                Elements = r
                                            }
                                        end 
                                    end 
                                    return n 
                                end 
                                
                                function c.Search(n,o)
                                    o = o or ''
                                    
                                    local p = k(o)f.Visible = true 
                                    g.Frame.Results.Frame.Visible = true 
                                    
                                    for q,r in next,f:GetChildren() do 
                                        if r.ClassName ~= 'UIListLayout' and r.ClassName ~= 'UIPadding' then 
                                            r:Destroy()
                                        end 
                                    end 
                                    
                                    if p and next(p) ~= nil then 
                                        for s,t in next,p do 
                                            local u = c.Icons.Tab 
                                            local v = i(t.Title,nil,u,f,true,function()c:Close()af:SelectTab(s)end)
                                            
                                            if t.Elements and next(t.Elements) ~= nil then 
                                                for w,x in next,t.Elements do 
                                                    local y = c.Icons[x.__type]
                                                    i(x.Title,x.Desc,y,v:FindFirstChild'ParentContainer' and v.ParentContainer.Frame or nil,false,function()c:Close()af:SelectTab(s)
                                                    end)
                                                end 
                                            end 
                                        end 
                                    elseif o~=''then 
                                        ad('TextLabel',{
                                            Size = UDim2.new(1,0,0,70),
                                            BackgroundTransparency = 1,
                                            Text = 'No results found',
                                            TextSize = 16,
                                            ThemeTag = {TextColor3 = 'Text'},
                                            TextTransparency = 0.2,
                                            BackgroundTransparency = 1,
                                            FontFace = Font.new(ac.Font,Enum.FontWeight.Medium),
                                            Parent = f,
                                            Name = 'NotFound'
                                        })
                                    else 
                                        f.Visible = false 
                                        g.Frame.Results.Frame.Visible = false 
                                    end 
                                end 
                                
                                d:GetPropertyChangedSignal'Text':Connect(function()
                                    c:Search(d.Text)
                                end)
                                
                                f.UIListLayout:GetPropertyChangedSignal'AbsoluteContentSize':Connect(function()
                                    ae(f,0.06,{Size = UDim2.new(1,0,0,math.clamp(f.UIListLayout.AbsoluteContentSize.Y+(c.Padding*2),0,c.MaxHeight))},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
                                end)
                                
                                function c.Open(n)
                                    task.spawn(function()
                                        g.Frame.Visible = true 
                                        h.Visible = true 
                                        ae(h.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                    end)
                                end 
                                
                                function c.Close(n)
                                    task.spawn(function()
                                        b()
                                        g.Frame.Visible = false 
                                        ae(h.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                        task.wait(0.12)
                                        h.Visible = false 
                                    end)
                                end 
                                
                                e.TextButton.MouseButton1Click:Connect(function()
                                    c:Close()
                                end)    
                                c:Open()
                                return c 
                            end 
                            return ab 
                        end 

                        function a.u()
                            local aa,ab,ac = game:GetService'UserInputService',game:GetService'RunService',a.load'a'
                            local ad,ae,af = ac.New,ac.Tween,false 
                            return function(ag)
                                local b = {
                                    Title = ag.Title or'UI Library',
                                    Author = ag.Author,
                                    Icon = ag.Icon,
                                    Folder = ag.Folder,
                                    Background = ag.Background,
                                    User=ag.User or {},
                                    Size = ag.Size and UDim2.new(0,math.clamp(ag.Size.X.Offset,480,700),0,math.clamp(ag.Size.Y.Offset,350,520)) or UDim2.new(0,580,0,460),ToggleKey = ag.ToggleKey or Enum.KeyCode.G,Transparent = ag.Transparent or false,
                                    Position = UDim2.new(0.5,0,0.5,0),
                                    UICorner = 16,
                                    UIPadding = 14,
                                    SideBarWidth = ag.SideBarWidth or 200,
                                    UIElements = {},
                                    CanDropdown = true,
                                    Closed = false,
                                    HasOutline = ag.HasOutline or false,
                                    SuperParent = ag.Parent,
                                    Destroyed = false,
                                    IsFullscreen = false,
                                    CanResize = true,
                                    IsOpenButtonEnabled = true,
                                    CurrentTab = nil,
                                    TabModule = nil,
                                    TopBarButtons = {}
                                }
                                
                                if b.Folder then 
                                    makefolder('Venuz Hub/'..b.Folder)
                                end 
                                
                                local c,d,e,f,g,h = 
                                ad('UICorner',{CornerRadius = UDim.new(0,b.UICorner)}),
                                ad('Frame',{ 
                                    Size = UDim2.new(0,32,0,32),
                                    Position = UDim2.new(1,0,1,0),
                                    AnchorPoint = Vector2.new(0.5,0.5),
                                    BackgroundTransparency = 1,ZIndex=99,
                                    Active = true
                                },{
                                    ad('ImageLabel',{
                                        Size = UDim2.new(0,96,0,96),
                                        BackgroundTransparency = 1,
                                        Image = 'rbxassetid://120997033468887',
                                        Position = UDim2.new(0.5,-16,0.5,-16),
                                        AnchorPoint = Vector2.new(0.5,0.5),
                                        ImageTransparency = 1,
                                    })
                                }),
                                ac.NewRoundFrame(b.UICorner,'Squircle',{
                                    Size = UDim2.new(1,0,1,0),
                                    ImageTransparency = 1,
                                    ImageColor3 = Color3.new(0,0,0),
                                    ZIndex = 98,
                                    Active = false,
                                    Visible = false
                                },{
                                    ad('ImageLabel',{
                                        Size = UDim2.new(0,70,0,70),
                                        Image = ac.Icon'expand'[1],
                                        ImageRectOffset = ac.Icon'expand'[2].ImageRectPosition,
                                        ImageRectSize = ac.Icon'expand'[2].ImageRectSize,
                                        BackgroundTransparency = 1,
                                        Position = UDim2.new(0.5,0,0.5,0),
                                        AnchorPoint = Vector2.new(0.5,0.5),
                                        ImageTransparency = 1,
                                        Visible = true
                                    })
                                }),
                                ac.NewRoundFrame(b.UICorner,'Squircle',{
                                    Size = UDim2.new(1,0,1,0),
                                    ImageTransparency = 1,
                                    ImageColor3 = Color3.new(0,0,0),
                                    ZIndex = 999,
                                    Active = false
                                }),
                                (ac.NewRoundFrame(b.UICorner-(b.UIPadding/2),'Squircle',{
                                    Size = UDim2.new(1,0,0,0),
                                    ImageTransparency = 0.95,
                                    ThemeTag = {ImageColor3 = 'Text'
                                }}
                            ))

                            b.UIElements.SideBar = ad('ScrollingFrame',{
                                Size = UDim2.new(1,0,1,0),
                                BackgroundTransparency = 1,
                                ScrollBarThickness=  0,
                                ElasticBehavior = 'Never',
                                CanvasSize = UDim2.new(0,0,0,0),
                                AutomaticCanvasSize = 'Y',
                                ScrollingDirection = 'Y',
                                ClipsDescendants = true,
                                VerticalScrollBarPosition = 'Left'
                            },{
                                ad('Frame',{
                                    BackgroundTransparency = 1,
                                    AutomaticSize = 'Y',
                                    Size = UDim2.new(1,0,0,0),
                                    Name = 'Frame'
                                },{
                                    ad('UIPadding',{
                                        PaddingTop = UDim.new(0,b.UIPadding/2),
                                        PaddingLeft = UDim.new(0,4+(b.UIPadding/2)),
                                        PaddingRight = UDim.new(0,4+(b.UIPadding/2)),
                                        PaddingBottom = UDim.new(0,b.UIPadding/2)
                                    }),
                                    ad('UIListLayout',{
                                        SortOrder = 'LayoutOrder',
                                        Padding = UDim.new(0,6)
                                    })
                                }),
                                ad('UIPadding',{
                                    PaddingLeft = UDim.new(0,b.UIPadding/2),
                                    PaddingRight = UDim.new(0,b.UIPadding/2)
                                }),g
                            })
                            
                            b.UIElements.SideBarContainer = ad('Frame',{
                                Size = UDim2.new(0,b.SideBarWidth,1,b.User.Enabled and -94-(b.UIPadding*2)or-52),Position=UDim2.new(0,0,0,52),
                                BackgroundTransparency = 1,
                                Visible = true
                            },{
                                b.UIElements.SideBar
                            })
                            
                            b.UIElements.MainBar=ad('Frame',{
                                Size = UDim2.new(1,-b.UIElements.SideBarContainer.AbsoluteSize.X,1,-52),
                                Position = UDim2.new(1,0,1,0),
                                AnchorPoint = Vector2.new(1,1),
                                BackgroundTransparency = 1
                            },{
                                ac.NewRoundFrame(b.UICorner-(b.UIPadding/2),'Squircle',{
                                    Size = UDim2.new(1,0,1,0),
                                     ImageColor3 = Color3.new(1,1,1),
                                     ZIndex = 3,
                                     ImageTransparency = 0.93,
                                     Name = 'Background'
                                    }),
                                    ad('UIPadding',{
                                        PaddingTop = UDim.new(0,b.UIPadding/2),
                                        PaddingLeft = UDim.new(0,b.UIPadding/2),
                                        PaddingRight = UDim.new(0,b.UIPadding/2),
                                        PaddingBottom = UDim.new(0,b.UIPadding/2)
                                    })
                                })
                                
                                local i,j = (ad('ImageLabel',{
                                    Image = 'rbxassetid://8992230677',
                                    ImageColor3 = Color3.new(0,0,0),
                                    ImageTransparency = 1,
                                    Size = UDim2.new(1,120,1,116),
                                    Position = UDim2.new(0,-60,0,-58),
                                    ScaleType = 'Slice',
                                    SliceCenter = Rect.new(99,99,99,99),
                                    BackgroundTransparency = 1,
                                    ZIndex = -9999
                                }))
                            
                                if aa.TouchEnabled and not aa.KeyboardEnabled then
                                    j = false 
                                elseif aa.KeyboardEnabled then 
                                    j = true 
                                else 
                                    j = nil 
                                end 
                                
                                local k,n,o,p 
                                if not j then 
                                    o = ad('ImageLabel',{
                                        Image = '',
                                        Size = UDim2.new(0,22,0,22),
                                        Position = UDim2.new(0.5,0,0.5,0),
                                        LayoutOrder = -1,
                                        AnchorPoint = Vector2.new(0.5,0.5),
                                        BackgroundTransparency = 1,
                                        Name = 'Icon'
                                    })
                                    
                                    OpenButtonTitle = ad('TextLabel',{
                                        Text = b.Title,
                                        TextSize = 17,
                                        FontFace = Font.new(ac.Font,Enum.FontWeight.Medium),
                                        BackgroundTransparency = 1,
                                        AutomaticSize='XY'
                                    })
                                    
                                    OpenButtonDrag = ad('Frame',{
                                        Size = UDim2.new(0,36,0,36),
                                        BackgroundTransparency = 1,
                                        Name = 'Drag'
                                    },{
                                        ad('ImageLabel',{
                                            Image = ac.Icon'move'[1],
                                            ImageRectOffset = ac.Icon'move'[2].ImageRectPosition,
                                            ImageRectSize = ac.Icon'move'[2].ImageRectSize,
                                            Size = UDim2.new(0,18,0,18),
                                            BackgroundTransparency = 1,
                                            Position = UDim2.new(0.5,0,0.5,0),
                                            AnchorPoint = Vector2.new(0.5,0.5)
                                        })
                                    })
                                    
                                    OpenButtonDivider = ad('Frame',{
                                        Size = UDim2.new(0,1,1,0),
                                        Position = UDim2.new(0,36,0.5,0),
                                        AnchorPoint = Vector2.new(0,0.5),
                                        BackgroundColor3 = Color3.new(1,1,1),
                                        BackgroundTransparency = 0.9
                                    })
                                    
                                    k = ad('Frame',{
                                        Size = UDim2.new(0,0,0,0),
                                        Position = UDim2.new(0.5,0,0,28),
                                        AnchorPoint = Vector2.new(0.5,0.5),
                                        Parent = ag.Parent,
                                        BackgroundTransparency = 1,
                                        Active = true,
                                        Visible = false
                                    })
                                    
                                    n = ad('TextButton',{
                                        Size = UDim2.new(0,0,0,44),
                                        AutomaticSize = 'X',
                                        Parent = k,Active = false,
                                        BackgroundTransparency = 0.25,
                                        ZIndex = 99,
                                        BackgroundColor3 = Color3.new(0,0,0)
                                    },{
                                        ad('UICorner',{CornerRadius = UDim.new(1,0)}),
                                        ad('UIStroke',{
                                            Thickness = 1,
                                            ApplyStrokeMode = 'Border',
                                            Color = Color3.new(1,1,1),
                                            Transparency = 0
                                        },{
                                            ad('UIGradient',{
                                                Color = ColorSequence.new(Color3.fromHex'40c9ff',Color3.fromHex'e81cff')
                                            })
                                        }),
                                        OpenButtonDrag,
                                        OpenButtonDivider,
                                        ad('UIListLayout',{
                                            Padding = UDim.new(0,4),
                                            FillDirection = 'Horizontal',
                                            VerticalAlignment = 'Center'
                                        }),
                                        ad('TextButton',{
                                            AutomaticSize = 'XY',
                                            Active = true,
                                            BackgroundTransparency = 1,
                                            Size = UDim2.new(0,0,0,36),
                                            BackgroundColor3 = Color3.new(1,1,1)
                                        },{
                                            ad('UICorner',{CornerRadius = UDim.new(1,-4)}),o,
                                            ad('UIListLayout',{
                                                Padding = UDim.new(0,b.UIPadding),
                                                FillDirection = 'Horizontal',
                                                VerticalAlignment = 'Center'
                                            }),
                                            OpenButtonTitle,
                                            ad('UIPadding',{
                                                PaddingLeft = UDim.new(0,12),
                                                PaddingRight = UDim.new(0,12)
                                            })
                                        }),
                                        ad('UIPadding',{
                                            PaddingLeft = UDim.new(0,4),
                                            PaddingRight = UDim.new(0,4)
                                        })
                                    })
                                    
                                    local q = n and n.UIStroke.UIGradient or nil 
                                    
                                    ab.RenderStepped:Connect(function(r)
                                        if b.UIElements.Main and k and k.Parent ~= nil then 
                                            if q then 
                                                q.Rotation = (q.Rotation+1)%360 
                                            end
                                            
                                            if p and p.Parent ~= nil and p.UIGradient then 
                                                p.UIGradient.Rotation = (p.UIGradient.Rotation+1)%360 
                                            end 
                                        end 
                                    end)
                                    
                                    n:GetPropertyChangedSignal'AbsoluteSize':Connect(function()
                                        k.Size = UDim2.new(0,n.AbsoluteSize.X,0,n.AbsoluteSize.Y)
                                    end)
                                    
                                    n.TextButton.MouseEnter:Connect(function()
                                        ae(n.TextButton,0.1,{BackgroundTransparency=0.93}):Play()
                                    end)
                                    
                                    n.TextButton.MouseLeave:Connect(function()
                                        ae(n.TextButton,0.1,{BackgroundTransparency=1}):Play()
                                    end)
                                end 
                                
                                local q 
                                if b.User.Enabled then 
                                    local r,s = game.Players:GetUserThumbnailAsync(b.User.Anonymous and 1 or game.Players.LocalPlayer.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)
                                    
                                    q = ad('TextButton',{
                                        Size = UDim2.new(0,(b.UIElements.SideBarContainer.AbsoluteSize.X)-(b.UIPadding/2),0,42+(b.UIPadding)),
                                        Position = UDim2.new(0,b.UIPadding/2,1,-(b.UIPadding/2)),
                                        AnchorPoint = Vector2.new(0,1),
                                        BackgroundTransparency = 1
                                    },{
                                        ac.NewRoundFrame(b.UICorner-(b.UIPadding/2),'Squircle',{
                                            Size = UDim2.new(1,0,1,0),
                                            ThemeTag = {ImageColor3='Text'},
                                            ImageTransparency = 1,
                                            Name = 'UserIcon'
                                        },{
                                            ad('ImageLabel',{
                                            Image = r,
                                            BackgroundTransparency = 1,
                                            Size = UDim2.new(0,42,0,42),
                                            ThemeTag = {BackgroundColor3='Text'},
                                            BackgroundTransparency = 0.93
                                        },{
                                        ad('UICorner',{CornerRadius = UDim.new(1,0)})}),
                                        ad('Frame',{
                                            AutomaticSize = 'XY',
                                            BackgroundTransparency = 1
                                        },{
                                            ad('TextLabel',{
                                                Text = b.User.Anonymous and 'Venuz Hub' or game.Players.LocalPlayer.DisplayName,
                                                TextSize = 17,
                                                ThemeTag = {TextColor3 = 'Text'},
                                                FontFace = Font.new(ac.Font,Enum.FontWeight.SemiBold),
                                                AutomaticSize = 'Y',
                                                BackgroundTransparency = 1,
                                                Size = UDim2.new(1,-27,0,0),
                                                TextTruncate = 'AtEnd',
                                                TextXAlignment = 'Left'
                                            }),
                                            ad('TextLabel',{
                                                Text = b.User.Anonymous and '@venuzontop' or '@'.. game.Players.LocalPlayer.Name,
                                                TextSize = 15,
                                                TextTransparency = 0.6,
                                                ThemeTag = {TextColor3='Text'},
                                                FontFace = Font.new(ac.Font,Enum.FontWeight.Medium),
                                                AutomaticSize = 'Y',
                                                BackgroundTransparency = 1,
                                                Size = UDim2.new(1,-27,0,0),
                                                TextTruncate = 'AtEnd',
                                                TextXAlignment = 'Left'
                                            }),
                                            ad('UIListLayout',{
                                                Padding = UDim.new(0,4),
                                                HorizontalAlignment = 'Left'
                                            })
                                        }),
                                        ad('UIListLayout',{
                                            Padding = UDim.new(0,b.UIPadding),
                                            FillDirection = 'Horizontal',
                                            VerticalAlignment = 'Center'
                                        }),
                                        ad('UIPadding',{
                                            PaddingLeft = UDim.new(0,b.UIPadding/2),
                                            PaddingRight = UDim.new(0,b.UIPadding/2)
                                        })
                                    })
                                })

                                if b.User.Callback then 
                                    q.MouseButton1Click:Connect(function()
                                        b.User.Callback()
                                    end)
                                    q.MouseEnter:Connect(function()
                                        ae(q.UserIcon,0.04,{ImageTransparency=0.94}):Play()
                                    end)
                                    q.InputEnded:Connect(function()
                                        ae(q.UserIcon,0.04,{ImageTransparency=1}):Play()
                                    end)
                                end 
                            end 
                            
                            local r,s,t,u = 
                            ac.NewRoundFrame(99,'Squircle',{
                                ImageTransparency = 0.8,
                                ImageColor3 = Color3.new(1,1,1),
                                Size = UDim2.new(0,200,0,4),
                                Position = UDim2.new(0.5,0,1,4),
                                AnchorPoint = Vector2.new(0.5,0)
                            },{
                                ad('Frame',{
                                    Size = UDim2.new(1,12,1,12),
                                    BackgroundTransparency = 1,
                                    Position = UDim2.new(0.5,0,0.5,0),
                                    AnchorPoint = Vector2.new(0.5,0.5),
                                    Active = true,
                                    ZIndex = 99
                                })
                            }),
                            (ad('TextLabel',{
                                Text = b.Title,
                                FontFace = Font.new(ac.Font,Enum.FontWeight.SemiBold),
                                BackgroundTransparency = 1,
                                AutomaticSize = 'XY',
                                Name = 'Title',
                                TextXAlignment = 'Left',
                                TextSize = 16,
                                ThemeTag = {TextColor3='Text'}
                            }))
                            
                            b.UIElements.Main = ad('Frame',{
                                Size = b.Size,
                                Position = b.Position,
                                BackgroundTransparency = 1,
                                Parent = ag.Parent,
                                AnchorPoint = Vector2.new(0.5,0.5),
                                Active = true
                            },{
                                i,ac.NewRoundFrame(b.UICorner,'Squircle',{
                                    ImageTransparency = 1,
                                    Size = UDim2.new(1,0,1,0),
                                    AnchorPoint = Vector2.new(0.5,0.5),
                                    Position = UDim2.new(0.5,0,0.5,0),
                                    Name = 'Background',
                                    ThemeTag = {ImageColor3='Background'},
                                    ZIndex = -99
                                },{
                                    ad('ImageLabel',{
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(1,0,1,0),
                                        Image = b.Background,
                                        ImageTransparency = 1,
                                        ScaleType = 'Crop'
                                    },{
                                        ad('UICorner',{CornerRadius = UDim.new(0,b.UICorner)})}),
                                        ad('UIScale',{Scale = 0.95})}),h,c,d,e,f,r,
                                        ad('Frame',{
                                            Size = UDim2.new(1,0,1,0),
                                            BackgroundTransparency = 1,
                                            Name = 'Main',
                                            Visible = false,
                                            ZIndex = 97
                                        },{
                                            ad('UICorner',{CornerRadius=UDim.new(0,b.UICorner)}),
                                            b.UIElements.SideBarContainer,
                                            b.UIElements.MainBar,q,u,
                                            ad('Frame',{
                                                Size = UDim2.new(1,0,0,52),
                                                BackgroundTransparency = 1,
                                                BackgroundColor3 = Color3.fromRGB(50,50,50),
                                                Name = 'Topbar'
                                            },{t,
                                            ad('Frame',{
                                                AutomaticSize = 'X',
                                                Size = UDim2.new(0,0,1,0),
                                                BackgroundTransparency = 1,
                                                Name = 'Left'
                                            },{
                                                ad('UIListLayout',{
                                                    Padding = UDim.new(0,10),
                                                    SortOrder = 'LayoutOrder',
                                                    FillDirection = 'Horizontal',
                                                    VerticalAlignment = 'Center'
                                                }),
                                                ad('Frame',{
                                                    AutomaticSize = 'XY',
                                                    BackgroundTransparency = 1,
                                                    Name = 'Title',
                                                    Size = UDim2.new(0,0,1,0),
                                                    LayoutOrder = 2
                                                },{
                                                    ad('UIListLayout',{
                                                        Padding = UDim.new(0,0),
                                                        SortOrder = 'LayoutOrder',
                                                        FillDirection = 'Vertical',
                                                        VerticalAlignment = 'Top'
                                                    }),s}),
                                                    ad('UIPadding',{PaddingLeft = UDim.new(0,4)})}),
                                                    ad('Frame',{
                                                        AutomaticSize = 'XY',
                                                        BackgroundTransparency = 1,
                                                        Position = UDim2.new(1,0,0.5,0),
                                                        AnchorPoint = Vector2.new(1,0.5),
                                                        Name = 'Right'
                                                    },{
                                                        ad('UIListLayout',{
                                                            Padding = UDim.new(0,9),
                                                            FillDirection = 'Horizontal',
                                                            SortOrder = 'LayoutOrder'
                                                        })
                                                    }),
                                                    ad('UIPadding',{
                                                        PaddingTop = UDim.new(0,b.UIPadding),
                                                        PaddingLeft = UDim.new(0,b.UIPadding),
                                                        PaddingRight = UDim.new(0,8),
                                                        PaddingBottom = UDim.new(0,b.UIPadding)
                                                    })
                                                })
                                            })
                                        })
                                        
                                        function b.CreateTopbarButton(v,w,x,y)
                                            local z = ad('TextButton',{
                                                Size = UDim2.new(0,36,0,36),
                                                BackgroundTransparency = 1,
                                                LayoutOrder = y or 999,
                                                Parent = b.UIElements.Main.Main.Topbar.Right,
                                                ZIndex = 9999,
                                                ThemeTag = {BackgroundColor3='Text'},
                                                BackgroundTransparency = 1
                                            },{
                                                ad('UICorner',{CornerRadius=UDim.new(0,9)}),
                                                ad('ImageLabel',{
                                                    Image = ac.Icon(w)[1],
                                                    ImageRectOffset = ac.Icon(w)[2].ImageRectPosition,
                                                    ImageRectSize = ac.Icon(w)[2].ImageRectSize,
                                                    BackgroundTransparency = 1,
                                                    Size = UDim2.new(0,16,0,16),
                                                    ThemeTag = {ImageColor3='Text'},
                                                    AnchorPoint = Vector2.new(0.5,0.5),
                                                    Position = UDim2.new(0.5,0,0.5,0),
                                                    Active = false,
                                                    ImageTransparency = 0.2
                                                }
                                            )})
                                            
                                            b.TopBarButtons[100-y] = z 
                                            z.MouseButton1Click:Connect(function()
                                                x()
                                            end)
                                            
                                            z.MouseEnter:Connect(function()
                                                ae(z,0.15,{BackgroundTransparency=0.93}):Play()
                                                ae(z.ImageLabel,0.15,{ImageTransparency=0}):Play()
                                            end)
                                            
                                            z.MouseLeave:Connect(function()
                                                ae(z,0.1,{BackgroundTransparency=1}):Play()
                                                ae(z.ImageLabel,0.1,{ImageTransparency=0.2}):Play()
                                            end)
                                            return z 
                                        end 
                                        
                                        local v,w = (ac.Drag(b.UIElements.Main,{b.UIElements.Main.Main.Topbar,r.Frame},function(v,w)
                                            if v and w == r.Frame then 
                                                ae(r,0.1,{ImageTransparency=0.35}):Play()
                                            else 
                                                ae(r,0.2,{ImageTransparency=0.8}):Play()
                                            end 
                                        end))
                                        
                                        if not j then 
                                            w = ac.Drag(k)
                                        end 
                                        
                                        if b.Author then 
                                            ad('TextLabel',{
                                                Text = b.Author,
                                                FontFace = Font.new(ac.Font,Enum.FontWeight.Medium),
                                                BackgroundTransparency = 1,
                                                TextTransparency = 0.4,
                                                AutomaticSize = 'XY',
                                                Parent = b.UIElements.Main.Main.Topbar.Left.Title,
                                                TextXAlignment = 'Left',
                                                TextSize = 14,
                                                LayoutOrder = 2,
                                                ThemeTag = {TextColor3='Text'}
                                            })
                                        end 
                                        
                                        task.spawn(function()
                                            if b.Icon then 
                                                local x = ac.Image(b.Icon,b.Title,b.UICorner-4,b.Folder,'Window')
                                                x.Parent = b.UIElements.Main.Main.Topbar.Left 
                                                x.Size = UDim2.new(0,22,0,22)
                                                if o and ac.Icon(tostring(b.Icon))[1] then 
                                                    o.Image = ac.Icon(b.Icon)[1]
                                                    o.ImageRectOffset = ac.Icon(b.Icon)[2].ImageRectPosition 
                                                    o.ImageRectSize = ac.Icon(b.Icon)[2].ImageRectSize 
                                                end 
                                            else
                                                if o then
                                                o.Visible = false
                                                end
                                            end 
                                        end)
                                        
                                        function b.SetToggleKey(x,y)
                                            b.ToggleKey = y 
                                        end 
                                        
                                        function b.SetBackgroundImage(x,y)
                                            b.UIElements.Main.Background.ImageLabel.Image = y 
                                        end 
                                        
                                        local x,y,z,A,B = ac.Icon'minimize',(ac.Icon'maximize')
                                        B = b:CreateTopbarButton('maximize',function()
                                            local C = b.IsFullscreen 
                                            v:Set(C)
                                            if not C then 
                                                z = b.UIElements.Main.Position 
                                                A = b.UIElements.Main.Size 
                                                B.ImageLabel.Image = x[1]
                                                B.ImageLabel.ImageRectOffset = x[2].ImageRectPosition 
                                                B.ImageLabel.ImageRectSize = x[2].ImageRectSize 
                                                b.CanResize = false 
                                            else 
                                                B.ImageLabel.Image = y[1]
                                                B.ImageLabel.ImageRectOffset = y[2].ImageRectPosition 
                                                B.ImageLabel.ImageRectSize = y[2].ImageRectSize 
                                                b.CanResize = true 
                                            end 
                                            
                                            ae(b.UIElements.Main,0.45,{Size=C and A or UDim2.new(1,-20,1,-72)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                            ae(b.UIElements.Main,0.45,{Position=C and z or UDim2.new(0.5,0,0.5,26)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                            
                                            b.IsFullscreen = not C 
                                        end,998)
                                        
                                        b:CreateTopbarButton('minus',function()
                                            b:Close()
                                            task.spawn(function()
                                                task.wait(0.3)
                                                if not j and b.IsOpenButtonEnabled then 
                                                    k.Visible = true 
                                                end 
                                            end)
                                            
                                            local C = j and 'Press '..b.ToggleKey.Name..' to open the Window' or 'Click the Button to open the Window'
                                            
                                            if not b.IsOpenButtonEnabled then 
                                                af = true 
                                            end 
                                            if not af then 
                                                af = not af 
                                                ag.WindUI:Notify{
                                                    Title='Minimize',
                                                    Content = "You've closed the Window. "..C,Icon = 'eye-off',
                                                    Duration=5
                                                }
                                            end 
                                        end,997)
                                        
                                        function b.Open(C)
                                            task.spawn(function()
                                                b.Closed = false 
                                                ae(b.UIElements.Main.Background,0.25,{ImageTransparency = ag.Transparent and ag.WindUI.TransparencyValue or 0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                                ae(b.UIElements.Main.Background.ImageLabel,0.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                                ae(b.UIElements.Main.Background.UIScale,0.2,{Scale=1},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
                                                ae(i,0.25,{ImageTransparency=0.7},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                                if h then 
                                                    ae(h,0.25,{Transparency=0.8},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                                end 

                                                b.CanDropdown = true 
                                                b.UIElements.Main.Visible = true 
                                                task.wait(0.1)
                                                b.UIElements.Main.Main.Visible = true 
                                            end)
                                        end 
                                        
                                        function b.Close(C)
                                            local D = {}
                                            b.UIElements.Main.Main.Visible = false 
                                            b.CanDropdown = false 
                                            b.Closed = true 
                                            ae(b.UIElements.Main.Background,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                            ae(b.UIElements.Main.Background.UIScale,0.19,{Scale=0.95},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                            ae(b.UIElements.Main.Background.ImageLabel,0.2,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                            ae(i,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                            if h then 
                                                ae(h,0.25,{Transparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                            end 
                                            
                                            task.spawn(function()
                                                task.wait(0.25)
                                                b.UIElements.Main.Visible = false 
                                            end)
                                            
                                            function D.Destroy(E)
                                                b.Destroyed = true 
                                                task.wait(0.25)
                                                ag.Parent.Parent:Destroy()
                                            end 
                                            return D 
                                        end 
                                        
                                        function b.ToggleTransparency(C,D)
                                            ag.Transparent = D 
                                            ag.WindUI.Transparent = D 
                                            ag.WindUI.Window.Transparent = D 
                                            b.UIElements.Main.Background.ImageTransparency = D and ag.WindUI.TransparencyValue or 0 
                                            b.UIElements.Main.Background.ImageLabel.ImageTransparency = D and ag.WindUI.TransparencyValue or 0 
                                            b.UIElements.MainBar.Background.ImageTransparency = D and 0.97 or 0.93 
                                        end 
                                        
                                        if not j and b.IsOpenButtonEnabled then 
                                            n.TextButton.MouseButton1Click:Connect(function()
                                                k.Visible = false 
                                                b:Open()
                                            end)
                                        end 
                                        
                                        aa.InputBegan:Connect(function(C,D)
                                            if D then 
                                                return 
                                            end 
                                            if C.KeyCode == b.ToggleKey then 
                                                if b.Closed then 
                                                    b:Open()
                                                else 
                                                    b:Close()
                                                end 
                                            end 
                                        end)
                                        
                                        task.spawn(function()
                                            b:Open()
                                        end)
                                        
                                        function b.EditOpenButton(C,D)
                                            if n and n.Parent ~= nil then 
                                                local E = {
                                                    Title = D.Title,
                                                    Icon = D.Icon or b.Icon,
                                                    Enabled = D.Enabled,
                                                    Position = D.Position,
                                                    Draggable = D.Draggable,
                                                    OnlyMobile = D.OnlyMobile,
                                                    CornerRadius = D.CornerRadius or UDim.new(1,0),
                                                    StrokeThickness = D.StrokeThickness or 2,
                                                    Color = D.Color or ColorSequence.new(Color3.fromHex'40c9ff',Color3.fromHex'e81cff')
                                                }
                                                
                                                if E.Enabled == false then 
                                                    b.IsOpenButtonEnabled = false 
                                                end 
                                                
                                                if E.Draggable == false and OpenButtonDrag and OpenButtonDivider then 
                                                    OpenButtonDrag.Visible = E.Draggable 
                                                    OpenButtonDivider.Visible = E.Draggable 
                                                    if w then 
                                                        w:Set(E.Draggable)
                                                    end 
                                                end 
                                                
                                                if E.Position and k then 
                                                    k.Position = E.Position 
                                                end 
                                                
                                                local F = aa.KeyboardEnabled or not aa.TouchEnabled
                                                n.Visible = not E.OnlyMobile or not F 
                                                
                                                if not n.Visible then 
                                                    return 
                                                end 
                                                
                                                if OpenButtonTitle then 
                                                    if E.Title then 
                                                        OpenButtonTitle.Text = E.Title 
                                                    elseif E.Title == nil then 
                                                    end 
                                                end 
                                                
                                                if ac.Icon(E.Icon) and o then 
                                                    o.Visible = true 
                                                    o.Image = ac.Icon(E.Icon)[1]
                                                    o.ImageRectOffset = ac.Icon(E.Icon)[2].ImageRectPosition 
                                                    o.ImageRectSize = ac.Icon(E.Icon)[2].ImageRectSize 
                                                end 
                                                
                                                n.UIStroke.UIGradient.Color = E.Color 
                                                if p then 
                                                    p.UIGradient.Color = E.Color 
                                                end 
                                                
                                                n.UICorner.CornerRadius = E.CornerRadius 
                                                n.TextButton.UICorner.CornerRadius = UDim.new(E.CornerRadius.Scale,E.CornerRadius.Offset-4)
                                                n.UIStroke.Thickness = E.StrokeThickness 
                                            end 
                                        end 
                                        
                                        local C = a.load's'
                                        local D = C.Init(b,ag.WindUI,ag.Parent.Parent.ToolTips,g)

                                        D:OnChange(function(E)
                                            b.CurrentTab = E 
                                        end)
                                        
                                        b.TabModule = C 
                                        
                                        function b.Tab(E,F)
                                            F.Parent = b.UIElements.SideBar.Frame 
                                            return D.New(F)
                                        end 
                                        
                                        function b.SelectTab(E,F)
                                            D:SelectTab(F)
                                        end 
                                        
                                        function b.Divider(E)
                                            local F = ad('Frame',{
                                                Size = UDim2.new(1,0,0,1),Position = UDim2.new(0.5,0,0,0),
                                                AnchorPoint = Vector2.new(0.5,0),
                                                BackgroundTransparency = 0.9,
                                                ThemeTag = {BackgroundColor3='Text'}
                                            })
                                            ad('Frame',{
                                                Parent = b.UIElements.SideBar.Frame,
                                                Size = UDim2.new(1,-7,0,1),
                                                BackgroundTransparency = 1
                                            },{
                                                F
                                            })
                                            end 
                                            
                                            local E = a.load'e'.Init(b)

                                            function b.Dialog(F,G)
                                                local H,I = {
                                                    Title = G.Title or 'Dialog',
                                                    Content = G.Content,
                                                    Buttons = G.Buttons or{}
                                                },E.Create()
                                                
                                                local J,K = (ad('Frame',{
                                                    Size = UDim2.new(1,0,0,0),
                                                    AutomaticSize = 'Y',
                                                    BackgroundTransparency = 1,
                                                    Parent = I.UIElements.Main
                                                },{
                                                    ad('UIListLayout',{
                                                        FillDirection = 'Horizontal',
                                                        Padding = UDim.new(0,I.UIPadding),
                                                        VerticalAlignment = 'Center'
                                                    })
                                                }))
                                                
                                                if G.Icon and ac.Icon(G.Icon)[2] then 
                                                    K = ad('ImageLabel',{
                                                        Image = ac.Icon(G.Icon)[1],
                                                        ImageRectSize = ac.Icon(G.Icon)[2].ImageRectSize,
                                                        ImageRectOffset = ac.Icon(G.Icon)[2].ImageRectPosition,
                                                        ThemeTag = {ImageColor3='Text'},
                                                        Size = UDim2.new(0,26,0,26),
                                                        BackgroundTransparency = 1,
                                                        Parent = J
                                                    })
                                                end 
                                                
                                                I.UIElements.UIListLayout = ad('UIListLayout',{
                                                    Padding = UDim.new(0,18.4),
                                                    FillDirection = 'Vertical',
                                                    HorizontalAlignment = 'Left',
                                                    Parent = I.UIElements.Main
                                                })

                                                ad('UISizeConstraint',{
                                                    MinSize = Vector2.new(180,20),
                                                    MaxSize = Vector2.new(400,math.huge),
                                                    Parent = I.UIElements.Main
                                                })

                                                I.UIElements.Title = ad('TextLabel',{
                                                    Text = H.Title,
                                                    TextSize = 19,
                                                    FontFace = Font.new(ac.Font,Enum.FontWeight.SemiBold),
                                                    TextXAlignment = 'Left',
                                                    TextWrapped = true,
                                                    RichText = true,
                                                    Size = UDim2.new(1,K and-26-I.UIPadding or 0,0,0),
                                                    AutomaticSize = 'Y',
                                                    ThemeTag = {TextColor3='Text'},
                                                    BackgroundTransparency = 1,
                                                    Parent = J
                                                })
                                                
                                                if H.Content then 
                                                    ad('TextLabel',{
                                                        Text = H.Content,
                                                        TextSize = 18,
                                                        TextTransparency = 0.4,
                                                        TextWrapped = true,
                                                        RichText = true,
                                                        FontFace = Font.new(ac.Font,Enum.FontWeight.Medium),
                                                        TextXAlignment = 'Left',
                                                        Size = UDim2.new(1,0,0,0),
                                                        AutomaticSize = 'Y',
                                                        LayoutOrder = 2,
                                                        ThemeTag = {TextColor3='Text'},
                                                        BackgroundTransparency = 1,
                                                        Parent = I.UIElements.Main
                                                    })
                                                end 
                                                
                                                local L = ad('UIListLayout',{
                                                    Padding = UDim.new(0,10),
                                                    FillDirection = 'Horizontal',
                                                    HorizontalAlignment = 'Right'
                                                })
                                                
                                                local M,N,O = ad('Frame',{
                                                    Size = UDim2.new(1,0,0,40),
                                                    AutomaticSize = 'None',
                                                    BackgroundTransparency = 1,
                                                    Parent = I.UIElements.Main,
                                                    LayoutOrder = 4
                                                },{
                                                    L
                                                }),a.load'd'.Button,{}
                                                
                                                for P,Q in next,H.Buttons do 
                                                    local R = N(Q.Title,Q.Icon,Q.Callback,Q.Variant,M,I)
                                                    table.insert(O,R)
                                                end 
                                                
                                                local R = function()
                                                    local R,S = L.AbsoluteContentSize.X,M.AbsoluteSize.X-1 
                                                    if R > S then 
                                                        L.FillDirection = 'Vertical'
                                                        L.HorizontalAlignment = 'Right'
                                                        L.VerticalAlignment = 'Bottom'
                                                        M.AutomaticSize = 'Y'
                                                        for T,U in ipairs(O)do 
                                                            U.Size = UDim2.new(1,0,0,40)
                                                            U.AutomaticSize = 'None'
                                                        end 
                                                    else 
                                                        L.FillDirection = 'Horizontal'
                                                        L.HorizontalAlignment = 'Right'
                                                        L.VerticalAlignment = 'Center'
                                                        M.AutomaticSize = 'None'
                                                        for T,U in ipairs(O) do 
                                                            U.Size = UDim2.new(0,0,1,0)
                                                            U.AutomaticSize = 'X'
                                                        end 
                                                    end 
                                                end 
                                                
                                                I.UIElements.Main:GetPropertyChangedSignal'AbsoluteSize':Connect(R)
                                                R()
                                                I:Open()
                                                return I 
                                            end 
                                            
                                            b:CreateTopbarButton('x',function()
                                                ae(b.UIElements.Main,0.35,{Position=UDim2.new(0.5,0,0.5,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
                                                b:Dialog{
                                                    Icon = 'trash-2',
                                                    Title = 'Close Window',
                                                    Content = [[Do you want to close this window? You will not be able to open it again.]],
                                                    Buttons = {
                                                        {
                                                            Title = 'Cancel',
                                                            Callback = function()end,
                                                            Variant = 'Secondary'
                                                        },{
                                                            Title = 'Close Window',
                                                            Callback = function()
                                                                b:Close():Destroy()
                                                            end,
                                                            Variant = 'Primary'
                                                        }}}
                                                    end,999)
                                                    
                                                    local F = function(F)
                                                        if b.CanResize then 
                                                            isResizing = true 
                                                            e.Active = true 
                                                            initialSize = b.UIElements.Main.Size 
                                                            initialInputPosition = F.Position 

                                                            ae(e,0.2,{ImageTransparency=0.65}):Play()
                                                            ae(e.ImageLabel,0.2,{ImageTransparency=0}):Play()
                                                            ae(d.ImageLabel,0.1,{ImageTransparency=0.35}):Play()

                                                            F.Changed:Connect(function()
                                                                if F.UserInputState == Enum.UserInputState.End then 
                                                                    isResizing = false 
                                                                    e.Active = false 
                                                                    ae(e,0.2,{ImageTransparency=1}):Play()
                                                                    ae(e.ImageLabel,0.2,{ImageTransparency=1}):Play()
                                                                    ae(d.ImageLabel,0.2,{ImageTransparency=0.8}):Play()
                                                                end 
                                                            end)
                                                        end 
                                                    end 
                                                    
                                                    d.InputBegan:Connect(function(G)
                                                        if G.UserInputType == Enum.UserInputType.MouseButton1 or G.UserInputType == Enum.UserInputType.Touch then 
                                                            if b.CanResize then 
                                                                F(G)
                                                            end 
                                                        end 
                                                    end)
                                                    
                                                    aa.InputChanged:Connect(function(G)
                                                        if G.UserInputType == Enum.UserInputType.MouseMovement or G.UserInputType == Enum.UserInputType.Touch then 
                                                            if isResizing and b.CanResize then 
                                                                local H = G.Position - initialInputPosition 
                                                                local I = UDim2.new(0,initialSize.X.Offset+H.X*2,0,initialSize.Y.Offset+H.Y*2)
                                                                ae(b.UIElements.Main,0.06,{Size=UDim2.new(0,math.clamp(I.X.Offset,480,700),0,math.clamp(I.Y.Offset,350,520))}):Play()
                                                            end 
                                                        end 
                                                    end)
                                                    
                                                    local G,H = a.load't',false 

                                                    SearchButton=b:CreateTopbarButton('search',function()
                                                        if H then 
                                                            return 
                                                        end 
                                                        
                                                        G.new(b.TabModule,b.UIElements.Main,function()
                                                            H = false 
                                                            b.CanResize = true 
                                                            ae(f,0.1,{ImageTransparency=1}):Play()
                                                            f.Active = false 
                                                        end)
                                                        
                                                        ae(f,0.1,{ImageTransparency=0.65}):Play()
                                                        f.Active = true 
                                                        H = true 
                                                        b.CanResize = false 
                                                    end,996)
                                                    return b 
                                                end 
                                            end 
                                        end 
                                        
                                        local aa,ab,ac = {
                                            Window = nil,
                                            Theme = nil,
                                            Creator = a.load'a',
                                            Themes = a.load'b',
                                            Transparent = false,
                                            TransparencyValue = 0.15
                                        }, game:GetService'RunService',a.load'f'
                                        
                                        local ad,ae = aa.Themes,aa.Creator 
                                        local af,ag = ae.New,ae.Tween

                                        ae.Themes = ad 

                                        local b = game:GetService'Players' and game:GetService'Players'.LocalPlayer or nil 

                                        aa.Themes = ad 

                                        local c,d = protectgui or (syn and syn.protect_gui) or function()end,gethui and gethui() or game.CoreGui 
                                        
                                        aa.ScreenGui = af('ScreenGui',{
                                            Name = 'WindUI',
                                            Parent = d,
                                            IgnoreGuiInset = true,
                                            ScreenInsets = 'None'
                                        },
                                        {
                                        af('Folder',{Name = 'Window'}),
                                        af('Folder',{Name='Dropdowns'}),
                                        af('Folder',{Name='KeySystem'}),
                                        af('Folder',{Name='Popups'}),
                                        af('Folder',{Name='ToolTips'})
                                    })
                                    
                                    aa.NotificationGui = af('ScreenGui',{
                                        Name = 'WindUI-Notifications',
                                        Parent = d,
                                        IgnoreGuiInset = true
                                    })
                                    
                                    c(aa.ScreenGui)
                                    c(aa.NotificationGui)
                                    math.clamp(aa.TransparencyValue,0,0.4)
                                    
                                    local e = a.load'g'
                                    local f = e.Init(aa.NotificationGui)
                                    
                                    function aa.Notify(g,h)
                                        h.Holder = f.Frame 
                                        h.Window = aa.Window 
                                        h.WindUI = aa return 
                                        e.New(h)
                                    end 
                                    
                                    function aa.SetNotificationLower(g,h)
                                        f.SetLower(h)
                                    end 
                                    
                                    function aa.SetFont(g,h)
                                        ae.UpdateFont(h)
                                    end 
                                    
                                    function aa.AddTheme(g,h)
                                        ad[h.Name] = h 
                                        return h 
                                    end 
                                    
                                    function aa.SetTheme(g,h)
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
                                    
                                    function aa.Popup(g,h)
                                        h.WindUI = aa 
                                        return a.load'h'.new(h)
                                    end 
                                    
                                    function aa.CreateWindow(g,h)
                                        local i = a.load'u'
                                        if not isfolder'WindUI' then 
                                            makefolder'WindUI' end 
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
                                            
                                            local j,k = true,ad[h.Theme or'Dark']
                                            aa.Theme = k 
                                            ae.SetTheme(k)
                                            local n = b.Name or 'Unknown' 
                                            if h.KeySystem then 
                                                j = false 
                                                if h.KeySystem.SaveKey and h.Folder then 
                                                    if isfile(h.Folder..'/'..n..'.key') then 
                                                        local o = tostring(h.KeySystem.Key) == tostring(readfile(h.Folder..'/'..n..'.key'))
                                                        if type(h.KeySystem.Key) == 'table' then 
                                                            o = table.find(h.KeySystem.Key,readfile(h.Folder..'/'..n..'.key'))
                                                        end 
                                                        
                                                        if o then 
                                                            j = true 
                                                        end 
                                                    else 
                                                        ac.new(h,n,function(o)
                                                            j = o 
                                                        end)
                                                    end 
                                                else 
                                                    ac.new(h,n,function(o)
                                                        j = o 
                                                    end)
                                                end 
                                                
                                                repeat task.wait()until j 
                                            end 
                                            
                                            local o = i(h)
                                            aa.Transparent = h.Transparent 
                                            aa.Window = o 
                                            return o 
                                        end 
                                        return aa
