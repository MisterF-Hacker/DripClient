-- DRIP CLIENT SOLUTIONS - BROOKHAVEN RP
-- Dev: VinzzDrip
-- Theme: Purple & Black

local DripClient = {}
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local teleportService = game:GetService("TeleportService")

-- ========== KONFIGURASI ==========
DripClient.Config = {
    Theme = {
        Primary = Color3.fromRGB(106, 13, 173),    -- Ungu tua
        Secondary = Color3.fromRGB(147, 51, 234),  -- Ungu terang
        Accent = Color3.fromRGB(192, 132, 252),    -- Ungu muda
        Background = Color3.fromRGB(18, 18, 18),   -- Hitam
        Surface = Color3.fromRGB(30, 30, 30),      -- Hitam lebih terang
        Text = Color3.fromRGB(255, 255, 255),      -- Putih
        TextMuted = Color3.fromRGB(180, 180, 180), -- Abu-abu
        Success = Color3.fromRGB(34, 197, 94),     -- Hijau
        Error = Color3.fromRGB(239, 68, 68),       -- Merah
        Warning = Color3.fromRGB(234, 179, 8),     -- Kuning
        Info = Color3.fromRGB(59, 130, 246)        -- Biru
    },
    Fonts = {
        Title = Enum.Font.GothamBold,
        Normal = Enum.Font.Gotham,
        Small = Enum.Font.GothamLight
    },
    Animations = {
        Duration = 0.3,
        Style = Enum.EasingStyle.Quad,
        Direction = Enum.EasingDirection.Out
    }
}

