
v.Slctd = {}

v.Slctd.rng_dflt = "'<,'>"

v.Slctd.str_expnd_char_pair_lst = {
  {'(', ')'},
  {'{', '}'},
  {"'", "'"},
  {'"', '"'},
  {'`', '`'},
}

-- slctd __

function v.Slctd.__clr() -- range -- alias

  v.Cmd.esc()
end

function v.Slctd.__ltst() -- range

  if     v.Mode.is__box() then
    return
  elseif v.Mode.is__str()  then
    return
  elseif v.Mode.is__line() then
    return
  end

  local nml_cmd = 'gv'
  v.Nml.exe(nml_cmd)
end

function v.Slctd.mode__tgl()

  v.Slctd.__ltst()

  if v.Mode.is__box() then
    if v.Slctd.is_line__mlt() then
      v.Nml.exe('V')
    else
      v.Nml.exe([[<esc>]])
      v.Nml.exe('v')
    end
  else
    v.Nml.exe('V')
  end
end

function v.Slctd.mode__box()

  v.Slctd.__ltst()
  v.Nml.exe('<c-v>')
end

-- slctd str

function v.Slctd.str() -- range

  v.Slctd.__ltst()

  v.Nml.exe('"zy')

  v.Slctd.__ltst()

  return v.Rgstr.get('z')
end

function v.Slctd.str_len_char() -- range -- use not

  v.Slctd.__ltst()

  local slctd_str = v.Slctd.str()
  local len_char = v.Str.len_char(slctd_str)
  return len_char
end

-- slctd str __

function v.Slctd.str__all()

  v.Nml.exe('ggVG')
end

function v.Slctd.__cursor_c_char()

  v.Nml.exe('v')
end

function v.Slctd.__cursor_word()

  local c = v.Cursor.c_char()

  if     v.Str.is__ptn(c, v.Ptn.vim.word_char) then
    v.Nml.exe('viw')

  elseif v.Str.is__ptn(c, v.Ptn.vim.space_char) then
    v.Slctd.str__cursor_f_space()

  else
    v.Slctd.__cursor_c_char()
  end
end

function v.Slctd.str__cursor_f_space()

  local c = v.Cursor.c_char()

  if not v.Str.is__ptn(c, v.Ptn.vim.space_char) then
    return
  end

  if v.Cursor.is_line_str_side_r__space() then
    v.Slctd.__cursor_c_char()
    v.Cursor.__mv_line_end_in()

  else
    v.Slctd.__cursor_c_char()

    v.Slctd.str__expnd_space_f()
  end
end

-- slctd __

function v.Slctd.__by_line_byte_idx(s_line, s_byte_idx, e_line, e_byte_idx)

  v.Slctd.__clr()

  s_line = s_line or v.Cursor.line_num()
  e_line = e_line or v.Cursor.line_num()

  v.Cursor.__mv_by_line_byte_idx(s_line, s_byte_idx)
  v.Slctd.__cursor_c_char()
  v.Cursor.__mv_by_line_byte_idx(e_line, e_byte_idx)
end

function v.Slctd.__by_pos(s_pos, e_pos) -- use not

  v.Slctd.__clr()

  v.Cursor.__mv_by_pos(s_pos)
  v.Slctd.__cursor_c_char()
  v.Cursor.__mv_by_pos(e_pos)
end

-- slctd cursor __ mv

function v.Slctd.cursor__mv_edge_tgl() -- range

  v.Slctd.__ltst()

  v.Nml.exe(v.Nml.x.cursor.mv.edge_tgl)
end

function v.Slctd.cursor__mv_edge(drct) -- range

  if     v.Char.is__r(drct) then
    v.Slctd.cursor__mv_edge_r()

  elseif v.Char.is__l(drct) then
    v.Slctd.cursor__mv_edge_l()
  end
end

function v.Slctd.cursor__mv_edge_r() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_cursor__edge_r() then
    return
  end

  v.Slctd.cursor__mv_edge_tgl()
end

function v.Slctd.cursor__mv_edge_l() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_cursor__edge_l() then
    return
  end

  v.Slctd.cursor__mv_edge_tgl()
end

function v.Slctd.cursor__mv_file_edge(nml_cmd)

  v.Slctd.__ltst()

  v.Cursor.__mv_file_edge(nml_cmd)
end

function v.Slctd.cursor__mv_v_jmp(drct) -- range

  v.Slctd.__ltst()
  v.Cursor.__mv_v_jmp(drct)
end

function v.Slctd.cursor__mv_line_end() -- range

  v.Slctd.__ltst()

  if     v.Mode.is__box() then

    if v.Cursor.is_byte_idx__line_end_ovr() then
      return
    end

    v.Cursor.__mv_line_end_in()

  elseif v.Mode.is__str() or v.Mode.is__line() then

    if v.Cursor.is_line_str__emp() then
      return
    end

    v.Cursor.__mv_line_end_in()
  end
end

-- slctd cursor cnd

