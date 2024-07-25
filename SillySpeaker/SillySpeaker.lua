SillySpeaker = LibStub("AceAddon-3.0"):NewAddon("SillySpeaker", "AceConsole-3.0", "AceEvent-3.0")

function SillySpeaker:OnInitialize()
    SillySpeaker.Config:Initialize(self)
    self:RegisterChatCommand("sillyspeaker", "ChatCommand")
    self:RegisterChatCommand("ss", "ChatCommand")
    
    -- Create the frame
    self.frame = SillySpeakerFrame or CreateFrame("Frame", "SillySpeakerFrame", UIParent, "SillySpeakerFrameTemplate")
    self:UpdateFramePosition()
    self.frame:Hide()
end

function SillySpeaker:OnEnable()
    self.frame:Show()
end

function SillySpeaker:OnDisable()
    self.frame:Hide()
end

function SillySpeaker:ChatCommand(input)
    if input == "toggle" then
        if self.frame:IsVisible() then
            self.frame:Hide()
        else
            self.frame:Show()
        end
    else
        self:SaySilly()
    end
end

function SillySpeaker:SaySilly()
    local phrase = SillySpeaker.Phrases:GetRandomPhrase()
    SendChatMessage(phrase, "SAY")
end

function SillySpeaker:UpdateFramePosition()
    local db = SillySpeaker.Config:GetDB()
    local x = db.profile.framePosition.x
    local y = db.profile.framePosition.y
    self.frame:SetPoint("CENTER", UIParent, "CENTER", x, y)
end

function SillySpeaker:SaveFramePosition()
    local db = SillySpeaker.Config:GetDB()
    local point, _, _, x, y = self.frame:GetPoint()
    db.profile.framePosition.x = x
    db.profile.framePosition.y = y
end