-- ========== MULTI LANGUAGE ==========
DripClient.Languages = {
    English = {
        -- Menu Names
        menu_information = "Information",
        menu_home = "Home",
        menu_premium = "Premium",
        menu_protection = "Protection",
        menu_spawn = "Spawn Client",
        menu_character = "Character",
        menu_troll = "Troll",
        menu_lag = "Lag Server",
        menu_audio = "Audio/Music",
        menu_clothes = "Clothes",
        menu_house = "House",
        menu_car = "Car",
        
        -- Information
        info_admin = "Access Admin",
        info_map_status = "Map Status",
        info_server_time = "Server Time",
        info_player_count = "Player Count",
        info_server_hop = "Server Hop",
        info_rejoin = "Rejoin Server",
        info_teleport = "Teleport Hub",
        
        -- Home
        home_credits = "Credits: VinzzDrip",
        home_version = "Version 3.0",
        home_discord = "Discord: discord.gg/drip",
        home_check_updates = "Check Updates",
        home_report_bug = "Report Bug",
        
        -- Premium
        premium_status = "Premium Status",
        premium_activate = "Activate Premium",
        premium_features = "Premium Features",
        premium_expiry = "Expiry Date",
        premium_key = "Enter Key",
        
        -- Protection
        prot_anti_arrest = "Anti Arrest",
        prot_anti_jail = "Anti Jail",
        prot_anti_kick = "Anti Kick",
        prot_anti_ban = "Anti Ban",
        prot_anti_teleport = "Anti Teleport",
        prot_anti_void = "Anti Void",
        prot_spy_alerts = "Admin Spy Alerts",
        
        -- Spawn
        spawn_vehicle = "Spawn Vehicle",
        spawn_pet = "Spawn Pet",
        spawn_npc = "Spawn NPC",
        spawn_item = "Spawn Item",
        spawn_money = "Spawn Money",
        spawn_weapon = "Spawn Weapon",
        
        -- Character
        char_noclip = "Noclip",
        char_fly = "Fly",
        char_speed = "Speed Boost",
        char_jump = "Jump Boost",
        char_invis = "Invisibility",
        char_size = "Change Size",
        char_reset = "Reset Character",
        char_emotes = "Emotes Menu",
        
        -- Troll
        troll_freeze = "Freeze Player",
        troll_kick = "Kick Player",
        troll_explode = "Explode Player",
        troll_rocket = "Rocket Player",
        troll_spam = "Spam Player",
        troll_clone = "Clone Player",
        troll_ragdoll = "Ragdoll",
        troll_fling = "Fling Player",
        troll_slap = "Slap Player",
        
        -- Lag Server
        lag_fps = "FPS Booster",
        lag_reduce = "Reduce Graphics",
        lag_remove = "Remove Effects",
        lag_clear = "Clear Decals",
        lag_spam = "Spam Server",
        lag_crash = "Crash Server (Risk)",
        
        -- Audio/Music
        audio_play = "Play Music",
        audio_stop = "Stop Music",
        audio_volume = "Volume",
        audio_loop = "Loop",
        audio_radio = "Radio Stations",
        audio_sound_effects = "Sound Effects",
        
        -- Clothes
        clothes_menu = "Clothes Menu",
        clothes_hats = "Hats",
        clothes_shirts = "Shirts",
        clothes_pants = "Pants",
        clothes_accessories = "Accessories",
        clothes_reset = "Reset Clothes",
        
        -- House
        house_teleport = "Teleport to House",
        house_unlock = "Unlock All Doors",
        house_remove = "Remove Furniture",
        house_spawn = "Spawn Furniture",
        house_clean = "Clean House",
        house_lighting = "Lighting Control",
        
        -- Car
        car_spawn = "Spawn Car",
        car_repair = "Repair Car",
        car_speed = "Car Speed Boost",
        car_flip = "Flip Car",
        car_color = "Change Color",
        car_fly = "Flying Car",
        car_invis = "Invisible Car",
        
        -- Buttons
        btn_minimize = "Minimize",
        btn_close = "Close",
        btn_apply = "Apply",
        btn_cancel = "Cancel",
        btn_save = "Save",
        btn_load = "Load",
        
        -- Messages
        msg_loading = "Loading...",
        msg_success = "Success!",
        msg_error = "Error!",
        msg_warning = "Warning!",
        msg_select_player = "Select Player",
        msg_no_permission = "No Permission",
        msg_premium_only = "Premium Only"
    },
    
    Indonesia = {
        menu_information = "Informasi",
        menu_home = "Beranda",
        menu_premium = "Premium",
        menu_protection = "Perlindungan",
        menu_spawn = "Spawn Client",
        menu_character = "Karakter",
        menu_troll = "Troll",
        menu_lag = "Lag Server",
        menu_audio = "Audio/Musik",
        menu_clothes = "Pakaian",
        menu_house = "Rumah",
        menu_car = "Mobil",
        
        info_admin = "Akses Admin",
        info_map_status = "Status Map",
        info_server_time = "Waktu Server",
        info_player_count = "Jumlah Pemain",
        info_server_hop = "Pindah Server",
        info_rejoin = "Masuk Ulang",
        info_teleport = "Teleport Hub",
        
        home_credits = "Kredit: VinzzDrip",
        home_version = "Versi 3.0",
        home_discord = "Discord: discord.gg/drip",
        home_check_updates = "Cek Update",
        home_report_bug = "Laporkan Bug",
        
        premium_status = "Status Premium",
        premium_activate = "Aktifkan Premium",
        premium_features = "Fitur Premium",
        premium_expiry = "Tanggal Kadaluarsa",
        premium_key = "Masukkan Key",
        
        prot_anti_arrest = "Anti Ditangkap",
        prot_anti_jail = "Anti Penjara",
        prot_anti_kick = "Anti Kick",
        prot_anti_ban = "Anti Ban",
        prot_anti_teleport = "Anti Teleport",
        prot_anti_void = "Anti Jatuh",
        prot_spy_alerts = "Peringatan Admin",
        
        spawn_vehicle = "Spawn Kendaraan",
        spawn_pet = "Spawn Hewan",
        spawn_npc = "Spawn NPC",
        spawn_item = "Spawn Item",
        spawn_money = "Spawn Uang",
        spawn_weapon = "Spawn Senjata",
        
        char_noclip = "Tembus Dinding",
        char_fly = "Terbang",
        char_speed = "Kecepatan",
        char_jump = "Lompat Tinggi",
        char_invis = "Tak Terlihat",
        char_size = "Ubah Ukuran",
        char_reset = "Reset Karakter",
        char_emotes = "Menu Emote",
        
        troll_freeze = "Bekukan Pemain",
        troll_kick = "Kick Pemain",
        troll_explode = "Ledakkan Pemain",
        troll_rocket = "Roket Pemain",
        troll_spam = "Spam Pemain",
        troll_clone = "Clone Pemain",
        troll_ragdoll = "Ragdoll",
        troll_fling = "Lemparkan",
        troll_slap = "Tampar",
        
        lag_fps = "Booster FPS",
        lag_reduce = "Kurangi Grafis",
        lag_remove = "Hapus Efek",
        lag_clear = "Bersihkan Decal",
        lag_spam = "Spam Server",
        lag_crash = "Crash Server (Resiko)",
        
        audio_play = "Putar Musik",
        audio_stop = "Hentikan",
        audio_volume = "Volume",
        audio_loop = "Ulang",
        audio_radio = "Radio",
        audio_sound_effects = "Efek Suara",
        
        clothes_menu = "Menu Pakaian",
        clothes_hats = "Topi",
        clothes_shirts = "Baju",
        clothes_pants = "Celana",
        clothes_accessories = "Aksesoris",
        clothes_reset = "Reset Pakaian",
        
        house_teleport = "Teleport ke Rumah",
        house_unlock = "Buka Semua Pintu",
        house_remove = "Hapus Furnitur",
        house_spawn = "Spawn Furnitur",
        house_clean = "Bersihkan Rumah",
        house_lighting = "Atur Pencahayaan",
        
        car_spawn = "Spawn Mobil",
        car_repair = "Perbaiki Mobil",
        car_speed = "Kecepatan Mobil",
        car_flip = "Balikkan Mobil",
        car_color = "Ganti Warna",
        car_fly = "Mobil Terbang",
        car_invis = "Mobil Tak Terlihat",
        
        btn_minimize = "Kecilkan",
        btn_close = "Tutup",
        btn_apply = "Terapkan",
        btn_cancel = "Batal",
        btn_save = "Simpan",
        btn_load = "Muat",
        
        msg_loading = "Memuat...",
        msg_success = "Berhasil!",
        msg_error = "Gagal!",
        msg_warning = "Peringatan!",
        msg_select_player = "Pilih Pemain",
        msg_no_permission = "Tidak Ada Izin",
        msg_premium_only = "Khusus Premium"
    },
    
    Spanish = {
        menu_information = "Información",
        menu_home = "Inicio",
        menu_premium = "Premium",
        menu_protection = "Protección",
        menu_spawn = "Generar Cliente",
        menu_character = "Personaje",
        menu_troll = "Troll",
        menu_lag = "Lag Servidor",
        menu_audio = "Audio/Música",
        menu_clothes = "Ropa",
        menu_house = "Casa",
        menu_car = "Coche",
        
        info_admin = "Acceso Admin",
        info_map_status = "Estado del Mapa",
        info_server_time = "Hora del Servidor",
        info_player_count = "Jugadores",
        info_server_hop = "Cambiar Servidor",
        info_rejoin = "Reconectar",
        info_teleport = "Teleport Hub",
        
        home_credits = "Créditos: VinzzDrip",
        home_version = "Versión 3.0",
        home_discord = "Discord: discord.gg/drip",
        home_check_updates = "Buscar Actualizaciones",
        home_report_bug = "Reportar Error",
        
        premium_status = "Estado Premium",
        premium_activate = "Activar Premium",
        premium_features = "Características Premium",
        premium_expiry = "Fecha de Expiración",
        premium_key = "Ingresar Key",
        
        prot_anti_arrest = "Anti Arresto",
        prot_anti_jail = "Anti Cárcel",
        prot_anti_kick = "Anti Expulsión",
        prot_anti_ban = "Anti Ban",
        prot_anti_teleport = "Anti Teletransporte",
        prot_anti_void = "Anti Vacío",
        prot_spy_alerts = "Alertas Admin",
        
        spawn_vehicle = "Generar Vehículo",
        spawn_pet = "Generar Mascota",
        spawn_npc = "Generar NPC",
        spawn_item = "Generar Objeto",
        spawn_money = "Generar Dinero",
        spawn_weapon = "Generar Arma",
        
        char_noclip = "Noclip",
        char_fly = "Volar",
        char_speed = "Velocidad",
        char_jump = "Salto Alto",
        char_invis = "Invisibilidad",
        char_size = "Cambiar Tamaño",
        char_reset = "Reiniciar",
        char_emotes = "Emotes",
        
        troll_freeze = "Congelar",
        troll_kick = "Expulsar",
        troll_explode = "Explotar",
        troll_rocket = "Cohete",
        troll_spam = "Spam",
        troll_clone = "Clonar",
        troll_ragdoll = "Ragdoll",
        troll_fling = "Lanzar",
        troll_slap = "Bofetada",
        
        lag_fps = "Aumentar FPS",
        lag_reduce = "Reducir Gráficos",
        lag_remove = "Eliminar Efectos",
        lag_clear = "Limpiar Decales",
        lag_spam = "Spam Servidor",
        lag_crash = "Crash Servidor (Riesgo)",
        
        audio_play = "Reproducir",
        audio_stop = "Detener",
        audio_volume = "Volumen",
        audio_loop = "Repetir",
        audio_radio = "Radio",
        audio_sound_effects = "Efectos",
        
        clothes_menu = "Menú Ropa",
        clothes_hats = "Sombreros",
        clothes_shirts = "Camisas",
        clothes_pants = "Pantalones",
        clothes_accessories = "Accesorios",
        clothes_reset = "Restablecer",
        
        house_teleport = "Teleport a Casa",
        house_unlock = "Abrir Puertas",
        house_remove = "Quitar Muebles",
        house_spawn = "Generar Muebles",
        house_clean = "Limpiar Casa",
        house_lighting = "Iluminación",
        
        car_spawn = "Generar Coche",
        car_repair = "Reparar",
        car_speed = "Velocidad",
        car_flip = "Voltear",
        car_color = "Cambiar Color",
        car_fly = "Coche Volador",
        car_invis = "Coche Invisible",
        
        btn_minimize = "Minimizar",
        btn_close = "Cerrar",
        btn_apply = "Aplicar",
        btn_cancel = "Cancelar",
        btn_save = "Guardar",
        btn_load = "Cargar",
        
        msg_loading = "Cargando...",
        msg_success = "¡Éxito!",
        msg_error = "¡Error!",
        msg_warning = "¡Advertencia!",
        msg_select_player = "Seleccionar Jugador",
        msg_no_permission = "Sin Permiso",
        msg_premium_only = "Solo Premium"
    }
}

