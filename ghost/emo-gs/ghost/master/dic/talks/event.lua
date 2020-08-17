-------- ここからこのまま
local response  = require "shiori.response"
return function(EV)
-------- ここまでこのまま

--初回トーク
function EV:初回起動(data, req)
    local s = [=[\1\![move,-353,,,0,base,base]]=]
    s = s.. [=[\0\c\s[5]はじめましてや！！\nうちは、むらさき。]=]
    s = s.. [=[\1\c\s[0]僕はエモ。\s[15]クール系の可愛い娘。]=]
    s = s.. [=[\0\n[150]\s[A0342]そこ自分でいう‥‥。]=]
    s = s.. [=[\1\c\s[9]イイジャン！‥‥ええと、\s[106]僕は日常から「感情」を探してるんだ。]=]
    s = s.. [=[\0\c\s[100] \0\s[6]つまり、、\n\s[B1332]エモを弄ってればOK？]=]
    s = s.. [=[\1\c\s[9]ちがうよう。]=]
    s = s.. [=[\0\n[150]\s[A1213]まあ、\s[5]これから、よろしゅうに！]=]
    s = s.. [=[\1\c\s[5]よろしくね。]=]
    s = s.. [=[\e]=]
    return response.talk(s)
end

--起動トーク
function EV:起動(data, req)
    local value = [=[\1\s[10]\0\s[5]起動したで！\1\s[0]や、お久しぶり。\e]=]
    return response.talk(value)
end

--クリック
function EV:ダブルクリック(data, req)
    local value = [=[\1\![move,-353,,,0,base,base]\s[100]\0\s[0]ダブルクリックで位置調整なんや。\1\s[100]ソーシャルディスタンスだね。\e]=]

    return response.talk(value)
end

--おさわり反応
local TOUCH = {}
function TOUCH.Head0()
    return [=[
\1\![move,-353,,,0,base,base]\s[100]
\0\s[5]撫でて伸ばすタイプなんや～。
\1\s[8]うそっぽ～い。
\e]=]
end
function TOUCH.Bust0()
    return [=[
\1\![move,-353,,,0,base,base]\s[100]
\0\s[5]えっち、\n　すけっち、\n　　わんたっち～♪\w9
\1\s[8]‥‥\n\w9昭和の香りがするよ。
\e]=]
end
function TOUCH.Head1()
    return [=[
\0\s[0]
\1\s[3]な、なんだよう。
\0\s[5]仕方ないなあ～、\n%usernameったらもう♪\w9
\e]=]
end
function TOUCH.Bust1()
    return [=[
\0\s[0]
\1\s[9]さ、触らないでよ！
\0\s[5]もう、%usernameったら、いたずらっ子やねぇ。\w9
\e]=]
end

function EV:おさわり反応(data, req, actor, region)
    local key = region .. actor
    local fn  = TOUCH[key]
    if type(fn) ~= "function" then
        return self:no_entry(data, req)
    end
    return response.talk(fn())
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
    local value = [=[\1\s[100]\0\s[B1315]きたよぉ～。\1\s[8]期待しない方が‥‥\e]=]
    return response.talk(value)
end
--ネットワーク更新：更新された
function EV:更新成功(data, req)
    local value = [=[
\1\s[100]
\0\s[B0823]更新したで！
\1\s[5]どこが変わったかな？
\0\s[B1322]\n[150]おさわり反応、\n主にえも側や！
\1\s[2]\nなんで！？
\e]=]
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
