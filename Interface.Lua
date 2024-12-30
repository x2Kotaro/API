_G.SettingsTable = {
    Tranpsy = 0,
    Acrylic = false,
    HotKey = nil
}

for i, v in pairs(_G.SettingsTable) do

end

local filename = "Venuz Hub/TheMimic.json";

function loadSettings()
    local HttpService = game:GetService("HttpService")
    if (readfile and isfile and isfile(filename)) then
        _G.SettingsTable = HttpService:JSONDecode(readfile(filename));
        for i, v in pairs(_G.SettingsTable) do
        end
    end
end

loadSettings()

function saveSettings()
    local json;
    local HttpService = game:GetService("HttpService");
    if (writefile) then
        json = HttpService:JSONEncode(_G.SettingsTable);
        writefile(filename, json);
    else
    end
end

local httpService = game:GetService("HttpService")

local InterfaceManager = {}
do
    InterfaceManager.Settings = {
        Theme = "Dark",
        Acrylic = _G.SettingsTable.Acrylic,
        Transparency = _G.SettingsTable.Tranpsy,
        MenuKeybind = _G.SettingsTable.HotKey
    }

    function InterfaceManager:SetFolder(folder)
        self.Folder = folder;
        self:BuildFolderTree()
    end

    function InterfaceManager:SetLibrary(library)
        self.Library = library
    end

    function InterfaceManager:SaveSettings()
        writefile(self.Folder .. "/options.json", httpService:JSONEncode(InterfaceManager.Settings))
    end

    function InterfaceManager:LoadSettings()
        local path = self.Folder .. "/options.json"
        if isfile(path) then
            local data = readfile(path)
            local success, decoded = pcall(httpService.JSONDecode, httpService, data)

            if success then
                for i, v in next, decoded do
                    InterfaceManager.Settings[i] = v
                end
            end
        end
    end

    function InterfaceManager:BuildInterfaceSection(tab)
        assert(self.Library, "Must set InterfaceManager.Library")
        local Library = self.Library
        local Settings = InterfaceManager.Settings

        InterfaceManager:LoadSettings()

        local section = tab:AddSection("Interface")

        local InterfaceTheme = section:AddDropdown("InterfaceTheme", {
            Title = "Theme",
            Description = "Changes the interface theme.",
            Values = Library.Themes,
            Default = Settings.Theme,
            Callback = function(Value)
                Library:SetTheme(Value)
                Settings.Theme = Value
            end
        })

        InterfaceTheme:SetValue(Settings.Theme)

        if Library.UseAcrylic then
            section:AddToggle("AcrylicToggle", {
                Title = "Acrylic",
                Description = "The blurred background requires graphic quality 8+",
                Default = Settings.Acrylic,
                Callback = function(Value)
                    Library:ToggleAcrylic(Value)
                    Settings.Acrylic = Value
                end
            })
        end

        section:AddToggle("TransparentToggle", {
            Title = "Transparency",
            Description = "Makes the interface transparent.",
            Default = Settings.Transparency,
            Callback = function(Value)
                Library:ToggleTransparency(Value)
                Settings.Transparency = Value
            end
        })

        section:Slider({
            Title = "Transparency",
            Description = "Makes the interface transparent.",
            Min = 0,
            Max = 100,
            default = _G.SettingsTable.Tranpsy,
            Callback = function(Value)
                Library:SetTransparency(Value / 100)
                Settings.Transparency = Value > 0
                saveSettings()
            end
        })

        local MenuKeybind = section:AddKeybind("MenuKeybind", {
            Title = "Minimize Bind",
            Default = "LeftControl"
        })
        MenuKeybind:OnChanged(function()
            Settings.MenuKeybind = MenuKeybind.Value
        end)
        Library.MinimizeKeybind = MenuKeybind
    end
end

return InterfaceManager