-- ========== FUNGSI UTILITY ==========
function DripClient:Create(class, properties)
    local obj = Instance.new(class)
    for prop, value in pairs(properties) do
        obj[prop] = value
    end
    return obj
end

function DripClient:Tween(obj, props, duration, callback)
    duration = duration or self.Config.Animations.Duration
    local tweenInfo = TweenInfo.new(
        duration,
        self.Config.Animations.Style,
        self.Config.Animations.Direction
    )
    local tween = tweenService:Create(obj, tweenInfo, props)
    tween.Completed:Connect(function()
        if callback then callback() end
    end)
    tween:Play()
    return tween
end

function DripClient:Notify(title, text, duration, type)
    duration = duration or 3
    type = type or "info"
    
    local colors = {
        success = self.Config.Theme.Success,
        error = self.Config.Theme.Error,
        warning = self.Config.Theme.Warning,
        info = self.Config.Theme.Info
    }
    
    local notif = self:Create("Frame", {
        Size = UDim2.new(0, 300, 0, 80),
        Position = UDim2.new(1, -320, 0, 20),
        BackgroundColor3 = self.Config.Theme.Background,
        BorderSizePixel = 0,
        Parent = self.GUI
    })
    
    local notifCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = notif
    })
    
    local colorBar = self:Create("Frame", {
        Size = UDim2.new(0, 5, 1, 0),
        BackgroundColor3 = colors[type],
        Parent = notif
    })
    
    local titleLabel = self:Create("TextLabel", {
        Size = UDim2.new(1, -15, 0, 25),
        Position = UDim2.new(0, 15, 0, 10),
        Text = title,
        TextColor3 = self.Config.Theme.Text,
        BackgroundTransparency = 1,
        Font = self.Config.Fonts.Title,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = notif
    })
    
    local textLabel = self:Create("TextLabel", {
        Size = UDim2.new(1, -15, 0, 35),
        Position = UDim2.new(0, 15, 0, 35),
        Text = text,
        TextColor3 = self.Config.Theme.TextMuted,
        BackgroundTransparency = 1,
        Font = self.Config.Fonts.Normal,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        Parent = notif
    })
    
    self:Tween(notif, {Position = UDim2.new(1, -320, 0, 20)}, 0.5)
    
    task.wait(duration)
    
    self:Tween(notif, {Position = UDim2.new(1, 0, 0, 20)}, 0.5, function()
        notif:Destroy()
    end)
