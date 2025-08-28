local NotificationLibrary = {
    _notifications = {},
    _theme = {
        -- สีพื้นฐานที่นุ่มนวลและสวยงาม
        background = "rbxassetid://9924336841",
        primaryColor = Color3.fromRGB(30, 32, 45),
        successColor = Color3.fromRGB(75, 196, 140),
        errorColor = Color3.fromRGB(242, 110, 140),
        warningColor = Color3.fromRGB(255, 204, 88),
        infoColor = Color3.fromRGB(116, 177, 255),
        textColor = Color3.fromRGB(250, 250, 255),
        titleColor = Color3.fromRGB(255, 255, 255),
        secondaryTextColor = Color3.fromRGB(200, 205, 220),
        
        -- มุมโค้งที่นุ่มนวล
        cornerRadius = UDim.new(0, 16),
        iconSize = UDim2.new(0, 28, 0, 28),
        font = Enum.Font.GothamSemibold,
        textFont = Enum.Font.Gotham,
        closeIcon = "rbxassetid://6031094677",
        mobileScale = 0.85,
        closeButtonSize = UDim2.new(0, 26, 0, 26),
        
        -- เอฟเฟกต์ที่สวยงาม
        showStroke = true,
        strokeColor = Color3.fromRGB(255, 255, 255),
        strokeTransparency = 0.9,
        strokeThickness = 1.5,
        useBackgroundColor = true,
        backgroundTransparency = 0.2,
        shadowColor = Color3.fromRGB(0, 0, 0),
        shadowTransparency = 0.7,
        
        -- Progress bar ที่สวยงาม
        progressBarColor = Color3.fromRGB(255, 255, 255),
        progressBarTransparency = 0.2,
        progressBarHeight = 4,
        progressBarGlow = true,
        
        -- Gradient effects
        useGradient = true,
        gradientTransparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.1),
            NumberSequenceKeypoint.new(1, 0.4)
        })
    },
    _settings = {
        duration = 6,
        position = "BottomRight",
        maxNotifications = 4,
        spacing = 16,
        fadeTime = 0.5,
        slideDistance = 30,
        scaleEffect = true,
        bounceEffect = true,
        glowEffect = true
    },
    _icons = {
        info = "rbxassetid://9405926389",
        success = "rbxassetid://11157772247", 
        error = "rbxassetid://9734956085",
        warning = "rbxassetid://85147473315465"
    }
}

function NotificationLibrary:_isMobile()
    return game:GetService("UserInputService").TouchEnabled
end

function NotificationLibrary:_init()
    if not self._container then
        self._container = Instance.new("ScreenGui")
        self._container.Name = "NotificationLibrary"
        self._container.ResetOnSpawn = false
        self._container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        self._container.Parent = game:GetService("CoreGui")
        
        if self:_isMobile() then
            self._container.Enabled = false
            local mobileUI = Instance.new("ScreenGui")
            mobileUI.Name = "NotificationLibraryMobile"
            mobileUI.ResetOnSpawn = false
            mobileUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            mobileUI.Parent = game:GetService("CoreGui")
            self._mobileContainer = mobileUI
        end
    end
end

function NotificationLibrary:_getNotificationSize()
    if self:_isMobile() then
        return UDim2.new(0.92, 0, 0, 95 * self._theme.mobileScale)
    else
        return UDim2.new(0, 360, 0, 85)
    end
end

