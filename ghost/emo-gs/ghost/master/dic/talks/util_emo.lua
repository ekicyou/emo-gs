-- えも側、共通アクション

local o = require "talks.o"
local _ = require "talks.word_dic" 
local builder = require "talks.builder"

local えも={}

local function SEL(talk, array)
    local C, S, T = talk.get()
    C(1, 150)
    o.SEL(array)(S,T)
end

local 評価オチ = {
    function(S,T) S("2") T([[なにそれ？]])      end,
    function(S,T) S("2") T([[うわあ‥‥？]])    end,
    function(S,T) S("5") T([[すごーい！]])      end,
}
local 危険オチ = {
    function(S,T) S("3") T([[危険だ‥‥。]])    end,
    function(S,T) S("2") T([[やばいじゃん！]])  end,
    function(S,T) S("5") T([[やばーい！]])      end,
}
local 逞しいオチ = {
    function(S,T) S("2" ) T([[頑張って生きてるんだ‥‥。]]) end,
    function(S,T) S("10") T([[そんなのでいいの？]])         end,
    function(S,T) S("5" ) T([[たくましーい！]])             end,
}


function えも.評価オチ(talk) SEL(talk, 評価オチ) end
function えも.危険オチ(talk) SEL(talk, 危険オチ) end
function えも.逞しいオチ(talk) SEL(talk, 逞しいオチ) end



return えも