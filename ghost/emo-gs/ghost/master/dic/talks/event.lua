-------- ここからこのまま
local response  = require "shiori.response"
return function(EV)
-------- ここまでこのまま

--初回トーク
function EV:初回起動(data, req)
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
function EV:起動(data, req)
    local value = [=[\1\s[10]\0\s[5]起動したで！\1\s[10]や、お久しぶり。\e]=]
    return response.talk(value)
end

--クリック
function EV:ダブルクリック(data, req)

    local value = [=[
\1\s[10]\0\s[B1124]アヒルやアヒル！\n11年ぶり、大阪にアヒルが\n帰ってくるねんで！\1\s[10]‥‥11年前って、\n覚えてるの？\e]=]

--  local value = [=[\1\![move,-353,,,0,base,base]\s[100]\0\s[0]\_qOnMouseDoubleClick\n\_qおや、ダブルクリックされたよ。\1\s[100]あいたたた？\e]=]
    return response.talk(value)
end

--バルーン切り替え
function EV:バルーン切り替え(data, req)
    local value = [=[\1\s[100]\0\s[0]バルーン切り替えです。\w9\w9\1\s[100]ばるるるるん？\_w[600]\e]=]
    return response.ok(value)
end


--ネットワーク更新：ネットワーク更新開始
function EV:更新開始(data, req)
    local value = [=[\1\s[100]\0\s[5]あったらし～い～、更新は？\1\s[100]きた？\e]=]
    return response.talk(value)
end
--ネットワーク更新：更新ファイル確認
function EV:更新確認(data, req)
    local value = [=[\1\s[100]\0\s[B1315]きたよぉ～。\1\s[18]期待しない方が‥‥\e]=]
    return response.talk(value)
end
--ネットワーク更新：更新された
function EV:更新成功(data, req)
    local value = [=[\1\s[100]\0\s[B0823]更新したで！\1\s[15]どこが変わったかな？\e]=]
    return response.talk(value)
end
--ネットワーク更新：更新されなかった
function EV:更新無し(data, req)
    local value = [=[\1\s[210]\0\s[B0511]こえへん‥‥\1\s[202]ｲｷﾛｰ｡\e]=]
    return response.talk(value)
end
--ネットワーク更新：サイト無し
function EV:更新失敗(data, req)
    local value = [=[\1\s[210]\0\s[B0511]繋がらへん‥‥\1\s[202]ｲｷﾛｰ｡\e]=]
    return response.talk(value)
end


-------- ここからこのまま
end
-------- ここまでこのまま