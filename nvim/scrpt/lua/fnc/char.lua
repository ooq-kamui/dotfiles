
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

  local ret = bl.f

  if v.Str.is__ptn(char, '\\d') then
    ret = bl.t
  end

  return ret
end

function v.Char.is__alpha(char)

  local ret = bl.f

  if v.Str.is__ptn(char, '\\a') then
    ret = bl.t
  end

  return ret
end

function v.Char.is__symbol(char)

  local ret = bl.f

  local symbol_ptn = [[\v[\x00-\x7f]&\W&\S]]

  if v.Str.is__ptn(char, symbol_ptn) then
    ret = bl.t
  end

  return ret
end

-- char cnd  -  char pair __

function v.Char.is_pair__ptn(c1, c2, ptn_vim)

  local ret = bl.f

  if v.Str.is__ptn(c1, ptn_vim) and v.Str.is__ptn(c2, ptn_vim) then
    ret = bl.t
  end

  return ret
end

function v.Char.is_pair__quote(c1, c2)

  local ret = bl.f

  if     c1 == "'" and c2 == "'" then
    ret = bl.t
  elseif c1 == '"' and c2 == '"' then
    ret = bl.t
  elseif c1 == '`' and c2 == '`' then
    ret = bl.t
  end

  return ret
end

function v.Char.is_pair__bracket(c1, c2)

  local ret = bl.f

  if     c1 == '(' and c2 == ')' then
    ret = bl.t
  elseif c1 == '{' and c2 == '}' then
    ret = bl.t
  elseif c1 == '[' and c2 == ']' then
    ret = bl.t
  elseif c1 == '<' and c2 == '>' then
    ret = bl.t
  end

  return ret
end

-- char cnd tgl

function v.Char.is__symbol_tgl(c)

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

  local ret = bl.f

  if char == ' ' or char == '\t' then
    ret = bl.t
  end

  return ret
end

