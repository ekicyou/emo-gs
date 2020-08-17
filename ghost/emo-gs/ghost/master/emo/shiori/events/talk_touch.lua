local response  = require "shiori.response"
local has_talk  = require "shiori.has_talk"

return function(EV)


function EV:OnMouseMove(data, req)
    local is_touch = has_talk.touch(data, req)
    if is_touch then
        local actor   = req.reference[3]
        local region  = req.reference[4]
        return self:おさわり反応(data, req, actor, region)
    else
        return self:no_entry(data, req)
    end
end





--
end