end

function DripClient:CreateButton(parent, text, position, size, callback)
    local btn = self:Create("TextButton", {
        Size = size or UDim2.new(0, 120, 0, 35),
        Position = position,
        Text = text,
        TextColor3 = self.Config.Theme.Text,
        BackgroundColor3 = self.Config.Theme.Secondary,
        AutoButtonColor = false,
        Font = self.Config.Fonts.Normal,
        TextSize = 14,
        Parent = parent
    })
    
    local btnCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = btn
    })
    
    btn.MouseEnter:Connect(function()
        self:Tween(btn, {BackgroundColor3 = self.Config.Theme.Primary}, 0.2)
    end)
    
    btn.MouseLeave:Connect(function()
        self:Tween(btn, {BackgroundColor3 = self.Config.Theme.Secondary}, 0.2)
    end)
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

function DripClient:CreateToggle(parent, text, position, default, callback)
    local frame = self:Create("Frame", {
        Size = UDim2.new(0, 200, 0, 30),
        Position = position,
        BackgroundTransparency = 1,
        Parent = parent
    })
    
    local label = self:Create("TextLabel", {
        Size = UDim2.new(0, 150, 1, 0),
        Text = text,
        TextColor3 = self.Config.Theme.Text,
        BackgroundTransparency = 1,
        Font = self.Config.Fonts.Normal,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = frame
    })
    
    local toggle = self:Create("TextButton", {
        Size = UDim2.new(0, 40, 0, 20),
        Position = UDim2.new(1, -40, 0.5, -10),
        Text = "",
        BackgroundColor3 = default and self.Config.Theme.Success or self.Config.Theme.Surface,
        AutoButtonColor = false,
        Parent = frame
    })
    
    local toggleCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = toggle
    })
    
    local toggleKnob = self:Create("Frame", {
        Size = UDim2.new(0, 16, 0, 16),
        Position = default and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
        BackgroundColor3 = self.Config.Theme.Text,
        Parent = toggle
    })
    
    local knobCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = toggleKnob
    })
    
    local state = default
    
    toggle.MouseButton1Click:Connect(function()
        state = not state
        self:Tween(toggle, {BackgroundColor3 = state and self.Config.Theme.Success or self.Config.Theme.Surface}, 0.2)
        self:Tween(toggleKnob, {Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}, 0.2)
        callback(state)
    end)
    
    return frame
end

function DripClient:CreateSlider(parent, text, position, min, max, default, callback)
    local frame = self:Create("Frame", {
        Size = UDim2.new(0, 200, 0, 50),
        Position = position,
        BackgroundTransparency = 1,
        Parent = parent
    })
    
    local label = self:Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 20),
        Text = text,
        TextColor3 = self.Config.Theme.Text,
        BackgroundTransparency = 1,
        Font = self.Config.Fonts.Normal,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = frame
    })
    
    local valueLabel = self:Create("TextLabel", {
        Size = UDim2.new(0, 40, 0, 20),
        Position = UDim2.new(1, -40, 0, 0),
        Text = tostring(default),
        TextColor3 = self.Config.Theme.Accent,
        BackgroundTransparency = 1,
        Font = self.Config.Fonts.Normal,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = frame
    })
    
    local sliderBg = self:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 4),
        Position = UDim2.new(0, 0, 0, 30),
        BackgroundColor3 = self.Config.Theme.Surface,
        Parent = frame
    })
    
    local sliderCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = sliderBg
    })
    
    local sliderFill = self:Create("Frame", {
        Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = self.Config.Theme.Secondary,
        Parent = sliderBg
    })
    
    local fillCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = sliderFill
    })
    
    local drag = self:Create("TextButton", {
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new((default - min) / (max - min), -8, 0, -6),
        Text = "",
        BackgroundColor3 = self.Config.Theme.Text,
        AutoButtonColor = false,
        Parent = sliderBg
    })
    
    local dragCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = drag
    })
    
    local dragging = false
    
    drag.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    userInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    userInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = userInputService:GetMouseLocation().X - sliderBg.AbsolutePosition.X
            local percent = math.clamp(pos / sliderBg.AbsoluteSize.X, 0, 1)
            sliderFill.Size = UDim2.new(percent, 0, 1, 0)
            drag.Position = UDim2.new(percent, -8, 0, -6)
            local val = min + (max - min) * percent
            valueLabel.Text = tostring(math.floor(val * 10) / 10)
            callback(val)
        end
    end)
    
    return frame
end

-- ========== FITUR-FITUR ==========

