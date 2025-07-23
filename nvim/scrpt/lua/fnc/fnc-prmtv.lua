
-- prmtv

-- char

function v.Char_lr_2_normal_cmd(lr)

  local cmd_nml

  if     lr == 'l' then
    cmd_nml = 'h'

  elseif lr == 'r' then
    cmd_nml = 'l'
  end

  return cmd_nml
end

-- char cnd

function v.Is_char__num(char)

  local ret = false

  if v.Is_str__ptn(char, '\\d') then
    ret = true
  end

  return ret
end

function v.Is_char__alpha(char)

  local ret = false

  if v.Is_str__ptn(char, '\\a') then
    ret = true
  end

  return ret
end

function v.Is_char__symbol(char)

  local ret = false

  if not v.Is_str__ptn(char, '\\s') and not v.Is_str__ptn(char, '\\w') then
    ret = true
  end

  return ret
end

-- char cnd  -  char pair __

function v.Is_char_pair__(ptn, c1, c2)

  local ret = false

  if v.Is_str__ptn(c1, ptn) and v.Is_str__ptn(c2, ptn) then
    ret = true
  end

  return ret
end

function v.Is_char_pair__quote(c1, c2)

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

function v.Is_char_pair__bracket(c1, c2)

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

function v.Is_char__tgl_symbol(c)

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

function v.Is_char__tgl_bracket_trn(c)

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

-- dev anchor
function v.Str.sub(str, idx, len) -- dev doing

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

function v.Str.srch_idx(...) -- alias

  local arg = {...}

  local str = arg[1]
  local ptn = arg[2]
  local idx = ( #arg >= 3 ) and arg[3] or nil

  local r_idx = f.match(str, ptn, idx)
  return r_idx -- -1 : match not
end

function v.Str_srch_end(str, ptn) -- alias

  local idx = f.matchend(str, ptn)
  return idx
end

-- str __ rpl

function v.Str__rpl(str, srch, rpl) -- alias

  local r_str = f.substitute(str, srch, rpl, 'g')
  return r_str
end

function v.Str_path_unix__cnv_win(path)

  local path = path
  local path = v.Str__rpl(path, '/c/', 'C:/')
  local path = v.Str__rpl(path, '/', '\\')
  return path
end

function v.Str_path_win__cnv_unix(path)

  local path = path
  local path = v.Str__rpl(path, 'C:', '/c')
  local path = v.Str__rpl(path, '\\', '/')
  return path
end

function v.Str_cmnt_1()

  local cmnt_1_def = {
    lua        = '-- ',
    text       = '# ' ,
    vim        = '" ' ,
    fish       = '# ' ,
    sh         = '# ' ,
    css        = '/* ',
    javascript = '// ',
    typescript = '// ',
    java       = '// ',
    sql        = '-- ',
    dflt       = '# ' ,
  }

  -- dev anchor
  local str = f.get(cmnt_1_def, vim.bo.filetype, cmnt_1_def['dflt'])
  return str
end

-- str cnd

function v.Is_str__emp(str)

  local ret = false

  if str == '' then
    ret = true
  end
  return ret
end

function v.Is_str__ptn(str, ptn)

  local ret

  if f.match(str, ptn) == -1 then
    ret = false
  else
    ret = true
  end

  return ret
end

function v.Is_str__space(str)

  local ptn = '^\\s\\+$'
  local ret = v.Is_str__ptn(str, ptn)
  return ret
end

function v.Is_str__num(str)

  local ptn = '^\\d\\+$'
  local ret = v.Is_str__ptn(str, ptn)
  return ret
end

-- idx

function v.Idx__icl(idx, ar_len)

  local r_idx = idx + 1

  if r_idx > ar_len then
    -- r_idx = 0
    r_idx = 1
  end

  return r_idx
end

function v.Idx__dcl(idx, ar_len)

  local r_idx = idx - 1

  -- if r_idx < 0 then
  if r_idx <= 0 then
    -- r_idx = ar_len - 1
    r_idx = ar_len
  end

  return r_idx
end

-- int

function v.Int_2_str(num)

  local num_str = f.printf('%o', num)
  return num_str
end

-- ar ( list )

-- txt

function v.Txt_to_ar(txt)

  local line_ar  = f.split(txt, '\\n')
  return line_ar
end

function v.Nothing() -- use by tst

  -- print( "do nothing.." )
end







