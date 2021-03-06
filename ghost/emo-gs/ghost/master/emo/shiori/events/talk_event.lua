local response  = require "shiori.response"

return function(EV)

--翻訳イベント。変更せずに返す。
function EV:OnTranslate(data, req)
    local value = req.reference[0]
    return response.ok(value)
end

--初回起動
function EV:OnFirstBoot(data, req)
    return self:初回起動(data, req)
end

--起動
function EV:OnBoot(data, req)
    return self:起動(data, req)end

--クリック
function EV:OnMouseDoubleClick(data, req)
    return self:ダブルクリック(data, req)end

--バルーン切り替え
function EV:OnBalloonChange(data, req)
    return self:バルーン切り替え(data, req)end



--ネットワーク更新：ネットワーク更新開始
function EV:OnUpdateBegin(data, req)
    return self:更新開始(data, req)
end
--ネットワーク更新：更新ファイル確認
function EV:OnUpdateReady(data, req)
    return self:更新確認(data, req)
end
--ネットワーク更新：更新成功
function EV:OnUpdateComplete(data, req)
    if req.reference[0] == "changed" then
        return self:更新成功(data, req)
    else
        return self:更新無し(data, req)
    end
end
--ネットワーク更新：更新失敗
function EV:OnUpdateFailure(data, req)
    return self:更新失敗(data, req)
end


--
end
