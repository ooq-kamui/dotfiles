
v.Slctd = {}

v.Slctd.rng_dflt = "'<,'>"

-- slctd __

function v.Slctd.__clr() -- range -- alias

  v.Cmd.esc()
end

function v.Slctd.__ltst() -- range
  -- v.Log.val(vf.mode())

  if v.Mode.is__box() then
    return
  elseif vf.mode() == 'v' then
    return
  elseif vf.mode() == 'V' then
    return
  end

  v.Cmd.nml('gv')
end

function v.Slctd.mode__tgl()

  v.Slctd.__ltst()

  if v.Mode.is__box() then
    if v.Slctd.is_line__mlt() then
      v.Cmd.nml('V')
    else
      v.Cmd.nml([[\<esc>]])
      -- v.Cmd.nml('\\<esc>')
      v.Cmd.nml('v')
    end
  else
    v.Cmd.nml('V')
  end
end

function v.Slctd.mode_state__swtch()

  v.Slctd.__ltst()
  v.Cmd.nml([[\<c-v>]])
  -- v.Cmd.nml('\\<c-v>')
  -- v.Cmd.cmd('exe "normal! \\<c-v>"')
end

-- slctd str

function v.Slctd.str() -- range

  v.Slctd.__ltst()

  v.Cmd.nml('"zy')

  v.Slctd.__ltst()

  return v.Rgstr.get('z')
end

function v.Slctd.str_len() -- range

  v.Slctd.__ltst()

  local slctd_str = v.Slctd.str()

  local len = v.Str.len(slctd_str)
  return len
end

-- slctd str __

function v.Slctd.str__all()

  v.Cmd.nml('ggVG')
end

function v.Slctd.str__cursor_c_char()

  v.Cmd.nml('v')
end

function v.Slctd.str__word()

  local c = v.Cursor.c_char()

  if     v.Str.is__ptn(c, '\\w') then
    v.Cmd.nml('viw')

  elseif v.Str.is__ptn(c, '\\s') then
    v.Slctd.str__cursor_f_space()

  else
    -- v.Cmd.nml('v')
    v.Slctd.str__cursor_c_char()
  end
end

function v.Slctd.str__cursor_f_space()

  local c = v.Cursor.c_char()

  if not v.Str.is__ptn(c, '\\s') then
    return
  end

  if v.Cursor.is_line_str_side_r__space() then
    -- v.Cmd.nml('v')
    v.Slctd.str__cursor_c_char()
    v.Cursor.__mv_line_end_in()

  else
    -- v.Cmd.nml('v')
    v.Slctd.str__cursor_c_char()

    v.Slctd.str__expnd_space_f()
    -- v.Cmd.nml('wh')
  end
end

function v.Slctd.str__by_col_len(s_col, len)

  local e_col = len - 1

  v.Slctd.__by_line_col(nil, s_col, nil, e_col)
end

-- slctd __

function v.Slctd.__by_pos(s_pos, e_pos) -- use not

  v.Cursor.__mv_by_pos(s_pos)
  -- v.Cmd.nml('v')
  v.Slctd.str__cursor_c_char()
  v.Cursor.__mv_by_pos(e_pos)
end

function v.Slctd.__by_line_col(s_line, s_col, e_line, e_col)

  s_line = (s_line == nil) and v.Cursor.line_num() or s_line
  e_line = (e_line == nil) and v.Cursor.line_num() or e_line

  v.Cursor.__mv_by_line_col(s_line, s_col)
  v.Slctd.str__cursor_c_char()
  v.Cursor.__mv_by_line_col(e_line, e_col)
end

-- slctd cursor __ mv

function v.Slctd.cursor__mv_edge_tgl() -- range

  v.Slctd.__ltst()
  v.Cmd.nml('o')
end

function v.Slctd.cursor__mv_edge(drct) -- range

  if     drct == 'f' then
    v.Slctd.cursor__mv_edge_r()

  elseif drct == 'b' then
    v.Slctd.cursor__mv_edge_l()
  end
end

function v.Slctd.cursor__mv_edge_r() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_cursor_pos__r() then
    return
  end

  v.Slctd.cursor__mv_edge_tgl()
end

function v.Slctd.cursor__mv_edge_l() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_cursor_pos__l() then
    return
  end

  v.Slctd.cursor__mv_edge_tgl()
end