function v.Slctd.is_cursor__edge_r() -- range

  local ret = bl.f

  v.Slctd.__ltst()

  local cursor_pos1 = v.Cursor.pos()
  -- v.Log.val( cursor_pos1 )

  v.Slctd.cursor__mv_edge_tgl()
  local cursor_pos2 = v.Cursor.pos()
  -- v.Log.val( cursor_pos2 )

  v.Slctd.cursor__mv_edge_tgl()


  if     cursor_pos1[2] >  cursor_pos2[2] then -- line
    ret = bl.t

  elseif cursor_pos1[2] == cursor_pos2[2] then -- line

    if   cursor_pos1[3] >= cursor_pos2[3] then -- byte_idx ( col_num )
      ret = bl.t
    end
  end

  return ret
end

function v.Slctd.is_cursor__edge_l() -- range

  local ret = not v.Slctd.is_cursor__edge_r()
  return ret
end

-- slctd str __

-- slctd str __ expnd

function v.Slctd.str__expnd_f_swtch() -- range

  v.Slctd.__ltst()

  if     v.Cursor.is_line_str_side_r__space() then

    v.Cursor.__mv_line_end()

  elseif v.Slctd.is_str_edge_r_out_char__space() then

    v.Slctd.str__expnd_space_f()

  else
    v.Slctd.str__expnd_word_f()
  end
end

function v.Slctd.str__expnd_word_f() -- range

  v.Slctd.__ltst()
  v.Nml.exe('e')
end

function v.Slctd.str__expnd_space_f() -- range

  v.Slctd.__ltst()

  if v.Cursor.is_byte_idx__line_end_inr() then return end

  v.Nml.exe('wh')
end

function v.Slctd.str__expnd_srch() -- range

  v.Slctd.__ltst()

  v.Cursor.__mv_by_srch_str('f', bl.t)
end

function v.Slctd.str__expnd_ptn_f(ptn_vim) -- range

  v.Slctd.__ltst()
  v.Slctd.cursor__mv_edge_r()
  local ret = v.Cursor.__mv_by_ptn(ptn_vim, 'f')
  return ret
end

function v.Slctd.str__expnd_ptn_b(ptn_vim) -- range

  v.Slctd.__ltst()
  v.Slctd.cursor__mv_edge_l()
  local ret = v.Cursor.__mv_by_ptn(ptn_vim, 'b')
  return ret
end

function v.Slctd.str__expnd_edge_out() -- range
  -- v.Log.val('str__expnd_edge_out')

  v.Slctd.__ltst()

  v.Slctd.cursor__mv_edge_r()
  v.Nml.exe('l')

  -- v.Slctd.cursor__mv_edge_tgl()
  v.Slctd.cursor__mv_edge_l()
  v.Nml.exe('h')

  v.Slctd.cursor__mv_edge_tgl()
end

-- slctd __ expnd char pair lst

function v.Slctd.str_expnd__init()

  v.Slctd.str_expnd_char_pair_lst_l = {}
  v.Slctd.str_expnd_char_pair_lst_r = {}

  for _idx, _pari in pairs(v.Slctd.str_expnd_char_pair_lst) do

    v.Tbl.add(v.Slctd.str_expnd_char_pair_lst_l, _pari[1])
    v.Tbl.add(v.Slctd.str_expnd_char_pair_lst_r, _pari[2])
  end

  v.Slctd.str_expnd_char_ptn_l = '[' .. v.Tbl.join(v.Slctd.str_expnd_char_pair_lst_l) .. ']'
  v.Slctd.str_expnd_char_ptn_r = '[' .. v.Tbl.join(v.Slctd.str_expnd_char_pair_lst_r) .. ']'
end
v.Slctd.str_expnd__init()

function v.Slctd.str__expnd_char_pair() -- range

  v.Slctd.__ltst()

  local char_l_i = v.Slctd.str_edge_l_char()
  local char_l_i_expnd_idx = v.Tbl.idx(v.Slctd.str_expnd_char_pair_lst_l, char_l_i)

  local char_r_i = v.Slctd.str_edge_r_char()
  local char_r_i_expnd_idx = v.Tbl.idx(v.Slctd.str_expnd_char_pair_lst_r, char_r_i)

  local char_l_o = v.Slctd.str_edge_l_out_char()
  local char_l_o_expnd_idx = v.Tbl.idx(v.Slctd.str_expnd_char_pair_lst_l, char_l_o)

  local char_r_o = v.Slctd.str_edge_r_out_char()
  local char_r_o_expnd_idx = v.Tbl.idx(v.Slctd.str_expnd_char_pair_lst_r, char_r_o)

  -- v.Log.val(char_l_i_expnd_idx, char_r_i_expnd_idx)
  -- v.Log.val(char_l_o_expnd_idx, char_r_o_expnd_idx)

  local char, st

  if     char_l_i_expnd_idx == char_r_i_expnd_idx and char_l_i_expnd_idx then
    -- slctd lr completed
    return

  elseif char_l_o_expnd_idx then

    if     char_l_o_expnd_idx == char_r_o_expnd_idx  then

      v.Slctd.str__expnd_edge_out()

    elseif char_l_o_expnd_idx ~= char_r_o_expnd_idx  then

      char = v.Slctd.str_expnd_char_pair_lst_r[char_l_o_expnd_idx]
      v.Slctd.str__expnd_ptn_f(char)
      v.Nml.exe('h')
    end

  elseif ( not char_l_o_expnd_idx ) and char_r_o_expnd_idx then

    v.Slctd.str__expnd_ptn_b(v.Slctd.str_expnd_char_ptn_l)
    v.Nml.exe('l')

  else
    st = v.Slctd.str__expnd_ptn_f(v.Slctd.str_expnd_char_ptn_r)
    if st then
      v.Nml.exe('h')
    end
  end
