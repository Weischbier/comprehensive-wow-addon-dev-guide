SillySpeaker = SillySpeaker or {}
SillySpeaker.Phrases = {}

SillySpeaker.Phrases.list = {
    "I'm not saying I'm Batman, but have you ever seen me and Batman in the same room?",
    "I put my root beer in a square glass. Now it's just beer.",
    "Why don't scientists trust atoms? Because they make up everything!",
    "I'm on a seafood diet. I see food, and I eat it.",
    "Why did the scarecrow win an award? He was outstanding in his field.",
}

function SillySpeaker.Phrases:GetRandomPhrase()
    return self.list[math.random(#self.list)]
end