function v.Slctd.cursor__mv_file_edge(cmd_nml)

  v.Slctd.__ltst()

  v.Cursor.__mv_file_edge(cmd_nml)
end

function v.Slctd.cursor__mv_v_jmp(drct) -- range

  v.Slctd.__ltst()
  v.Cursor.__mv_v_jmp(drct)
end

function v.Slctd.cursor__mv_line_end() -- range

  v.Slctd.__ltst()

  if     v.Mode.is__box() then

    if v.Cursor.is_col__line_end_ovr() then
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

function v.Slctd.is_cursor_pos__r() -- range

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

    if   cursor_pos1[3] >= cursor_pos2[3] then -- col
      ret = bl.t
    end
  end

  return ret
end

function v.Slctd.is_cursor_pos__l() -- range

  local ret = not v.Slctd.is_cursor_pos__r()
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
  v.Cmd.nml('e')
end

function v.Slctd.str__expnd_space_f() -- range

  v.Slctd.__ltst()

  if v.Cursor.is_col__line_end_inr() then return end

  v.Cmd.nml('wh')
end

function v.Slctd.str__expnd_srch() -- range

  v.Slctd.__ltst()

  v.Cursor.__mv_by_srch_str('f', bl.t)
end

function v.Slctd.str__expnd_ptn_f(ptn) -- range

  v.Slctd.__ltst()
  v.Slctd.cursor__mv_edge_r()
  v.Cursor.__mv_by_ptn(ptn, 'f')
end

function v.Slctd.str__expnd_ptn_b(ptn) -- range

  v.Slctd.__ltst()
  v.Slctd.cursor__mv_edge_l()
  v.Cursor.__mv_by_ptn(ptn, 'b')
end

function v.Slctd.str__expnd_edge_out() -- range
  -- v.Log.val('str__expnd_edge_out')

  v.Slctd.__ltst()

  v.Slctd.cursor__mv_edge_r()
  v.Cmd.nml('l')

  -- v.Slctd.cursor__mv_edge_tgl()
  v.Slctd.cursor__mv_edge_l()
  v.Cmd.nml('h')

  v.Slctd.cursor__mv_edge_tgl()
end

-- slctd __ expnd char pair lst

v.Slctd.str_expnd_char_pair_lst = {
  {'(', ')'},
  {'{', '}'},
  {"'", "'"},
  {'"', '"'},
  {'`', '`'},
}

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

  local char

  if     char_l_i_expnd_idx == char_r_i_expnd_idx and char_l_i_expnd_idx then
    -- slctd lr completed
    return

  elseif char_l_o_expnd_idx then

    if     char_l_o_expnd_idx == char_r_o_expnd_idx  then

      v.Slctd.str__expnd_edge_out()

    elseif char_l_o_expnd_idx ~= char_r_o_expnd_idx  then

      char = v.Slctd.str_expnd_char_pair_lst_r[char_l_o_expnd_idx]
      v.Slctd.str__expnd_ptn_f(char)
      v.Cmd.nml('h')
    end

  elseif ( not char_l_o_expnd_idx ) and char_r_o_expnd_idx then

    v.Slctd.str__expnd_ptn_b(v.Slctd.str_expnd_char_ptn_l)
    v.Cmd.nml('l')

  else
    v.Slctd.str__expnd_ptn_f(v.Slctd.str_expnd_char_ptn_r)
    v.Cmd.nml('h')
  end
end

-- slctd str __ reduce

function v.Slctd.str__reduce_dlm_r(char) -- range

  v.Slctd.__ltst()

  local cmd_nml = 'of' .. char .. 'lo'
  v.Cmd.nml(cmd_nml)
end

function v.Slctd.str__reduce_dlm_l(char) -- range

  v.Slctd.__ltst()

  local slctd_str = v.Slctd.str()
  local srch_idx = v.Str.srch_idx_by_lua(slctd_str, char)

  if not srch_idx then
    v.Slctd.__clr()
    return
  end

  local cmd_nml = 'F' .. char .. 'h'
  v.Cmd.nml(cmd_nml)
end

-- slctd str __ ( edit )

function v.Slctd.str__ynk() -- range

  v.Slctd.__ltst()
  v.Cmd.nml('"zd')
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

function v.Slctd.str__(str) -- range -- todo dev

end

