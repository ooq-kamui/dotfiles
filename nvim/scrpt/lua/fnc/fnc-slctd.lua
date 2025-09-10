
-- slctd

v.Slctd = {}

v.Slctd.rng_dflt = "'<,'>"
-- g.v_rng_dflt = v.Slctd.rng_dflt

-- slctd __ ( slct )

function v.Slctd.__cancel() -- range -- alias

  v.Esc()
end

function v.Slctd.__ltst() -- range
  -- print(vf.mode())

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
      v.Cmd.nml('\\<esc>')
      v.Cmd.nml('v')
    end
  else
    v.Cmd.nml('V')
  end
end

function v.Slctd.mode_state__swtch()

  v.Slctd.__ltst()
  vim.cmd('exe "normal! \\<c-v>"')

  -- if v.Mode.is__box() then
  --   v.Slctd.box_width__1()
  -- else
  --   vim.cmd('exe "normal! \\<c-v>"')
  -- end
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
    v.Cmd.nml('wh')
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

function v.Slctd.cursor__mv_slctd_edge_r() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_cursor_pos__r() then
    return
  end

  v.Cursor.__mv_slctd_edge_tgl()
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

  local ret = false

  v.Slctd.__ltst()

  local cursor_pos1 = v.Cursor.pos()
  -- print( cursor_pos1 )

  v.Cursor.__mv_slctd_edge_tgl()
  local cursor_pos2 = v.Cursor.pos()
  -- print( cursor_pos2 )

  v.Cursor.__mv_slctd_edge_tgl()


  if     cursor_pos1[2] >  cursor_pos2[2] then -- line
    ret = true

  elseif cursor_pos1[2] == cursor_pos2[2] then -- line

    if   cursor_pos1[3] >= cursor_pos2[3] then -- col
      ret = true
    end
  end

  return ret
end

-- slctd str __ ( expnd )

function v.Slctd.str__expnd() -- expnd lr, cre re

end

function v.Slctd.str__expnd_srch() -- range

  v.Slctd.__ltst()
  v.Cursor.__mv_srch('f')
end

function v.Slctd.str__expnd_word_f() -- range

  v.Slctd.__ltst()

  v.Cmd.nml('e')
end

function v.Slctd.str__expnd_space_f() -- range

  v.Slctd.__ltst()

  v.Cmd.nml('wh')
end

-- dev anchor ?
function v.Slctd.str__expnd_f() -- range

  v.Slctd.__ltst()

  if     v.Cursor.is_line_str_side_r__space() then

    v.Cursor.__mv_line_end()

  elseif v.Slctd.is_str_edge_r_out_char__space() then

    v.Slctd.str__expnd_space_f()

  else
    v.Slctd.str__expnd_word_f()
  end
end

function  v.Slctd.is_str_edge_r_out_char__space()

  local ret = false

  local slctd_r_out_char = v.Slctd.str_edge_r_out_char()

  if v.Str.is__ptn(slctd_r_out_char, '\\s') then

    ret = true
  end

  return ret
end

-- slctd __ expnd quote

g.quote_ptn = '[' .. "'" .. '"' .. '`' .. ']'

function v.Slctd.str__expnd_quote_swtch() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_str_edge_char__quote() then
    -- v.Esc()
    return
  end

  if v.Slctd.is_str_edge_out_char__quote() then

    v.Slctd.str__expnd_quote_on()
  else
    v.Slctd.str__expnd_quote_in_swtch()
  end
end

function v.Slctd.str__expnd_quote_on() -- range

  v.Slctd.__ltst()

  v.Slctd.str__expnd_quote_on_f()
  v.Slctd.str__expnd_quote_on_b()
end

function v.Slctd.str__expnd_quote_on_f() -- range

  v.Slctd.__ltst()
  v.Cursor.__mv_srch_ptn(g.quote_ptn, 'f')
end

function v.Slctd.str__expnd_quote_on_b() -- range

  v.Slctd.__ltst()

  v.Cursor.__mv_slctd_edge_tgl()
  v.Cursor.__mv_srch_ptn(g.quote_ptn, 'b')
end

