-- むらさき側、共通アクション

local o = require "talks.o"
local _ = require "talks.word_dic" 
local builder = require "talks.builder"

local 紫={}

local function SEL(talk, array)
    local C, S, T = talk.get()
    C(0, 150)
    o.SEL(array)(S,T)
end

local 人名って危険なXXXらしいで = {
    function(S,T) T(_.人名()) T([[って、\n]]) T([[目に爆弾抱えとるらしいで。]]) end,
    function(S,T) T(_.人名()) T([[につける薬はないらしいで。]]) end,
    function(S,T) T(_.人名()) T([[って、\n]]) T(_.XXXが出来る()) T([[が出来るらしいで。]])    end,
}
function 紫.人名って危険なXXXらしいで(talk) SEL(talk, 人名って危険なXXXらしいで) end

--エイリアス
-- |0:腕   |1:紅   |2:口     |3:眉     |4:目     |
-- |=======|=======|=========|=========|=========|
-- |A:伸び |0:無し |1:笑顔１ |1:通常   |1:べそ   |
-- |B:組み |1:差し |2:笑顔２ |2:オコ   |2:ジトー |
--                 |3:口開   |3:悲しみ |3:通常   |
--                 |4:うや？ |4:シュン |4:笑顔   |
--                 |5:うう‥ |         |5:静観 |
--                 |6:む？   |
--                 |7:‥‥   |
--                 |8:にこっ |
--                 |9:小口   |
--                 |A:中口   |
--                 |B:うぇ～ |
--                 |C:ハァ～ |


--|ID    |0:腕   |1:紅   |2:口     |3:眉     |4:目  |
--|B1124 |B:伸び |1:差し |1:笑顔１ |2:オコ   |4笑顔 | 興奮笑顔









return 紫