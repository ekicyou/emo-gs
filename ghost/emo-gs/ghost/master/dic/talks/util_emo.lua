-- えも側、共通アクション

local o = require "talks.o"
local _ = require "talks.word_dic" 
local util = require "talks.util" 

local えも={}

function えも.評価オチ()
    local t, S = util.start()
    local a = math.random(3)
    if a == 1 then
        t = t .. S(1, "2" ,150) ..[[なにそれ？]]
    elseif a == 2 then
        t = t .. S(1, "2" ,150) ..[[うわあ‥‥？]]
    else
        t = t .. S(1, "5" ,150) ..[[すごーい！]]
    end
    return t
end

function えも.危険オチ()
    local t, S = util.start()
    local a = math.random(3)
    if a == 1 then
        t = t .. S(1, "3" ,150) ..[[この星はもう‥‥。]]
    elseif a == 2 then
        t = t .. S(1, "2" ,150) ..[[当局は何をしてるの！]]
    else
        t = t .. S(1, "2" ,150) ..[[やばーい！]]
    end
    return t
end

function えも.逞しいオチ()
    local t, S = util.start()
    local a = math.random(3)
    if a == 1 then
        t = t .. S(1, "2" ,150) ..[[頑張って生きてるんだ‥‥。]]
    elseif a == 2 then
        t = t .. S(1, "10" ,150) ..[[そんなのでいいの？]]
    else
        t = t .. S(1, "5" ,150) ..[[たくましーい！]]
    end
    return t
end

return えも