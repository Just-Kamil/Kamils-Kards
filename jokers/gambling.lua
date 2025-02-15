local jokerInfo = {
    name = "gambling",
    config = {
        extra = {
            xMult = 0.5, -- #1#
            xMult_2 = 2, -- #2#
            odds = 2 -- #3#
        }
    },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}


function jokerInfo.loc_vars(self, info_queue,card)
    info_queue[#info_queue + 1] = {key = "idea_cred1", set = "Other"}
    return { vars = {card.ability.extra.xMult ,card.ability.extra.xMult_2, (G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
end

function jokerInfo.calculate(self, card, context)
    if context.joker_main then
        if pseudorandom("gambling") < G.GAME.probabilities.normal / card.ability.extra.odds then
                TXmult_mod = card.ability.extra.xMult_2
                Tmessage = localize { type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xMult_2}}
        else
                TXmult_mod = card.ability.extra.xMult
                Tmessage = localize { type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xMult}}
        end 
        return {
        Xmult_mod = TXmult_mod, message = Tmessage
        }
    end

end

return jokerInfo