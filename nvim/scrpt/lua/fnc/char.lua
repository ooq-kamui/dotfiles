
v.Char = {}

-- cnst

v.Char.cnst = {}
v.Char.cnst.l_lst = {'l', 'b'}
v.Char.cnst.r_lst = {'r', 'f'}
v.Char.cnst.b_lst = v.Char.cnst.l_lst
v.Char.cnst.f_lst = v.Char.cnst.r_lst

v.Char.cnst.bracket = {}
v.Char.cnst.bracket.lst = {
  {'[', ']'},
  {'(', ')'},
  {'<', '>'},
  {'{', '}'},
}

function v.Char.bracket__init()

  v.Char.cnst.bracket.l_lst = v.Tbl.lst_by_2d_idx(v.Char.cnst.bracket.lst, 1)
  v.Char.cnst.bracket.r_lst = v.Tbl.lst_by_2d_idx(v.Char.cnst.bracket.lst, 2)
end
v.Char.bracket__init()

v.Char.cnst.quote = {}
v.Char.cnst.quote.lst = {"'", '"', '`'}

v.Char.cnst.quote.odr_lst = {
  markdown = {'`', "'", '"'},
  dflt     = {"'", '"', '`'},
}

v.Char.cnst.symbol = {}
v.Char.cnst.symbol.tgl_grp_lst = {
  { '/', '|', [[\]],    },
  { "'", '"', '`',      },
  { '-', '+', '=', '*', },
  { ',', '.',           },
  { ';', ':',           },
  { '?', '!',           },
}

-- ptn

v.Char.ptn = {}
v.Char.ptn.l = 'lb'
v.Char.ptn.r = 'rf'

function v.Char.lr_2_normal_cmd(lr)

  local nml_cmd
  if     v.Char.is__l(lr) then nml_cmd = v.Nml.n.cursor.mv.l
  elseif v.Char.is__r(lr) then nml_cmd = v.Nml.n.cursor.mv.r
  end
  return nml_cmd
end

function v.Char.symbol_tgl(c)

  local rpl = ''

  local idx1, idx2 = v.Tbl.tbl2d_idx(v.Char.cnst.symbol.tgl_grp_lst, c)

  if not idx1 then return rpl end

  local grp_lst = v.Char.cnst.symbol.tgl_grp_lst[idx1]
  idx2 = v.Tbl.idx_inc_loop(grp_lst, idx2)

  rpl = v.Char.cnst.symbol.tgl_grp_lst[idx1][idx2]
  return rpl
end

function v.Char.bracket_l_lst()

  local l_lst = v.Tbl.lst_by_2d_idx(v.Char.cnst.bracket.lst, 1)
  return l_lst
end

function v.Char.bracket_r_lst()

  local r_lst = v.Tbl.lst_by_2d_idx(v.Char.cnst.bracket.lst, 2)
  return r_lst
end

function v.Char.bracket_r(bracket_l)

  local bracket_r

  for idx, bracket_pair in pairs(v.Char.cnst.bracket.lst) do

    if bracket_l == bracket_pair[1] then
      bracket_r = bracket_pair[2]
      break
    end
  end

  return bracket_r
end

function v.Char.bracket_pair_char(c)

  local rpl = ''

  local bracket_l_lst = v.Char.bracket_l_lst()
  local l_idx         = v.Tbl.idx(bracket_l_lst, c)
  local bracket_r_lst = v.Char.bracket_r_lst()
  local r_idx         = v.Tbl.idx(bracket_r_lst, c)

  if     l_idx then
    rpl = bracket_r_lst[l_idx]
  elseif r_idx then
    rpl = bracket_l_lst[r_idx]
  end
  return rpl
end

function v.Char.quote_odr_lst()

  local file_type = v.Buf.file_type()
  local dflt = v.Char.cnst.quote.odr_lst['dflt']
  local quote_odr_lst = v.Tbl.get_by_key(v.Char.cnst.quote.odr_lst, file_type, dflt)
  return quote_odr_lst
end

-- cnd

function v.Char.is__space(char)

  local ret = bl.f

  if char == ' ' or char == '\t' then
    ret = bl.t
  end

  return ret
end

function v.Char.is__mb(char)

  local ret = v.Str.is__ptn(char, v.Ptn.vim.mb_char)
  return ret
end

function v.Char.is__l(lr)

  local ret = bl.f

  if v.Tbl.is__in(v.Char.cnst.l_lst, lr) then
    ret = bl.t
  end

  return ret
end
v.Char.is__b = v.Char.is__l

function v.Char.is__r(lr)

  local ret = bl.f

  if v.Tbl.is__in(v.Char.cnst.r_lst, lr) then
    ret = bl.t
  end

  return ret
end
v.Char.is__f = v.Char.is__r

function v.Char.is__num(char)

  local ret = bl.f

  if v.Str.is__ptn(char, [[\d]]) then
    ret = bl.t
  end

  return ret
end

function v.Char.is__alpha(char)

  local ret = bl.f

  if v.Str.is__ptn(char, [[\a]]) then
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

-- cnd  -  char pair __

function v.Char.is_pair__ptn(c1, c2, ptn_vim)

  local ret = bl.f

  if v.Str.is__ptn(c1, ptn_vim) and v.Str.is__ptn(c2, ptn_vim) then
    ret = bl.t
  end

  return ret
end

function v.Char.is_pair__quote(c1, c2)

  local ret = bl.f

  if c1 == c2 and v.Tbl.is__in(v.Char.cnst.quote.lst, c1) then
    ret = bl.t
  end
  return ret
end

function v.Char.is_pair__bracket(char1, char2)

  local ret = bl.f

  local char1_bracket_idx = v.Tbl.idx(v.Char.cnst.bracket.l_lst, char1)
  local char2_bracket_idx = v.Tbl.idx(v.Char.cnst.bracket.r_lst, char2)

  if char1_bracket_idx and (char1_bracket_idx == char2_bracket_idx) then
    ret = bl.t
  end

  return ret
end

