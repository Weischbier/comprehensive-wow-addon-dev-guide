SillySpeaker = SillySpeaker or {}
SillySpeaker.Config = {}

SillySpeaker.Config.defaults = {
    profile = {
        minimap = {
            hide = false,
        },
        framePosition = {
            x = 0,
            y = 0,
        },
    },
}

function SillySpeaker.Config:GetDB()
    return SillySpeaker.db
end

function SillySpeaker.Config:Initialize(addon)
    self.db = LibStub("AceDB-3.0"):New("SillySpeakerDB", self.defaults, true)
    addon.db = self.db
end