function NotificationLibrary:_createNotificationFrame()
    local container = Instance.new("Frame")
    container.BackgroundTransparency = 1
    container.Size = self:_getNotificationSize()
    container.ClipsDescendants = false
    container.ZIndex = 100
    
    local notification = Instance.new("Frame")
    notification.Name = "MainFrame"
    notification.BackgroundColor3 = self._theme.primaryColor
    notification.BackgroundTransparency = self._theme.useBackgroundColor and 0.1 or 1
    notification.Size = UDim2.new(1, 0, 1, 0)
    notification.ClipsDescendants = true
    notification.ZIndex = 101
    notification.Parent = container
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = self._theme.cornerRadius
    uiCorner.Parent = notification
    
    -- Gradient background
    if self._theme.useGradient then
        local gradient = Instance.new("UIGradient")
        gradient.Transparency = self._theme.gradientTransparency
        gradient.Rotation = 45
        gradient.Parent = notification
    end
    
    -- Stroke ที่สวยงาม
    if self._theme.showStroke then
        local uiStroke = Instance.new("UIStroke")
        uiStroke.Color = self._theme.strokeColor
        uiStroke.Thickness = self._theme.strokeThickness
        uiStroke.Transparency = self._theme.strokeTransparency
        uiStroke.Parent = notification
    end
    
    -- Background image
    local bgImage = Instance.new("ImageLabel")
    bgImage.Name = "Background"
    bgImage.Image = self._theme.background
    bgImage.Size = UDim2.new(1, 0, 1, 0)
    bgImage.BackgroundTransparency = 1
    bgImage.ScaleType = Enum.ScaleType.Crop
    bgImage.ImageTransparency = self._theme.backgroundTransparency
    bgImage.ZIndex = 102
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = self._theme.cornerRadius
    bgCorner.Parent = bgImage
    
    bgImage.Parent = notification
    
    return container
end

function NotificationLibrary:_createGlowEffect(parent, color)
    if not self._settings.glowEffect then return end
    
    local glow = Instance.new("Frame")
    glow.Name = "Glow"
    glow.Size = UDim2.new(1, 4, 1, 4)
    glow.Position = UDim2.new(0, -2, 0, -2)
    glow.BackgroundColor3 = color
    glow.BackgroundTransparency = 0.9
    glow.ZIndex = 98
    glow.Parent = parent
    
    local glowCorner = Instance.new("UICorner")
    glowCorner.CornerRadius = UDim.new(0, self._theme.cornerRadius.Offset + 2)
    glowCorner.Parent = glow
    
    -- Glow animation
    local glowTween = game:GetService("TweenService"):Create(
        glow,
        TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        {BackgroundTransparency = 0.95}
    )
    glowTween:Play()
    
    return glow
end

