-- 共通ユーティリティ

local M = {}

function M.new_talk()


    
    return M.s, ""
end




function M.start()
    return "", M.s
end

function M.s(ch, sf, num)
    local t = ""
    if ch then
        t = t .. "\\" .. ch
    end
    if sf then
        t = t .. "\\s[" .. sf .."]"
    end
    if num then
        t = t .. "\\n[" .. num .."]"
    end
    return t
end

return M