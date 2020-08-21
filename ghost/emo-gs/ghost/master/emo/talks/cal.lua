local o = require "talks.o"
local _ = require "talks.word_dic" 
local builder = require "talks.builder"

local function 時報(hour)
    local cal = string.format("T%02d00", hour)
    local t, S = builder.start()
    t = t .. S(1, "10")
    t = t .. S(0, "0") .. ..hour..[[時です。]]
    t = t .. [=[\e]=]
    return {cal=cal, talk=t}
end


local talk_items = {
    時報(0),
    時報(1),
    時報(2),
    時報(3),
    時報(4),
    時報(5),
    時報(6),
    時報(7),
    時報(8),
    時報(9),
    時報(10),
    時報(11),
    時報(12),
    時報(13),
    時報(14),
    時報(15),
    時報(16),
    時報(17),
    時報(18),
    時報(19),
    時報(20),
    時報(21),
    時報(22),
    時報(23),
}

return talk_items