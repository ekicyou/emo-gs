-------- ここからこのまま
local response  = require "shiori.response"
return function(EV)
-------- ここまでこのまま

--ランダムトーク
function EV:ランダムトーク(data, req)
        local value = [=[\1\s[10]\0\s[0]いつものお話やで。\1\s[10]ネタはないの？\e]=]
        return response.talk(value)
end

-------- ここからこのまま
end
-------- ここまでこのまま