end

-- slctd str __ reduce

function v.Slctd.str__reduce_dlm_l(char)

  v.Slctd.str__reduce_dlm(char, 'l')
end

function v.Slctd.str__reduce_dlm_r(char)

  v.Slctd.str__reduce_dlm(char, 'r')
end

function v.Slctd.str__reduce_dlm(dlm_char, lr) -- lr: base side

  v.Slctd.__ltst()

  if not v.Slctd.is_str__ptn(dlm_char) then
    return
  end

  local slctd_str = v.Slctd.str()
  local byte_idx_lst1, byte_idx_lst2 = v.Str.word_byte_idx_lst(slctd_str, dlm_char)
  local word_s_idx, word_e_idx

  local s_byte_idx = v.Slctd.str_edge_l_line_byte_idx()
  local e_byte_idx = v.Slctd.str_edge_r_line_byte_idx()

  if     v.Char.is__r(lr) then

    word_s_idx = 1

    if v.Str.l_char(slctd_str) ~= dlm_char then
      word_s_idx = word_s_idx + 1
    end

    s_byte_idx = s_byte_idx + byte_idx_lst1[word_s_idx] - 1

  elseif v.Char.is__l(lr) then

    word_e_idx = v.Tbl.len(byte_idx_lst2)

    if v.Str.r_char(slctd_str) ~= dlm_char then
      word_e_idx = word_e_idx - 1
    end

    e_byte_idx = s_byte_idx + byte_idx_lst2[word_e_idx] - 1
  end

  v.Slctd.__by_line_byte_idx(nil, s_byte_idx, nil, e_byte_idx)
end

-- slctd str __ ( edit )

function v.Slctd.str__ynk() -- range

  v.Slctd.__ltst()
  v.Nml.exe('"zd')
  v.Cursor.__ins_ynk()
end

function v.Slctd.str__clp() -- range

  v.Rgstr.ynk__clp()
  v.Slctd.str__ynk()
end

-- slctd str __ rpl

function v.Slctd.str__rpl(srch, rpl) -- range

  v.Slctd.box__rpl(srch, rpl)
end

-- slctd str __ ( rpl )

function v.Slctd.__srch(drct)

  local nml_cmd = 'g'

  if     v.Char.is__f(drct) then
    nml_cmd = nml_cmd .. 'n'

  elseif v.Char.is__b(drct) then
    nml_cmd = nml_cmd .. 'N'
  end

  v.Nml.exe(nml_cmd)
end

function v.Slctd.__srch_nxt(drct) -- srch rpl skip

  v.Slctd.__ltst()

  v.Slctd.cursor__mv_edge(drct)

  v.Slctd.__clr()

  v.Cursor.__mv_char(drct)
  v.Slctd.__srch(drct)
end

function v.Slctd.__srch_nxt_f()

  v.Slctd.__srch_nxt('f')
end

-- slctd str __ rpl, srch nxt slctd

function v.Slctd.str__ynk__srch_nxt_f()

  v.Slctd.__ltst()

  v.Slctd.str__ynk()
  v.Slctd.__srch('f')
end

-- slctd str __ del

function v.Slctd.__del() -- range

  v.Slctd.__ltst()

  local rgstr = 'z'
  local cmd = '"' .. rgstr .. 'd' .. 'gv'
  v.Nml.exe(cmd)
end

-- slctd str __ fil

function v.Slctd.__fil(char) -- range

  local char = char

  if char == '|' then
    char = [[\<bar>]]
    -- char = '\\<bar>'
  end

  v.Slctd.__ltst()

  local nml_cmd = 'r' .. char
  v.Nml.exe(nml_cmd)
  -- v.Cmd.cmd('exe "normal! ' .. nml_cmd .. '"')

  v.Slctd.__ltst()
end

function v.Slctd.__fil_space() -- range

  v.Slctd.__fil(' ')
end

function v.Slctd.__fil_bar() -- range

  v.Slctd.__fil('|')
end

function v.Slctd.str_space__underscore() -- range

  v.Slctd.str__rpl(' ', '_')
end

-- slctd str edge

