
-- Excel列名変換 (自動判定)
function excel_col_convert(input)
    -- 数値かどうかを判定
    if tonumber(input) then
        -- 数値の場合：数値→英語列名
        return num_to_col(tonumber(input))
    else
        -- 英語の場合：英語列名→数値
        return col_to_num(input)
    end
end

-- 内部function: 数値を英語列名に変換
function num_to_col(num)
    local result = ""
    
    while num > 0 do
        local remainder = (num - 1) % 26
        result = string.char(remainder + 65) .. result
        num = math.floor((num - 1) / 26)
    end
    
    return result
end

-- 内部function: 英語列名を数値に変換
function col_to_num(col)
    col = string.upper(col)
    local result = 0
    
    for i = 1, #col do
        local char = string.sub(col, i, i)
        local value = string.byte(char) - 64
        result = result * 26 + value
    end
    
    return result
end

local col_str = excel_col_convert(arg[1])
print(col_str)

