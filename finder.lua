-- Send test message in the console to see if executed
print("success")

-- List of egg names to check
local eggNames = { "rainbow-egg", "nightmare-egg", "void-egg" }

-- Function to check all eggs
local function checkEggs()
    local rendered = workspace:FindFirstChild("Rendered")
    if not rendered then return end

    local rifts = rendered:FindFirstChild("Rifts")
    if not rifts then return end

    for _, eggName in ipairs(eggNames) do
        local egg = rifts:FindFirstChild(eggName)
        if egg then
            local display = egg:FindFirstChild("Display")
            if display then
                local surfaceGui = display:FindFirstChild("SurfaceGui")
                if surfaceGui then
                    local icon = surfaceGui:FindFirstChild("Icon")
                    if icon then
                        local luck = icon:FindFirstChild("Luck")
                        if luck and luck:IsA("TextLabel") then
                            local luckText = luck.Text
                            if luckText == "x25" then
                                game.TextChatService.TextChannels.RBXGeneral:SendAsync("🗿 A Random x25 Egg has spawned!") -- Sends a message in global chat notifying about the x25 egg constantly while the egg is found
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Loop every 60 second
while true do
    pcall(checkEggs)
    wait(60)
end