function v.Slctd.str_edge_pos()

  v.Slctd.__ltst()

  local s_pos = vf.getpos('v')
  local e_pos = vf.getpos('.') -- mb: ng

  local pos = {}

  pos.s = {}
  pos.s.line_num = s_pos[2]
  pos.s.byte_idx = s_pos[3]

  pos.e = {}
  pos.e.line_num = e_pos[2]
  pos.e.byte_idx = e_pos[3]

  if     pos.s.line_num <  pos.e.line_num then
    pos.l = pos.s
    pos.r = pos.e

  elseif pos.s.line_num == pos.e.line_num then

    if pos.s.byte_idx <= pos.e.byte_idx then
      pos.l = pos.s
      pos.r = pos.e
    else
      pos.l = pos.e
      pos.r = pos.s
    end

  else
    pos.l = pos.e
    pos.r = pos.s
  end

  return pos
end

function v.Slctd.str_edge_x_line_byte_idx(lr)

  local edge_pos = v.Slctd.str_edge_pos()
  local byte_idx = edge_pos[lr].byte_idx
  return byte_idx
end

function v.Slctd.str_edge_l_line_byte_idx()

  local byte_idx = v.Slctd.str_edge_x_line_byte_idx('l')
  return byte_idx
end

function v.Slctd.str_edge_r_line_byte_idx()

  local byte_idx = v.Slctd.str_edge_x_line_byte_idx('r')
  return byte_idx
end

function v.Slctd.str_edge_l_line_char_idx()

  v.Slctd.__ltst()

  local byte_idx = v.Slctd.str_edge_l_line_byte_idx()
  local line_str = v.Cursor.line_str()
  local char_idx = v.Str.char_idx_by_byte_idx(line_str, byte_idx)
  return char_idx
end

function v.Slctd.str_edge_r_line_char_idx()

  v.Slctd.__ltst()

  local byte_idx = v.Slctd.str_edge_r_line_byte_idx()
  local line_str = v.Cursor.line_str()
  local char_idx = v.Str.char_idx_by_byte_idx(line_str, byte_idx)
  return char_idx
end

function v.Slctd.str_edge_l_char()

  v.Slctd.__ltst()

  local char_idx = v.Slctd.str_edge_l_line_char_idx()
  local line_str = v.Cursor.line_str()
  local char = v.Str.char_by_char_idx(line_str, char_idx)
  return char
end

function v.Slctd.str_edge_r_char()

  v.Slctd.__ltst()

  local char_idx = v.Slctd.str_edge_r_line_char_idx()
  local line_str = v.Cursor.line_str()
  local char = v.Str.char_by_char_idx(line_str, char_idx)
  return char
end

function v.Slctd.str_edge_l_out_char()

  v.Slctd.__ltst()

  local char_idx = v.Slctd.str_edge_l_line_char_idx()

  if char_idx == 1 then return '' end 

  char_idx = char_idx - 1

  local line_str = v.Cursor.line_str()
  local char = v.Str.char_by_char_idx(line_str, char_idx)
  return char
end

function v.Slctd.str_edge_r_out_char()

  v.Slctd.__ltst()

  local char_idx = v.Slctd.str_edge_r_line_char_idx()

  local line_str_len_char = v.Cursor.line_str_len_char()

  if char_idx == line_str_len_char then return '' end 

  char_idx = char_idx + 1
  -- v.Log.val(char_idx)

  local line_str = v.Cursor.line_str()
  local char = v.Str.char_by_char_idx(line_str, char_idx)
  return char
end

function v.Slctd.str_edge_l_out_str()

  v.Slctd.__ltst()

  local char_idx = v.Slctd.str_edge_l_line_char_idx()

  if char_idx == 1 then return '' end 

  char_idx = char_idx - 1

  local line_str = v.Cursor.line_str()
  local str = v.Str.sub_by_char_idx(line_str, 1, char_idx)
  return str
end

function v.Slctd.str_edge_r_out_str()

  v.Slctd.__ltst()

  local char_idx = v.Slctd.str_edge_l_line_char_idx()

  local line_str_len_char = v.Cursor.line_str_len_char()

  if char_idx == line_str_len_char then return '' end 

  char_idx = char_idx + 1

  local line_str = v.Cursor.line_str()
  local str = v.Str.sub_by_char_idx(line_str, char_idx, line_str_len_char)
  return str
end

-- slctd str edge __ ( edit )

function v.Slctd.str_edge_out__ins(c) -- range

  v.Slctd.__ltst()

  if v.Slctd.is_line__mlt() then
    v.Slctd.__clr()
    return
  end

  local c_l = c
  local c_r = c

  if     c == '(' then
    c_r = ')'
  elseif c == '{' then
    c_r = '}'
  elseif c == '[' then
    c_r = ']'
  elseif c == '<' then
    c_r = '>'
  end

  v.Nml.exe('"zx')
  v.Cursor.__ins(c_l .. c_r)

  local str_len = v.Str.len(c_l)
  v.Nml.exe(str_len .. 'h')

  v.Nml.exe('"zP')
  v.Nml.exe('gv')

  local cnt = 0
  while cnt < str_len do

    v.Slctd.box__mv('r')

    cnt = cnt + 1
  end
