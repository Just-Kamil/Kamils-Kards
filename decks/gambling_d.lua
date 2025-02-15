local deckInfo = {
    name = "Gambling Deck",
    unlocked = true,
    discovered = true,
    config = {
        joker = {card_key = "j_kamkards_gambling"}
    }
}

function deckInfo.apply(self)
    G.E_MANAGER:add_event(Event({trigger = "after", delay = 0.4,
    func = function ()
        card = SMODS.create_card({set = "jokers", area= G.jokers ,edition = {negative = true}, stickers = {"eternal"}, key = "j_kamkard_gambling"})
        card:add_to_deck()
        G.jokers:emplace(card)
        card:start_materialize()
        G.GAME.joker_buffer = 0
    return true
    end 
}))
end


return deckInfo