function v.Slctd.str__expnd_quote_in_swtch() -- range

  v.Slctd.__ltst()

  if not v.Cursor.is_line_str__ptn(g.quote_ptn) then
    return
  end

  local c_r = v.Slctd.str_edge_r_out_char()

  if not v.Str.is__ptn(c_r, g.quote_ptn) then

    v.Slctd.str__expnd_quote_in_f()
  else
    v.Slctd.str__expnd_quote_in_b()
  end
end

function v.Slctd.str__expnd_quote_in_f() -- range

  v.Slctd.str__expnd_quote_on_f()
  v.Cmd.nml('h')
end

function v.Slctd.str__expnd_quote_in_b() -- range

  v.Slctd.str__expnd_quote_on_b()
  v.Cmd.nml('l')
end



-- dev anchor vvvvvvvvvvvvvvv

g.char_pair_lst_r = {')', '}'}
g.char_pair_lst_l = {'(', '{'}

g.char_pair_ptn = '[' .. "'" .. '"' .. '`' .. ']'

function v.Slctd.str__expnd_char_pair_swtch() -- range

  v.Slctd.__ltst()

  if v.Slctd.is_str_edge_char__char_pair() then
    -- v.Esc()
    return
  end

  if v.Slctd.is_str_edge_out_char__char_pair() then

    v.Slctd.str__expnd_char_pair_on()
  else
    v.Slctd.str__expnd_char_pair_in_swtch()
  end
end

function v.Slctd.str__expnd_char_pair_on() -- range

  v.Slctd.__ltst()

  v.Slctd.str__expnd_char_pair_on_f()
  v.Slctd.str__expnd_char_pair_on_b()
end

function v.Slctd.str__expnd_char_pair_on_f() -- range

  v.Slctd.__ltst()
  v.Cursor.__mv_srch_ptn(g.char_pair_ptn, 'f')
end

function v.Slctd.str__expnd_char_pair_on_b() -- range

  v.Slctd.__ltst()

  v.Cursor.__mv_slctd_edge_tgl()
  v.Cursor.__mv_srch_ptn(g.char_pair_ptn, 'b')
end

function v.Slctd.str__expnd_char_pair_in_swtch() -- range

  v.Slctd.__ltst()

  if not v.Cursor.is_line_str__ptn(g.char_pair_ptn) then
    return
  end

  local c_r = v.Slctd.str_edge_r_out_char()

  if not v.Str.is__ptn(c_r, g.char_pair_ptn) then

    v.Slctd.str__expnd_char_pair_in_f()
  else
    v.Slctd.str__expnd_char_pair_in_b()
  end
end

function v.Slctd.str__expnd_char_pair_in_f() -- range

  v.Slctd.str__expnd_char_pair_on_f()
  v.Cmd.nml('h')
end

function v.Slctd.str__expnd_char_pair_in_b() -- range

  v.Slctd.str__expnd_char_pair_on_b()
  v.Cmd.nml('l')
end

-- dev anchor ^^^^^^^^^^^^^^^



-- dev anchor, del ????
function v.Slctd.str__expnd_bracket_f() -- range -- todo dev

  -- local bracket_ptn = '[' .. "'" .. '"`)}\\]' .. ']'
  local bracket_ptn = '[' .. "'" .. '"`)}%]' .. ']'
  
  local s_col = v.Slctd.str_edge_l_col()
  
  local line_str_r = v.Slctd.str_edge_r_out_str()
  local srch_idx = v.Str.srch_idx_by_lua(line_str_r, bracket_ptn, 2)

  if not srch_idx then
    v.Cmd.nml('gv')
    return
  end

  local len = s_col + v.Slctd.str_len() + srch_idx - 1
  v.Slctd.str__by_col_len(s_col, len)
end

function v.Slctd.str_r__reduce_dlm(char) -- range

  v.Slctd.__ltst()

  local cmd_nml = 'of' .. char .. 'lo'
  v.Cmd.nml(cmd_nml)
end

function v.Slctd.str_l__reduce_dlm(char) -- range

  v.Slctd.__ltst()

  local slctd_str = v.Slctd.str()
  local srch_idx = v.Str.srch_idx_by_lua(slctd_str, char)

  if not srch_idx then
    v.Slctd.__cancel()
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

-- slctd str __ rpl, srch nxt slctd