end

function v.Slctd.str_edge_out__ins_space()

  v.Slctd.str_edge_out__ins(" ")
end

function v.Slctd.str_edge_out__ins_markdown_strikethrough()

  v.Slctd.__ltst()

  if v.Slctd.is_line__mlt() then
    v.Slctd.__clr()
    return
  end

  v.Slctd.str_edge_out__ins('~~')
end

function v.Slctd.str_edge_out__ins_markdown_bold()

  v.Slctd.str_edge_out__ins('**')
end

function v.Slctd.str_edge_out_char__tgl_swtch() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_line__mlt() then return end


  local c_l = v.Slctd.str_edge_l_out_char()
  local c_r = v.Slctd.str_edge_r_out_char()

  if v.Tbl.is__in(c_l, {"'", '"', '`'}) and c_l == c_r then
    v.Slctd.str_edge_out_quote__tgl()

  elseif c_l == '(' and c_r == ')' then
    v.Slctd.str_edge_out_bracket__tgl()
  elseif c_l == '{' and c_r == '}' then
    v.Slctd.str_edge_out_bracket__tgl()
  elseif c_l == '[' and c_r == ']' then
    v.Slctd.str_edge_out_bracket__tgl()
  elseif c_l == '<' and c_r == '>' then
    v.Slctd.str_edge_out_bracket__tgl()

  else
    v.Slctd.str_edge_out_quote__tgl()
  end
end

function v.Slctd.str_edge_out_quote__tgl() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_line__mlt()           then return end

  if v.Cursor.is_byte_idx__line_end() then return end

  local c_l = v.Slctd.str_edge_l_out_char()
  local c_r = v.Slctd.str_edge_r_out_char()

  local c_lst

  if v.Buf.is_file_type__('markdown') then
    c_lst = {'`', "'", '"'}
  else
    c_lst = {"'", '"', '`'}
  end

  local c, idx

  if c_l == c_r then
    idx = v.Tbl.idx(c_lst, c_l)
  end

  if idx == nil then

    c = c_lst[1]
    v.Slctd.str_edge_out__ins(c)

  elseif idx == v.Tbl.len(c_lst) then

    v.Slctd.str_edge_out_char__del()

  else
    v.Slctd.str_edge_out_char__del()
    c = c_lst[idx + 1]
    v.Slctd.str_edge_out__ins(c)
  end
end

function v.Slctd.str_edge_out_bracket__tgl() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_line__mlt() then
    return
  end

  if v.Cursor.is_byte_idx__line_end() then
    return
  end

  local c_l = v.Slctd.str_edge_l_out_char()
  local c_r = v.Slctd.str_edge_r_out_char()

  local c
  local bracket_lst = {'[', '(', '<', '{' }

  local idx = v.Tbl.idx(bracket_lst, c_l)

  if idx then
    v.Slctd.str_edge_out_char__del()

    if c_l == v.Tbl.last(bracket_lst) then
      -- nothing
    else
      c = bracket_lst[idx + 1]
      v.Slctd.str_edge_out__ins(c)
    end
  else
    c = bracket_lst[1]
    v.Slctd.str_edge_out__ins(c)
  end
end

function v.Slctd.str_edge_out_char__type_ch() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_line__mlt() then
    return
  end

  if v.Cursor.is_byte_idx__line_end() then
    return
  end

  -- char chk
  local c_l = v.Slctd.str_edge_l_out_char()
  local c_r = v.Slctd.str_edge_r_out_char()
  -- v.Log.val( c_l c_r )

  if     v.Char.is_pair__quote(c_l, c_r) then
    v.Slctd.str_edge_out_char__del()
    v.Slctd.str_edge_out_bracket__tgl()

  elseif v.Char.is_pair__bracket(c_l, c_r) then
    v.Slctd.str_edge_out_char__del()
    v.Slctd.str_edge_out_quote__tgl()

  else
    v.Slctd.str_edge_out_bracket__tgl()
  end
end

function v.Slctd.str_edge_out_char__del() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_str_edge_l__line_top() then return end

  local slctd_str = v.Slctd.str()

  v.Slctd.cursor__mv_edge_l()
  v.Slctd.__del()
  v.Slctd.__clr()

  v.Nml.exe('hxx')

  v.Cursor.__ins__slct(slctd_str)
end

-- slctd str cnd

function v.Slctd.is_str__srch_str_plain()

  local srch_str = v.Srch.str_plain()

  if v.Slctd.str() == srch_str then
    return bl.t
  else
    return bl.f
  end
end

function v.Slctd.is_str__line_mlt()

  if v.Str.is__ptn(v.Slctd.str(), '\\n') then
    return bl.t
  else
    return bl.f
  end
end

function v.Slctd.is_str__ptn(ptn_vim)

  local slctd_str = v.Slctd.str()
  local ret = v.Str.is__ptn(slctd_str, ptn_vim)
  return ret
end

-- slctd str edge cnd

