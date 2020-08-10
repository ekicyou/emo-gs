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
        local value = [=[\1\s[10]\0\s[0]いつものお話やで。\1\s[10]ネタはないの？\e]=]
        return response.talk(value)
    end
    return self:no_entry(data, req)
end

--翻訳イベント。変更せずに返す。
function EV:OnTranslate(data, req)
    local value = req.reference[0]
    return response.ok(value)
end

--初回トーク
function EV:OnFirstBoot(data, req)
    local s = [=[\1\![move,-353,,,0,base,base]]=]
    s = s.. [=[\0\c\s[5]はじめましてや！！\nうちは、むらさき。]=]
    s = s.. [=[\1\c\s[10]僕はエモ。\s[15]クール系の可愛い娘。]=]
    s = s.. [=[\0\n[150]\s[A0342]そこ自分でいう‥‥。]=]
    s = s.. [=[\1\c\s[19]イイジャン！‥‥ええと、\s[106]僕は日常から「感情」を探してるんだ。]=]
    s = s.. [=[\0\c\s[100] \0\s[6]つまり、、\n\s[B1332]エモを弄ってればOK？]=]
    s = s.. [=[\1\c\s[19]ちがうよう。]=]
    s = s.. [=[\0\n[150]\s[A1213]まあ、\s[5]これから、よろしゅうに！]=]
    s = s.. [=[\1\c\s[15]よろしくね。]=]
    s = s.. [=[\e]=]
    return response.talk(s)
end

--起動トーク
function EV:OnBoot(data, req)
    local value = [=[\1\![move,-353,,,0,base,base]\s[100]\0\s[5]起動したで！\1\s[10]や、お久しぶり。\e]=]
    return response.talk(value)
end

--クリック
function EV:OnMouseDoubleClick(data, req)
    local value = [=[\1\![move,-353,,,0,base,base]\s[100]\0\s[0]\_qOnMouseDoubleClick\n\_qおや、ダブルクリックされたよ。\1\s[100]あいたたた？\e]=]
    return response.talk(value)
end

--バルーン切り替え
function EV:OnBalloonChange(data, req)
    local value = [=[\1\s[100]\0\s[0]\_qOnBalloonChange\n\_qバルーン切り替えです。\w9\w9\1\s[100]ばるるるるん？\_w[600]\e]=]
    return response.ok(value)
end



--ネットワーク更新：ネットワーク更新開始
function EV:OnUpdateBegin(data, req)
    local value = [=[\1\s[100]\0\s[5]あったらし～い～、更新は？\1\s[100]きた？\e]=]
    return response.talk(value)
end
--ネットワーク更新：更新ファイル確認
function EV:OnUpdateReady(data, req)
    local value = [=[\1\s[100]\0\s[B1315]きたよぉ～。\1\s[18]期待しない方が‥‥\e]=]
    return response.talk(value)

end
--ネットワーク更新：更新成功
function EV:OnUpdateComplete(data, req)
    local value = [=[\1\s[100]\0\s[B0823]更新したで！\1\s[5]どこが変わったかな？\e]=]
    return response.talk(value)
end
--ネットワーク更新：更新失敗
function EV:OnUpdateFailure(data, req)
    local value = [=[\1\s[210]\0\s[B0511]こえへん‥‥\1\s[202]ｲｷﾛｰ｡\e]=]
    return response.talk(value)
end

--
end
