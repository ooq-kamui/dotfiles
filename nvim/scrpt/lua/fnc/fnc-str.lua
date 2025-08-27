
v.Str = {}

function v.Str.len(str) -- alias

  return vf.strchars(str) -- by char
end

function v.Str.len_byte(str) -- alias

  return vf.strlen(str) -- by byte
end

function v.Str.len_char(str) -- alias

  return vf.strcharlen(str) -- by char
end

function v.Str.trim(str) -- alias

  str = vf.trim(str)
  return str
end

function v.Str.l_char(str)

  local l_idx = 1
  local char = str:sub(l_idx, l_idx)
  --print(char)
  return char
end

function v.Str.r_char(str)

  local r_idx = v.Str.len(str)
  local char = str:sub(r_idx, r_idx)
  --print( char )
  return char
end

-- dev anchor
function v.Str.sub_by_byte(str, byte_s, byte_e) -- col : 1 start

  local r_str = string.sub(str, byte_s, byte_e)
  return r_str
end

-- dev anchor
function v.Str.sub_by_col(str, col_s, col_e) -- col : 1 start

  local len    = col_e - col_s + 1
  local byte_s = col_s - 1

  local r_str = vf.strpart(str, byte_s, len)
  return r_str
end

function v.Str.sub_by_char_idx(str, char_idx_s, char_idx_e) -- char_idx : 1 start

  local len = char_idx_e - char_idx_s + 1
  local r_str = vf.strcharpart(str, char_idx_s - 1, len)
  return r_str
end

function v.Str.space(len)

  local space_str = ''

  local idx = 1
  while idx <= len do

    space_str = space_str .. ' '

    idx = idx + 1
  end
  return space_str
end

function v.Str.ruler_len(str)

  local ruler_num = vf.strdisplaywidth(str)
  return ruler_num
end

-- str srch

function v.Str.srch(str, ptn)

  local match_str = string.match(str, ptn)
  return match_str
end

function v.Str.srch_idx_by_lua(str, ptn, srch_s_idx)
  -- print(str, ptn, srch_s_idx)

  local s_idx, e_idx = string.find(str, ptn, srch_s_idx)
  -- print(s_idx, e_idx)
  return s_idx, e_idx
end

-- dev anchor, rpl
function v.Str.srch_idx_by_vim(str, ptn, idx) -- alias

  local r_idx = vf.match(str, ptn, idx)
  return r_idx -- -1 : match not
end

function v.Str.srch_idx(str, ptn, srch_s_idx) -- alias

  -- return v.Str.srch_idx_by_vim(str, ptn, srch_s_idx)
  return v.Str.srch_idx_by_lua(str, ptn, srch_s_idx)
end

function v.Str.srch_end(str, ptn) -- alias

  local idx = vf.matchend(str, ptn)
  return idx
end

function v.Str.col_idx_lst(str)

  local col_idx_lst = {}
  local char

  local is_space = true

  for idx = 1, #str do

    char = str:sub(idx, idx)

    if v.Char.is_space(char) then
      is_space = true

    else
      if is_space then
        table.insert(col_idx_lst, idx)
      end
      is_space = false
    end
  end

  return col_idx_lst
end

-- str __ rpl

function v.Str.__rpl(str, srch, rpl) -- alias

  local r_str = vf.substitute(str, srch, rpl, 'g')
  return r_str
end

function v.Str.path_unix__cnv_win(path)

  local path = path
  local path = v.Str.__rpl(path, '/c/', 'C:/')
  local path = v.Str.__rpl(path, '/', '\\')
  return path
end

function v.Str.path_win__cnv_unix(path)

  local path = path
  local path = v.Str.__rpl(path, 'C:', '/c')
  local path = v.Str.__rpl(path, '\\', '/')
  return path
end

function v.Str.cmnt_1()

  local cmnt_1_def = {
    lua        = '-- ',
    text       = '# ' ,
    vim        = '" ' ,
    fish       = '# ' ,
    sh         = '# ' ,
    css        = '/* ',
    javascript = '// ',
    typescript = '// ',
    typescriptreact = '// ',
    java       = '// ',
    sql        = '-- ',
    dflt       = '# ' ,
  }

  -- dev anchor
  -- local str = vf.get(cmnt_1_def, vim.bo.filetype, cmnt_1_def['dflt'])
  local str = cmnt_1_def[vim.bo.filetype] or cmnt_1_def['dflt']
  return str
end

-- str cnd

function v.Str.is__emp(str)

  local ret = false

  if str == '' then
    ret = true
  end
  return ret
end

function v.Str.is__ptn(str, ptn)

  local ret

  if vf.match(str, ptn) == -1 then
    ret = false
  else
    ret = true
  end

  return ret
end

function v.Str.is__space(str)

  local ptn = '^\\s\\+$'
  local ret = v.Str.is__ptn(str, ptn)
  return ret
end

function v.Str.is__num(str)

  local ptn = '^\\d\\+$'
  local ret = v.Str.is__ptn(str, ptn)
  return ret
end


