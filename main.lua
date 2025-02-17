--- STEAMODDED HEADER
--- MOD_NAME: Kamil's Kards
--- MOD_ID: KAMKARD
--- MOD_AUTHOR: [Just-Kamil]
--- MOD_DESCRIPTION: Adds the world's coolest jokers and other?
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]
--- BADGE_COLOR: #F3E46
--- PREFIX: kamkard

-- TO DO

-- Load jokers from the jokers foler,  ideally without having a list of jokers to load
-- idk that it.


-- Stealing a lot of this from the Cardsauce mod, very good mod, better than this.
-- https://github.com/BarrierTrio/Cardsauce/

local modPath = SMODS.current_mod.path:match("Mods/[^/]+")
local jokerPath = modPath .. "/jokers"

sendDebugMessage(usable_path)

local jokersToLoad = {}

for i, n in ipairs(love.filesystem.getDirectoryItems(jokerPath)) do
    table.insert(jokersToLoad, n)
end

for i, j in ipairs(jokersToLoad) do
    local jokerInfo = assert(SMODS.load_file("jokers/" .. j))()
    j = j:match("^([^.]+)")
    jokerInfo.key = j
    jokerInfo.atlas = j
    local atlasKey = j
    sendDebugMessage(tprint(jokerInfo))
    jokerInfo.pos = {x = 0, y = 0}

    local joker = SMODS.Joker(jokerInfo)
    for key, val in ipairs(joker) do
        if type(val) == "function" then
            joker[key] = jokerInfo[key]
        end
    end

sendDebugMessage("jokers/" .. atlasKey ..  ".png")

    SMODS.Atlas({ key = atlasKey, path="jokers/" .. atlasKey ..  ".png", px = 71, py = 95})
end

SMODS.Atlas {
    key = "modicon",
    path = "modicon.png",
    px = 32,
    py = 32
}:register()

local decksToLoad = {}
local deckPath = modPath .. "/decks"

for i, n in ipairs(love.filesystem.getDirectoryItems(deckPath)) do
    table.insert(decksToLoad, n)
end

for i, d in ipairs(decksToLoad) do
    local deckInfo = assert(SMODS.load_file("decks/" .. d))()
    d = d:match("^([^.]+)")
    deckInfo.key = d
    deckInfo.atlas = d
    local atlasKey = d
    deckInfo.pos = {x = 0, y = 0}

    local deck = SMODS.Back(deckInfo)
    for key, val in ipairs(deck) do
        if type(val) == "function" then
            deck[key] = deckInfo[key]
        end
    end
    SMODS.Atlas({key = d, path = "decks/" .. d .. ".png", px = 71, py = 95})
end