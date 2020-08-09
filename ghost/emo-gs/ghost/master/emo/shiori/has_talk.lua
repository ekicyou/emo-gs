local utils  = require "shiori.utils" 

local M = {}

-- 会話中でなければtrue
function M.quick(status_dic)
    return status_dic.talking  ~= nil
end

-- 会話終了後の経過時間を見て
-- 発言可能かどうかを判断する関数
-- 参照：
--   data.save.talking.wait_sec  : 会話終了後に発言を開ける秒数
--   data.save.talking.time_talk : 最後に会話中だった時刻
--   date.save.talking.time_check: この関数を最後に呼び出した時刻
--   date.save.talking.time_ok   : この関数が最後にtrueを返した時刻
function M.normal(status_dic, data)
    now = os.time()
    local x = utils.get_tree_entry(data, "save", "talking")
    x.time_check = now
    if x.wait_sec == nil then
        x.wait_sec = 30
        x.time_talk = nil
    end
    if x.time_talk == nil then
        x.time_talk = now
    end
    if M.quick(status_dic) then
        x.time_talk = now
        return false
    end
    if now - x.time_talk < x.wait_sec then
        return false
    end
    x.time_ok=now
    return true
end


return M