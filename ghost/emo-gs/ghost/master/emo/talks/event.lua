-------- ここからこのまま
local response  = require "shiori.response"
return function(EV)
-------- ここまでこのまま

--初回トーク
function EV:初回起動(data, req)
    local value = [=[\1\s[10]\0\s[0]《イベント： 初回起動 》です。\e]=]
    return response.talk(value)
end

--起動トーク
function EV:起動(data, req)
    local value = [=[\1\s[10]\0\s[0]《イベント： 起動 》です。\e]=]
    return response.talk(value)
end

--クリック
function EV:ダブルクリック(data, req)
    local value = [=[\1\s[10]\0\s[0]《イベント： ダブルクリック 》です。\e]=]
    return response.talk(value)
end

--バルーン切り替え
function EV:バルーン切り替え(data, req)
    local value = [=[\1\s[10]\0\s[0]《イベント： バルーン切り替え 》です。\e]=]
    return response.ok(value)
end


--おさわり反応
function EV:おさわり反応(data, req, actor, region)
    local value = [=[\1\s[10]\0\s[0]《イベント： おさわり反応 》です。"]=].. actor ..[=["側の"]=].. region ..[=["がタッチされました。\e]=]
    return response.talk(value)
end


--ネットワーク更新：ネットワーク更新開始
function EV:更新開始(data, req)
    local value = [=[\1\s[10]\0\s[0]《イベント： 更新開始 》です。\e]=]
    return response.talk(value)
end
--ネットワーク更新：更新ファイル確認
function EV:更新確認(data, req)
    local value = [=[\1\s[10]\0\s[0]《イベント： 更新確認 》です。\e]=]
    return response.talk(value)
end
--ネットワーク更新：更新された
function EV:更新成功(data, req)
    local value = [=[\1\s[10]\0\s[0]《イベント： 更新成功 》です。\e]=]
    return response.talk(value)
end
--ネットワーク更新：更新されなかった
function EV:更新無し(data, req)
    local value = [=[\1\s[10]\0\s[0]《イベント： 更新無し 》です。\e]=]
    return response.talk(value)
end
--ネットワーク更新：サイト無し
function EV:更新失敗(data, req)
    local value = [=[\1\s[10]\0\s[0]《イベント： 更新失敗 》です。\e]=]
    return response.talk(value)
end


-------- ここからこのまま
end
-------- ここまでこのまま