function v.Slctd.__rpl_7_srch_nxt() -- dir forward only

  v.Slctd.__ltst()
  v.Cmd.nml('"zd"aPlgn')
end

-- slctd str __ del

-- dev anchor
function v.Slctd.v__del() -- dev doing, can

  v.Slctd.__ltst()

  v.Cmd.nml('"ad')

  v.Rgstr.__('+', v.Rgstr.get('a'))
end

function v.Slctd.__del() -- range

  v.Slctd.__ltst()

  local rgstr = 'z'

  local cmd = '"' .. rgstr .. 'dgv'
  v.Cmd.nml(cmd)
end

-- slctd str __ fil

function v.Slctd.__fil(char) -- range

  local char = char

  if char == '|' then
    char = '\\<bar>'
  end

  v.Slctd.__ltst()

  local cmd_nml = 'r' .. char
  vim.cmd('exe "normal! ' .. cmd_nml .. '"')

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

-- slctd str cnd

function v.Slctd.is_str__srch_str()

  if v.Slctd.str() == v.Rgstr.get('/') then
    return true
  else
    return false
  end
end

function v.Slctd.is_str__line_mlt()

  if v.Str.is__ptn(v.Slctd.str(), '\\n') then
    return true
  else
    return false
  end
end

-- slctd str edge

function v.Slctd.str_edge_l_col()

  v.Cursor.__mv_slctd_edge_l()

  local col = v.Cursor.col_num()
  return col
end

function v.Slctd.str_edge_r_col()

  v.Slctd.cursor__mv_slctd_edge_r()
  
  local col = v.Cursor.col_num()
  return col
end

function v.Slctd.str_edge_l_pos()

  v.Cursor.__mv_slctd_edge_l()
  local pos = v.Cursor.pos()
  return pos
end

function v.Slctd.str_edge_r_pos()

  v.Slctd.cursor__mv_slctd_edge_r()
  local pos = v.Cursor.pos()
  return pos
end

function v.Slctd.str_edge_l_char()

  v.Cursor.__mv_slctd_edge_l()

  local c_char = v.Cursor.c_char()
  return c_char
end

function v.Slctd.str_edge_r_char()

  v.Slctd.cursor__mv_slctd_edge_r()

  local c_char = v.Cursor.c_char()
  return c_char
end

function v.Slctd.str_edge_l_out_char()

  v.Cursor.__mv_slctd_edge_l()

  local l_char = v.Cursor.l_char()
  return l_char
end

function v.Slctd.str_edge_r_out_char()

  v.Slctd.cursor__mv_slctd_edge_r()

  local r_char = v.Cursor.r_char()
  return r_char
end

function v.Slctd.str_edge_l_out_str()

  v.Cursor.__mv_slctd_edge_l()

  local str = v.Cursor.line_str_side_l()
  return str
end

function v.Slctd.str_edge_r_out_str()

  v.Slctd.cursor__mv_slctd_edge_r()

  local str = v.Cursor.line_str_side_r()
  return str
end

-- slctd str edge __ ( edit )

function v.Slctd.str_edge_out__ins(c) -- range

  v.Slctd.__ltst()

  if v.Slctd.is_line__mlt() then
    v.Slctd.__cancel()
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
    v.Slctd.__cancel()
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
  -- print( c_l c_r )

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
  -- print( c_l c_r )

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
  local bracket_lst = {'(', '[', '<', '{' }

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

function v.Slctd.str_edge_out__tgl_shft() -- range

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
  -- print( c_l c_r )

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

-- slctd str edge cnd

function v.Slctd.is_str_edge_char__(ptn)

  local c1 = v.Slctd.str_edge_l_char()
  local c2 = v.Slctd.str_edge_r_char()

  local ret = v.Char.is_pair__(ptn, c1, c2)
  return ret
end

function v.Slctd.is_str_edge_char__quote()

  local ret = v.Slctd.is_str_edge_char__(g.quote_ptn)
  return ret
end

function v.Slctd.is_str_edge_out_char__(ptn)

  local c1 = v.Slctd.str_edge_l_out_char()
  local c2 = v.Slctd.str_edge_r_out_char()

  local ret = v.Char.is_pair__(ptn, c1, c2)
  return ret
end

