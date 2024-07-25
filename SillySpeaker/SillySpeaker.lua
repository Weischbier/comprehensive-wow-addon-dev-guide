-- SillySpeaker: A World of Warcraft addon that says random silly phrases in chat
-- Author: TheSaltySeagull
-- Version: 1.0
-- Dependencies: Ace3

-- Create the addon using AceAddon-3.0 and include AceConsole-3.0 and AceEvent-3.0 mixins
SillySpeaker = LibStub("AceAddon-3.0"):NewAddon("SillySpeaker", "AceConsole-3.0", "AceEvent-3.0")

-- Default settings for the addon
local defaults = {
    profile = {
        minimap = {
            hide = false, -- Whether to hide the minimap icon or not
        },
    },
}

-- List of silly phrases that the addon can say
local sillyPhrases = {
    "I'm not saying I'm Batman, but have you ever seen me and Batman in the same room?",
    "I put my root beer in a square glass. Now it's just beer.",
    "Why don't scientists trust atoms? Because they make up everything!",
    "I'm on a seafood diet. I see food, and I eat it.",
    "Why did the scarecrow win an award? He was outstanding in his field.",
}

local toggles = {
    "toggle",
    "show",
    "display",
    "help"
}

-- Called when the addon is initialized
function SillySpeaker:OnInitialize()
    -- Create the database using AceDB-3.0
    self.db = LibStub("AceDB-3.0"):New("SillySpeakerDB", defaults, true)
    
    -- Register chat commands
    self:RegisterChatCommand("sillyspeaker", "ChatCommand")
    self:RegisterChatCommand("ss", "ChatCommand") -- Shorthand command
end

-- Called when the addon is enabled
function SillySpeaker:OnEnable()
    SillySpeakerFrame:Show() -- Show the addon's frame
end

-- Called when the addon is disabled
function SillySpeaker:OnDisable()
    SillySpeakerFrame:Hide() -- Hide the addon's frame
end

-- Handles chat commands
-- @param input (string) The command input after "/sillyspeaker" or "/ss"
function SillySpeaker:ChatCommand(input)
    if input == "toggle" then
        -- Toggle the visibility of the addon's frame
        if SillySpeakerFrame:IsVisible() then
            SillySpeakerFrame:Hide()
        else
            SillySpeakerFrame:Show()
        end
    else
        -- If no specific command is given, say a silly phrase
        self:SaySilly()
    end
end

-- Sends a random silly phrase to the "SAY" chat channel
function SillySpeaker:SaySilly()
    -- Choose a random phrase from the sillyPhrases table
    local phrase = sillyPhrases[math.random(#sillyPhrases)]
    
    -- Send the chosen phrase to the "SAY" chat channel
    SendChatMessage(phrase, "SAY")
end