function v.Slctd.is_str_edge_char__(ptn_vim)

  local edge_l_char = v.Slctd.str_edge_l_char()
  local edge_r_char = v.Slctd.str_edge_r_char()

  local ret = v.Char.is_pair__ptn(edge_l_char, edge_r_char, ptn_vim)
  return ret
end

function v.Slctd.is_str_edge_char__quote()

  local ret = v.Slctd.is_str_edge_char__(v.Ptn.vim.quote_char_lst)
  return ret
end

function v.Slctd.is_str_edge_char__pair(char_l, char_r)

  local edge_l_char = v.Slctd.str_edge_l_char()
  local edge_r_char = v.Slctd.str_edge_r_char()

  if ( edge_l_char == char_l ) and ( edge_r_char == char_r ) then
    return bl.t
  else
    return bl.f
  end
end

function v.Slctd.is_str_edge_out_char__(ptn_vim)

  local char_l = v.Slctd.str_edge_l_out_char()
  local char_r = v.Slctd.str_edge_r_out_char()

  local ret = v.Char.is_pair__ptn(char_l, char_r, ptn_vim)
  return ret
end

function v.Slctd.is_str_edge_out_char__quote()

  local ret = v.Slctd.is_str_edge_out_char__(v.Ptn.vim.quote_char_lst)
  return ret
end

function v.Slctd.is_str_edge_out_char__pair(char_l, char_r)

  local edge_l_char = v.Slctd.str_edge_l_out_char()
  local edge_r_char = v.Slctd.str_edge_r_out_char()

  if ( edge_l_char == char_l ) and ( edge_r_char == char_r ) then
    return bl.t
  else
    return bl.f
  end
end

function v.Slctd.is_str_edge_r_out_char__space()

  local ret = bl.f

  local ptn_vim = v.Ptn.vim.space_char
  local slctd_r_out_char = v.Slctd.str_edge_r_out_char()

  if v.Str.is__ptn(slctd_r_out_char, ptn_vim) then
    ret = bl.t
  end

  return ret
end

function v.Slctd.is_str_edge_l__line_top() -- range

  v.Slctd.__ltst()

  local ret = bl.f

  local edge_l_byte_idx   = v.Slctd.str_edge_l_line_byte_idx()

  if edge_l_byte_idx == 1 then
    ret = bl.t
  end

  return ret
end

-- slctd line

function v.Slctd.line_s_num()

  return vim.api.nvim_buf_get_mark(0, '<')[1]
end

function v.Slctd.line_e_num()

  return vim.api.nvim_buf_get_mark(0, '>')[1]
end

function v.Slctd.line_num_seq()

  local line_s_num = v.Slctd.line_s_num()
  local line_e_num = v.Slctd.line_e_num()

  local tbl = v.Num.seq(line_s_num, line_e_num)
  return tbl
end

-- slctd line __ ( edit )

function v.Slctd.line__del() -- use not, todo dev

  v.Nml.exe('gvj')
  --v.Nml.exe('"ad')

  v.Rgstr.clp__ynk()
end

function v.Slctd.line__cursor_line()

  v.Nml.exe('V')
end

function v.Slctd.line__by_line_rng(line_s_num, line_e_num)

  v.Cursor.__mv_by_line_num(line_s_num)
  -- v.Nml.exe('V')
  v.Slctd.line__cursor_line()
  v.Cursor.__mv_by_line_num(line_e_num)
end

-- todo refactoring, fnc name mod, v > slctd

-- slctd line __ rpl

function v.Slctd.line__rpl(srch, rpl) -- range

  local rng = v.Slctd.rng_dflt
  local cmd = rng .. 's/' .. srch .. '/' .. rpl .. '/eg'
  --v.Log.val( cmd )
  v.Cmd.cmd(cmd)
end

function v.Slctd.line__rpl_by_line1_line2() -- range -- use not

  local srch = v.Line.str_by_line_num(1)
  local rpl  = v.Line.str_by_line_num(2)

  local rng = v.Slctd.rng_dflt
  local cmd = rng .. 's/' .. srch .. '/' .. rpl .. '/eg'
  --v.Log.val( cmd )
  v.Cmd.cmd(cmd)
end

function v.Slctd.line__rpl_sys_cmd(sys_cmd) -- range -- read

  local rng = v.Slctd.rng_dflt
  local cmd = rng .. ' ! ' .. sys_cmd
  v.Cmd.cmd(cmd)
end

function v.Slctd.line_srch_str__rpl_cr() -- range

  local srch_str = v.Srch.str_vim()

  local rng = v.Slctd.rng_dflt
  local cmd = rng .. 's/\\(' .. srch_str .. '\\)/\\1\\r/eg'
  v.Cmd.cmd(cmd)
end

function v.Slctd.line__markdown_strikethrough() -- range -- todo dev

end

function v.Slctd.__sys_cmd(sys_cmd) -- range

  local rng = v.Slctd.rng_dflt
  local cmd = rng .. '! ' .. sys_cmd
  v.Cmd.cmd(cmd)
end

