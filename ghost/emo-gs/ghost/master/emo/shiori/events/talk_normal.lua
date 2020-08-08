local response  = require "shiori.response"

return function(EV)


local wait_sec = 15
-- 秒の更新
-- 会話終了後、wait_secだけ秒数が経過したら通常会話イベントを発動。
function EV:OnSecondChange(data, req)
    now = os.time()
    data.save.time_OnSecondChange = now
    if req.status_dic.talking then
        data.save.time_talking = now
    elseif now - data.save.time_talking >= wait_sec then
        data.save.time_talk_normal = now
        local value = [=[\1\s[10]\0\s[0]通常トークです。\w9\1\s[100]ネタはないの？\e]=]
        return response.ok(value)
    end
    return self:no_entry(data, req)
end

--翻訳イベント。変更せずに返す。
function EV:OnTranslate(data, req)
    local value = req.reference[0]
    return response.ok(value)
end

--起動トーク
function EV:OnBoot(data, req)
    local value = [=[\1\s[10]\0\s[0]OnBoot:起動トークです。\w9\1\s[100]起動したよ。\e]=]
    return response.ok(value)
end

--クリック
function EV:OnMouseDoubleClick(data, req)
    local value = [=[\1\s[100]\![move,-353,,,0,base,base]\0\s[0]OnMouseDoubleClick:ダブルクリックです。\w9\1\s[100]あいたたた？\e]=]
    return response.ok(value)
end

--バルーン切り替え
function EV:OnBalloonChange(data, req)
    local value = [=[\1\s[10]\0\s[0]OnBalloonChange:バルーン切り替えです。\w9\1\s[100]ばるるるるん？\e]=]
    return response.ok(value)
end

--
end