function v.Slctd.__srch(drct)

  local cmd_nml = 'g'

  if     drct == 'f' then
    cmd_nml = cmd_nml .. 'n'

  elseif drct == 'b' then
    cmd_nml = cmd_nml .. 'N'
  end

  v.Cmd.nml(cmd_nml)
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

  local cmd = '"' .. rgstr .. 'dgv'
  v.Cmd.nml(cmd)
end

function v.Slctd.v__del() -- dev doing, can

  v.Slctd.__ltst()

  v.Cmd.nml('"ad')

  v.Rgstr.__('+', v.Rgstr.get('a'))
end

-- slctd str __ fil

function v.Slctd.__fil(char) -- range

  local char = char

  if char == '|' then
    char = [[\<bar>]]
    -- char = '\\<bar>'
  end

  v.Slctd.__ltst()

  local cmd_nml = 'r' .. char
  v.Cmd.nml(cmd_nml)
  -- v.Cmd.cmd('exe "normal! ' .. cmd_nml .. '"')

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

function v.Slctd.str_edge_l_col()

  v.Slctd.cursor__mv_edge_l()

  local col = v.Cursor.col_num()
  return col
end

function v.Slctd.str_edge_r_col()

  v.Slctd.cursor__mv_edge_r()
  
  local col = v.Cursor.col_num()
  return col
end

function v.Slctd.str_edge_l_pos()

  v.Slctd.cursor__mv_edge_l()
  local pos = v.Cursor.pos()
  return pos
end

function v.Slctd.str_edge_r_pos()

  v.Slctd.cursor__mv_edge_r()
  local pos = v.Cursor.pos()
  return pos
end

function v.Slctd.str_edge_l_char()

  v.Slctd.cursor__mv_edge_l()

  local c_char = v.Cursor.c_char()
  return c_char
end

function v.Slctd.str_edge_r_char()

  v.Slctd.cursor__mv_edge_r()

  local c_char = v.Cursor.c_char()
  return c_char
end

function v.Slctd.str_edge_l_out_char()

  v.Slctd.cursor__mv_edge_l()

  local l_char = v.Cursor.l_char()
  return l_char
end

function v.Slctd.str_edge_r_out_char()

  v.Slctd.cursor__mv_edge_r()

  local r_char = v.Cursor.r_char()
  return r_char
end

function v.Slctd.str_edge_l_out_str()

  v.Slctd.cursor__mv_edge_l()

  local str = v.Cursor.line_str_side_l()
  return str
end

function v.Slctd.str_edge_r_out_str()

  v.Slctd.cursor__mv_edge_r()

  local str = v.Cursor.line_str_side_r()
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

  v.Cmd.nml('"zx')
  v.Cursor.__ins(c_l .. c_r)

  local str_len = v.Str.len(c_l)
  v.Cmd.nml(str_len .. 'h')

  v.Cmd.nml('"zP')
  v.Cmd.nml('gv')

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

function v.Slctd.str_edge_out_char__tgl() -- range

  v.Slctd.str_edge_out_char__tgl_swtch()
end

function v.Slctd.str_edge_out_char__tgl_swtch() -- range

  -- char chk
  local c_l = v.Slctd.str_edge_l_out_char()
  local c_r = v.Slctd.str_edge_r_out_char()
  -- v.Log.val( c_l c_r )

  if     c_l == "'" and c_l == c_r then
    v.Slctd.str_edge_out_quote__tgl()
  elseif c_l == '"' and c_l == c_r then
    v.Slctd.str_edge_out_quote__tgl()
  elseif c_l == '`' and c_l == c_r then
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

  if v.Slctd.is_line__mlt() then
    return
  end

  if v.Cursor.is_col__line_end() then
    return
  end

  -- char chk
  local c_l = v.Slctd.str_edge_l_out_char()
  local c_r = v.Slctd.str_edge_r_out_char()
  -- v.Log.val( c_l c_r )

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

  if v.Cursor.is_col__line_end() then
    return
  end

  -- char chk
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

  if v.Cursor.is_col__line_end() then
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

  if v.Slctd.is_str_edge_l_col__line_top() then
    return
  end

  v.Cmd.nml('"zx')
  v.Cmd.nml('xhx')
  v.Cmd.nml('"zP')
  v.Cmd.nml('gv')
  v.Slctd.box__mv('l')
end

-- slctd str cnd

function v.Slctd.is_str__srch_str()

  local srch_str = v.Rgstr.get('/')
  -- v.Log.log(srch_str)
  srch_str = v.Str.__rpl_by_lua(srch_str, [[\<]], '')
  srch_str = v.Str.__rpl_by_lua(srch_str, [[\>]], '')
  -- v.Log.log(srch_str)

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