function v.Slctd.line_top_space__del()

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do

    v.Line.top_space__del(line_num)
  end
end

function v.Slctd.line_end_space__del() -- range

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do

    v.Line.end_space__del(line_num)
  end
end

function v.Slctd.line_end__ins(str) -- range

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do

    v.Cursor.__mv_by_line_num(line_num)
    v.Cursor.line_end__ins(str)
  end
end

function v.Slctd.line_end__ins_input() -- range

  -- if v.Mode.is__box() then
  --   v.Cmd.esc()
  -- end

  local line_s_num = v.Slctd.line_s_num()
  local line_e_num = v.Slctd.line_e_num()

  v.Cursor.__mv_by_line_num(line_s_num)
  v.Cursor.__mv_line_end()

  vim.api.nvim_create_autocmd('InsertLeave', {
    once = bl.t,
    callback = function()
      local ins_str = v.Rgstr.get('.')

      -- if v.Str.is__emp(ins_str) then
      --   return
      -- end

      for line_num = line_s_num + 1, line_e_num do
        v.Cursor.__mv_by_line_num(line_num)
        v.Cursor.line_end__ins(ins_str)
      end
    end
  })

  v.Mode.__ins()
end

function v.Slctd.line_end__pad_space() -- range -- use not

  -- use recommend "aygvr gv

  v.Slctd.__ltst()
  v.Nml.exe('o')

  local fil_end_byte_idx = v.Cursor.byte_idx() - 1

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do

    v.Line.end__pad_space(line_num, fil_end_byte_idx)
  end
end

function v.Slctd.line__join_per_line(per_line_num) -- range

  local nml_cmd = per_line_num .. 'Jj'

  local slctd_line_s_num = v.Slctd.line_s_num()
  local slctd_line_e_num = v.Slctd.line_e_num()

  local line_num = slctd_line_e_num - slctd_line_s_num + 1

  -- local exe_num = line_num / per_line_num
  local exe_num = math.floor(line_num / per_line_num)
  --v.Log.val( exe_num )

  for _idx, idx in pairs(vf.range(1, exe_num)) do

    v.Nml.exe(nml_cmd)
  end
end

function v.Slctd.line_indnt__space(indnt_byte_idx) -- range

  if v.Env.is__('win64') then
    v.Slctd.line_tab__rpl_space(indnt_byte_idx)

  else
    local sys_cmd = '  expand   -t ' .. indnt_byte_idx
    v.Slctd.line__rpl_sys_cmd(sys_cmd)
  end
end

function v.Slctd.line_indnt__tab(indnt_byte_idx) -- range

  if v.Env.is__('win64') then
    v.Do.nothing()
  else
    local sys_cmd = 'unexpand   -t ' .. indnt_byte_idx
    v.Slctd.line__rpl_sys_cmd(sys_cmd)
  end
end

-- slctd line indnt __ shft

function v.Slctd.line_indnt__shft_l()

  v.Slctd.__ltst()

  local nml_cmd = '<gv'
  v.Nml.exe(nml_cmd)
end

function v.Slctd.line_indnt__shft_r()

  v.Slctd.__ltst()

  local nml_cmd = '>gv'
  v.Nml.exe(nml_cmd)
end

-- slctd line tab

function v.Slctd.line_tab__rpl_space(byte_idx) -- range

  local space_str = v.Str.space(byte_idx)
  local rng = v.Slctd.rng_dflt
  local cmd = rng .. 's/\\t/' .. space_str .. '/eg'
  v.Cmd.cmd(cmd)
end

-- slctd line __ cmnt

function v.Slctd.line__ins_cmnt_1() -- range

  -- v.Slctd.__ltst() -- why ??

  local slctd_line_s_num = v.Slctd.line_s_num()

  v.Cursor.__mv_by_line_num(slctd_line_s_num)

  v.Cursor.__mv_line_top1() -- v.Nml.exe('^')

  local byte_idx = v.Cursor.byte_idx()

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do
    -- v.Log.val(idx)

    v.Line.end__pad_space(line_num, byte_idx - 1)
    v.Cursor.__mv_by_line_byte_idx(line_num, byte_idx)
    v.Cursor.__ins_cmnt_1(nil)
  end
end

function v.Slctd.box_f_str__space_crct_with_fzy() -- use not, dev doing

  local byte_idx = v.Cursor.byte_idx()

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do

    v.Cursor.__mv_by_line_byte_idx(line_num, byte_idx)

    v.Cursor.f_str__space_crct_with_fzy(ref_drct)
  end

  v.Slctd.__ltst()
end

-- slctd line __ crct tbl

function v.Slctd.line__crct_tbl() -- range

  local sys_cmd

  if     v.Env.is__('linux') then
    sys_cmd = '/usr/bin/column -t'
  elseif v.Env.is__('mac')   then
    sys_cmd = 'column -t'
  else
    sys_cmd = 'column -t'
  end

  v.Slctd.line__rpl_sys_cmd(sys_cmd)
end

-- markdown tbl header

