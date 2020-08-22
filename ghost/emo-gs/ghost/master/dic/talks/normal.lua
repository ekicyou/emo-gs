local o    = require "talks.o"
local _    = require "talks.word_dic" 
local builder = require "talks.builder"


local えも  = require "talks.util_emo" 
local 紫    = require "talks.util_murasaki" 

local function 目に爆弾(args)
    local talk, C, S, T = builder.new()
    local 人名      = _.人名()
    C(1) S("素")
    C(0) S("素") T(人名) T([[って、\n目に爆弾抱えとるらしいで。]])
    えも.危険オチ(talk)
    args = coroutine.yield(talk.build())
end

local function 異世界の門(args)
    local talk, C, S, T = builder.new()
    local 地名 = _.地名()
    C(0) S("素")
    C(1) S("静観") T(地名) T([[に、異世界の門が開いたらしいよ。]])
    C(0) S("不安") T([[また勇者が\n召喚されたんやね‥‥。]])
    args = coroutine.yield(talk.build())

    local talk, C, S, T = builder.new()
    local 勇者      = _.人名()
    C(1) S("素")
    C(0) S("興奮笑顔") T([[こないだ、]] ..地名.. [[から異世界に召喚された]] ..勇者.. [[が帰ってきたんよ。]])
    C(1) S("素") T([[どんなだった？]])

    if math.random(2) == 1 then
        local 能力          = _.能力()
        local XXXが出来る   = _.XXXが出来る()
        C(0,100) S("静観") T('"'..能力.. [["に目覚めたって。]])
        C(1,150) S("驚き") T([[‥‥ん？]])
        C(0,100) S("素") T(XXXが出来る) T([[出来るんや。]])
        えも.評価オチ(talk)
        args = coroutine.yield(talk.build())
    else
        local 体の場所  = _.体の場所()
        local 物        = _.物()
        C(0,100) S("素") T(体の場所) T([[に]]) T(物) T([[生やしとった。]])
        えも.評価オチ(talk)
        args = coroutine.yield(talk.build())
    end


end


local talk_items = {
[=[
\1\s[10]
\0\s[興奮笑顔]アヒルやアヒル！\n11年ぶり、大阪にアヒルが\n帰ってくるねんで！
\1\s[10]‥‥11年前って、\n覚えてるの？
\e]=],

異世界の門,
目に爆弾,
}


local co_talk = coroutine.wrap(o.INFINITY(o.RAND(talk_items)))

local function call(data, req)
    local args = {}
    args.data = data
    args.req  = req
    return co_talk(args)
end


local M = {}
M.call = call

return M
