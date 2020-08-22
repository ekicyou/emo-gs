local response  = require "shiori.response"
local utils     = require "shiori.utils"
local has_talk  = require "shiori.has_talk"
local cal_entry = require "talks.cal"
local cal       = require "shiori.cal_time"

return function(EV)


-- 秒の更新
-- 会話終了後、待機時間が終了したら一般会話イベントを発行。
function EV:OnSecondChange(data, req)
    if type(data) ~= "table" then
        local value = [=[\1\s[10]\0\s[素]ERROR\e]=]
        return response.ok(value)   
    end
    -- イベントトーク判定
    if not has_talk.quick(req.status_dic) then
        local x = utils.get_tree_entry(data, "save", "talking")
        local block_sec = x.wait_sec *2
        if not block_sec then block_sec = 40 end
        local flag, entry = cal.fire_entry(block_sec, cal_entry, os.time())
        if     flag == 2    then return response.talk(entry.talk);
        elseif flag == 1    then return response.warn("cal guard time")
        end
    end

    -- ランダムトーク判定
    local remain_sec = has_talk.normal(req.status_dic, data)
    if remain_sec == 0 then
        return self:ランダムトーク(data, req)
    end
    return response.warn("wait normal talk.. " .. remain_sec .. " sec" )
end

--翻訳イベント。変更せずに返す。
function EV:OnTranslate(data, req)
    local value = req.reference[0]
    return response.ok(value)
end




--
end