function NotificationLibrary:_createContent(parent, notificationType)
    local mainFrame = parent:FindFirstChild("MainFrame")
    
    local content = Instance.new("Frame")
    content.BackgroundTransparency = 1
    content.Size = UDim2.new(1, -24, 1, -24)
    content.Position = UDim2.new(0, 12, 0, 12)
    content.ZIndex = 103
    content.Parent = mainFrame
    
    -- Icon frame with glow effect
    local iconFrame = Instance.new("Frame")
    iconFrame.BackgroundTransparency = 1
    iconFrame.Size = UDim2.new(0, 45, 1, 0)
    iconFrame.ZIndex = 104
    iconFrame.Parent = content
    
    local iconBg = Instance.new("Frame")
    iconBg.Size = UDim2.new(0, 36, 0, 36)
    iconBg.AnchorPoint = Vector2.new(0.5, 0.5)
    iconBg.Position = UDim2.new(0.5, 0, 0.5, 0)
    iconBg.BackgroundTransparency = 0.85
    iconBg.ZIndex = 105
    iconBg.Parent = iconFrame
    
    -- Set icon background color based on type
    local iconColor = self._theme.infoColor
    if notificationType == "success" then iconColor = self._theme.successColor
    elseif notificationType == "error" then iconColor = self._theme.errorColor
    elseif notificationType == "warning" then iconColor = self._theme.warningColor end
    iconBg.BackgroundColor3 = iconColor
    
    local iconBgCorner = Instance.new("UICorner")
    iconBgCorner.CornerRadius = UDim.new(0, 18)
    iconBgCorner.Parent = iconBg
    
    local icon = Instance.new("ImageLabel")
    icon.Size = self._theme.iconSize
    icon.AnchorPoint = Vector2.new(0.5, 0.5)
    icon.Position = UDim2.new(0.5, 0, 0.5, 0)
    icon.BackgroundTransparency = 1
    icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    icon.ZIndex = 106
    icon.Parent = iconBg
    
    -- Text container
    local textFrame = Instance.new("Frame")
    textFrame.BackgroundTransparency = 1
    textFrame.Position = UDim2.new(0, 55, 0, 0)
    textFrame.Size = UDim2.new(1, -85, 1, 0)
    textFrame.ZIndex = 104
    textFrame.Parent = content
    
    local title = Instance.new("TextLabel")
    title.Font = self._theme.font
    title.TextColor3 = self._theme.titleColor
    title.TextSize = self:_isMobile() and 15 or 17
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextYAlignment = Enum.TextYAlignment.Top
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 0, 28)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "Title"
    title.ZIndex = 105
    title.Parent = textFrame
    
    local message = Instance.new("TextLabel")
    message.Font = self._theme.textFont
    message.TextColor3 = self._theme.secondaryTextColor
    message.TextSize = self:_isMobile() and 13 or 14
    message.TextXAlignment = Enum.TextXAlignment.Left
    message.TextYAlignment = Enum.TextYAlignment.Top
    message.BackgroundTransparency = 1
    message.Size = UDim2.new(1, 0, 1, -28)
    message.Position = UDim2.new(0, 0, 0, 28)
    message.TextWrapped = true
    message.Text = "Message"
    message.ZIndex = 105
    message.Parent = textFrame
    
    -- Close button with hover effect
    local closeBtn = Instance.new("ImageButton")
    closeBtn.Image = self._theme.closeIcon
    closeBtn.Size = self._theme.closeButtonSize
    closeBtn.Position = UDim2.new(1, -30, 0, 8)
    closeBtn.BackgroundTransparency = 1
    closeBtn.ImageColor3 = self._theme.secondaryTextColor
    closeBtn.ZIndex = 106
    closeBtn.Parent = content
    
    -- Hover effect for close button
    closeBtn.MouseEnter:Connect(function()
        local hoverTween = game:GetService("TweenService"):Create(
            closeBtn,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad),
            {ImageColor3 = self._theme.titleColor, Size = self._theme.closeButtonSize + UDim2.new(0, 2, 0, 2)}
        )
        hoverTween:Play()
    end)
    
    closeBtn.MouseLeave:Connect(function()
        local leaveTween = game:GetService("TweenService"):Create(
            closeBtn,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad),
            {ImageColor3 = self._theme.secondaryTextColor, Size = self._theme.closeButtonSize}
        )
        leaveTween:Play()
    end)
    
    -- Progress bar container
    local progressBarContainer = Instance.new("Frame")
    progressBarContainer.Name = "ProgressBarContainer"
    progressBarContainer.Size = UDim2.new(1, 0, 0, self._theme.progressBarHeight)
    progressBarContainer.Position = UDim2.new(0, 0, 1, -self._theme.progressBarHeight)
    progressBarContainer.BackgroundTransparency = 1
    progressBarContainer.ClipsDescendants = true
    progressBarContainer.ZIndex = 104
    progressBarContainer.Parent = mainFrame
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = self._theme.cornerRadius
    containerCorner.Parent = progressBarContainer
    
    local progressBar = Instance.new("Frame")
    progressBar.Name = "ProgressBar"
    progressBar.Size = UDim2.new(1, 0, 1, 0)
    progressBar.BackgroundColor3 = iconColor
    progressBar.BackgroundTransparency = self._theme.progressBarTransparency
    progressBar.BorderSizePixel = 0
    progressBar.ZIndex = 105
    progressBar.Parent = progressBarContainer
    
    -- Glow effect for progress bar
    if self._theme.progressBarGlow then
        local progressGlow = Instance.new("Frame")
        progressGlow.Size = UDim2.new(1, 0, 1, 2)
        progressGlow.Position = UDim2.new(0, 0, 0, -1)
        progressGlow.BackgroundColor3 = iconColor
        progressGlow.BackgroundTransparency = 0.7
        progressGlow.ZIndex = 104
        progressGlow.Parent = progressBarContainer
    end
    
    return {
        frame = parent,
        mainFrame = mainFrame,
        icon = icon,
        iconBg = iconBg,
        title = title,
        message = message,
        closeBtn = closeBtn,
        progressBar = progressBar,
        progressBarContainer = progressBarContainer
    }
end

function NotificationLibrary:_calculatePosition(index)
    local isMobile = self:_isMobile()
    local position = self._settings.position
    local spacing = self._settings.spacing
    local height = isMobile and (95 * self._theme.mobileScale) or 85
    
    if position == "BottomCenter" then
        return UDim2.new(0.5, 0, 1, -30 - (index-1)*(height + spacing))
    else -- BottomRight
        if isMobile then
            return UDim2.new(1, -15, 1, -30 - (index-1)*(height + spacing))
        else
            return UDim2.new(1, -25, 1, -30 - (index-1)*(height + spacing))
        end
    end
