-- えも側、共通アクション

local o = require "talks.o"
local _ = require "talks.word_dic" 
local builder = require "talks.builder"

local えも={}

function えも.評価オチ(talk)
    local C, S, T = talk.get()
    C(1, 150)
    local a = math.random(3)
    if     a == 1 then S("2") T([[なにそれ？]])
    elseif a == 2 then S("2") T([[うわあ‥‥？]])
    else               S("5") T([[すごーい！]])
    end
end

function えも.危険オチ(talk)
    local C, S, T = talk.get()
    C(1, 150)
    local a = math.random(3)
    if     a == 1 then S("3") T([[この星はもう‥‥。]])
    elseif a == 2 then S("9") T([[当局は何をしてるの！]])
    else               S("2") T([[やばーい！]])
    end
end

function えも.逞しいオチ(talk)
    local C, S, T = talk.get()
    C(1, 150)
    local a = math.random(3)
    if     a == 1 then S("2" ) T([[頑張って生きてるんだ‥‥。]])
    elseif a == 2 then S("10") T([[そんなのでいいの？]])
    else               S("5" ) T([[たくましーい！]])
    end
end

return えも