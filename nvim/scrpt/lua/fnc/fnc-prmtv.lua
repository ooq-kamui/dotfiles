
-- prmtv

require('fnc/fnc-str')
require('fnc/fnc-tbl')


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

  local ret = c.f

  if v.Str.is__ptn(char, '\\d') then
    ret = c.t
  end

  return ret
end

function v.Char.is__alpha(char)

  local ret = c.f

  if v.Str.is__ptn(char, '\\a') then
    ret = c.t
  end

  return ret
end

function v.Char.is__symbol(char)

  local ret = c.f

  if not v.Str.is__ptn(char, '\\s') and not v.Str.is__ptn(char, '\\w') then
    ret = c.t
  end

  return ret
end

-- char cnd  -  char pair __

function v.Char.is_pair__ptn(c1, c2, ptn)

  local ret = c.f

  if v.Str.is__ptn(c1, ptn) and v.Str.is__ptn(c2, ptn) then
    ret = c.t
  end

  return ret
end

function v.Char.is_pair__quote(c1, c2)

  local ret = c.f

  if     c1 == "'" and c2 == "'" then
    ret = c.t
  elseif c1 == '"' and c2 == '"' then
    ret = c.t
  elseif c1 == '`' and c2 == '`' then
    ret = c.t
  end

  return ret
end

function v.Char.is_pair__bracket(c1, c2)

  local ret = c.f

  if     c1 == '(' and c2 == ')' then
    ret = c.t
  elseif c1 == '{' and c2 == '}' then
    ret = c.t
  elseif c1 == '[' and c2 == ']' then
    ret = c.t
  elseif c1 == '<' and c2 == '>' then
    ret = c.t
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
    rpl = "'"
    -- rpl = '`'

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

function v.Char.is_space(char)

  local ret = c.f

  if char == ' ' or char == '\t' then
    ret = c.t
  end

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

  local num_str = vf.printf('%o', num)
  return num_str
end

-- ar ( list )

v.Ar = {}

-- txt

v.Txt = {}

function v.Txt._to_ar(txt)

  local line_ar  = vf.split(txt, '\\n')
  return line_ar
end

-- do nothing

v.Do = {}

function v.Do.nothing() -- use by tst

  -- print( "do nothing.." )
end

-- fr utl

v.Num = {}

function v.Num.seq(s_num, e_num)

  local tbl = {}
  for num = s_num, e_num do
    v.Tbl.add(tbl, num)
  end
  return tbl
end

