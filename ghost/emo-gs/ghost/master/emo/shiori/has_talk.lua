local utils  = require "shiori.utils" 

local M = {}


-- 会話中でなければtrue
local function has_talk(status_dic)
    return status_dic.talking  ~= nil
end

-- 会話終了後の経過時間を見て
-- 発言可能かどうかを判断する関数
-- 参照：
--   data.save.talking.wait_sec  : 会話終了後に発言を開ける秒数
--   data.save.talking.time_talk : 最後に会話中だった時刻
--   date.save.talking.time_check: この関数を最後に呼び出した時刻
--   date.save.talking.time_ok   : この関数が最後にtrueを返した時刻
local function has_talk_normal(status_dic, data)
    now = os.time()
    local x = utils.get_tree_entry(data, "save", "talking")
    x.time_check = now
--    if x.wait_sec <= 0 then
--        x.wait_sec = 60
--    end
--    if has_talk(status_dic) then
--        x.time_talk = now
--        return false
--    elseif now - x.time_talk < x.wait_sec then
--        return false
--    end
--    x.time_ok=now
--    return true
    return false
end




function M:quick(status_dic)
    return has_talk(status_dic)
end
function M:normal(status_dic, data)
    return has_talk_normal(status_dic, data)
end

return M