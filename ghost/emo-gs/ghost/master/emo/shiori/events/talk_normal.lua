local response  = require "shiori.response"

return function(EV)
-- 秒の更新
function EV:OnSecondChange(data, req)
    return self:no_entry(data, req)
end

--翻訳イベント。変更せずに返す。
function EV:OnTranslate(data, req)
    local value = req.reference[0]
    return response.ok(value)
end

--起動トーク
function EV:OnBoot(data, req)
    local value = [=[\1\s[10]\0\s[0]OnBoot:起動トークです。\1\s[100]起動したよ。\e]=]
    return response.ok(value)
end

--クリック
function EV:OnMouseDoubleClick(data, req)
    local value = [=[\1\s[100]\![move,-353,,,0,base,base]\0\s[0]OnMouseDoubleClick:ダブルクリックです。\1\s[100]あいたたた？\e]=]
    return response.ok(value)
end

--バルーン切り替え
function EV:OnBalloonChange(data, req)
    local value = [=[\1\s[10]\0\s[0]OnBalloonChange:バルーン切り替えです。\1\s[100]ばるるるるん？\e]=]
    return response.ok(value)
end

--
end