-- Information Menu
function DripClient:SetupInformationMenu(parent, lang)
    local y = 10
    
    -- Access Admin
    local adminBtn = self:CreateButton(parent, lang.info_admin, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        self:Notify("Admin", "Accessing admin...", 2, "info")
        -- Admin access logic
    end)
    
    -- Map Status
    y = y + 40
    local mapBtn = self:CreateButton(parent, lang.info_map_status, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        local mapName = workspace.Name or "Unknown"
        self:Notify("Map Status", "Current map: " .. mapName, 3, "info")
    end)
    
    -- Server Time
    y = y + 40
    local timeLabel = self:Create("TextLabel", {
        Size = UDim2.new(0, 180, 0, 30),
        Position = UDim2.new(0, 10, 0, y),
        Text = lang.info_server_time .. ": " .. os.date("%H:%M:%S"),
        TextColor3 = self.Config.Theme.Text,
        BackgroundColor3 = self.Config.Theme.Surface,
        Font = self.Config.Fonts.Normal,
        TextSize = 14,
        Parent = parent
    })
    
    local timeCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = timeLabel
    })
    
    -- Update time every second
    spawn(function()
        while parent.Parent do
            timeLabel.Text = lang.info_server_time .. ": " .. os.date("%H:%M:%S")
            wait(1)
        end
    end)
    
    -- Player Count
    y = y + 40
    local playerCount = self:Create("TextLabel", {
        Size = UDim2.new(0, 180, 0, 30),
        Position = UDim2.new(0, 10, 0, y),
        Text = lang.info_player_count .. ": " .. #game.Players:GetPlayers(),
        TextColor3 = self.Config.Theme.Text,
        BackgroundColor3 = self.Config.Theme.Surface,
        Font = self.Config.Fonts.Normal,
        TextSize = 14,
        Parent = parent
    })
    
    local playerCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = playerCount
    })
    
    -- Update player count
    game.Players.PlayerAdded:Connect(function()
        playerCount.Text = lang.info_player_count .. ": " .. #game.Players:GetPlayers()
    end)
    game.Players.PlayerRemoving:Connect(function()
        playerCount.Text = lang.info_player_count .. ": " .. #game.Players:GetPlayers()
    end)
    
    -- Server Hop
    y = y + 40
    local hopBtn = self:CreateButton(parent, lang.info_server_hop, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        local placeId = game.PlaceId
        local jobId = game.JobId
        teleportService:Teleport(placeId, player)
    end)
    
    -- Rejoin
    y = y + 40
    local rejoinBtn = self:CreateButton(parent, lang.info_rejoin, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        local placeId = game.PlaceId
        teleportService:Teleport(placeId, player)
    end)
end

-- Home Menu
function DripClient:SetupHomeMenu(parent, lang)
    local y = 10
    
    local credits = self:Create("TextLabel", {
        Size = UDim2.new(0, 180, 0, 30),
        Position = UDim2.new(0, 10, 0, y),
        Text = lang.home_credits,
        TextColor3 = self.Config.Theme.Accent,
        BackgroundTransparency = 1,
        Font = self.Config.Fonts.Title,
        TextSize = 16,
        Parent = parent
    })
    
    y = y + 40
    local version = self:Create("TextLabel", {
        Size = UDim2.new(0, 180, 0, 30),
        Position = UDim2.new(0, 10, 0, y),
        Text = lang.home_version,
        TextColor3 = self.Config.Theme.TextMuted,
        BackgroundTransparency = 1,
        Font = self.Config.Fonts.Normal,
        TextSize = 14,
        Parent = parent
    })
    
    y = y + 40
    local discord = self:Create("TextLabel", {
        Size = UDim2.new(0, 180, 0, 30),
        Position = UDim2.new(0, 10, 0, y),
        Text = lang.home_discord,
        TextColor3 = self.Config.Theme.Info,
        BackgroundTransparency = 1,
        Font = self.Config.Fonts.Normal,
        TextSize = 14,
        Parent = parent
    })
    
    y = y + 40
    local updateBtn = self:CreateButton(parent, lang.home_check_updates, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        self:Notify("Updates", "You have the latest version!", 2, "success")
    end)
    
    y = y + 40
    local reportBtn = self:CreateButton(parent, lang.home_report_bug, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        self:Notify("Report Bug", "Join Discord to report bugs!", 3, "info")
    end)
end

