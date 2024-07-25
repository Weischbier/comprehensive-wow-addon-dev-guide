-- SillySpeaker: A World of Warcraft addon that allows players to say silly phrases in chat
-- This addon is built using the Ace3 framework, which provides various helpful libraries

-- Create a new Ace3 addon named "SillySpeaker" with dependencies on AceConsole-3.0 and AceEvent-3.0
-- These libraries provide console command handling and event management respectively
SillySpeaker = LibStub("AceAddon-3.0"):NewAddon("SillySpeaker", "AceConsole-3.0", "AceEvent-3.0")

-- OnInitialize: Called when the addon is loaded but before player data is available
-- This function sets up the initial state of the addon
function SillySpeaker:OnInitialize()
    -- Initialize the addon's configuration
    SillySpeaker.Config:Initialize(self)
    
    -- Register chat commands to trigger the addon's functionality
    -- Players can use either "/sillyspeaker" or "/ss" to interact with the addon
    self:RegisterChatCommand("sillyspeaker", "ChatCommand")
    self:RegisterChatCommand("ss", "ChatCommand")
    
    -- Create or retrieve the addon's main frame
    -- This frame will serve as the user interface for the addon
    self.frame = SillySpeakerFrame or CreateFrame("Frame", "SillySpeakerFrame", UIParent, "SillySpeakerFrameTemplate")
    
    -- Set the initial position of the frame based on saved configuration
    self:UpdateFramePosition()
    
    -- Hide the frame initially
    self.frame:Hide()
end

-- OnEnable: Called when the addon is enabled
-- This function makes the addon's frame visible
function SillySpeaker:OnEnable()
    self.frame:Show()
end

-- OnDisable: Called when the addon is disabled
-- This function hides the addon's frame
function SillySpeaker:OnDisable()
    self.frame:Hide()
end

-- ChatCommand: Handles the chat commands registered earlier
-- This function is called when a player uses "/sillyspeaker" or "/ss" in chat
function SillySpeaker:ChatCommand(input)
    if input == "toggle" then
        -- If the input is "toggle", switch the visibility of the frame
        if self.frame:IsVisible() then
            self.frame:Hide()
        else
            self.frame:Show()
        end
    else
        -- For any other input (or no input), say a silly phrase
        self:SaySilly()
    end
end

-- SaySilly: Generates and sends a random silly phrase to the chat
function SillySpeaker:SaySilly()
    -- Get a random phrase from the Phrases module
    local phrase = SillySpeaker.Phrases:GetRandomPhrase()
    -- Send the phrase as a "SAY" message in the chat
    SendChatMessage(phrase, "SAY")
end

-- UpdateFramePosition: Updates the position of the addon's frame based on saved configuration
function SillySpeaker:UpdateFramePosition()
    -- Retrieve the saved position from the configuration database
    local db = SillySpeaker.Config:GetDB()
    local x = db.profile.framePosition.x
    local y = db.profile.framePosition.y
    -- Set the frame's position relative to the center of the screen
    self.frame:SetPoint("CENTER", UIParent, "CENTER", x, y)
end

-- SaveFramePosition: Saves the current position of the addon's frame to the configuration
function SillySpeaker:SaveFramePosition()
    -- Get the configuration database
    local db = SillySpeaker.Config:GetDB()
    -- Retrieve the current position of the frame
    local point, _, _, x, y = self.frame:GetPoint()
    -- Save the position to the configuration
    db.profile.framePosition.x = x
    db.profile.framePosition.y = y
end
