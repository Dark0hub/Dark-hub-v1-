-- ============================================================
-- 𖤐 𝐃𝐀𝐑𝐊 𝐇𝐔𝐁 𖤐 - Universal Launcher (Moderno)
-- ============================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ============================================================
-- CONFIGURAÇÕES
-- ============================================================
local DARK_HUB_LOGO = "rbxassetid://76208826954157"
local HUB_BACKGROUND = "rbxassetid://129581125553650"

local KEY_CORRETA = "DARKZINNMVP"
local DISCORD_LINK = "https://discord.gg/HGnARQJZhx"
local VERSION = "v1"

local PLATFORM_SCALES = { mobile = 0.55, pc = 1.00 }

-- ============================================================
-- IMAGENS DOS JOGOS
-- ============================================================
local GAME_IMAGES = {
    ["Steal An Egg"]     = "rbxassetid://89692136510159",
    ["Murder Mystery 2"] = "rbxassetid://75303301760365",
    ["Rivals"]           = "rbxassetid://87109817182786",
    ["Blox Fruits"]      = "rbxassetid://95578910902535",
    ["Blade Ball"]       = "rbxassetid://117801421904163",
    ["Ride a Pet"]       = "rbxassetid://88188513548843"
}

-- ============================================================
-- PALETA
-- ============================================================
local C = {
    bg          = Color3.fromRGB(8, 10, 18),
    panel       = Color3.fromRGB(15, 17, 28),
    panelLight  = Color3.fromRGB(22, 25, 40),
    card        = Color3.fromRGB(20, 23, 38),
    cardHover   = Color3.fromRGB(30, 34, 55),
    accent      = Color3.fromRGB(100, 130, 255),
    accentGlow  = Color3.fromRGB(130, 160, 255),
    purple      = Color3.fromRGB(160, 110, 255),
    text        = Color3.fromRGB(240, 242, 250),
    textDim     = Color3.fromRGB(140, 145, 165),
    textMid     = Color3.fromRGB(180, 185, 205),
    border      = Color3.fromRGB(40, 45, 70),
    borderGlow  = Color3.fromRGB(80, 100, 200),
    success     = Color3.fromRGB(90, 230, 140),
    danger      = Color3.fromRGB(255, 90, 110),
    warning     = Color3.fromRGB(255, 200, 110),
    gold        = Color3.fromRGB(255, 190, 90),
    discord     = Color3.fromRGB(88, 101, 242),
    discordGlow = Color3.fromRGB(114, 137, 218)
}

local currentLang = "pt-BR"

-- ============================================================
-- TRADUÇÕES
-- ============================================================
local Translations = {
    ["pt-BR"] = {
        keyTitle = "Insira sua Key", keySubtitle = "Autenticação necessária para continuar",
        keyPlaceholder = "Insira sua key...", confirm = "Confirmar", paste = "Colar",
        invalidKey = "Key inválida. Tente novamente.", validKey = "Key válida! Continuando...",
        help = "Precisa de ajuda? Entre no servidor do Discord",
        keyInDiscord = "A KEY ESTÁ DISPONÍVEL NO DISCORD!",
        getKeyDiscord = "Pegar Key no Discord",
        linkCopied = "Link copiado! Abrindo...",
        platformTitle = "Escolha sua plataforma", platformSubtitle = "Isso ajusta o tamanho da interface",
        mobile = "Celular", mobileDesc = "Interface compacta",
        pc = "Computador", pcDesc = "Interface completa",
        home = "Início", games = "Jogos",
        search = "Pesquisar jogos...", back = "Voltar",
        scripts = "Scripts", execute = "Executar", loading = "Carregando...",
        success = "OK", error = "Erro", timeout = "Tempo esgotado",
        session = "SESSÃO", connected = "Conectado", availableScripts = "Scripts disponíveis",
        universalLibrary = "Biblioteca Universal", madeBy = "FEITO POR DARK HUB",
        communityScripts = "Scripts da comunidade",
        nowPlaying = "JOGANDO AGORA",
        updated = "ATUALIZADO", hubTitle = "Universal Launcher",
        hubSubtitle = "Originais Dark Hub e biblioteca universal.",
        loadingScript = "Carregando script...", wait = "Aguarde (pode demorar)",
        closeConfirm = "Deseja realmente fechar o Dark Hub?",
        cancel = "Cancelar", closeBtn = "Fechar"
    },
    ["en-US"] = {
        keyTitle = "Enter your Key", keySubtitle = "Authentication required to continue",
        keyPlaceholder = "Enter your key...", confirm = "Confirm", paste = "Paste",
        invalidKey = "Invalid key. Try again.", validKey = "Valid key! Continuing...",
        help = "Need help? Join the Discord server",
        keyInDiscord = "THE KEY IS AVAILABLE ON DISCORD!",
        getKeyDiscord = "Get Key on Discord",
        linkCopied = "Link copied! Opening...",
        platformTitle = "Choose your platform", platformSubtitle = "This adjusts the interface size",
        mobile = "Mobile", mobileDesc = "Compact interface",
        pc = "Computer", pcDesc = "Full interface",
        home = "Home", games = "Games",
        search = "Search games...", back = "Back",
        scripts = "Scripts", execute = "Execute", loading = "Loading...",
        success = "OK", error = "Error", timeout = "Timeout",
        session = "SESSION", connected = "Connected", availableScripts = "Available Scripts",
        universalLibrary = "Universal Library", madeBy = "MADE BY DARK HUB",
        communityScripts = "Community scripts",
        nowPlaying = "NOW PLAYING",
        updated = "UPDATED", hubTitle = "Universal Launcher",
        hubSubtitle = "Dark Hub originals and universal library.",
        loadingScript = "Loading script...", wait = "Please wait (may take a while)",
        closeConfirm = "Do you really want to close Dark Hub?",
        cancel = "Cancel", closeBtn = "Close"
    },
    ["es-ES"] = {
        keyTitle = "Ingresa tu Key", keySubtitle = "Autenticación requerida para continuar",
        keyPlaceholder = "Ingresa tu key...", confirm = "Confirmar", paste = "Pegar",
        invalidKey = "Key inválida. Inténtalo de nuevo.", validKey = "¡Key válida! Continuando...",
        help = "¿Necesitas ayuda? Únete al servidor de Discord",
        keyInDiscord = "¡LA KEY ESTÁ DISPONIBLE EN DISCORD!",
        getKeyDiscord = "Obtener Key en Discord",
        linkCopied = "¡Enlace copiado! Abriendo...",
        platformTitle = "Elige tu plataforma", platformSubtitle = "Esto ajusta el tamaño de la interfaz",
        mobile = "Móvil", mobileDesc = "Interfaz compacta",
        pc = "Computadora", pcDesc = "Interfaz completa",
        home = "Inicio", games = "Juegos",
        search = "Buscar juegos...", back = "Volver",
        scripts = "Scripts", execute = "Ejecutar", loading = "Cargando...",
        success = "OK", error = "Error", timeout = "Tiempo agotado",
        session = "SESIÓN", connected = "Conectado", availableScripts = "Scripts disponibles",
        universalLibrary = "Biblioteca Universal", madeBy = "HECHO POR DARK HUB",
        communityScripts = "Scripts de la comunidad",
        nowPlaying = "JUGANDO AHORA",
        updated = "ACTUALIZADO", hubTitle = "Universal Launcher",
        hubSubtitle = "Originales Dark Hub y biblioteca universal.",
        loadingScript = "Cargando script...", wait = "Espera (puede tardar)",
        closeConfirm = "¿Realmente quieres cerrar Dark Hub?",
        cancel = "Cancelar", closeBtn = "Cerrar"
    }
}

local function T(key)
    local lang = Translations[currentLang] or Translations["pt-BR"]
    return lang[key] or Translations["pt-BR"][key] or key
end