function  v.Slctd.is_str_edge_r_out_char__space()

  local ret = bl.f

  local slctd_r_out_char = v.Slctd.str_edge_r_out_char()

  if v.Str.is__ptn(slctd_r_out_char, '\\s') then

    ret = bl.t
  end

  return ret
end

-- slctd str edge cnd

function v.Slctd.is_str_edge_char__(ptn)

  local edge_l_char = v.Slctd.str_edge_l_char()
  local edge_r_char = v.Slctd.str_edge_r_char()

  local ret = v.Char.is_pair__ptn(edge_l_char, edge_r_char, ptn)
  return ret
end

function v.Slctd.is_str_edge_char__quote()

  local ret = v.Slctd.is_str_edge_char__(v.Srch.ptn.quote)
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

function v.Slctd.is_str_edge_out_char__(ptn)

  local char_l = v.Slctd.str_edge_l_out_char()
  local char_r = v.Slctd.str_edge_r_out_char()

  local ret = v.Char.is_pair__ptn(char_l, char_r, ptn)
  return ret
end

function v.Slctd.is_str_edge_out_char__quote()

  local ret = v.Slctd.is_str_edge_out_char__(v.Srch.ptn.quote)
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

function v.Slctd.is_str_edge_l_col__line_top() -- range

  local ret = bl.f

  v.Slctd.__ltst()

  v.Slctd.cursor__mv_edge_tgl()
  local cursor_l_pos = v.Cursor.pos()
  -- v.Log.val( cursor_l_pos )

  v.Slctd.cursor__mv_edge_tgl()

  -- if cursor_l_pos[2] == 1 then -- col
  if cursor_l_pos[3] == 1 then -- col
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

  v.Cmd.nml('gvj')
  --v.Cmd.nml('"ad')

  v.Rgstr.clp__ynk()
end

function v.Slctd.line__cursor_line()

  v.Cmd.nml('V')
end

function v.Slctd.line__by_line_rng(line_s_num, line_e_num)

  v.Cursor.__mv_by_line_num(line_s_num)
  -- v.Cmd.nml('V')
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

function v.Slctd.line__rpl_by_line1_line2() -- range

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

  local srch = v.Rgstr.get('/')

  local rng = v.Slctd.rng_dflt
  local cmd = rng .. 's/\\(' .. srch .. '\\)/\\1\\r/eg'
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

  -- dev anchor
  -- refactoring, line num seq ?
  local rng = v.Slctd.rng_dflt
  local rpl_cmd = rng .. 's/' .. g.line_top_space_ptn .. '//eg'
  v.Cmd.cmd(rpl_cmd)
end

function v.Slctd.line_end_space__del() -- range

  -- v.Slctd.__ltst()

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
  v.Cmd.nml('o')

  local fil_end_col = v.Cursor.col_num() - 1

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do

    v.Line.end__pad_space(line_num, fil_end_col)
  end
end

function v.Slctd.line__join_per_line(per_line_num) -- range

  local cmd_nml = per_line_num .. 'Jj'

  local slctd_line_s_num = v.Slctd.line_s_num()
  local slctd_line_e_num = v.Slctd.line_e_num()

  local line_num = slctd_line_e_num - slctd_line_s_num + 1

  -- local exe_num = line_num / per_line_num
  local exe_num = math.floor(line_num / per_line_num)
  --v.Log.val( exe_num )

  for _idx, idx in pairs(vf.range(1, exe_num)) do

    v.Cmd.nml(cmd_nml)
  end
end

function v.Slctd.line_indnt__space(indnt_col) -- range

  if v.Env.is__('win64') then
    v.Slctd.line_tab__rpl_space(indnt_col)

  else
    local sys_cmd = '  expand   -t ' .. indnt_col
    v.Slctd.line__rpl_sys_cmd(sys_cmd)
  end
end

function v.Slctd.line_indnt__tab(indnt_col) -- range

  if v.Env.is__('win64') then
    v.Do.nothing()
  else
    local sys_cmd = 'unexpand   -t ' .. indnt_col
    v.Slctd.line__rpl_sys_cmd(sys_cmd)
  end
end

-- slctd line indnt __ shft