end

-- Enhanced animation with bounce and scale effects
function NotificationLibrary:_animateIn(notification)
    local startPos = notification.frame.Position
    local slideOffset = self._settings.slideDistance
    
    -- Initial state
    notification.frame.Position = startPos + UDim2.new(0, slideOffset, 0, slideOffset)
    notification.mainFrame.BackgroundTransparency = 1
    notification.mainFrame.Background.ImageTransparency = 1
    
    if self._settings.scaleEffect then
        notification.mainFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
        notification.mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        notification.mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    end
    
    -- Main entrance animation with bounce
    local tweenInfo = TweenInfo.new(
        self._settings.fadeTime,
        self._settings.bounceEffect and Enum.EasingStyle.Back or Enum.EasingStyle.Quint,
        Enum.EasingDirection.Out
    )
    
    local tweenIn = game:GetService("TweenService"):Create(
        notification.frame,
        tweenInfo,
        {Position = startPos}
    )
    
    local tweenScale = game:GetService("TweenService"):Create(
        notification.mainFrame,
        tweenInfo,
        {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = self._theme.useBackgroundColor and 0.1 or 1
        }
    )
    
    local tweenBg = game:GetService("TweenService"):Create(
        notification.mainFrame.Background,
        tweenInfo,
        {ImageTransparency = self._theme.backgroundTransparency}
    )
    
    tweenIn:Play()
    tweenScale:Play()
    tweenBg:Play()
    
    -- Icon bounce animation
    task.wait(0.2)
    local iconBounce = game:GetService("TweenService"):Create(
        notification.iconBg,
        TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 36, 0, 36)}
    )
    notification.iconBg.Size = UDim2.new(0, 28, 0, 28)
    iconBounce:Play()
end

function NotificationLibrary:_animateOut(notification, callback)
    local slideOffset = self._settings.slideDistance
    local tweenInfo = TweenInfo.new(
        self._settings.fadeTime * 0.8,
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.In
    )
    
    local tweenOut = game:GetService("TweenService"):Create(
        notification.frame,
        tweenInfo,
        {
            Position = notification.frame.Position + UDim2.new(0, slideOffset, 0, slideOffset * 0.5),
        }
    )
    
    local tweenScale = game:GetService("TweenService"):Create(
        notification.mainFrame,
        tweenInfo,
        {
            Size = UDim2.new(0.9, 0, 0.9, 0),
            BackgroundTransparency = 1
        }
    )
    
    local tweenBg = game:GetService("TweenService"):Create(
        notification.mainFrame.Background,
        tweenInfo,
        {ImageTransparency = 1}
    )
    
    tweenOut:Play()
    tweenScale:Play()
    tweenBg:Play()
    
    tweenOut.Completed:Connect(function()
        notification.frame:Destroy()
        if callback then callback() end
    end)
end

function NotificationLibrary:_updatePositions()
    for i, notif in ipairs(self._notifications) do
        local newPos = self:_calculatePosition(i)
        local positionTween = game:GetService("TweenService"):Create(
            notif.frame,
            TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {Position = newPos}
        )
        positionTween:Play()
    end
end