-- ============================================================
-- DADOS DOS JOGOS
-- ============================================================
local games = {
    {
        name = "Steal An Egg",
        localizedNames = {
            ["pt-BR"] = "Roube Um Ovo",
            ["en-US"] = "Steal An Egg",
            ["es-ES"] = "Steal An Egg"
        },
        color = Color3.fromRGB(255, 90, 90),
        placeId = 107780707777162,
        tag = "ORIGINAL",
        scripts = {
            { name = "Miranda Hub",        link = "https://raw.githubusercontent.com/miirandahub/loader/refs/heads/main/stealeggies" },
            { name = "Miranda Hub AFK",    link = "https://raw.githubusercontent.com/miirandahub/loader/refs/heads/main/afkk" },
            { name = "Lennon Hub",         link = "https://raw.githubusercontent.com/lennonxscripts/lennonhubv4/refs/heads/main/stealanegg" },
            { name = "Lennon Auto Farm",   link = "https://raw.githubusercontent.com/lennonxscripts/lennonfarmv2/refs/heads/main/stealanegg" },
            { name = "LKZ Hub",            link = "https://api.luarmor.net/files/v4/loaders/65bf3459d87ba3ac46350e154b640929.lua" },
            { name = "BK's Hub",           link = "https://api.luarmor.net/files/v4/loaders/9ee4edde227ac85f50872bf9e4226508.lua" },
            { name = "Fake Admin",         link = "https://raw.githubusercontent.com/Dayvinksthik/Script/refs/heads/main/Games/JoshBNS-Crack.lua" },
            { name = "Chilli Hub",         link = "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua" },
            { name = "Server PV",          link = "https://pastefy.app/YoZocJ8O/raw" },
            { name = "FYY Hub",            link = "https://raw.githubusercontent.com/napun87/stealanegg/refs/heads/main/fly.lua" },
            { name = "FoxName Hub",        link = "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn-stealanegg.lua" },
            { name = "On Hub",             link = "https://raw.githubusercontent.com/davizin713/ONhub/refs/heads/main/script.lua" },
            { name = "Clover Hub",         link = "https://cloverhub.app/clover.lua" },
        }
    },
    {
        name = "Murder Mystery 2",
        color = Color3.fromRGB(255, 90, 110),
        placeId = 142823291,
        tag = "COMMUNITY",
        scripts = {
            { name = "Forge Hub",  link = "https://raw.githubusercontent.com/ScriptBLOXmm2/ForgeHubWaguri/refs/heads/main/keyless" },
            { name = "MOZQL Hub",  link = "https://raw.githubusercontent.com/snxpzscripts/mm2/refs/heads/main/gumba.lua" },
            { name = "TRAV Hub",   link = "https://raw.githubusercontent.com/josiahcarterthegoat-alt/TravHubMM2/refs/heads/main/script.lua" },
            { name = "Pulse Hub",  link = "https://raw.githubusercontent.com/snxpzscripts/autofarm/refs/heads/main/xmm2" },
            { name = "Waguri Hub", link = "https://raw.githubusercontent.com/Waguriiiii/Murder-mystery-2/refs/heads/main/Waguri.lua" },
        }
    },
    {
        name = "Rivals",
        color = Color3.fromRGB(255, 160, 80),
        placeId = 17625359962,
        tag = "COMMUNITY",
        scripts = {
            { name = "Z3US",                link = "https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/main.lua" },
            { name = "Baza Hub",            link = "https://raw.githubusercontent.com/vasul111/Script-sourse/main/Place/Rivals/Baza%20(%3F)" },
            { name = "Shrak",               link = "https://raw.githubusercontent.com/imshrak/rivals/refs/heads/main/main" },
            { name = "Y-Ji Hub",            link = "https://raw.githubusercontent.com/Oliver139293/RIVALS-Scripts-Silent-Aim-More/refs/heads/main/Silent%20Aim%20and%20More.txt" },
            { name = "Sych Hub",            link = "https://raw.githubusercontent.com/axleoislost/Accent/main/Rivals" },
            { name = "Kagu Hub",            link = "https://raw.githubusercontent.com/Kaguya11/KaguHubRework/main/Scripts/Loader.lua" },
            { name = "Rivals Skin Changer", link = "https://raw.githubusercontent.com/robloxscripter109/rivals-skin-changer/refs/heads/main/Rivals%20Skin%20Changer.Lua" },
        }
    },
    {
        name = "Blox Fruits",
        color = Color3.fromRGB(80, 200, 120),
        placeId = 2753915549,
        tag = "COMMUNITY",
        scripts = {
            { name = "HoHo Hub",               link = "https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI" },
            { name = "4479Hub",                link = "https://raw.githubusercontent.com/4479cantcode/4479Hub/refs/heads/main/Script.lua" },
            { name = "TheScripter Quantum",    link = "https://gist.githubusercontent.com/sheshiidriz-netizen/b880b0c514479292c62a95457031709a/raw" },
            { name = "Banana Hub",             link = "https://raw.githubusercontent.com/kimprobloxdz/banana-free/refs/heads/main/protected_5609200582002947.lua.txt" },
            { name = "Universal Hub (RedZ)",   link = "https://raw.githubusercontent.com/realredz/bloxfruits/refs/heads/main/source.lua" },
            { name = "Dev-NightMystic",        link = "https://raw.githubusercontent.com/Dev-NightMystic/Bloxfruits/refs/heads/main/Script.lua" },
        }
    },
    {
        name = "Blade Ball",
        color = Color3.fromRGB(180, 130, 255),
        placeId = 13772394625,
        tag = "COMMUNITY",
        scripts = {
            { name = "SP HUB",             link = "https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/BladeBall" },
            { name = "VYLERA Hub",         link = "https://raw.githubusercontent.com/vylerascripts/vylera-scripts/main/vylerabladeball.lua" },
            { name = "Azzy Auto Parry",    link = "https://raw.githubusercontent.com/azzyy1/bladeball-script/main/main.lua" },
            { name = "Winds Hub",          link = "https://api.luarmor.net/files/v4/loaders/2e02119bc860dfc0821c4ec83266ca8f.lua" },
            { name = "Dryx Blade Ball",    link = "https://raw.githubusercontent.com/Doortthemort/676/main/Main.lua" },
        }
    },
    {
        name = "Ride a Pet",
        color = Color3.fromRGB(255, 200, 100),
        placeId = 106462296435536,
        tag = "COMMUNITY",
        scripts = {
            { name = "Mystrix Hub",   link = "https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader" },
            { name = "Serenity Hub",  link = "https://raw.githubusercontent.com/MUshihara/Serenity-hub/main/loader.lua" },
            { name = "Bac0nHck Hub",  link = "https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/rideapet.lua" },
        }
    },
}

-- ============================================================
-- UTILITÁRIOS
-- ============================================================
local function abrirLink(url)
    local abriu = false
    pcall(function() GuiService:OpenBrowserWindow(url); abriu = true end)
    if not abriu and setclipboard then pcall(function() setclipboard(url) end) end
    return abriu
end

local function criar(className, props, parent)
    local obj = Instance.new(className)
    if props then
        for k, v in pairs(props) do
            pcall(function() obj[k] = v end)
        end
    end
    if parent then obj.Parent = parent end
    return obj
end

local function corner(parent, radius)
    if not parent then return nil end
    return criar("UICorner", { CornerRadius = UDim.new(0, radius or 8) }, parent)
end

local function stroke(parent, color, thickness, transparency)
    if not parent then return nil end
    return criar("UIStroke", {
        Color = color or C.border,
        Thickness = thickness or 1,
        Transparency = transparency or 0
    }, parent)
end

