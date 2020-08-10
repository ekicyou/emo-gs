local o  = require "talks.o"

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


local co_talk = o.INFINITY(o.RAND(talk_items))

local function call(data, req)
    local args = {}
    args.data = data
    args.req  = req
    return co_talk(args)
end


local M = {}
M.call = call

return M
