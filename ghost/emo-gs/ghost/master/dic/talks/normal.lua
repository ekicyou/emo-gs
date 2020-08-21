local o    = require "talks.o"
local _    = require "talks.word_dic" 
local util = require "talks.util" 


local えも  = require "talks.util_emo" 
local 紫    = require "talks.util_murasaki" 

local function 目に爆弾(args)

end

local function 異世界の門(args)
    local t, S = util.start()

    local 地名 = _.地名()
    t = t .. S(0, "0")
    t = t .. S(1, "6")      ..地名.. [[に、異世界の門が開いたらしいよ。]]
    t = t .. S(0, "3")      ..[[また勇者が\n召喚されたんやね‥‥。]]
    t = t .. [=[\e]=]
    args = coroutine.yield(t)

    local 勇者      = _.人名()
    local t, S = util.start()
    t = t .. S(1, "0")
    t = t .. S(0, "B1124")  ..[[こないだ、]] ..地名.. [[から異世界に召喚された]] ..勇者.. [[が帰ってきたんよ。]]
    t = t .. S(1, "0")      ..[[どんなだった？]]

    if math.random(2) == 1 then
        local 能力          = _.能力()
        local XXXが出来る   = _.XXXが出来る()
        t = t .. S(0, "0"   ,100) ..'"'..能力.. [["に目覚めたって。]]
        t = t .. S(1, "200" ,150) ..[[‥‥ん？]]
        t = t .. S(0, "0"   ,100) ..XXXが出来る.. [[出来るんや。]]
        t = t .. えも.評価オチ()
        t = t .. [[\e]]
        args = coroutine.yield(t)
    else
        local 体の場所  = _.体の場所()
        local 物        = _.物()
        t = t .. S(0, "0" ,100) ..体の場所.. [[に]] ..物.. [[生やしとった。]]
        t = t .. えも.評価オチ()
        args = coroutine.yield(t)
    end


end


local talk_items = {
[=[
\1\s[10]
\0\s[B1124]アヒルやアヒル！\n11年ぶり、大阪にアヒルが\n帰ってくるねんで！
\1\s[10]‥‥11年前って、\n覚えてるの？
\e]=],

異世界の門,

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