function v.Slctd.is_str_edge_out_char__quote()

  local ret = v.Slctd.is_str_edge_out_char__(g.quote_ptn)
  return ret
end

function v.Slctd.is_str_edge_l_col__line_top() -- range

  local ret = false

  v.Slctd.__ltst()

  v.Cursor.__mv_slctd_edge_tgl()
  local cursor_l_pos = v.Cursor.pos()
  -- print( cursor_l_pos )

  v.Cursor.__mv_slctd_edge_tgl()

  -- if cursor_l_pos[2] == 1 then -- col
  if cursor_l_pos[3] == 1 then -- col
    ret = true
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
  --print( cmd )
  v.Cmd.cmd(cmd)
end

function v.Slctd.line__rpl_by_line1_line2() -- range

  local srch = v.Line.str_by_line_num(1)
  local rpl  = v.Line.str_by_line_num(2)

  local rng = v.Slctd.rng_dflt
  local cmd = rng .. 's/' .. srch .. '/' .. rpl .. '/eg'
  --print( cmd )
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
  --   v.Esc()
  -- end

  local line_s_num = v.Slctd.line_s_num()
  local line_e_num = v.Slctd.line_e_num()

  v.Cursor.__mv_by_line_num(line_s_num)
  v.Cursor.__mv_line_end()

  v.Mode.__ins()

  vim.api.nvim_create_autocmd('InsertLeave', {
    once = true,
    callback = function()

      local ins_str = v.Rgstr.get('.')

      for line_num = line_s_num + 1, line_e_num do

        v.Cursor.__mv_by_line_num(line_num)
        v.Cursor.line_end__ins(ins_str)
      end
    end
  })
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
  local slctd_line_e_num  = v.Slctd.line_e_num()

  local line_num = slctd_line_e_num - slctd_line_s_num + 1

  -- local exe_num = line_num / per_line_num
  local exe_num = math.floor(line_num / per_line_num)
  --print( exe_num )

  for _idx, idx in pairs(vf.range(1, exe_num)) do

    v.Cmd.nml(cmd_nml)
  end
end

function v.Slctd.line_indnt__space(indnt_col) -- range

  if v.Is_env__('win64') then
    v.Slctd.line_tab__rpl_space(indnt_col)

  else
    local sys_cmd = '  expand   -t ' .. indnt_col
    v.Slctd.line__rpl_sys_cmd(sys_cmd)
  end
end

function v.Slctd.line_indnt__tab(indnt_col) -- range

  if v.Is_env__('win64') then
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

function v.Slctd.line__ins_cmnt_1() -- range

  local slctd_line_s_num = v.Slctd.line_s_num()
  -- v.Log.val(slctd_line_s_num)

  v.Cursor.__mv_by_line_num(slctd_line_s_num)
  v.Cmd.nml('^')

  local col = v.Cursor.col_num()

  for idx, line_num in pairs(v.Slctd.line_num_seq()) do

    v.Line.end__pad_space(line_num, col - 1)

    v.Cursor.__mv_by_line_col(line_num, col)

    v.Cursor.__ins_cmnt_1(nil)
  end
end

-- slctd line __ crct tbl

function v.Slctd.line__crct_tbl() -- range

  local sys_cmd

  if     v.Is_env__('linux') then
    sys_cmd = '/usr/bin/column -t'
  elseif v.Is_env__('mac')   then
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
end

function v.Slctd.is_line__mlt()

  local ret = false

  local slctd_line_s_num = v.Slctd.line_s_num()
  local slctd_line_e_num = v.Slctd.line_e_num()

  if slctd_line_s_num ~= slctd_line_e_num then
    ret = true
  end

  return ret
end

-- slctd box __ mv

function v.Slctd.box__mv(lr) -- range

  v.Slctd.__ltst()

  local cmd_nml = v.Char.lr_2_normal_cmd(lr)
  v.Cmd.nml('o' .. cmd_nml)
  v.Cmd.nml('o' .. cmd_nml)
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
    print( 'yank is include cr' )
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

-- slctd etc

function v.Slctd.srch__swtch() -- srch, set or run

  if v.Slctd.is_str__line_mlt() then

    v.Slctd.str__expnd_srch()
  else
    v.Srch.str__slctd_str()
  end
end