local function tween(obj, time, props)
    if not obj then return end
    local ok, t = pcall(function()
        return TweenService:Create(obj, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
    end)
    if ok and t then t:Play(); return t end
end

local function gameThumbUrl(placeId, gameName)
    if gameName and GAME_IMAGES[gameName] then
        return GAME_IMAGES[gameName]
    end
    return "rbxthumb://type=GameIcon&id=" .. tostring(placeId) .. "&w=150&h=150"
end

-- ✅ Retorna o nome do jogo traduzido para o idioma atual
local function gameName(g)
    if g.localizedNames and g.localizedNames[currentLang] then
        return g.localizedNames[currentLang]
    end
    return g.name
end

-- ============================================================
-- ROOT
-- ============================================================
local Root = criar("ScreenGui", {
    Name = "DarkHubUniversal",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 999,
    IgnoreGuiInset = true
}, PlayerGui)

-- ============================================================
-- TELA 0 — IDIOMA
-- ============================================================
local function buildLanguageScreen()
    local LanguageScreen = criar("Frame", {
        Name = "LanguageScreen",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = C.bg,
        BorderSizePixel = 0,
        ZIndex = 100
    }, Root)

    local LangCard = criar("Frame", {
        Size = UDim2.new(0, 340, 0, 360),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = C.panel,
        BorderSizePixel = 0,
        ZIndex = 101
    }, LanguageScreen)
    corner(LangCard, 18)
    stroke(LangCard, C.borderGlow, 1.5, 0.5)

    local LangLogo = criar("Frame", {
        Size = UDim2.new(0, 70, 0, 70),
        Position = UDim2.new(0.5, -35, 0, 30),
        BackgroundColor3 = C.panelLight,
        BorderSizePixel = 0,
        ZIndex = 102
    }, LangCard)
    corner(LangLogo, 35)
    stroke(LangLogo, C.accent, 2, 0.2)

    local LangLogoImg = criar("ImageLabel", {
        Name = "LogoImage",
        Size = UDim2.new(1, -4, 1, -4),
        Position = UDim2.new(0, 2, 0, 2),
        BackgroundTransparency = 1,
        Image = DARK_HUB_LOGO,
        ScaleType = Enum.ScaleType.Crop,
        ZIndex = 103
    }, LangLogo)
    corner(LangLogoImg, 34)

    criar("TextLabel", {
        Size = UDim2.new(1, 0, 0, 26),
        Position = UDim2.new(0, 0, 0, 118),
        BackgroundTransparency = 1,
        Text = "DARK HUB",
        TextColor3 = C.text,
        Font = Enum.Font.GothamBold,
        TextSize = 22,
        ZIndex = 102
    }, LangCard)

    criar("TextLabel", {
        Size = UDim2.new(1, 0, 0, 18),
        Position = UDim2.new(0, 0, 0, 148),
        BackgroundTransparency = 1,
        Text = "Select your language",
        TextColor3 = C.textDim,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        ZIndex = 102
    }, LangCard)

    local LangList = criar("Frame", {
        Size = UDim2.new(1, -40, 0, 160),
        Position = UDim2.new(0, 20, 0, 180),
        BackgroundTransparency = 1,
        ZIndex = 102
    }, LangCard)

    criar("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder
    }, LangList)

    local function criarBotaoIdioma(flag, nome, code, ordem)
        local btn = criar("TextButton", {
            Size = UDim2.new(1, 0, 0, 44),
            BackgroundColor3 = C.card,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = ordem,
            ZIndex = 103
        }, LangList)
        corner(btn, 12)
        local s = stroke(btn, C.border, 1, 0.3)

        criar("TextLabel", {
            Size = UDim2.new(0, 40, 0, 44),
            Position = UDim2.new(0, 12, 0, 0),
            BackgroundTransparency = 1,
            Text = flag,
            TextColor3 = C.textMid,
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            ZIndex = 104
        }, btn)

        criar("TextLabel", {
            Size = UDim2.new(1, -70, 0, 44),
            Position = UDim2.new(0, 55, 0, 0),
            BackgroundTransparency = 1,
            Text = nome,
            TextColor3 = C.text,
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 104
        }, btn)

        local arrow = criar("TextLabel", {
            Size = UDim2.new(0, 30, 0, 44),
            Position = UDim2.new(1, -38, 0, 0),
            BackgroundTransparency = 1,
            Text = ">",
            TextColor3 = C.textDim,
            Font = Enum.Font.GothamBold,
            TextSize = 18,
            ZIndex = 104
        }, btn)

        btn.MouseEnter:Connect(function()
            tween(btn, 0.15, { BackgroundColor3 = C.cardHover })
            tween(s, 0.15, { Color = C.accent, Transparency = 0 })
            arrow.TextColor3 = C.accent
        end)
        btn.MouseLeave:Connect(function()
            tween(btn, 0.15, { BackgroundColor3 = C.card })
            tween(s, 0.15, { Color = C.border, Transparency = 0.3 })
            arrow.TextColor3 = C.textDim
        end)

        btn.MouseButton1Click:Connect(function()
            currentLang = code
            tween(LanguageScreen, 0.25, { BackgroundTransparency = 1 })
            tween(LangCard, 0.25, { BackgroundTransparency = 1 })
            task.wait(0.25)
            LanguageScreen:Destroy()
            if _G.ShowKeyScreen then _G.ShowKeyScreen() end
        end)
    end

    criarBotaoIdioma("BR", "Portugues", "pt-BR", 1)
    criarBotaoIdioma("US", "English", "en-US", 2)
    criarBotaoIdioma("ES", "Espanol", "es-ES", 3)
end

