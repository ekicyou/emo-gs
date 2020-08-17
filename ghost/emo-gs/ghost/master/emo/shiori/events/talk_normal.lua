local response  = require "shiori.response"
local has_talk  = require "shiori.has_talk"

return function(EV)


-- 秒の更新
-- 会話終了後、待機時間が終了したら一般会話イベントを発行。
function EV:OnSecondChange(data, req)
    if type(data) ~= "table" then
        local value = [=[\1\s[10]\0\s[0]ERROR\e]=]
        return response.ok(value)   
    end
    if has_talk.normal(req.status_dic, data) then
        return self:ランダムトーク(data, req)
    end
    return self:no_entry(data, req)
end

--翻訳イベント。変更せずに返す。
function EV:OnTranslate(data, req)
    local value = req.reference[0]
    return response.ok(value)
end




--
end
