local jokerInfo = {
    name = "CBT",
    config = {
        extra = {
            x_mult = 0.5,
            cash = 10
        }
    },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

function jokerInfo.loc_vars(self, info_queue, card)
    info_queue[#info_queue+1] = {key = "joke_line1", set = "Other"}
    return { vars = {card.ability.extra.x_mult, card.ability.extra.cash} }
end

function jokerInfo.calculate(self,card,context)
    -- Add X0.5 Mult when a hand is played
    if context.joker_main then
        return {
            x_mult_mod = card.ability.extra.x_mult
        }
    end
end


function jokerInfo.calc_dollar_bonus(self, card)
     local bonus = card.ability.extra.cash
     if bonus > 0 then return bonus end
end

return jokerInfo