function v.Slctd.line_indnt__shft_l()

  v.Slctd.__ltst()

  local cmd_nml = '<gv'
  v.Cmd.nml(cmd_nml)
end

function v.Slctd.line_indnt__shft_r()

  v.Slctd.__ltst()

  local cmd_nml = '>gv'
  v.Cmd.nml(cmd_nml)
end

-- slctd line tab

function v.Slctd.line_tab__rpl_space(space_col) -- range

  local space_str = v.Str_space(space_col)
  local rng = v.Slctd.rng_dflt
  local cmd = rng .. 's/\\t/' .. space_str .. '/eg'
  v.Cmd.cmd(cmd)
end

-- slctd line __ cmnt

-- dev anchor
function v.Slctd.line__ins_cmnt_1() -- range

  -- dev anchor
  -- v.Slctd.__ltst() -- ??

  local slctd_line_s_num = v.Slctd.line_s_num()
  -- v.Log.val(slctd_line_s_num)

  v.Cursor.__mv_by_line_num(slctd_line_s_num)
  v.Cmd.nml('^')

  local col_num = v.Cursor.col_num()

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do
    -- v.Log.val(line_num)

    v.Line.end__pad_space(line_num, col_num - 1)

    v.Cursor.__mv_by_line_col(line_num, col_num)

    v.Cursor.__ins_cmnt_1(nil)
  end
end

-- dev anchor
function v.Slctd.box_f_str__space_crct_with_fzy()

  local col_num = v.Cursor.col_num()

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do

    v.Cursor.__mv_by_line_col(line_num, col_num)

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

-- slctd line mb

function v.Slctd.line_mb__cnv() -- range

  local sys_cmd = 'mb__cnv'
  v.Slctd.line__rpl_sys_cmd(sys_cmd)

  -- dev anchor
  -- local str = v.Slctd.str()
  -- str = v.Mb.str__cnv(str)
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

  -- dev anchor
  if     lr == 'l' then
    v.Slctd.cursor__mv_edge_l()
  elseif lr == 'r' then
    v.Slctd.cursor__mv_edge_r()
  end

  if lr == 'l' and v.Cursor.is_col__line_top0()    then return end
  if lr == 'r' and v.Cursor.is_col__line_end_inr() then return end

  local cmd_nml = v.Char.lr_2_normal_cmd(lr)
  v.Slctd.cursor__mv_edge_tgl()
  v.Cmd.nml(cmd_nml)
  v.Slctd.cursor__mv_edge_tgl()
  v.Cmd.nml(cmd_nml)
end

function v.Slctd.box_width__1() -- range

  v.Slctd.__ltst()

  if not v.Mode.is__box() then
    return
  end

  v.Cmd.nml('o')
  local col_num = v.Cursor.col_num()

  v.Cmd.nml('o')
  v.Cursor.__mv_by_col_num(col_num)
end

function v.Slctd.box_str__mv(lr) -- range

  local cmd_nml = v.Char.lr_2_normal_cmd(lr)

  v.Slctd.__ltst()

  v.Cmd.nml('"zx')
  v.Cmd.nml(cmd_nml)
  v.Cmd.nml('"zP')

  v.Slctd.__ltst()
  v.Slctd.box__mv(lr)
end

-- slctd box __ ( edit )

function v.Slctd.box_edge_l__ins_space()

  v.Slctd.__ltst()

  v.Cmd.nml('I ')

  v.Slctd.__ltst()

  -- v.Slctd.box__rpl('^ $', '')
  -- v.Slctd.__ltst()
end

function v.Slctd.box_edge_l__ynk_line_1() -- range

  if v.Str.is__ptn(v.Rgstr.get('a'), '\\n') then
    v.Log.val( 'yank is include cr' )
    return
  end

  -- local col_num   = v.Cursor.col_num()
  local ruler_num = v.Cursor.ruler_num()

  -- v.Log.val(col_num)

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do

    -- v.Cursor.__mv_by_line_col(line_num, col_num)
    v.Cursor.__mv_by_line_ruler(line_num, ruler_num)

    if v.Cursor.col_num() < ruler_num then
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

  local col              = v.Cursor.col_num()
  local slctd_line_s_num = v.Slctd.line_s_num()

  v.Cursor.__mv_by_line_col(slctd_line_s_num, col)

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

  elseif v.Slctd.is_str__srch_str() then
  
    v.Slctd.__srch_nxt_f()

  else
    v.Srch.str__slctd_str()
  end
end

