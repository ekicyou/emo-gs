-------- ここからこのまま
local response  = require "shiori.response"
return function(EV)
-------- ここまでこのまま

--ランダムトーク
function EV:ランダムトーク(data, req)
    local value = [=[\1\s[10]\0\s[素]《イベント： ランダムトーク 》です。\e]=]
    return response.talk(value)
end

-------- ここからこのまま
end
-------- ここまでこのまま