function NotificationLibrary:Notify(options)
    self:_init()
    
    options = options or {}
    local title = options.Title or "การแจ้งเตือน"
    local message = options.Message or ""
    local duration = options.Duration or self._settings.duration
    local notificationType = options.Type or "info"
    local callback = options.Callback
    
    local container = self:_isMobile() and self._mobileContainer or self._container
    
    if #self._notifications >= self._settings.maxNotifications then
        local oldest = table.remove(self._notifications, 1)
        self:_animateOut(oldest)
    end
    
    local frame = self:_createNotificationFrame()
    frame.AnchorPoint = Vector2.new(
        self._settings.position == "BottomCenter" and 0.5 or 1,
        1
    )
    frame.Position = self:_calculatePosition(#self._notifications + 1)
    frame.Parent = container
    
    -- Create glow effect
    local glowColor = self._theme.infoColor
    if notificationType == "success" then glowColor = self._theme.successColor
    elseif notificationType == "error" then glowColor = self._theme.errorColor
    elseif notificationType == "warning" then glowColor = self._theme.warningColor end
    
    self:_createGlowEffect(frame, glowColor)
    
    local notification = self:_createContent(frame, notificationType)
    notification.title.Text = title
    notification.message.Text = message
    notification.icon.Image = self._icons[notificationType:lower()] or self._icons.info
    
    -- Apply theme colors
    local mainFrame = notification.mainFrame
    if notificationType == "success" then
        mainFrame.BackgroundColor3 = self._theme.successColor
    elseif notificationType == "error" then
        mainFrame.BackgroundColor3 = self._theme.errorColor
    elseif notificationType == "warning" then
        mainFrame.BackgroundColor3 = self._theme.warningColor
    else
        mainFrame.BackgroundColor3 = self._theme.infoColor
    end
    
    self:_animateIn(notification)
    table.insert(self._notifications, notification)
    
    -- Close button functionality
    notification.closeBtn.MouseButton1Click:Connect(function()
        self:_animateOut(notification, function()
            for i, v in ipairs(self._notifications) do
                if v == notification then
                    table.remove(self._notifications, i)
                    break
                end
            end
            self:_updatePositions()
            if callback then callback() end
        end)
    end)
    
    -- Progress bar animation
    if duration > 0 then
        local progressTween = game:GetService("TweenService"):Create(
            notification.progressBar,
            TweenInfo.new(duration, Enum.EasingStyle.Linear),
            {Size = UDim2.new(0, 0, 1, 0)}
        )
        progressTween:Play()
    else
        notification.progressBarContainer.Visible = false
    end
    
    -- Auto close
    if duration > 0 then
        task.delay(duration, function()
            if notification.frame and notification.frame.Parent then
                self:_animateOut(notification, function()
                    for i, v in ipairs(self._notifications) do
                        if v == notification then
                            table.remove(self._notifications, i)
                            break
                        end
                    end
                    self:_updatePositions()
                    if callback then callback() end
                end)
            end
        end)
    end
    
    return {
        Close = function()
            if notification.frame and notification.frame.Parent then
                self:_animateOut(notification, function()
                    for i, v in ipairs(self._notifications) do
                        if v == notification then
                            table.remove(self._notifications, i)
                            break
                        end
                    end
                    self:_updatePositions()
                    if callback then callback() end
                end)
            end
        end,
        Update = function(newOptions)
            if notification.frame and notification.frame.Parent then
                newOptions = newOptions or {}
                if newOptions.Title then notification.title.Text = newOptions.Title end
                if newOptions.Message then notification.message.Text = newOptions.Message end
                if newOptions.Type then
                    local newType = newOptions.Type:lower()
                    notification.icon.Image = self._icons[newType] or self._icons.info
                    
                    local color = self._theme.infoColor
                    if newType == "success" then color = self._theme.successColor
                    elseif newType == "error" then color = self._theme.errorColor
                    elseif newType == "warning" then color = self._theme.warningColor end
                    
                    local colorTween = game:GetService("TweenService"):Create(
                        notification.mainFrame,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                        {BackgroundColor3 = color}
                    )
                    local iconTween = game:GetService("TweenService"):Create(
                        notification.iconBg,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                        {BackgroundColor3 = color}
                    )
                    local progressTween = game:GetService("TweenService"):Create(
                        notification.progressBar,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                        {BackgroundColor3 = color}
                    )
                    
                    colorTween:Play()
                    iconTween:Play()
                    progressTween:Play()
                end
            end
        end
    }
end

-- Enhanced theme and settings methods
function NotificationLibrary:SetTheme(themeOptions)
    for key, value in pairs(themeOptions) do
        if self._theme[key] ~= nil then
            self._theme[key] = value
        end
    end
end

function NotificationLibrary:SetSettings(settings)
    for key, value in pairs(settings) do
        if self._settings[key] ~= nil then
            self._settings[key] = value
        end
    end
end

function NotificationLibrary:EnableGlowEffect(enabled)
    self._settings.glowEffect = enabled
end

function NotificationLibrary:EnableBounceEffect(enabled)
    self._settings.bounceEffect = enabled
end

function NotificationLibrary:EnableScaleEffect(enabled)
    self._settings.scaleEffect = enabled
end

function NotificationLibrary:SetGradientMode(enabled)
    self._theme.useGradient = enabled
end

NotificationLibrary:_init()

return NotificationLibrary
