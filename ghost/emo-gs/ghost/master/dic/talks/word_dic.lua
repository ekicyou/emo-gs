local dkit = require "talks.dkit"
local o  = require "talks.o"

local M = {}
local CO = {}

local function create_db()
    local csv_data = require "talks.word"
    local db = dkit.create_word_db(csv_data)
    return db
end
local db = create_db()

local function WRAP(...)
    local items = dkit.filter_names(db, ...)
    local co = o.INFINITY(o.RAND(items))
    return coroutine.wrap(co)
end

local function WRAP_COL(key)
    local items = dkit.value_items(db, key)
    local co = o.INFINITY(o.RAND(items))
    return coroutine.wrap(co)
end

CO.人名 = WRAP("カテゴリー", "キャラ")
function M.人名()
    return CO.人名()
end

CO.地名 = WRAP_COL("生息地")
function M.地名()
    return CO.地名()
end

CO.体の場所 = WRAP("カテゴリー", "体の場所")
function M.体の場所()
    return CO.体の場所()
end

CO.物 = WRAP("カテゴリー", "物")
function M.物()
    return CO.物()
end

function M.s(ch, sf, num)
    local t = ""
    if ch then
        t = t .. "\\" .. ch
    end
    if sf then
        t = t .. "\\s[" .. sf .."]"
    end
    if num then
        t = t .. "\\n[" .. num .."]"
    end
    return t
end

return M