-- ============================================================
-- TELA 1 — KEY
-- ============================================================
_G.ShowKeyScreen = function()
    local KeyScreen = criar("Frame", {
        Name = "KeyScreen",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = C.bg,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ZIndex = 100
    }, Root)

    local KeyCard = criar("Frame", {
        Size = UDim2.new(0, 360, 0, 460),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = C.panel,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ZIndex = 101
    }, KeyScreen)
    corner(KeyCard, 18)
    stroke(KeyCard, C.borderGlow, 1.5, 0.5)

    tween(KeyScreen, 0.25, { BackgroundTransparency = 0 })
    tween(KeyCard, 0.25, { BackgroundTransparency = 0 })

    local KeyIcon = criar("Frame", {
        Size = UDim2.new(0, 60, 0, 60),
        Position = UDim2.new(0.5, -30, 0, 22),
        BackgroundColor3 = C.panelLight,
        BorderSizePixel = 0,
        ZIndex = 102
    }, KeyCard)
    corner(KeyIcon, 30)
    stroke(KeyIcon, C.accent, 2, 0.2)

    criar("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "K",
        TextColor3 = C.accent,
        Font = Enum.Font.GothamBold,
        TextSize = 28,
        ZIndex = 103
    }, KeyIcon)

    criar("TextLabel", {
        Size = UDim2.new(1, 0, 0, 24),
        Position = UDim2.new(0, 0, 0, 92),
        BackgroundTransparency = 1,
        Text = T("keyTitle"),
        TextColor3 = C.text,
        Font = Enum.Font.GothamBold,
        TextSize = 16,
        ZIndex = 102
    }, KeyCard)

    criar("TextLabel", {
        Size = UDim2.new(1, 0, 0, 16),
        Position = UDim2.new(0, 0, 0, 118),
        BackgroundTransparency = 1,
        Text = T("keySubtitle"),
        TextColor3 = C.textDim,
        Font = Enum.Font.Gotham,
        TextSize = 11,
        ZIndex = 102
    }, KeyCard)

    local InputBox = criar("Frame", {
        Size = UDim2.new(1, -50, 0, 44),
        Position = UDim2.new(0, 25, 0, 146),
        BackgroundColor3 = C.panelLight,
        BorderSizePixel = 0,
        ZIndex = 102
    }, KeyCard)
    corner(InputBox, 10)
    stroke(InputBox, C.border, 1, 0.3)

    local KeyInput = criar("TextBox", {
        Size = UDim2.new(1, -95, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        PlaceholderText = T("keyPlaceholder"),
        PlaceholderColor3 = C.textDim,
        TextColor3 = C.text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        ZIndex = 103
    }, InputBox)

    local PasteBtn = criar("TextButton", {
        Size = UDim2.new(0, 65, 0, 32),
        Position = UDim2.new(1, -72, 0.5, -16),
        BackgroundColor3 = C.cardHover,
        BorderSizePixel = 0,
        Text = T("paste"),
        TextColor3 = C.textMid,
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        AutoButtonColor = false,
        ZIndex = 103
    }, InputBox)
    corner(PasteBtn, 8)

    PasteBtn.MouseButton1Click:Connect(function()
        local clip
        if getclipboard then pcall(function() clip = getclipboard() end) end
        if not clip and clipboard and clipboard.get then pcall(function() clip = clipboard.get() end) end
        if clip then KeyInput.Text = clip end
    end)

    local ErrorLabel = criar("TextLabel", {
        Size = UDim2.new(1, 0, 0, 18),
        Position = UDim2.new(0, 0, 0, 198),
        BackgroundTransparency = 1,
        Text = "",
        TextColor3 = C.danger,
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        ZIndex = 102
    }, KeyCard)

    local ConfirmBtn = criar("TextButton", {
        Size = UDim2.new(1, -50, 0, 42),
        Position = UDim2.new(0, 25, 0, 224),
        BackgroundColor3 = C.accent,
        BorderSizePixel = 0,
        Text = T("confirm"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        AutoButtonColor = false,
        ZIndex = 102
    }, KeyCard)
    corner(ConfirmBtn, 10)

    ConfirmBtn.MouseEnter:Connect(function() tween(ConfirmBtn, 0.15, { BackgroundColor3 = C.accentGlow }) end)
    ConfirmBtn.MouseLeave:Connect(function() tween(ConfirmBtn, 0.15, { BackgroundColor3 = C.accent }) end)

    -- ============================================================
    -- DIVISOR "OU" / "OR"
    -- ============================================================
    criar("Frame", {
        Size = UDim2.new(1, -60, 0, 1),
        Position = UDim2.new(0, 30, 0, 282),
        BackgroundColor3 = C.border,
        BorderSizePixel = 0,
        ZIndex = 102
    }, KeyCard)

    -- ============================================================
    -- AVISO: KEY ESTÁ NO DISCORD
    -- ============================================================
    criar("TextLabel", {
        Size = UDim2.new(1, -50, 0, 18),
        Position = UDim2.new(0, 25, 0, 298),
        BackgroundTransparency = 1,
        Text = T("keyInDiscord"),
        TextColor3 = C.gold,
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        ZIndex = 102
    }, KeyCard)

    -- ============================================================
    -- BOTÃO: PEGAR KEY NO DISCORD (copia + abre o link)
    -- ============================================================
    local DiscordBtn = criar("TextButton", {
        Size = UDim2.new(1, -50, 0, 46),
        Position = UDim2.new(0, 25, 0, 322),
        BackgroundColor3 = C.discord,
        BorderSizePixel = 0,
        Text = T("getKeyDiscord"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        AutoButtonColor = false,
        ZIndex = 103
    }, KeyCard)
    corner(DiscordBtn, 10)
    stroke(DiscordBtn, C.discordGlow, 1.5, 0.2)

    DiscordBtn.MouseEnter:Connect(function()
        tween(DiscordBtn, 0.15, { BackgroundColor3 = C.discordGlow })
    end)
    DiscordBtn.MouseLeave:Connect(function()
        tween(DiscordBtn, 0.15, { BackgroundColor3 = C.discord })
    end)

    DiscordBtn.MouseButton1Click:Connect(function()
        -- Copia o link para a área de transferência
        if setclipboard then
            pcall(function() setclipboard(DISCORD_LINK) end)
        end
        -- Feedback visual
        DiscordBtn.Text = T("linkCopied")
        DiscordBtn.BackgroundColor3 = C.success
        task.wait(1.8)
        DiscordBtn.Text = T("getKeyDiscord")
        DiscordBtn.BackgroundColor3 = C.discord
        -- Abre o navegador
        abrirLink(DISCORD_LINK)
    end)

    criar("TextLabel", {
        Size = UDim2.new(1, 0, 0, 16),
        Position = UDim2.new(0, 0, 0, 384),
        BackgroundTransparency = 1,
        Text = "discord.gg/HGnARQJZhx",
        TextColor3 = C.discordGlow,
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        ZIndex = 102
    }, KeyCard)

    criar("TextLabel", {
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.new(0, 0, 0, 406),
        BackgroundTransparency = 1,
        Text = T("help"),
        TextColor3 = C.textDim,
        Font = Enum.Font.Gotham,
        TextSize = 10,
        ZIndex = 102
    }, KeyCard)

    criar("TextLabel", {
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.new(0, 0, 0, 424),
        BackgroundTransparency = 1,
        Text = VERSION .. " - " .. T("madeBy"),
        TextColor3 = C.textDim,
        Font = Enum.Font.Gotham,
        TextSize = 9,
        ZIndex = 102
    }, KeyCard)

    -- DRAG
    local dragging, dragStart, startPos
    KeyCard.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local objs = PlayerGui:GetGuiObjectsAtPosition(input.Position.X, input.Position.Y)
            local isButton = false
            for _, o in ipairs(objs) do
                if o:IsA("TextButton") or o:IsA("TextBox") then isButton = true; break end
            end
            if not isButton then
                dragging = true
                dragStart = input.Position
                startPos = KeyCard.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            KeyCard.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    local function verificar()
        if KeyInput.Text == KEY_CORRETA then
            ErrorLabel.Text = T("validKey")
            ErrorLabel.TextColor3 = C.success
            task.wait(0.6)
            KeyScreen:Destroy()
            if _G.ShowPlatformScreen then _G.ShowPlatformScreen() end
        else
            ErrorLabel.Text = T("invalidKey")
            ErrorLabel.TextColor3 = C.danger
            KeyInput.Text = ""
            local orig = InputBox.Position
            for i = 1, 4 do
                InputBox.Position = orig + UDim2.new(0, 5, 0, 0)
                task.wait(0.04)
                InputBox.Position = orig - UDim2.new(0, 5, 0, 0)
                task.wait(0.04)
            end
            InputBox.Position = orig
        end
    end

    ConfirmBtn.MouseButton1Click:Connect(verificar)
    KeyInput.FocusLost:Connect(function(enter) if enter then verificar() end end)
end

-- ============================================================
-- TELA 1.5 — PLATAFORMA
-- ============================================================
_G.ShowPlatformScreen = function()
    local PlatformScreen = criar("Frame", {
        Name = "PlatformScreen",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = C.bg,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ZIndex = 100
    }, Root)

    local PlatformCard = criar("Frame", {
        Size = UDim2.new(0, 340, 0, 320),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = C.panel,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ZIndex = 101
    }, PlatformScreen)
    corner(PlatformCard, 18)
    stroke(PlatformCard, C.borderGlow, 1.5, 0.5)

    tween(PlatformScreen, 0.25, { BackgroundTransparency = 0 })
    tween(PlatformCard, 0.25, { BackgroundTransparency = 0 })

    local iconFrame = criar("Frame", {
        Size = UDim2.new(0, 60, 0, 60),
        Position = UDim2.new(0.5, -30, 0, 25),
        BackgroundColor3 = C.panelLight,
        BorderSizePixel = 0,
        ZIndex = 102
    }, PlatformCard)
    corner(iconFrame, 30)
    stroke(iconFrame, C.accent, 2, 0.2)

    criar("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "*",
        TextColor3 = C.accent,
        Font = Enum.Font.GothamBold,
        TextSize = 28,
        ZIndex = 103
    }, iconFrame)

    criar("TextLabel", {
        Size = UDim2.new(1, 0, 0, 24),
        Position = UDim2.new(0, 0, 0, 98),
        BackgroundTransparency = 1,
        Text = T("platformTitle"),
        TextColor3 = C.text,
        Font = Enum.Font.GothamBold,
        TextSize = 16,
        ZIndex = 102
    }, PlatformCard)

    criar("TextLabel", {
        Size = UDim2.new(1, 0, 0, 16),
        Position = UDim2.new(0, 0, 0, 124),
        BackgroundTransparency = 1,
        Text = T("platformSubtitle"),
        TextColor3 = C.textDim,
        Font = Enum.Font.Gotham,
        TextSize = 11,
        ZIndex = 102
    }, PlatformCard)

    local platformList = criar("Frame", {
        Size = UDim2.new(1, -40, 0, 160),
        Position = UDim2.new(0, 20, 0, 155),
        BackgroundTransparency = 1,
        ZIndex = 102
    }, PlatformCard)

    criar("UIListLayout", {
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder
    }, platformList)

    local function criarCardPlataforma(titulo, descricao, scale, ordem, corDestaque)
        local btn = criar("TextButton", {
            Size = UDim2.new(1, 0, 0, 70),
            BackgroundColor3 = C.card,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = ordem,
            ZIndex = 103
        }, platformList)
        corner(btn, 12)
        local s = stroke(btn, corDestaque, 1.5, 0.4)

        criar("Frame", {
            Size = UDim2.new(0, 4, 0, 44),
            Position = UDim2.new(0, 0, 0.5, -22),
            BackgroundColor3 = corDestaque,
            BorderSizePixel = 0,
            ZIndex = 104
        }, btn)

        criar("TextLabel", {
            Size = UDim2.new(1, -90, 0, 22),
            Position = UDim2.new(0, 20, 0, 16),
            BackgroundTransparency = 1,
            Text = titulo,
            TextColor3 = C.text,
            Font = Enum.Font.GothamBold,
            TextSize = 15,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 104
        }, btn)

        criar("TextLabel", {
            Size = UDim2.new(1, -90, 0, 16),
            Position = UDim2.new(0, 20, 0, 38),
            BackgroundTransparency = 1,
            Text = descricao,
            TextColor3 = C.textDim,
            Font = Enum.Font.Gotham,
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 104
        }, btn)

        btn.MouseEnter:Connect(function()
            tween(btn, 0.15, { BackgroundColor3 = C.cardHover })
            tween(s, 0.15, { Transparency = 0 })
        end)
        btn.MouseLeave:Connect(function()
            tween(btn, 0.15, { BackgroundColor3 = C.card })
            tween(s, 0.15, { Transparency = 0.4 })
        end)

        btn.MouseButton1Click:Connect(function()
            tween(PlatformScreen, 0.25, { BackgroundTransparency = 1 })
            tween(PlatformCard, 0.25, { BackgroundTransparency = 1 })
            task.wait(0.25)
            PlatformScreen:Destroy()
            if _G.ShowHubScreen then _G.ShowHubScreen(scale) end
        end)
    end

    criarCardPlataforma(T("mobile"), T("mobileDesc"), PLATFORM_SCALES.mobile, 1, C.purple)
    criarCardPlataforma(T("pc"), T("pcDesc"), PLATFORM_SCALES.pc, 2, C.accent)
end

-- ============================================================
-- TELA 2 — DARK HUB
-- ============================================================
_G.ShowHubScreen = function(uiScale)
    uiScale = uiScale or PLATFORM_SCALES.pc

    local HubFrame = criar("Frame", {
        Name = "HubFrame",
        Size = UDim2.new(0, 900, 0, 560),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = C.bg,
        BorderSizePixel = 0,
        Active = true,
        ClipsDescendants = true,
        ZIndex = 50
    }, Root)
    corner(HubFrame, 18)
    stroke(HubFrame, C.border, 1, 0)
    criar("UIScale", { Scale = uiScale }, HubFrame)

    -- FUNDO DO HUB (IMAGEM)
    local bgImage = criar("ImageLabel", {
        Name = "BackgroundImage",
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Image = HUB_BACKGROUND,
        ScaleType = Enum.ScaleType.Crop,
        ZIndex = 50
    }, HubFrame)
    corner(bgImage, 18)

    local bgOverlay = criar("Frame", {
        Name = "BackgroundOverlay",
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.45,
        BorderSizePixel = 0,
        ZIndex = 51
    }, HubFrame)
    corner(bgOverlay, 18)

    -- SIDEBAR
    local Sidebar = criar("Frame", {
        Name = "Sidebar",
        Size = UDim2.new(0, 190, 1, 0),
        BackgroundColor3 = C.panel,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        ZIndex = 52
    }, HubFrame)
    corner(Sidebar, 18)
    criar("Frame", {
        Size = UDim2.new(0, 18, 1, 0),
        Position = UDim2.new(1, -18, 0, 0),
        BackgroundColor3 = C.panel,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        ZIndex = 53
    }, Sidebar)

    local SideLogo = criar("Frame", {
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 18, 0, 20),
        BackgroundColor3 = C.panelLight,
        BorderSizePixel = 0,
        ZIndex = 54
    }, Sidebar)
    corner(SideLogo, 12)
    stroke(SideLogo, C.accent, 1.5, 0.3)

    local SideLogoImg = criar("ImageLabel", {
        Name = "LogoImage",
        Size = UDim2.new(1, -4, 1, -4),
        Position = UDim2.new(0, 2, 0, 2),
        BackgroundTransparency = 1,
        Image = DARK_HUB_LOGO,
        ScaleType = Enum.ScaleType.Crop,
        ZIndex = 55
    }, SideLogo)
    corner(SideLogoImg, 10)

    criar("TextLabel", {
        Size = UDim2.new(0, 100, 0, 40),
        Position = UDim2.new(0, 68, 0, 20),
        BackgroundTransparency = 1,
        Text = "DARK HUB",
        TextColor3 = C.text,
        Font = Enum.Font.GothamBold,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 55
    }, Sidebar)

    local navItems = {
        { key = "home",  label = T("home"),  icon = "H" },
        { key = "games", label = T("games"), icon = "G" }
    }

    local navFrame = criar("Frame", {
        Size = UDim2.new(1, -20, 0, 200),
        Position = UDim2.new(0, 10, 0, 80),
        BackgroundTransparency = 1,
        ZIndex = 54
    }, Sidebar)
    criar("UIListLayout", {
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder
    }, navFrame)

    local navButtons = {}
    local showHome, showGames

    local function setActiveNav(key)
        for k, btn in pairs(navButtons) do
            local isActive = (k == key)
            tween(btn.bg, 0.2, { BackgroundColor3 = isActive and C.panelLight or C.panel })
            btn.stroke.Transparency = isActive and 0 or 0.7
            btn.label.TextColor3 = isActive and C.text or C.textMid
            btn.bar.Visible = isActive
        end
        if key == "home" then showHome() else showGames() end
    end

    for i, item in ipairs(navItems) do
        local btn = criar("TextButton", {
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = C.panel,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = i,
            ZIndex = 55
        }, navFrame)
        corner(btn, 10)
        local s = stroke(btn, C.accent, 1, 0.7)

        criar("TextLabel", {
            Size = UDim2.new(0, 30, 1, 0),
            Position = UDim2.new(0, 12, 0, 0),
            BackgroundTransparency = 1,
            Text = item.icon,
            TextColor3 = C.textMid,
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            ZIndex = 56
        }, btn)

        local lbl = criar("TextLabel", {
            Size = UDim2.new(1, -45, 1, 0),
            Position = UDim2.new(0, 42, 0, 0),
            BackgroundTransparency = 1,
            Text = item.label,
            TextColor3 = C.textMid,
            Font = Enum.Font.GothamBold,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 56
        }, btn)

        local bar = criar("Frame", {
            Size = UDim2.new(0, 3, 0, 20),
            Position = UDim2.new(1, -3, 0.5, -10),
            BackgroundColor3 = C.accent,
            BorderSizePixel = 0,
            Visible = false,
            ZIndex = 56
        }, btn)
        corner(bar, 2)

        navButtons[item.key] = { bg = btn, stroke = s, label = lbl, bar = bar }
        btn.MouseButton1Click:Connect(function() setActiveNav(item.key) end)
    end

    -- Session Card
    local SessionCard = criar("Frame", {
        Size = UDim2.new(1, -20, 0, 100),
        Position = UDim2.new(0, 10, 1, -110),
        BackgroundColor3 = C.panelLight,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        ZIndex = 54
    }, Sidebar)
    corner(SessionCard, 10)
    stroke(SessionCard, C.border, 1, 0.5)

    criar("TextLabel", {
        Size = UDim2.new(1, -20, 0, 16),
        Position = UDim2.new(0, 10, 0, 8),
        BackgroundTransparency = 1,
        Text = T("session"),
        TextColor3 = C.textDim,
        Font = Enum.Font.GothamBold,
        TextSize = 9,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 55
    }, SessionCard)

    criar("TextLabel", {
        Size = UDim2.new(1, -20, 0, 18),
        Position = UDim2.new(0, 10, 0, 26),
        BackgroundTransparency = 1,
        Text = LocalPlayer.DisplayName or LocalPlayer.Name,
        TextColor3 = C.text,
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 55
    }, SessionCard)

    local avatarFrame = criar("Frame", {
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 10, 0, 50),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
        ZIndex = 55
    }, SessionCard)
    corner(avatarFrame, 20)
    stroke(avatarFrame, C.gold, 1.5, 0)

    local avatarImg = criar("ImageLabel", {
        Size = UDim2.new(1, -6, 1, -6),
        Position = UDim2.new(0, 3, 0, 3),
        BackgroundTransparency = 1,
        Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150",
        ZIndex = 56
    }, avatarFrame)
    corner(avatarImg, 18)

    criar("TextLabel", {
        Size = UDim2.new(1, -60, 0, 14),
        Position = UDim2.new(0, 58, 0, 54),
        BackgroundTransparency = 1,
        Text = "@" .. LocalPlayer.Name,
        TextColor3 = C.textMid,
        Font = Enum.Font.Gotham,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 55
    }, SessionCard)

    criar("TextLabel", {
        Size = UDim2.new(1, -60, 0, 14),
        Position = UDim2.new(0, 58, 0, 70),
        BackgroundTransparency = 1,
        Text = "o " .. T("connected"),
        TextColor3 = C.success,
        Font = Enum.Font.GothamBold,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 55
    }, SessionCard)

    -- TOP BAR
    local TopBar = criar("Frame", {
        Name = "TopBar",
        Size = UDim2.new(1, -190, 0, 56),
        Position = UDim2.new(0, 190, 0, 0),
        BackgroundColor3 = C.panel,
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        ZIndex = 52
    }, HubFrame)

    criar("TextLabel", {
        Size = UDim2.new(0, 300, 0, 22),
        Position = UDim2.new(0, 24, 0, 10),
        BackgroundTransparency = 1,
        Text = T("hubTitle"),
        TextColor3 = C.text,
        Font = Enum.Font.GothamBold,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 54
    }, TopBar)

    criar("TextLabel", {
        Size = UDim2.new(0, 400, 0, 16),
        Position = UDim2.new(0, 24, 0, 30),
        BackgroundTransparency = 1,
        Text = T("hubSubtitle"),
        TextColor3 = C.textDim,
        Font = Enum.Font.Gotham,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 54
    }, TopBar)

    local versionBadge = criar("TextButton", {
        Size = UDim2.new(0, 110, 0, 26),
        Position = UDim2.new(1, -250, 0.5, -13),
        BackgroundColor3 = C.panelLight,
        BorderSizePixel = 0,
        Text = VERSION .. " " .. T("updated"),
        TextColor3 = C.accent,
        Font = Enum.Font.GothamBold,
        TextSize = 10,
        AutoButtonColor = false,
        ZIndex = 54
    }, TopBar)
    corner(versionBadge, 13)
    stroke(versionBadge, C.accent, 1, 0.6)

    local minBtn = criar("TextButton", {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -135, 0.5, -15),
        BackgroundColor3 = C.panelLight,
        BorderSizePixel = 0,
        Text = "-",
        TextColor3 = C.textMid,
        Font = Enum.Font.GothamBold,
        TextSize = 16,
        AutoButtonColor = false,
        ZIndex = 54
    }, TopBar)
    corner(minBtn, 8)

    local closeBtn = criar("TextButton", {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -100, 0.5, -15),
        BackgroundColor3 = C.panelLight,
        BorderSizePixel = 0,
        Text = "X",
        TextColor3 = C.textMid,
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        AutoButtonColor = false,
        ZIndex = 54
    }, TopBar)
    corner(closeBtn, 8)

    closeBtn.MouseEnter:Connect(function()
        tween(closeBtn, 0.15, { BackgroundColor3 = C.danger })
        closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
    end)
    closeBtn.MouseLeave:Connect(function()
        tween(closeBtn, 0.15, { BackgroundColor3 = C.panelLight })
        closeBtn.TextColor3 = C.textMid
    end)

    minBtn.MouseButton1Click:Connect(function()
        HubFrame.Visible = false
        local reopen = criar("TextButton", {
            Size = UDim2.new(0, 50, 0, 50),
            Position = UDim2.new(0, 20, 0, 90),
            BackgroundColor3 = C.accent,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            ZIndex = 999,
            Active = true
        }, Root)
        corner(reopen, 25)
        stroke(reopen, C.accentGlow, 2, 0.3)

        local reopenImg = criar("ImageLabel", {
            Name = "LogoImage",
            Size = UDim2.new(1, -6, 1, -6),
            Position = UDim2.new(0, 3, 0, 3),
            BackgroundTransparency = 1,
            Image = DARK_HUB_LOGO,
            ScaleType = Enum.ScaleType.Crop,
            ZIndex = 1000
        }, reopen)
        corner(reopenImg, 22)

        local rDrag, rStart, rPos, rMoved
        reopen.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                rDrag = true
                rMoved = false
                rStart = input.Position
                rPos = reopen.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        if not rMoved then
                            HubFrame.Visible = true
                            reopen:Destroy()
                        end
                        rDrag = false
                    end
                end)
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if rDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - rStart
                if math.abs(delta.X) > 3 or math.abs(delta.Y) > 3 then
                    rMoved = true
                    reopen.Position = UDim2.new(rPos.X.Scale, rPos.X.Offset + delta.X, rPos.Y.Scale, rPos.Y.Offset + delta.Y)
                end
            end
        end)
    end)

    closeBtn.MouseButton1Click:Connect(function()
        local ConfirmGui = criar("ScreenGui", {
            Name = "DarkHubConfirm",
            ResetOnSpawn = false,
            DisplayOrder = 1000
        }, PlayerGui)

        criar("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            ZIndex = 1001
        }, ConfirmGui)

        local cFrame = criar("Frame", {
            Size = UDim2.new(0, 320, 0, 170),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = C.panel,
            BorderSizePixel = 0,
            ZIndex = 1002
        }, ConfirmGui)
        corner(cFrame, 14)
        stroke(cFrame, C.borderGlow, 1.5, 0.3)

        criar("TextLabel", {
            Size = UDim2.new(1, 0, 0, 30),
            Position = UDim2.new(0, 0, 0, 20),
            BackgroundTransparency = 1,
            Text = "DARK HUB",
            TextColor3 = C.accent,
            Font = Enum.Font.GothamBold,
            TextSize = 18,
            ZIndex = 1003
        }, cFrame)

        criar("TextLabel", {
            Size = UDim2.new(1, -30, 0, 40),
            Position = UDim2.new(0, 15, 0, 55),
            BackgroundTransparency = 1,
            Text = T("closeConfirm"),
            TextColor3 = C.text,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextWrapped = true,
            ZIndex = 1003
        }, cFrame)

        local btnYes = criar("TextButton", {
            Size = UDim2.new(0, 130, 0, 40),
            Position = UDim2.new(0, 20, 1, -55),
            BackgroundColor3 = C.danger,
            BorderSizePixel = 0,
            Text = T("closeBtn"),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.GothamBold,
            TextSize = 13,
            AutoButtonColor = false,
            ZIndex = 1003
        }, cFrame)
        corner(btnYes, 8)

        local btnNo = criar("TextButton", {
            Size = UDim2.new(0, 130, 0, 40),
            Position = UDim2.new(1, -150, 1, -55),
            BackgroundColor3 = C.cardHover,
            BorderSizePixel = 0,
            Text = T("cancel"),
            TextColor3 = C.text,
            Font = Enum.Font.GothamBold,
            TextSize = 13,
            AutoButtonColor = false,
            ZIndex = 1003
        }, cFrame)
        corner(btnNo, 8)
        stroke(btnNo, C.border, 1, 0.3)

        btnYes.MouseButton1Click:Connect(function()
            ConfirmGui:Destroy()
            HubFrame:Destroy()
        end)

        btnNo.MouseButton1Click:Connect(function()
            ConfirmGui:Destroy()
        end)
    end)

    -- CONTEÚDO
    local ContentArea = criar("Frame", {
        Name = "ContentArea",
        Size = UDim2.new(1, -190, 1, -56),
        Position = UDim2.new(0, 190, 0, 56),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 52
    }, HubFrame)

    -- HOME
    local HomeFrame = criar("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ZIndex = 53
    }, ContentArea)

    local HeroCard = criar("Frame", {
        Size = UDim2.new(1, -40, 0, 230),
        Position = UDim2.new(0, 20, 0, 20),
        BackgroundColor3 = C.card,
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        ZIndex = 54
    }, HomeFrame)
    corner(HeroCard, 14)
    stroke(HeroCard, C.border, 1, 0.3)

    local heroBanner = criar("Frame", {
        Name = "HeroBanner",
        Size = UDim2.new(0, 180, 0, 180),
        Position = UDim2.new(0, 30, 0.5, -90),
        BackgroundColor3 = C.panelLight,
        BorderSizePixel = 0,
        ZIndex = 55
    }, HeroCard)
    corner(heroBanner, 16)
    stroke(heroBanner, C.accent, 2, 0.3)

    local heroBannerImg = criar("ImageLabel", {
        Name = "BannerImage",
        Size = UDim2.new(1, -8, 1, -8),
        Position = UDim2.new(0, 4, 0, 4),
        BackgroundTransparency = 1,
        Image = DARK_HUB_LOGO,
        ScaleType = Enum.ScaleType.Crop,
        ZIndex = 56
    }, heroBanner)
    corner(heroBannerImg, 12)

    criar("TextLabel", {
        Size = UDim2.new(0, 350, 0, 34),
        Position = UDim2.new(0, 240, 0, 30),
        BackgroundTransparency = 1,
        Text = "DARK",
        TextColor3 = C.text,
        Font = Enum.Font.GothamBold,
        TextSize = 32,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 55
    }, HeroCard)

    criar("TextLabel", {
        Size = UDim2.new(0, 350, 0, 34),
        Position = UDim2.new(0, 240, 0, 62),
        BackgroundTransparency = 1,
        Text = "HUB",
        TextColor3 = C.accent,
        Font = Enum.Font.GothamBold,
        TextSize = 32,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 55
    }, HeroCard)

    criar("TextLabel", {
        Size = UDim2.new(0, 400, 0, 18),
        Position = UDim2.new(0, 240, 0, 100),
        BackgroundTransparency = 1,
        Text = T("hubSubtitle"),
        TextColor3 = C.textDim,
        Font = Enum.Font.Gotham,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 55
    }, HeroCard)

    local nowPlaying = criar("Frame", {
        Size = UDim2.new(0, 400, 0, 50),
        Position = UDim2.new(0, 240, 0, 130),
        BackgroundColor3 = C.panelLight,
        BorderSizePixel = 0,
        ZIndex = 55
    }, HeroCard)
    corner(nowPlaying, 10)

    criar("TextLabel", {
        Size = UDim2.new(1, -20, 0, 12),
        Position = UDim2.new(0, 12, 0, 6),
        BackgroundTransparency = 1,
        Text = T("nowPlaying"),
        TextColor3 = C.textDim,
        Font = Enum.Font.GothamBold,
        TextSize = 8,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 56
    }, nowPlaying)

    criar("TextLabel", {
        Size = UDim2.new(1, -20, 0, 16),
        Position = UDim2.new(0, 12, 0, 22),
        BackgroundTransparency = 1,
        Text = game.PlaceId and ("Place " .. game.PlaceId) or "Unknown",
        TextColor3 = C.text,
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 56
    }, nowPlaying)

    criar("TextLabel", {
        Size = UDim2.new(1, -40, 0, 16),
        Position = UDim2.new(0, 20, 0, 270),
        BackgroundTransparency = 1,
        Text = T("madeBy"),
        TextColor3 = C.textDim,
        Font = Enum.Font.GothamBold,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 54
    }, HomeFrame)

    -- QUICK ROW — ARRASTAR PARA O LADO (SCROLL HORIZONTAL)
    local quickRow = criar("ScrollingFrame", {
        Name = "QuickRow",
        Size = UDim2.new(1, -40, 0, 145),
        Position = UDim2.new(0, 20, 0, 284),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = C.accent,
        ScrollingDirection = Enum.ScrollingDirection.X,
        ScrollingEnabled = true,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.X,
        ElasticBehavior = Enum.ElasticBehavior.Never,
        ZIndex = 54
    }, HomeFrame)

    criar("UIListLayout", {
        Padding = UDim.new(0, 10),
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, quickRow)

    -- CARDS DOS JOGOS NA HOME
    for i, g in ipairs(games) do
        local card = criar("TextButton", {
            Name = "GameCard_" .. i,
            Size = UDim2.new(0, 175, 0, 130),
            BackgroundColor3 = C.card,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = i,
            ZIndex = 55
        }, quickRow)
        corner(card, 12)
        stroke(card, g.color, 1.5, 0.2)

        criar("Frame", {
            Size = UDim2.new(1, -20, 0, 3),
            Position = UDim2.new(0, 10, 0, 0),
            BackgroundColor3 = g.color,
            BorderSizePixel = 0,
            ZIndex = 56
        }, card)

        local imgFrame = criar("Frame", {
            Name = "GameImageFrame",
            Size = UDim2.new(0, 70, 0, 70),
            Position = UDim2.new(0.5, -35, 0, 10),
            BackgroundColor3 = C.panelLight,
            BorderSizePixel = 0,
            ZIndex = 56
        }, card)
        corner(imgFrame, 10)

        criar("ImageLabel", {
            Name = "GameImage",
            Size = UDim2.new(1, -4, 1, -4),
            Position = UDim2.new(0, 2, 0, 2),
            BackgroundTransparency = 1,
            Image = gameThumbUrl(g.placeId, g.name),
            ScaleType = Enum.ScaleType.Crop,
            ZIndex = 57
        }, imgFrame)

        criar("TextLabel", {
            Name = "GameName",
            Size = UDim2.new(1, -20, 0, 20),
            Position = UDim2.new(0, 10, 0, 88),
            BackgroundTransparency = 1,
            Text = gameName(g),
            TextColor3 = C.text,
            Font = Enum.Font.GothamBold,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            ZIndex = 57
        }, card)

        local tag = criar("TextLabel", {
            Name = "GameTag",
            Size = UDim2.new(0, 80, 0, 16),
            Position = UDim2.new(0.5, -40, 0, 110),
            BackgroundColor3 = g.color,
            BorderSizePixel = 0,
            Text = g.tag or "ORIGINAL",
            TextColor3 = Color3.fromRGB(255,255,255),
            Font = Enum.Font.GothamBold,
            TextSize = 9,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            ZIndex = 57
        }, card)
        corner(tag, 8)

        card.MouseEnter:Connect(function() tween(card, 0.15, { BackgroundColor3 = C.cardHover }) end)
        card.MouseLeave:Connect(function() tween(card, 0.15, { BackgroundColor3 = C.card }) end)
        card.MouseButton1Click:Connect(function()
            setActiveNav("games")
            task.wait(0.1)
            if _G.OpenGame then _G.OpenGame(g) end
        end)
    end

    -- GAMES
    local GamesFrame = criar("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Visible = false,
        ZIndex = 53
    }, ContentArea)

    local searchBar = criar("Frame", {
        Size = UDim2.new(1, -40, 0, 44),
        Position = UDim2.new(0, 20, 0, 20),
        BackgroundColor3 = C.card,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        ZIndex = 54
    }, GamesFrame)
    corner(searchBar, 12)
    stroke(searchBar, C.border, 1, 0.3)

    local searchInput = criar("TextBox", {
        Size = UDim2.new(1, -30, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        PlaceholderText = T("search"),
        PlaceholderColor3 = C.textDim,
        TextColor3 = C.text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        ZIndex = 55
    }, searchBar)

    criar("TextLabel", {
        Size = UDim2.new(1, -40, 0, 16),
        Position = UDim2.new(0, 20, 0, 80),
        BackgroundTransparency = 1,
        Text = T("universalLibrary"),
        TextColor3 = C.textDim,
        Font = Enum.Font.GothamBold,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 54
    }, GamesFrame)

    local gamesScroll = criar("ScrollingFrame", {
        Size = UDim2.new(1, -40, 1, -120),
        Position = UDim2.new(0, 20, 0, 104),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = C.accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ZIndex = 54
    }, GamesFrame)

    criar("UIGridLayout", {
        CellSize = UDim2.new(0, 200, 0, 70),
        CellPadding = UDim2.new(0, 10, 0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder
    }, gamesScroll)

    for i, g in ipairs(games) do
        local row = criar("TextButton", {
            Size = UDim2.new(0, 200, 0, 70),
            BackgroundColor3 = C.card,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = i,
            ZIndex = 55
        }, gamesScroll)
        corner(row, 12)
        local rs = stroke(row, C.border, 1, 0.5)

        local thumb = criar("Frame", {
            Size = UDim2.new(0, 52, 0, 52),
            Position = UDim2.new(0, 9, 0.5, -26),
            BackgroundColor3 = C.panelLight,
            BorderSizePixel = 0,
            ZIndex = 56
        }, row)
        corner(thumb, 8)

        criar("ImageLabel", {
            Size = UDim2.new(1, -2, 1, -2),
            Position = UDim2.new(0, 1, 0, 1),
            BackgroundTransparency = 1,
            Image = gameThumbUrl(g.placeId, g.name),
            ScaleType = Enum.ScaleType.Crop,
            ZIndex = 57
        }, thumb)

        criar("TextLabel", {
            Name = "GameName",
            Size = UDim2.new(1, -80, 0, 18),
            Position = UDim2.new(0, 68, 0, 16),
            BackgroundTransparency = 1,
            Text = gameName(g),
            TextColor3 = C.text,
            Font = Enum.Font.GothamBold,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 57
        }, row)

        criar("TextLabel", {
            Size = UDim2.new(1, -80, 0, 14),
            Position = UDim2.new(0, 68, 0, 34),
            BackgroundTransparency = 1,
            Text = T("communityScripts"),
            TextColor3 = C.textDim,
            Font = Enum.Font.Gotham,
            TextSize = 9,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 57
        }, row)

        row.MouseEnter:Connect(function()
            tween(row, 0.15, { BackgroundColor3 = C.cardHover })
            tween(rs, 0.15, { Color = g.color, Transparency = 0 })
        end)
        row.MouseLeave:Connect(function()
            tween(row, 0.15, { BackgroundColor3 = C.card })
            tween(rs, 0.15, { Color = C.border, Transparency = 0.5 })
        end)
        row.MouseButton1Click:Connect(function()
            if _G.OpenGame then _G.OpenGame(g) end
        end)
    end

    -- Busca (considera nome interno + nome traduzido)
    searchInput:GetPropertyChangedSignal("Text"):Connect(function()
        local q = string.lower(searchInput.Text)
        for _, row in ipairs(gamesScroll:GetChildren()) do
            if row:IsA("TextButton") then
                local nameLabel = row:FindFirstChild("GameName")
                if nameLabel then
                    local match = (q == "" or string.find(string.lower(nameLabel.Text), q, 1, true))
                    row.Visible = match
                end
            end
        end
    end)

    -- SCRIPTS DO JOGO
    _G.OpenGame = function(g)
        HomeFrame.Visible = false
        GamesFrame.Visible = false

        local ScriptsFrame = criar("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            ZIndex = 53
        }, ContentArea)

        local backBtn = criar("TextButton", {
            Size = UDim2.new(0, 80, 0, 32),
            Position = UDim2.new(0, 20, 0, 20),
            BackgroundColor3 = C.card,
            BorderSizePixel = 0,
            Text = "< " .. T("back"),
            TextColor3 = C.text,
            Font = Enum.Font.GothamBold,
            TextSize = 11,
            AutoButtonColor = false,
            ZIndex = 55
        }, ScriptsFrame)
        corner(backBtn, 8)
        stroke(backBtn, C.border, 1, 0.3)

        backBtn.MouseButton1Click:Connect(function()
            ScriptsFrame:Destroy()
            GamesFrame.Visible = true
        end)

        criar("TextLabel", {
            Size = UDim2.new(1, -120, 0, 24),
            Position = UDim2.new(0, 120, 0, 20),
            BackgroundTransparency = 1,
            Text = gameName(g),
            TextColor3 = C.text,
            Font = Enum.Font.GothamBold,
            TextSize = 18,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 55
        }, ScriptsFrame)

        criar("TextLabel", {
            Size = UDim2.new(1, -120, 0, 16),
            Position = UDim2.new(0, 120, 0, 44),
            BackgroundTransparency = 1,
            Text = #g.scripts .. " " .. T("scripts") .. " - " .. T("availableScripts"),
            TextColor3 = C.textDim,
            Font = Enum.Font.Gotham,
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 55
        }, ScriptsFrame)

        local scriptsScroll = criar("ScrollingFrame", {
            Size = UDim2.new(1, -40, 1, -80),
            Position = UDim2.new(0, 20, 0, 70),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 4,
            ScrollBarImageColor3 = C.accent,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ZIndex = 54
        }, ScriptsFrame)

        criar("UIListLayout", {
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder
        }, scriptsScroll)

        local function criarBotaoScript(scriptData, ordem, cor)
            local btn = criar("TextButton", {
                Size = UDim2.new(1, -8, 0, 56),
                BackgroundColor3 = C.card,
                BackgroundTransparency = 0.15,
                BorderSizePixel = 0,
                Text = "",
                AutoButtonColor = false,
                LayoutOrder = ordem,
                ZIndex = 55
            }, scriptsScroll)
            corner(btn, 12)
            local s = stroke(btn, cor, 1.5, 0.4)

            criar("Frame", {
                Size = UDim2.new(0, 4, 0, 36),
                Position = UDim2.new(0, 0, 0.5, -18),
                BackgroundColor3 = cor,
                BorderSizePixel = 0,
                ZIndex = 56
            }, btn)

            criar("TextLabel", {
                Size = UDim2.new(0.7, 0, 0, 22),
                Position = UDim2.new(0, 20, 0, 10),
                BackgroundTransparency = 1,
                Text = scriptData.name,
                TextColor3 = C.text,
                Font = Enum.Font.GothamBold,
                TextSize = 13,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 56
            }, btn)

            local stateLabel = criar("TextLabel", {
                Size = UDim2.new(0.7, 0, 0, 16),
                Position = UDim2.new(0, 20, 0, 30),
                BackgroundTransparency = 1,
                Text = "> " .. T("execute"),
                TextColor3 = C.textDim,
                Font = Enum.Font.Gotham,
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 56
            }, btn)

            btn.MouseEnter:Connect(function()
                tween(btn, 0.15, { BackgroundColor3 = C.cardHover, BackgroundTransparency = 0 })
                tween(s, 0.15, { Transparency = 0, Color = cor })
            end)
            btn.MouseLeave:Connect(function()
                tween(btn, 0.15, { BackgroundColor3 = C.card, BackgroundTransparency = 0.15 })
                tween(s, 0.15, { Transparency = 0.4, Color = cor })
            end)

            btn.MouseButton1Click:Connect(function()
                if stateLabel.Text:find(T("loading")) then return end
                stateLabel.Text = "... " .. T("loading")
                stateLabel.TextColor3 = C.warning

                local isLuarmor = string.find(scriptData.link, "luarmor", 1, true) ~= nil

                if isLuarmor then
                    local aviso = criar("Frame", {
                        Size = UDim2.new(0, 280, 0, 60),
                        Position = UDim2.new(0.5, 0, 0, 20),
                        AnchorPoint = Vector2.new(0.5, 0),
                        BackgroundColor3 = C.panel,
                        BorderSizePixel = 0,
                        ZIndex = 999
                    }, Root)
                    corner(aviso, 10)
                    stroke(aviso, C.warning, 1.5, 0)
                    criar("TextLabel", {
                        Size = UDim2.new(1, -20, 1, 0),
                        Position = UDim2.new(0, 10, 0, 0),
                        BackgroundTransparency = 1,
                        Text = T("loadingScript") .. "\n" .. T("wait"),
                        TextColor3 = C.warning,
                        Font = Enum.Font.GothamBold,
                        TextSize = 12,
                        TextWrapped = true,
                        ZIndex = 1000
                    }, aviso)
                    task.delay(5, function() if aviso and aviso.Parent then aviso:Destroy() end end)
                end

                local thread = coroutine.create(function()
                    local ok = pcall(function()
                        loadstring(game:HttpGet(scriptData.link))()
                    end)
                    task.spawn(function()
                        if ok then
                            stateLabel.Text = "OK " .. T("success")
                            stateLabel.TextColor3 = C.success
                        else
                            stateLabel.Text = "X " .. T("error")
                            stateLabel.TextColor3 = C.danger
                        end
                        task.wait(2)
                        stateLabel.Text = "> " .. T("execute")
                        stateLabel.TextColor3 = C.textDim
                    end)
                end)
                coroutine.resume(thread)

                task.delay(30, function()
                    if stateLabel.Text:find(T("loading")) then
                        stateLabel.Text = "! " .. T("timeout")
                        stateLabel.TextColor3 = C.warning
                        task.wait(2)
                        stateLabel.Text = "> " .. T("execute")
                        stateLabel.TextColor3 = C.textDim
                    end
                end)
            end)
        end

        for i, scriptData in ipairs(g.scripts) do
            criarBotaoScript(scriptData, i, g.color)
        end
    end

    showHome = function()
        HomeFrame.Visible = true
        GamesFrame.Visible = false
    end
    showGames = function()
        HomeFrame.Visible = false
        GamesFrame.Visible = true
    end

    setActiveNav("home")

    -- DRAG
    local hDrag, hStart, hPos
    HubFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local objs = PlayerGui:GetGuiObjectsAtPosition(input.Position.X, input.Position.Y)
            local isButton = false
            for _, o in ipairs(objs) do
                if o:IsA("TextButton") or o:IsA("TextBox") then isButton = true; break end
            end
            if not isButton then
                hDrag = true
                hStart = input.Position
                hPos = HubFrame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then hDrag = false end
                end)
            end
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if hDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - hStart
            HubFrame.Position = UDim2.new(hPos.X.Scale, hPos.X.Offset + delta.X, hPos.Y.Scale, hPos.Y.Offset + delta.Y)
        end
    end)
end

-- ============================================================
-- INICIALIZA
-- ============================================================
buildLanguageScreen()
