local o  = require "talks.o"

local talk_items = {
[=[
\1\s[10]\0\s[B1124]アヒルやアヒル！\n11年ぶり、大阪にアヒルが\n帰ってくるねんで！\1\s[10]‥‥11年前って、\n覚えてるの？\e]=],

[=[
\1\s[10]\0\s[0]（１）\nランダムトーク実験中やで。\1\s[10]ネタはないの？\e]=],

[=[
\1\s[10]\0\s[0]（２）\nランダムトーク実験中やで。\1\s[10]1/3でアヒル。\e]=],

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
