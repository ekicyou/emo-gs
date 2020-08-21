local response  = require "shiori.response"
local utils     = require "shiori.utils"


local function TRY_CATCH(what)
    local status, result = pcall(what.try)
    if status then  return result
    else            return what.catch(result)
    end
    return result
end


return function(EV)
-- SHIORI リクエスト呼び出し
function EV:fire_request(data, req)
    local function try()
        -- Statusがある場合の分解
        local status_dic = utils.get_status(req.status)
        req.status_dic = status_dic

        -- 日時フィールドが未登録なら登録
        if req.date == nil then
            req.date = os.date("*t")
        end

        -- イベント分岐
        local id = req.id
        local fn = self[id]
        return fn(self, data, req)
    end

    local function catch(ex)
        return response.talk([=[\1\s[10]\0\s[0]エラー発生！\n]=].. ex ..[=[]=])
    end

    return TRY_CATCH({try=try, catch=catch})
end
--
end