-- Character Menu
function DripClient:SetupCharacterMenu(parent, lang)
    local y = 10
    local character = player.Character
    local humanoid = character and character:FindFirstChild("Humanoid")
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    
    -- Noclip
    local noclipToggle = self:CreateToggle(parent, lang.char_noclip, UDim2.new(0, 10, 0, y), false, function(state)
        if state then
            runService.Stepped:Connect(function()
                if character then
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    end)
    
    y = y + 40
    -- Fly
    local flyToggle = self:CreateToggle(parent, lang.char_fly, UDim2.new(0, 10, 0, y), false, function(state)
        if state then
            if humanoid and rootPart then
                humanoid.PlatformStand = true
                local bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(1, 1, 1) * 1e5
                bv.Velocity = Vector3.new(0, 0, 0)
                bv.Parent = rootPart
                
                runService.Heartbeat:Connect(function()
                    if state and rootPart then
                        local move = Vector3.new()
                        if userInputService:IsKeyDown(Enum.KeyCode.W) then
                            move = move + workspace.CurrentCamera.CFrame.LookVector
                        end
                        if userInputService:IsKeyDown(Enum.KeyCode.S) then
                            move = move - workspace.CurrentCamera.CFrame.LookVector
                        end
                        if userInputService:IsKeyDown(Enum.KeyCode.A) then
                            move = move - workspace.CurrentCamera.CFrame.RightVector
                        end
                        if userInputService:IsKeyDown(Enum.KeyCode.D) then
                            move = move + workspace.CurrentCamera.CFrame.RightVector
                        end
                        if userInputService:IsKeyDown(Enum.KeyCode.Space) then
                            move = move + Vector3.new(0, 1, 0)
                        end
                        if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                            move = move + Vector3.new(0, -1, 0)
                        end
                        if move.Magnitude > 0 then
                            bv.Velocity = move.Unit * 50
                        else
                            bv.Velocity = Vector3.new(0, 0, 0)
                        end
                    else
                        bv:Destroy()
                        humanoid.PlatformStand = false
                    end
                end)
            end
        else
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
    end)
    
    y = y + 40
    -- Speed Boost
    local speedSlider = self:CreateSlider(parent, lang.char_speed, UDim2.new(0, 10, 0, y), 16, 200, 16, function(val)
        if humanoid then
            humanoid.WalkSpeed = val
        end
    end)
    
    y = y + 50
    -- Jump Boost
    local jumpSlider = self:CreateSlider(parent, lang.char_jump, UDim2.new(0, 10, 0, y), 50, 200, 50, function(val)
        if humanoid then
            humanoid.JumpPower = val
        end
    end)
    
    y = y + 50
    -- Invisibility
    local invisToggle = self:CreateToggle(parent, lang.char_invis, UDim2.new(0, 10, 0, y), false, function(state)
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = state and 1 or 0
                end
            end
        end
    end)
    
    y = y + 40
    -- Reset Character
    local resetBtn = self:CreateButton(parent, lang.char_reset, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        if humanoid then
            humanoid.Health = 0
        end
    end)
end

-- Troll Menu
function DripClient:SetupTrollMenu(parent, lang)
    local y = 10
    local players = game.Players:GetPlayers()
    
    -- Player Selector
    local playerDropdown = self:Create("Frame", {
        Size = UDim2.new(0, 180, 0, 40),
        Position = UDim2.new(0, 10, 0, y),
        BackgroundColor3 = self.Config.Theme.Surface,
        Parent = parent
    })
    
    local dropdownCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = playerDropdown
    })
    
    local dropdownLabel = self:Create("TextLabel", {
        Size = UDim2.new(1, -30, 1, 0),
        Text = lang.msg_select_player,
        TextColor3 = self.Config.Theme.TextMuted,
        BackgroundTransparency = 1,
        Font = self.Config.Fonts.Normal,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = playerDropdown
    })
    
    local selectedPlayer = nil
    
    -- Freeze
    y = y + 50
    local freezeBtn = self:CreateButton(parent, lang.troll_freeze, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        if selectedPlayer and selectedPlayer.Character then
            local hrp = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Anchored = true
                self:Notify("Troll", "Froze " .. selectedPlayer.Name, 2, "success")
            end
        else
            self:Notify("Error", lang.msg_select_player, 2, "error")
        end
    end)
    
    y = y + 40
    -- Explode
    local explodeBtn = self:CreateButton(parent, lang.troll_explode, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        if selectedPlayer and selectedPlayer.Character then
            local hrp = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local explosion = Instance.new("Explosion")
                explosion.Position = hrp.Position
                explosion.BlastRadius = 10
                explosion.BlastPressure = 100
                explosion.DestroyJointRadiusPercent = 1
                explosion.Parent = workspace
                self:Notify("Troll", "Exploded " .. selectedPlayer.Name, 2, "success")
            end
        else
            self:Notify("Error", lang.msg_select_player, 2, "error")
        end
    end)
    
    y = y + 40
    -- Rocket
    local rocketBtn = self:CreateButton(parent, lang.troll_rocket, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        if selectedPlayer and selectedPlayer.Character then
            local hrp = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(1, 1, 1) * 1e5
                bv.Velocity = Vector3.new(0, 100, 0)
                bv.Parent = hrp
                task.wait(3)
                bv:Destroy()
                self:Notify("Troll", "Rocketed " .. selectedPlayer.Name, 2, "success")
            end
        else
            self:Notify("Error", lang.msg_select_player, 2, "error")
        end
    end)
    
    y = y + 40
    -- Fling
    local flingBtn = self:CreateButton(parent, lang.troll_fling, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        if selectedPlayer and selectedPlayer.Character then
            local hrp = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(1, 1, 1) * 1e5
                bv.Velocity = Vector3.new(math.random(-100, 100), 50, math.random(-100, 100))
                bv.Parent = hrp
                task.wait(2)
                bv:Destroy()
                self:Notify("Troll", "Flinged " .. selectedPlayer.Name, 2, "success")
            end
        else
            self:Notify("Error", lang.msg_select_player, 2, "error")
        end
    end)
end

-- Lag Server Menu
function DripClient:SetupLagMenu(parent, lang)
    local y = 10
    
    -- FPS Booster
    local fpsBtn = self:CreateButton(parent, lang.lag_fps, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        settings().Rendering.QualityLevel = 1
        workspace.DescendantAdded:Connect(function(desc)
            if desc:IsA("Decal") or desc:IsA("Texture") then
                desc:Destroy()
            end
        end)
        self:Notify("FPS Booster", "Graphics reduced for better FPS", 2, "success")
    end)
    
    y = y + 40
    -- Remove Effects
    local removeBtn = self:CreateButton(parent, lang.lag_remove, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") then
                v:Destroy()
            end
        end
        self:Notify("Effects", "All effects removed", 2, "success")
    end)
    
    y = y + 40
    -- Clear Decals
    local clearBtn = self:CreateButton(parent, lang.lag_clear, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy()
            end
        end
        self:Notify("Decals", "All decals cleared", 2, "success")
    end)
    
    y = y + 40
    -- Spam Server
    local spamToggle = self:CreateToggle(parent, lang.lag_spam, UDim2.new(0, 10, 0, y), false, function(state)
        if state then
            spawn(function()
                while state do
                    for i = 1, 10 do
                        local part = Instance.new("Part")
                        part.Position = Vector3.new(math.random(-100, 100), 500, math.random(-100, 100))
                        part.Parent = workspace
                        game:GetService("Debris"):AddItem(part, 5)
                    end
                    wait(0.1)
                end
            end)
        end
    end)
end

