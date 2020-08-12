local o  = require "talks.o"


local function チェイントーク１(args)
    
    local value = [=[
\0\s[0]
\1\s[16]＠場所　に異世界の門が開いたらしいよ。
\0\s[3]また勇者が召喚されたんやね‥‥。
\e]=]
    args = coroutine.yield(value)

    local value = [=[
\1\s[10]
\0\s[B1124]こないだ＠場所　から異世界に召喚された＠名前　が帰ってきたんよ。
\1\s[10]どんなだった？
\1\s[10]＠体の場所　に＠物　生やしとった。
\1\s[10]うわあ‥‥？
\e]=]
    args = coroutine.yield(value)

end


local talk_items = {
[=[
\1\s[10]
\0\s[B1124]アヒルやアヒル！\n11年ぶり、大阪にアヒルが\n帰ってくるねんで！
\1\s[10]‥‥11年前って、\n覚えてるの？
\e]=],

[=[
\1\s[10]
\0\s[0]（１）\nランダムトーク実験中やで。
\1\s[10]ネタはないの？
\e]=],

[=[
\1\s[10]
\0\s[0]（２）\nランダムトーク実験中やで。
\1\s[10]1/3でアヒル。
\e]=],

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
