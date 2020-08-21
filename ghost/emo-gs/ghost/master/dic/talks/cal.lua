local o = require "talks.o"
local _ = require "talks.word_dic" 
local builder = require "talks.builder"

local function 時報深夜０時(hour)
    local cal = string.format("T%02d00", hour)
    local t, S = builder.start()
    t = t .. S(0, "0")
    t = t .. S(1, "0") .. [[深夜0時になったよ。]]
    t = t .. S(0, "3") .. [[新しい日‥‥はええから、寝よ寝よ。]]
    t = t .. [=[\e]=]
    return {cal=cal, talk=t}
end


local function 時報深夜(hour)
    local cal = string.format("T%02d00", hour)
    local t, S = builder.start()
    t = t .. S(0, "0")
    t = t .. S(1, "0") .. [[午前]]..hour..[[時になったよ。]]
    t = t .. S(0, "6") .. [[（‥‥ぐぅ）]]
    t = t .. [=[\e]=]
    return {cal=cal, talk=t}
end

local function 時報早朝(hour)
    local cal = string.format("T%02d00", hour)
    local t, S = builder.start()
    t = t .. S(0, "0")
    t = t .. S(1, "0") .. [[午前]]..hour..[[時になったよ。]]
    t = t .. S(0, "4") .. [[うぅ、起こさんといて、二度寝‥‥。]]
    t = t .. [=[\e]=]
    return {cal=cal, talk=t}
end

local function 時報朝(hour)
    local cal = string.format("T%02d00", hour)
    local t, S = builder.start()
    t = t .. S(0, "0")
    t = t .. S(1, "0") .. [[午前]]..hour..[[時になったよ。]]
    t = t .. S(0, "5") .. [[おはよー！パンを咥えて、\n気になるあの子にぶつかるでー。]]
    t = t .. [=[\e]=]
    return {cal=cal, talk=t}
end

local function 時報午前(hour)
    local cal = string.format("T%02d00", hour)
    local t, S = builder.start()
    t = t .. S(0, "0")
    t = t .. S(1, "0") .. [[午前]]..hour..[[時になったよ。]]
    t = t .. S(0, "4") .. [[うち、まだ眠いわ‥‥。]]
    t = t .. [=[\e]=]
    return {cal=cal, talk=t}
end

local function 時報正午(hour)
    local cal = string.format("T%02d00", hour)
    local t, S = builder.start()
    t = t .. S(0, "0")
    t = t .. S(1, "0") .. [[正午だよ。]]
    t = t .. S(0, "5") .. [[おっひるはなにかいなー♪]]
    t = t .. [=[\e]=]
    return {cal=cal, talk=t}
end

local function 時報午後(hour)
    local cal = string.format("T%02d00", hour)
    local t, S = builder.start()
    t = t .. S(0, "0")
    t = t .. S(1, "0") .. [[午後]]..(hour-12)..[[時になったよ。]]
    t = t .. S(0, "5") .. [[午後もがんばろー！]]
    t = t .. [=[\e]=]
    return {cal=cal, talk=t}
end

local function 時報夕方(hour)
    local cal = string.format("T%02d00", hour)
    local t, S = builder.start()
    t = t .. S(0, "0")
    t = t .. S(1, "0") .. [[午後]]..(hour-12)..[[時になったよ。]]
    t = t .. S(0, "0") .. [[そろそろ夕方やね。]]
    t = t .. [=[\e]=]
    return {cal=cal, talk=t}
end

local function 時報晩御飯(hour)
    local cal = string.format("T%02d00", hour)
    local t, S = builder.start()
    t = t .. S(0, "0")
    t = t .. S(1, "0") .. [[午後]]..(hour-12)..[[時になったよ。]]
    t = t .. S(0, "5") .. [[お夕飯はなにかいなー♪]]
    t = t .. [=[\e]=]
    return {cal=cal, talk=t}
end

local function 時報夜(hour)
    local cal = string.format("T%02d00", hour)
    local t, S = builder.start()
    t = t .. S(0, "0")
    t = t .. S(1, "0") .. [[午後]]..(hour-12)..[[時になったよ。]]
    t = t .. S(0, "8") .. [[夜更かしはほどほどにして、\n寝なあかんよ。]]
    t = t .. [=[\e]=]
    return {cal=cal, talk=t}
end

local talk_items = {
    時報深夜０時(0),
    時報深夜(1),
    時報深夜(2),
    時報深夜(3),
    時報早朝(4),
    時報早朝(5),
    時報朝(6),
    時報朝(7),
    時報朝(8),
    時報午前(9),
    時報午前(10),
    時報午前(11),
    時報正午(12),
    時報午後(13),
    時報午後(14),
    時報午後(15),
    時報午後(16),
    時報夕方(17),
    時報夕方(18),
    時報晩御飯(19),
    時報晩御飯(20),
    時報夜(21),
    時報夜(22),
    時報夜(23),
}

return talk_items