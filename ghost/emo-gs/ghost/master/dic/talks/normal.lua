local shuffle  = require "libs.shuffle"

local talk_items = {
[=[
\1\s[10]\0\s[B1124]アヒルやアヒル！\n11年ぶり、大阪にアヒルが\n帰ってくるねんで！\1\s[10]‥‥11年前って、\n覚えてるの？\e]=],

[=[
\1\s[10]\0\s[0]いつものお話やで１。\1\s[10]ネタはないの？\e]=],

[=[
\1\s[10]\0\s[0]いつものお話やで２。\1\s[10]ネタはないの？\e]=],

[=[
\1\s[10]\0\s[0]いつものお話やで３。\1\s[10]ネタはないの？\e]=],

[=[
\1\s[10]\0\s[0]いつものお話やで４。\1\s[10]ネタはないの？\e]=],

[=[
\1\s[10]\0\s[0]いつものお話やで５。\1\s[10]ネタはないの？\e]=],

[=[
\1\s[10]\0\s[0]いつものお話やで６。\1\s[10]ネタはないの？\e]=],

[=[
\1\s[10]\0\s[0]いつものお話やで７。\1\s[10]ネタはないの？\e]=],

[=[
\1\s[10]\0\s[0]いつものお話やで８。\1\s[10]ネタはないの？\e]=],

[=[
\1\s[10]\0\s[0]いつものお話やで９。\1\s[10]ネタはないの？\e]=],
}

local function table_copy(t)
    local t2 = {}
    for k,v in pairs(t) do
        t2[k] = v
    end
    return t2
end

--トーク実行コルーチン
local function talk_loop(args)
    local data = args.data
    local req  = args.req

    while true do
        local sh = table_copy(talk_items)
        -- shuffle.shuffle(sh)
        for i,v in ipairs(sh) do
            local args = coroutine.yield(v)
            data = args.data
            req  = args.req
        end
    end
end

local co_talk = coroutine.wrap(talk_loop)

local function call(data, req)
    local args = {}
    args.data = data
    args.req  = req
    return co_talk(args)
end


local M = {}
M.call = call

return M
