
-- prmtv

-- char

v.Char = {}

function v.Char.lr_2_normal_cmd(lr)

  local cmd_nml

  if     lr == 'l' then
    cmd_nml = 'h'

  elseif lr == 'r' then
    cmd_nml = 'l'
  end

  return cmd_nml
end

-- char cnd

function v.Char.is__num(char)

  local ret = false

  if v.Str.is__ptn(char, '\\d') then
    ret = true
  end

  return ret
end

function v.Char.is__alpha(char)

  local ret = false

  if v.Str.is__ptn(char, '\\a') then
    ret = true
  end

  return ret
end

function v.Char.is__symbol(char)

  local ret = false

  if not v.Str.is__ptn(char, '\\s') and not v.Str.is__ptn(char, '\\w') then
    ret = true
  end

  return ret
end

-- char cnd  -  char pair __

function v.Char.is_pair__(ptn, c1, c2)

  local ret = false

  if v.Str.is__ptn(c1, ptn) and v.Str.is__ptn(c2, ptn) then
    ret = true
  end

  return ret
end

function v.Char.is_pair__quote(c1, c2)

  local ret = false

  if     c1 == "'" and c2 == "'" then
    ret = true
  elseif c1 == '"' and c2 == '"' then
    ret = true
  elseif c1 == '`' and c2 == '`' then
    ret = true
  end

  return ret
end

function v.Char.is_pair__bracket(c1, c2)

  local ret = false

  if     c1 == '(' and c2 == ')' then
    ret = true
  elseif c1 == '{' and c2 == '}' then
    ret = true
  elseif c1 == '[' and c2 == ']' then
    ret = true
  elseif c1 == '<' and c2 == '>' then
    ret = true
  end

  return ret
end

-- char cnd tgl

function v.Char.is__tgl_symbol(c)

  local rpl = ''

  if     c == '/' then
    rpl = '|'
  elseif c == '|' then
    rpl = '\\'
  elseif c == '\\' then
    rpl = '/'

  elseif c == "'" then
    rpl = '"'
  elseif c == '"' then
    rpl = '`'
  elseif c == '`' then
    rpl = "'"

  elseif c == '-' then
    rpl = '+'
  elseif c == '+' then
    rpl = '='
  elseif c == '=' then
    rpl = '*'
  elseif c == '*' then
    rpl = '-'

  elseif c == ',' then
    rpl = '.'
  elseif c == '.' then
    rpl = ','

  elseif c == ';' then
    rpl = ':'
  elseif c == ':' then
    rpl = ';'

  elseif c == '?' then
    rpl = '!'
  elseif c == '!' then
    rpl = '?'
  end

  return rpl
end

function v.Char.is__tgl_bracket_trn(c)

  local rpl = ''

  if     c == '<' then
    rpl = '>'
  elseif c == '>' then
    rpl = '<'

  elseif c == '{' then
    rpl = '}'
  elseif c == '}' then
    rpl = '{'

  elseif c == '[' then
    rpl = ']'
  elseif c == ']' then
    rpl = '['

  elseif c == '(' then
    rpl = ')'
  elseif c == ')' then
    rpl = '('
  end

  return rpl
end

function v.Char.bracket_r(bracket_l)

  local bracket_lst = {
    {'(', ')'},
    {'[', ']'},
    {'{', '}'},
    {'<', '>'},
  }

  local bracket_r

  for idx, bracket_pair in pairs(bracket_lst) do

    if bracket_l == bracket_pair[1] then
      bracket_r = bracket_pair[2]
    end
  end

  return bracket_r
end

-- str

v.Str = {}

function v.Str.len(str) -- alias

  return f.strchars(str)
end

function v.Str.l_char(str)

  -- local l_idx = 0
  local l_idx = 1
  -- local c = str[l_idx]
  local c = str:sub(l_idx, l_idx)
  --print(c)
  return c
end

function v.Str.r_char(str)

  -- local r_idx = v.Str.len(str) - 1
  local r_idx = v.Str.len(str)
  -- local c = str[r_idx]
  local c = str:sub(r_idx, r_idx)
  --print( c )
  return c
end

-- dev anchor ?
function v.Str.sub(str, idx_s, idx_e)  -- alias

  local r_str = string.sub(str, idx_s, idx_e)
  return r_str
end

-- dev anchor
function v.Str.sub_by_len(str, idx, len) -- todo dev

  local str = str
  return str
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

function v.Str.srch(str, ptn)

  local ret = string.match(str, ptn)
  return ret
end

function v.Str.srch_idx(str, ptn, idx) -- alias

  -- local arg = {...}
  -- local str = arg[1]
  -- local ptn = arg[2]
  -- local idx = ( #arg >= 3 ) and arg[3] or nil

  local r_idx = f.match(str, ptn, idx)
  return r_idx -- -1 : match not
end

function v.Str.srch_end(str, ptn) -- alias

  local idx = f.matchend(str, ptn)
  return idx
end

-- str __ rpl

function v.Str.__rpl(str, srch, rpl) -- alias

  local r_str = f.substitute(str, srch, rpl, 'g')
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
  -- local str = f.get(cmnt_1_def, vim.bo.filetype, cmnt_1_def['dflt'])
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

  if f.match(str, ptn) == -1 then
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

-- idx

v.Idx = {}

function v.Idx.__icl(idx, ar_len)

  local r_idx = idx + 1

  if r_idx > ar_len then
    -- r_idx = 0
    r_idx = 1
  end

  return r_idx
end

function v.Idx.__dcl(idx, ar_len)

  local r_idx = idx - 1

  -- if r_idx < 0 then
  if r_idx <= 0 then
    -- r_idx = ar_len - 1
    r_idx = ar_len
  end

  return r_idx
end

-- int

v.Int = {}

function v.Int._2_str(num)

  local num_str = f.printf('%o', num)
  return num_str
end

-- ar ( list )

v.Ar = {}

-- txt

v.Txt = {}

function v.Txt._to_ar(txt)

  local line_ar  = f.split(txt, '\\n')
  return line_ar
end

-- do nothing

v.Do = {}

function v.Do.nothing() -- use by tst

  -- print( "do nothing.." )
end

-- fr utl

v.Tbl = {}

function v.Tbl.add(tbl, val)

  return table.insert(tbl, val)
end

function v.Tbl.del(tbl, idx)

  return table.remove(tbl, idx)
end

function v.Tbl.len(tbl)

  return #tbl
end

function v.Tbl.idx(tbl, val)

  for _idx, _val in pairs(tbl) do

    if _val == val then
      return _idx
    end
  end
  return nil
end

function v.Tbl.is_in(tbl, val)

  local idx = v.Tbl.idx(tbl, val)

  if idx then
    return true
  else
    return false
  end
end

function v.Tbl.last(tbl)

  local len = v.Tbl.len(tbl)
  return tbl[len]
end

function v.Tbl.is_last(tbl, val)

  if val == v.Tbl.last(tbl) then
    return true
  else
    return false
  end
end

function v.Tbl.srt(tbl, cmp_fnc)

  return table.sort(tbl, cmp_fnc)
end

v.Num = {}

function v.Num.seq(s_num, e_num)

  local tbl = {}
  for num = s_num, e_num do
    v.Tbl.add(tbl, num)
  end
  return tbl
end

