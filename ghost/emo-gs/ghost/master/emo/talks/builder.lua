-- トーク組み立てビルダ
local M = {}

-- 配列からランダムに要素を1つ選んで返す。
local function SEL(array)
    local counter = #array
    local index = math.random(counter)
    return array[index]
end

-- builderを返す
-- local C, S, T = builder.new()
function M.new()
    local x = {}
    local t = ""
    local scope = {}
    local actor = false

    -- スコープ切り替え
    local function change_scope(id, line)
        t = t .. "\\" .. id
        actor = scope[id]
        if not actor then
            if not line then line = 150 end
            actor = {line = line, len=0}
            scope[id] = actor
        else
            if line then actor.line = line end
            if actor.len > 0 then
                t = t .. "\\n[" .. actor.line .."]"
                actor.len = 0
            end
        end
    end

    -- サーフェス切り替え
    local function change_surface(...)
        local id = SEL({...})
        if id then t = t .. "\\s[" .. id .."]" end
    end

    -- テキスト追加
    local function push(text)
        t = t .. text
        if actor then
            actor.len = actor.len + string.len(text)
        else
            error("T(\"".. text .."\") Error, Not call C()")
        end
    end

    -- 発行
    x.build = function()
        return t .. [=[\e]=]
    end

    -- 環境取得
    x.get = function()
        return change_scope, change_surface, push
    end
    return  x, change_scope, change_surface, push
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