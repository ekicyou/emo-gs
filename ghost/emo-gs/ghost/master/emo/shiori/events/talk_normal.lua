local response  = require "shiori.response"
local has_talk  = require "shiori.has_talk"

return function(EV)


-- 秒の更新
-- 会話終了後、待機時間が終了したら一般会話イベントを発行。
function EV:OnSecondChange(data, req)
    if has_talk.normal(req.status_dic, data) then
        local value = [=[\1\s[10]\0\s[0]いつものお話やで。\w9\w9\1\s[10]ネタはないの？\w9\w9\e]=]
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
    local value = [=[\1\![move,-353,,,0,base,base]\s[100]\0\s[5]OnBoot:起動トークや！\_w[600]\1\s[10]や、\_w[400]お久しぶり。\w9\w9\e]=]
    return response.ok(value)
end

--クリック
function EV:OnMouseDoubleClick(data, req)
    local value = [=[\1\![move,-353,,,0,base,base]\s[100]\0\s[0]\_qOnMouseDoubleClick\n\_qおや、\_w[400]ダブルクリックされたよ。\_w[600]\1\s[100]あいたたた？\w9\w9\e]=]
    return response.ok(value)
end

--バルーン切り替え
function EV:OnBalloonChange(data, req)
    local value = [=[\1\s[100]\0\s[0]\_qOnBalloonChange\n\_qバルーン切り替えです。\w9\w9\1\s[100]ばるるるるん？\_w[600]\e]=]
    return response.ok(value)
end



--ネットワーク更新：ネットワーク更新開始
function EV:OnUpdateBegin(data, req)
    local value = [=[\1\s[100]\0\s[5]あったらし～い～、\_w[400]更新は？\_w[600]\w9\w9\1\s[100]きた？\_w[600]\e]=]
    return response.ok(value)
end
--ネットワーク更新：更新ファイル確認
function EV:OnUpdateReady(data, req)
    local value = [=[\1\s[210]\0\s[B0511]こえへん‥‥\_w[210]\1\s[202]ｲｷﾛｰ｡\_w[600]\e]=]
    return response.ok(value)
end
--ネットワーク更新：更新成功
function EV:OnUpdateComplete(data, req)
    local value = [=[\1\s[100]\0\s[0]\_qOnBalloonChange\n\_qバルーン切り替えです。\_w[600]\1\s[100]ばるるるるん？\_w[600]\e]=]
    return response.ok(value)
end
--ネットワーク更新：更新失敗
function EV:OnUpdateFailure(data, req)
    local value = [=[\1\s[100]\0\s[0]\_qOnBalloonChange\n\_qバルーン切り替えです。\_w[600]\1\s[100]ばるるるるん？\_w[600]\e]=]
    return response.ok(value)
end

--
end