function v.Slctd.line__cnv_markdown_tbl_header() -- range -- ??

  v.Slctd.line__rpl('[^|]', '-'  )
  v.Slctd.line__rpl( '|.' , '| ' )
  v.Slctd.line__rpl('.|'  , ' |' )
end

-- slctd line mlt cnv mb to ascii

function v.Slctd.line_mlt_mb__cnv() -- range

  local sys_cmd = 'mb__cnv'
  v.Slctd.line__rpl_sys_cmd(sys_cmd)
end

function v.Slctd.is_line__mlt()

  local ret = bl.f

  local slctd_line_s_num = v.Slctd.line_s_num()
  local slctd_line_e_num = v.Slctd.line_e_num()

  if slctd_line_s_num ~= slctd_line_e_num then
    ret = bl.t
  end

  return ret
end

-- slctd box __ mv

function v.Slctd.box__mv(lr) -- range

  v.Slctd.__ltst()

  if     v.Char.is__l(lr) then
    v.Slctd.cursor__mv_edge_l()

  elseif v.Char.is__r(lr) then
    v.Slctd.cursor__mv_edge_r()
  end

  if v.Char.is__l(lr) and v.Cursor.is_byte_idx__line_top0()    then return end
  if v.Char.is__r(lr) and v.Cursor.is_byte_idx__line_end_inr() then return end

  local nml_cmd = v.Char.lr_2_normal_cmd(lr)
  v.Slctd.cursor__mv_edge_tgl()
  v.Nml.exe(nml_cmd)
  v.Slctd.cursor__mv_edge_tgl()
  v.Nml.exe(nml_cmd)
end

function v.Slctd.box_width__1() -- range

  v.Slctd.__ltst()

  if not v.Mode.is__box() then return end


  v.Slctd.cursor__mv_edge_tgl()
  local byte_idx = v.Cursor.byte_idx()

  v.Slctd.cursor__mv_edge_tgl()
  v.Cursor.__mv_by_byte_idx(byte_idx)
end

function v.Slctd.box_str__mv(lr) -- range

  local nml_cmd = v.Char.lr_2_normal_cmd(lr)

  v.Slctd.__ltst()

  v.Nml.exe('"zx')
  v.Nml.exe(nml_cmd)
  v.Nml.exe('"zP')

  v.Slctd.__ltst()
  v.Slctd.box__mv(lr)
end

-- slctd box __ ( edit )

function v.Slctd.box_edge_l__ins_space()

  v.Slctd.__ltst()

  v.Nml.exe('I ')

  v.Slctd.__ltst()

  -- v.Slctd.box__rpl('^ $', '')
  -- v.Slctd.__ltst()
end

function v.Slctd.box_edge_l__ynk_str() -- range

  if v.Str.is__ptn(v.Rgstr.ynk(), '\\n') then
    v.Log.val( 'yank is include cr' )
    return
  end

  local ruler_idx = v.Cursor.ruler_idx()
  -- v.Log.val(ruler_idx)

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do

    v.Cursor.__mv_by_line_ruler_idx(line_num, ruler_idx)

    if v.Cursor.byte_idx() < ruler_idx then
      -- continue
    else
      v.Cursor.__ins_ynk()
      v.Cursor.__mv_d()
    end
  end
end

-- slctd box __ rpl

function v.Slctd.box__rpl(srch, rpl) -- range

  -- v.Slctd.__ltst()

  local rng = v.Slctd.rng_dflt
  local cmd = rng .. 's/' .. '\\%V' .. srch .. '/' .. rpl .. '/g'
  v.Cmd.cmd(cmd)
end

-- slctd box space __ del

function v.Slctd.box_space__del() -- range

  local srch = ' '
  local rpl  = ''

  v.Slctd.str__rpl(srch, rpl)
end

-- slctd box char __ shft

function v.Slctd.box_edge_r_char__shft_in() -- range

  local rng = v.Slctd.rng_dflt
  local cmd = rng .. 's/' .. '\\%V\\([ ]\\+\\)\\([^ ]\\)' .. '/' .. '\\2\\1' .. '/eg'
  v.Cmd.cmd(cmd)

  v.Slctd.__ltst()
end

function v.Slctd.box_cursor_r_space__crct() -- range

  local byte_idx         = v.Cursor.byte_idx()
  local slctd_line_s_num = v.Slctd.line_s_num()

  v.Cursor.__mv_by_line_byte_idx(slctd_line_s_num, byte_idx)

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do

    v.Cursor.f_space__del()
    v.Cursor.__mv_d()
  end
end

-- slctd srch

function v.Slctd.__srch_swtch() -- srch, set or run

  v.Slctd.__ltst()

  if     v.Mode.is__line() then

    v.Slctd.str__expnd_srch()

  elseif v.Slctd.is_str__srch_str_plain() then
  
    v.Slctd.__srch_nxt_f()

  else
    v.Srch.str_vim__slctd_str()
  end
end

-- trns

function v.Slctd.str_trns()

  v.Sys.trns_by_slctd_str()
end