-- Car Menu
function DripClient:SetupCarMenu(parent, lang)
    local y = 10
    local car = nil
    
    -- Spawn Car
    local spawnBtn = self:CreateButton(parent, lang.car_spawn, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        local carModel = Instance.new("Model")
        carModel.Name = "DripCar"
        
        local chassis = Instance.new("Part")
        chassis.Size = Vector3.new(8, 2, 15)
        chassis.BrickColor = BrickColor.new("Bright purple")
        chassis.Material = Enum.Material.SmoothPlastic
        chassis.Anchored = false
        chassis.Parent = carModel
        
        local window = Instance.new("Part")
        window.Size = Vector3.new(6, 2, 6)
        window.Position = Vector3.new(0, 2, -3)
        window.BrickColor = BrickColor.new("Black")
        window.Material = Enum.Material.Glass
        window.Transparency = 0.3
        window.Anchored = false
        window.Parent = carModel
        
        local wheelPositions = {
            Vector3.new(3, -1, 5),
            Vector3.new(-3, -1, 5),
            Vector3.new(3, -1, -5),
            Vector3.new(-3, -1, -5)
        }
        
        for _, pos in ipairs(wheelPositions) do
            local wheel = Instance.new("Part")
            wheel.Size = Vector3.new(2, 2, 2)
            wheel.Position = pos
            wheel.BrickColor = BrickColor.new("Black")
            wheel.Shape = Enum.PartType.Cylinder
            wheel.Orientation = Vector3.new(0, 0, 90)
            wheel.Anchored = false
            wheel.Parent = carModel
        end
        
        carModel.Parent = workspace
        carModel:MoveTo(player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 10))
        
        car = carModel
        self:Notify("Car", "Car spawned!", 2, "success")
    end)
    
    y = y + 40
    -- Repair Car
    local repairBtn = self:CreateButton(parent, lang.car_repair, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        if car then
            for _, part in ipairs(car:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.BrickColor = BrickColor.new("Bright purple")
                end
            end
            self:Notify("Car", "Car repaired!", 2, "success")
        else
            self:Notify("Error", "No car found", 2, "error")
        end
    end)
    
    y = y + 40
    -- Car Speed Boost
    local speedSlider = self:CreateSlider(parent, lang.car_speed, UDim2.new(0, 10, 0, y), 16, 500, 50, function(val)
        if car and car.PrimaryPart then
            local bv = car.PrimaryPart:FindFirstChild("BodyVelocity")
            if not bv then
                bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(1, 1, 1) * 1e5
                bv.Parent = car.PrimaryPart
            end
            bv.Velocity = car.PrimaryPart.CFrame.LookVector * val
        end
    end)
    
    y = y + 50
    -- Flip Car
    local flipBtn = self:CreateButton(parent, lang.car_flip, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        if car and car.PrimaryPart then
            car:SetPrimaryPartCFrame(car.PrimaryPart.CFrame * CFrame.Angles(0, 0, math.rad(180)))
            self:Notify("Car", "Car flipped!", 2, "success")
        end
    end)
    
    y = y + 40
    -- Change Color
    local colorBtn = self:CreateButton(parent, lang.car_color, UDim2.new(0, 10, 0, y), UDim2.new(0, 180, 0, 30), function()
        if car then
            for _, part in ipairs(car:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "Window" then
                    part.BrickColor = BrickColor.new("Bright red")
                end
            end
            self:Notify("Car", "Color changed!", 2, "success")
        end
    end)
    
    y = y + 40
    -- Flying Car
    local flyCarToggle = self:CreateToggle(parent, lang.car_fly, UDim2.new(0, 10, 0, y), false, function(state)
        if car and car.PrimaryPart then
            if state then
                car.PrimaryPart.Velocity = Vector3.new(0, 50, 0)
            end
        end
    end)
end

-- ========== MAIN GUI ==========
function DripClient:Init()
    self.GUI = Instance.new("ScreenGui")
    self.GUI.Name = "DripClient"
    self.GUI.Parent = player:WaitForChild("PlayerGui")
    self.GUI.ResetOnSpawn = false
    
    self.MainFrame = self:Create("Frame", {
        Size = UDim2.new(0, 800, 0, 600),
        Position = UDim2.new(0.5, -400, 0.5, -300),
        BackgroundColor3 = self.Config.Theme.Background,
        BorderSizePixel = 0,
        Parent = self.GUI
    })
    
    local mainCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = self.MainFrame
    })
    
    -- Title Bar
    local titleBar = self:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = self.Config.Theme.Surface,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })
    
    local titleCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = titleBar
    })
    
    -- Logo
    local logoFrame = self:Create("Frame", {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(0, 5, 0.5, -15),
        BackgroundColor3 = self.Config.Theme.Secondary,
        Parent = titleBar
    })
    
    local logoCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 5),
        Parent = logoFrame
    })
    
    local logoText = self:Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        Text = "💧",
        TextColor3 = self.Config.Theme.Text,
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = 20,
        Parent = logoFrame
    })
    
    local titleText = self:Create("TextLabel", {
        Size = UDim2.new(0, 200, 1, 0),
        Position = UDim2.new(0, 40, 0, 0),
        Text = "Drip Client",
        TextColor3 = self.Config.Theme.Accent,
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = titleBar
    })
    
    -- Language Selector
    local langFrame = self:Create("Frame", {
        Size = UDim2.new(0, 180, 0, 30),
        Position = UDim2.new(0.5, -90, 0.5, -15),
        BackgroundColor3 = self.Config.Theme.Background,
        Parent = titleBar
    })
    
    local langCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 15),
        Parent = langFrame
    })
    
    local function createLangButton(text, pos, langCode)
        local btn = self:Create("TextButton", {
            Size = UDim2.new(0, 60, 1, 0),
            Position = UDim2.new(pos, 0, 0, 0),
            Text = text,
            TextColor3 = self.Config.Theme.Text,
            BackgroundColor3 = self.Config.Theme.Surface,
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            Parent = langFrame
        })
        
        if pos == 0 then
            btn.BackgroundColor3 = self.Config.Theme.Secondary
        end
        
        btn.MouseButton1Click:Connect(function()
            self.Language = self.Languages[langCode]
            self:RefreshGUI()
        end)
        
        return btn
    end
    
    createLangButton("EN", 0, "English")
    createLangButton("ID", 0.33, "Indonesia")
    createLangButton("ES", 0.66, "Spanish")
    
    -- Minimize & Close
    local minBtn = self:Create("TextButton", {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -70, 0.5, -15),
        Text = "−",
        TextColor3 = self.Config.Theme.Text,
        BackgroundColor3 = self.Config.Theme.Surface,
        Font = Enum.Font.GothamBold,
        TextSize = 20,
        Parent = titleBar
    })
    
    local minCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = minBtn
    })
    
    local closeBtn = self:Create("TextButton", {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -35, 0.5, -15),
        Text = "×",
        TextColor3 = self.Config.Theme.Text,
        BackgroundColor3 = self.Config.Theme.Error,
        Font = Enum.Font.GothamBold,
        TextSize = 20,
        Parent = titleBar
    })
    
    local closeCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = closeBtn
    })
    
    local minimized = false
    local originalSize = self.MainFrame.Size
    
    minBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            self:Tween(self.MainFrame, {Size = UDim2.new(0, 800, 0, 40)}, 0.3)
            for _, v in ipairs(self.MainFrame:GetChildren()) do
                if v ~= titleBar then v.Visible = false end
            end
        else
            self:Tween(self.MainFrame, {Size = originalSize}, 0.3)
            for _, v in ipairs(self.MainFrame:GetChildren()) do
                if v ~= titleBar then v.Visible = true end
            end
        end
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        self.GUI:Destroy()
    end)
    
    -- Side Menu
    local sideMenu = self:Create("Frame", {
        Size = UDim2.new(0, 200, 1, -50),
        Position = UDim2.new(0, 0, 0, 45),
        BackgroundColor3 = self.Config.Theme.Surface,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })
    
    local sideCorner = self:Create("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = sideMenu
    })
    
    -- Menu Buttons
    local menuY = 10
    local menus = {
        "information", "home", "premium", "protection", "spawn",
        "character", "troll", "lag", "audio", "clothes", "house", "car"
    }
    
    self.MenuFrames = {}
    self.CurrentMenu = nil
    
    for _, menu in ipairs(menus) do
        local btn = self:Create("TextButton", {
            Size = UDim2.new(1, -20, 0, 35),
            Position = UDim2.new(0, 10, 0, menuY),
            Text = self.Language and self.Language["menu_" .. menu] or menu,
            TextColor3 = self.Config.Theme.Text,
            BackgroundColor3 = self.Config.Theme.Background,
            Font = Enum.Font.Gotham,
            TextSize = 14,
            Parent = sideMenu
        })
        
        local btnCorner = self:Create("UICorner", {
            CornerRadius = UDim.new(0, 6),
            Parent = btn
        })
        
        -- Content Frame for this menu
        local contentFrame = self:Create("ScrollingFrame", {
            Size = UDim2.new(1, -210, 1, -50),
            Position = UDim2.new(0, 205, 0, 45),
            BackgroundColor3 = self.Config.Theme.Background,
            BorderSizePixel = 0,
            ScrollBarThickness = 5,
            Visible = false,
            Parent = self.MainFrame
        })
        
        local contentCorner = self:Create("UICorner", {
            CornerRadius = UDim.new(0, 10),
            Parent = contentFrame
        })
        
        self.MenuFrames[menu] = contentFrame
        
        btn.MouseButton1Click:Connect(function()
            if self.CurrentMenu then
                self.MenuFrames[self.CurrentMenu].Visible = false
            end
            self.CurrentMenu = menu
            contentFrame.Visible = true
            
            -- Reset button colors
            for _, b in ipairs(sideMenu:GetChildren()) do
                if b:IsA("TextButton") then
                    self:Tween(b, {BackgroundColor3 = self.Config.Theme.Background}, 0.2)
                end
            end
            
            -- Highlight current
            self:Tween(btn, {BackgroundColor3 = self.Config.Theme.Primary}, 0.2)
        end)
        
        menuY = menuY + 40
    end
    
    -- Set default language
    self.Language = self.Languages.English
    
    -- Setup menu contents
    self:SetupInformationMenu(self.MenuFrames["information"], self.Language)
    self:SetupHomeMenu(self.MenuFrames["home"], self.Language)
    self:SetupCharacterMenu(self.MenuFrames["character"], self.Language)
    self:SetupTrollMenu(self.MenuFrames["troll"], self.Language)
    self:SetupLagMenu(self.MenuFrames["lag"], self.Language)
    self:SetupCarMenu(self.MenuFrames["car"], self.Language)
    
    -- Show first menu
    self.MenuFrames["information"].Visible = true
    self.CurrentMenu = "information"
end

function DripClient:RefreshGUI()
    -- Refresh all menu texts
    if self.CurrentMenu then
        self.MenuFrames[self.CurrentMenu].Visible = false
        self.CurrentMenu = nil
    end
    
    -- Rebuild menus with new language
    self:SetupInformationMenu(self.MenuFrames["information"], self.Language)
    self:SetupHomeMenu(self.MenuFrames["home"], self.Language)
    self:SetupCharacterMenu(self.MenuFrames["character"], self.Language)
    self:SetupTrollMenu(self.MenuFrames["troll"], self.Language)
    self:SetupLagMenu(self.MenuFrames["lag"], self.Language)
    self:SetupCarMenu(self.MenuFrames["car"], self.Language)
    
    self.MenuFrames["information"].Visible = true
    self.CurrentMenu = "information"
    
    self:Notify("Language", "Changed to " .. self.Language.menu_information, 2, "success")
end

-- ========== INITIALIZE ==========
DripClient:Init()