
-- cursor

v.Cursor = {}

v.Cursor.cnst = {}

-- cursor pos

function v.Cursor.pos() -- alias

  local pos = vf.getpos('.')
  return pos
end

-- cursor byte_idx ( col )

function v.Cursor.byte_idx_with_vim(key)

  local byte_idx = vf.col(key)
  return byte_idx
end

function v.Cursor.byte_idx() -- byte ( mb:3, start 1 )

  return v.Cursor.c_byte_idx()
end

function v.Cursor.c_byte_idx()

  local byte_idx = v.Cursor.byte_idx_with_vim('.')
  return byte_idx
end

function v.Cursor.l_byte_idx()

  local c_byte_idx = v.Cursor.c_byte_idx()
  local l_byte_idx = c_byte_idx - 1
  return l_byte_idx
end

function v.Cursor.ruler_idx()

  local str = v.Cursor.line_str_side_l()

  local ruler_idx = v.Str.len_ruler(str) + 1
  return ruler_idx
end

-- cursor col cnd

function v.Cursor.is_byte_idx__line_end()

  if v.Cursor.byte_idx() == v.Cursor.line_end_byte_idx() then
    return bl.t
  else
    return bl.f
  end
end

function v.Cursor.is_byte_idx__line_end_inr()

  if v.Cursor.byte_idx() == v.Cursor.line_end_byte_idx() - 1 then

    return bl.t
  else
    return bl.f
  end
end

function v.Cursor.is_byte_idx__line_end_ovr() -- range

  if v.Cursor.byte_idx() >= v.Cursor.line_end_byte_idx() then
    return bl.t
  else
    return bl.f
  end
end

function v.Cursor.is_byte_idx__line_top0()

  if v.Cursor.byte_idx() == 1 then
    return bl.t
  else
    return bl.f
  end
end

function v.Cursor.is_byte_idx__line_top1()

  local c_byte_idx = v.Cursor.byte_idx()

  local top1_byte_idx = v.Cursor.line_top1_byte_idx()

  if c_byte_idx == top1_byte_idx then
    return bl.t
  else
    return bl.f
  end
end

-- cursor __ mv

function v.Cursor.__mv_by_byte_idx(byte_idx)

  if not v.Str.is__num(byte_idx) then return end

  local line_num = v.Cursor.line_num()

  v.Cursor.__mv_by_line_byte_idx(line_num, byte_idx)
end

function v.Cursor.__mv_by_ruler_idx(ruler_idx)

  if not v.Str.is__num(ruler_idx) then return end

  local line_num = v.Cursor.line_num()

  v.Cursor.__mv_by_line_ruler_idx(line_num, ruler_idx)
end

function v.Cursor.__mv_by_line_num(line_num)

  if v.Var.is__emp(line_num) then
    return
  end

  if v.Var.is__str(line_num) then
    if not v.Str.is__num(line_num) then
      return
    else
      line_num = v.Str.to_num(line_num)
    end
  end

  local win_id = 0 -- crnt
  local cursor = vim.api.nvim_win_get_cursor(win_id)
  local cursor_byte_idx = cursor[2]
  vim.api.nvim_win_set_cursor(win_id, {line_num, cursor_byte_idx})

  -- v.Nml.exe(line_num .. 'G')
end

function v.Cursor.__mv_by_line_byte_idx(line_num, byte_idx)

  line_num = line_num or v.Cursor.line_num()

  local tmp = vim.o.virtualedit
  vim.o.virtualedit = "all"

  vf.cursor(line_num, byte_idx)

  vim.o.virtualedit = tmp
end

function v.Cursor.__mv_by_jmplst_line_info_lst(jmplst_line_info_lst)

  local line_num = v.Line.num_by_jmplst_line_info(jmplst_line_info_lst)
  v.Cursor.__mv_by_line_num(line_num)
end

function v.Cursor.__mv_by_pos(pos)

  vf.setpos('.', pos)
end

function v.Cursor.__mv_line_top0()

  local top0_byte_idx = 1
  v.Cursor.__mv_by_byte_idx(top0_byte_idx)
end

function v.Cursor.__mv_line_top1()

  local top1_byte_idx = v.Cursor.line_top1_byte_idx()
  v.Cursor.__mv_by_byte_idx(top1_byte_idx)
end

function v.Cursor.__mv_line_end()

  if v.Cursor.is_line_str__emp() then
    return
  end

  v.Nml.exe(v.Nml.n.cursor.mv.line_end)

  if v.Mode.is__normal() then
    v.Cursor.__mv_char_f()
  end
end

function v.Cursor.__mv_line_end_in()

  v.Nml.exe(v.Nml.n.cursor.mv.line_end)

  if not v.Mode.is__normal() then
    v.Cursor.__mv_char_b()
  end
end

function v.Cursor.__mv_char(drct)

  local nml_cmd

  if     v.Char.is__f(drct) then
    nml_cmd = v.Nml.n.cursor.mv.f
  elseif v.Char.is__b(drct) then
    nml_cmd = v.Nml.n.cursor.mv.b
  end

  v.Nml.exe(nml_cmd)
end

function v.Cursor.__mv_char_f()

  v.Cursor.__mv_char('f')
end

function v.Cursor.__mv_char_b()

  v.Cursor.__mv_char('b')
end

function v.Cursor.__mv_word_f()

  local drct = 'd'
  local line_crnt_num, line_nxt_num

  if     v.Cursor.is_byte_idx__line_end_inr() then

    v.Cursor.__mv_char_f()
    return

  elseif v.Cursor.is_byte_idx__line_end() then

    line_crnt_num = v.Cursor.line_num()
    line_nxt_num  = line_crnt_num + 1

    if v.Line.is_str__emp(line_crnt_num) and v.Line.is_str__emp(line_nxt_num) then
      v.Cursor.__mv_line_emp_mlt_edge(drct)
    else
      v.Cursor.__mv_char_f()
    end
    return

  elseif v.Cursor.is_line_str_side_r__space() then

    v.Cursor.__mv_line_end()
    return
  end

  local c_char = v.Cursor.c_char()
  local r_char = v.Cursor.r_char()

  if v.Str.is__ptn(c_char, ' ') and v.Str.is__ptn(r_char, ' ') then
    v.Nml.exe(v.Nml.n.cursor.mv.f_word_s)
  else
    v.Nml.exe(v.Nml.n.cursor.mv.f_word_e) -- e
    v.Cursor.__mv_char_f()                -- l
  end
end

function v.Cursor.__mv_word_b()

  local l_char = v.Cursor.l_char()
  -- v.Log.log(l_char)

  if     v.Cursor.is_byte_idx__line_top0() then
    v.Cursor.__mv_u_line_end()

  elseif v.Cursor.is_line_str_side_l__space() then
    v.Cursor.__mv_line_top0()

  elseif v.Cursor.is_byte_idx__line_top1() then
    v.Cursor.__mv_line_top0()

  elseif v.Char.is__symbol(l_char) then
    v.Cursor.__mv_char_b()

  else
    v.Nml.exe(v.Nml.n.cursor.mv.b_word_s)
  end
end

function v.Cursor.__mv_word_dlm_f()

  local ptn_vim  = v.Ptn.vim.word_dlm_02_char
  local line_num = v.Cursor.line_num()
  local opt      = 'zW' -- z: srch start line top, W: file end stop
  local st = v.Srch.srch(ptn_vim, opt, line_num)

  if not st then
    v.Cursor.__mv_line_end()
  end
end

function v.Cursor.__mv_space_not_f()

  v.Nml.exe(v.Nml.n.cursor.mv.f_space_not_e)
end

function v.Cursor.__mv_var_f()

  local st = v.Cursor.__mv_by_ptn(v.Ptn.vim.var.str, 'f', bl.t, bl.t)
end

function v.Cursor.__mv_var_b()

  local st = v.Cursor.__mv_by_ptn(v.Ptn.vim.var.str, 'b', bl.f, bl.t)
end

function v.Cursor.__mv_fnc_name() -- use off

  local st = v.Cursor.__mv_by_ptn('(', 'f')

  if st then
    v.Cursor.__mv_word_b()
  end
end

function v.Cursor.__mv_u() -- alias

  v.Nml.exe(v.Nml.n.cursor.mv.u) -- k
end

function v.Cursor.__mv_d() -- alias

  v.Nml.exe(v.Nml.n.cursor.mv.d) -- j
end

function v.Cursor.__mv_v(drct)

  if     drct == 'u' then
    v.Cursor.__mv_u()

  elseif drct == 'd' then
    v.Cursor.__mv_d()
  else
    v.Cursor.__mv_d()
  end
end

v.Cursor.cnst.mv_line_step_dflt = 10

function v.Cursor.__mv_line_mlt(drct) -- alias

  local nml_cmd

  if     drct == 'u' then
    nml_cmd = '<c-y>'

  elseif drct == 'd' then
    nml_cmd = '<c-e>'
  end

  local num = v.Cursor.cnst.mv_line_step_dflt
  local nml_cmd = num .. nml_cmd
  v.Nml.exe(nml_cmd)
end

function v.Cursor.__mv_line_mlt_u()

  v.Cursor.__mv_line_mlt('u')
end

function v.Cursor.__mv_line_mlt_d()

  v.Cursor.__mv_line_mlt('d')
end

function v.Cursor.__mv_u_line_end()

  v.Cursor.__mv_u()
  v.Cursor.__mv_line_end()
end

function v.Cursor.__mv_line_top_or_new_line()

  if     v.Cursor.is_byte_idx__line_top0() then

    v.Cursor.__ins_line_emp()

  elseif v.Cursor.is_byte_idx__line_top1() then

    v.Cursor.__mv_line_top0()
  else
    v.Cursor.__mv_line_top1()
  end
end

function v.Cursor.__mv_file_edge(nml_cmd)

  if v.Cursor.is_line_num__file_edge() then
    v.Nml.exe(nml_cmd)
  end

  local cnt = 1
  local cnt_max = 50000

  while ( not v.Cursor.is_line_num__file_edge() and cnt < cnt_max ) do

    v.Nml.exe(nml_cmd)
    cnt = cnt + 1
  end

  if not v.Cursor.is_line_num__file_edge() then
    if     nml_cmd == 'k' then
      v.Nml.exe(v.Nml.n.cursor.mv.file_top) -- gg
    elseif nml_cmd == 'j' then
      v.Nml.exe(v.Nml.n.cursor.mv.file_end) -- G
    end
  end
end

function v.Cursor.__mv_file_edge_bgn() -- alias

  v.Cursor.__mv_file_edge('k')
end

function v.Cursor.__mv_file_edge_end() -- alias

  v.Cursor.__mv_file_edge('j')
end

function v.Cursor.__mv_v_jmp_to_char(drct_cmd_nml, is_space_stop)

  if not v.Tbl.is__in({'k', 'j'}, drct_cmd_nml) then
    return
  end

  v.Nml.exe(drct_cmd_nml)
  local cnt = 1
  local cnt_max = 10000

  while ( not v.Cursor.is_line_num__file_edge() and cnt < cnt_max ) do

    if not ( v.Cursor.is_c_char__space() or v.Cursor.is_byte_idx__line_end() ) then
      break -- stop
    end

    if is_space_stop and v.Cursor.is_c_char__space() then
      break -- stop
    end

    v.Nml.exe(drct_cmd_nml)
    cnt = cnt + 1
  end
end

function v.Cursor.__mv_v_jmp_u_also_space() -- alias

  v.Cursor.__mv_v_jmp_to_char('k', bl.t)
end

function v.Cursor.__mv_v_jmp_d_also_space() -- alias

  v.Cursor.__mv_v_jmp_to_char('j', bl.t)
end

function v.Cursor.__mv_v_jmp_to_space(drct_cmd_nml)

  if not v.Tbl.is__in({'k', 'j'}, drct_cmd_nml) then
    return
  end

  v.Nml.exe(drct_cmd_nml)

  local cnt = 1
  local cnt_max = 10000

  while ( not v.Cursor.is_line_num__file_edge() and cnt < cnt_max ) do

    if v.Cursor.is_c_char__space() or v.Cursor.is_byte_idx__line_end() then
      break
    end

    v.Nml.exe(drct_cmd_nml)
    cnt = cnt + 1
  end
end

function v.Cursor.__mv_v_jmp_u()

  v.Cursor.__mv_v_jmp('k')
end

function v.Cursor.__mv_v_jmp_d()

  v.Cursor.__mv_v_jmp('j')
end

function v.Cursor.__mv_v_jmp(drct_cmd_nml)

  if not v.Tbl.is__in({'k', 'j'}, drct_cmd_nml) then
    return
  end

  v.Nml.exe(drct_cmd_nml)

  local is_c_char__space = v.Cursor.is_c_char__space()
  local is_byte_idx__line_end = v.Cursor.is_byte_idx__line_end()

  if is_c_char__space or is_byte_idx__line_end then

    v.Cursor.__mv_v_jmp_to_char(drct_cmd_nml)
  else
    v.Cursor.__mv_v_jmp_to_space(drct_cmd_nml)
  end
end

function v.Cursor.__mv_by_ptn(ptn_vim, drct, end_flg, line_only_flg) -- range, on 1 line

  local opt_drct = ''

  if     v.Char.is__f(drct) then
    opt_drct = ''
  elseif v.Char.is__b(drct) then
    opt_drct = 'b'
  end

  local opt = 'W' .. opt_drct

  if end_flg then
    opt = opt .. 'e'
  end

  local line_num = line_only_flg and v.Cursor.line_num() or nil

  -- v.Log.log(ptn_vim, opt, line_num)
  local ret = v.Srch.srch(ptn_vim, opt, line_num)
  return ret
end

function v.Cursor.__mv_srch_str(drct, end_flg)

  local opt = ''

  if     v.Char.is__f(drct) then
    opt = opt .. ''
  elseif v.Char.is__b(drct) then
    opt = opt .. 'b'
  end

  if end_flg then
    opt = opt .. 'e'
  end

  local ptn_vim = v.Srch.str_vim()
  v.Srch.srch(ptn_vim, opt)
end

function v.Cursor.__mv_bracket_out() -- use off

  local block_type_bracket_list = { -- todo use
    'javascript',
    'java',
  }

  local nml_cmd = '[{'
  v.Nml.exe(nml_cmd)
end

function v.Cursor.__mv_fnc_out()

  local nml_cmd = '[m'
  v.Nml.exe(nml_cmd)
end

function v.Cursor.__mv_by_line_ruler_idx(line_num, ruler_idx)

  v.Cursor.__mv_by_line_num(line_num)

  local nml_cmd = ruler_idx .. '|'
  v.Nml.exe(nml_cmd)
end

function v.Cursor.__mv_line_u_word_byte_idx()

  local ref_drct = 'u'
  v.Cursor.__mv_line_x_word_byte_idx(ref_drct)
end

function v.Cursor.__mv_line_d_word_byte_idx()

  local ref_drct = 'd'
  v.Cursor.__mv_line_x_word_byte_idx(ref_drct)
end

function v.Cursor.__mv_line_x_word_byte_idx(ref_drct)

  local ref_line_num    = v.Cursor.line_num(ref_drct)
  local cursor_byte_idx = v.Cursor.byte_idx()
  local word_byte_idx   = v.Line.word_byte_idx(ref_line_num, cursor_byte_idx)

  if not word_byte_idx then return end

  v.Cursor.__mv_by_byte_idx(word_byte_idx)
end

function v.Cursor.__mv_line_emp_mlt_edge(drct)

  drct = drct or 'd'

  local line_nxt_num, is_line_nxt_str__emp

  repeat
    line_nxt_num = v.Cursor.line_num(drct)
    is_line_nxt_str__emp = v.Line.is_str__emp(line_nxt_num)
    if is_line_nxt_str__emp then
      v.Cursor.__mv_v(drct)
    end
  until (not is_line_nxt_str__emp) or v.Cursor.is_line_num__file_edge_end()
end

function v.Cursor.__mv_by_win_id(win_id)

  vim.api.nvim_set_current_win(win_id)
end

-- cursor __ ins

function v.Cursor.__ins(str)

  v.Nml.ins(str)
  v.Cursor.__mv_char_f()
end

function v.Cursor.__ins__slct(str)

  v.Cursor.__ins(str)
  v.Nml.exe(v.Nml.n.cursor.mv.edit_ltst_top) -- `[
  v.Nml.exe(v.Nml.n.mode.v_str)              -- v
  v.Nml.exe(v.Nml.n.cursor.mv.edit_ltst_end) -- `]
  v.Nml.exe(v.Nml.n.cursor.mv.b)             -- h
end

-- cursor __ ins ynk ( paste )

function v.Cursor.__ins_ynk()

  v.Nml.exe(v.Nml.n.rgstr.main .. v.Nml.n.edit.paste.pre)
end

function v.Cursor.__ins_ynk_box()

  v.Nml.exe(v.Nml.n.rgstr.name_no .. v.Nml.n.edit.paste.pre)
end

function v.Cursor.__ins_clp()

  v.Rgstr.ynk__clp()
  v.Cursor.__ins_ynk()
end

function v.Cursor.__ins_mlt(str, num)

  if num == 0 then return end

  local nml_cmd = num .. 'i' .. str
  v.Nml.exe(nml_cmd)
end

function v.Cursor.__ins_cr()

  local line_num = v.Cursor.line_num()

  local nml_cmd = 'i<cr>'
  v.Nml.exe(nml_cmd)

  v.Line.end_space__del(line_num)
end

function v.Cursor.__ins_space(is_cursor_anchor)

  v.Cursor.__ins(' ')

  if is_cursor_anchor then
    v.Cursor.__mv_char_b()
  end
end

function v.Cursor.__ins_hyphen()

  v.Cursor.__ins('-')
end

function v.Cursor.__ins_tilde() -- use off

  v.Cursor.__ins('~')
end

function v.Cursor.__ins_slash() -- use off

  v.Cursor.__ins('/')
end

function v.Cursor.__ins_slashback() -- use off

  v.Cursor.__ins([[\]])
end

function v.Cursor.__ins_quote()

  v.Cursor.__ins("' '")
  v.Cursor.__mv_char_b()
end

function v.Cursor.__ins_da()

  local str = v.Date.da()
  v.Cursor.__ins(str)
end

function v.Cursor.__ins_tm()

  local str = v.Date.tm()
  v.Cursor.__ins(str)
end

function v.Cursor.__ins_dt()

  local str = v.Date.dt()
  v.Cursor.__ins(str)
end

function v.Cursor.__ins_ts()

  local str = v.Date.ts()
  v.Cursor.__ins(str)
end

function v.Cursor.__ins_week()

  local str = v.Date.week()
  v.Cursor.__ins(str)
end

-- cmnt

function v.Cursor.__ins_cmnt_1(cmd_cursor__mv_line_top)

  if cmd_cursor__mv_line_top then
    v.Nml.exe(cmd_cursor__mv_line_top)
  end

  local str = v.Str.cmnt.line_1()
  v.Nml.ins(str)

  v.Cursor.__mv_line_top1()
end

function v.Cursor.__ins_rgstr_by_rgstr_info(rgstr_info)

  local rgstr_key = v.Rgstr.info_rgstr(rgstr_info)
  local rgstr     = v.Nml.n.rgstr.key.rgstr .. rgstr_key
  v.Nml.exe(rgstr .. v.Nml.n.edit.paste.pre)
end

function v.Cursor.__ins_cmnt_mlt() -- call when mode normal

  v.Cursor.__ins_cmnt_mlt_by_pos_key('end')
  v.Cursor.__ins_cmnt_mlt_by_pos_key('bgn')
end

function v.Cursor.__ins_cmnt_mlt_by_pos_key(pos_key)

  local str_ar = v.Str.cmnt.line_mlt()

  if     pos_key == 'bgn' then
    v.Cursor.__ins_line_emp()
    -- v.Nml.exe(v.Nml.n.mode.ins_line_pre) -- O
    v.Nml.ins(str_ar[1]) -- v.Nml.exe('i' .. str_ar[1])

  elseif pos_key == 'end' then
    v.Nml.exe(v.Nml.n.mode.ins_line_flw) -- o
    v.Nml.ins(str_ar[2]) -- v.Nml.exe('i' .. str_ar[2])
  end
end

-- markdown

function v.Cursor.__ins_markdown_heading()

  local md_head_str = '#'

  local top0_char = v.Cursor.line_top0_char()

  if top0_char ~= md_head_str then
    md_head_str = md_head_str .. ' '
  end

  v.Cursor.line_top0__ins(md_head_str)

  if md_head_str == '# ' then return end

  local ptn_vim = v.Ptn.vim.markdown_heading
  local end_flg = bl.t
  v.Cursor.__mv_by_ptn(ptn_vim, 'f', end_flg)
  v.Cursor.__mv_char_f()
end

function v.Cursor.__ins_markdown_cr()

  v.Cursor.__ins('  ')
end

function v.Cursor.__ins_markdown_itm()

  if v.Cursor.is_line__markdown_itm() then
    return
  end

  local byte_idx = v.Cursor.line_indnt__crct()

  local str = '- '
  v.Cursor.line_top1__ins(str)
end

-- cnd line  markdown

function v.Cursor.is_line__markdown_itm()

  local ptn_vim  = v.Ptn.vim.markdown_itm
  local str      = v.Cursor.line_str()
  local byte_idx = v.Str.srch_byte_idx_by_ptn_vim(str, ptn_vim)

  if not byte_idx then
    return bl.f
  else
    return bl.t
  end
end

function v.Cursor.__ins_markdown_code()

  local str = '```'
  v.Cursor.__ins_line(str)
end

function v.Cursor.markdown_itm_chk__tgl()

  if v.Cursor.l_char() ~= '[' or v.Cursor.r_char() ~= ']' then
    return
  end

  local cursor_char = v.Cursor.c_char()

  local rpl_char

  if cursor_char == ' ' then
    rpl_char = 'x'
  else
    rpl_char = ' '
  end

  v.Cursor.char__rpl(rpl_char)
end

-- cursor char

function v.Cursor.c_char_idx() -- 1 start

  local c_char_idx = vf.charcol('.')
  return c_char_idx
end

function v.Cursor.c_char()

  local line_str   = v.Cursor.line_str()
  local c_char_idx = v.Cursor.c_char_idx()

  local c_char = v.Str.char_by_char_idx(line_str, c_char_idx, c_char_idx)
  return c_char
end

function v.Cursor.l_char()

  local line_str = v.Cursor.line_str()
  local c_char_idx = v.Cursor.c_char_idx()

  if c_char_idx <= 1 then
    return ''
  end

  local l_char_idx = c_char_idx - 1
  local l_char = v.Str.char_by_char_idx(line_str, l_char_idx, l_char_idx)
  return l_char
end

function v.Cursor.r_char()

  local byte_idx = v.Cursor.byte_idx() + 1
  local line_str = v.Cursor.line_str()
  local char = v.Str.sub_by_byte_idx(line_str, byte_idx, byte_idx)

  return char
end

function v.Cursor.u_char()

  if v.Cursor.is_line_num__file_edge_bgn() then
    return ''
  end

  local idx = v.Cursor.byte_idx()
  local line_num = v.Cursor.line_num() - 1

  local c = v.Str.sub_by_byte_idx(v.Line.str_by_line_num(line_num), idx, idx)
  return c
end

function v.Cursor.d_char()

  if v.Cursor.is_line_num__file_edge_end() then
    return ''
  end

  local idx = v.Cursor.byte_idx()
  local line_num = v.Cursor.line_num() + 1
  local c = v.Str.sub_by_byte_idx(v.Line.str_by_line_num(line_num), idx, idx)
  return c
end

-- cursor char __

function v.Cursor.char__rpl(rpl_char)

  if v.Str.is__ptn(rpl_char, [[\\]]) then
    rpl_char = v.Str.__rpl_with_vim(rpl_char, [[\\]], [[\\\\]])
  end

  v.Nml.exe(v.Nml.n.edit.char.rpl .. rpl_char)
end

function v.Cursor.char__rpl_underscore() -- alias

  -- todo, case: line end

  v.Cursor.char__rpl('_')
  v.Cursor__mv_char_f()
  -- v.Cursor.__mv_char_forward() -- todo, fnc cre
end

function v.Cursor.c_char__tgl_case()

  v.Nml.exe(v.Nml.n.edit.char.case_tgl) -- v~

  -- refactoring : cmd nml not
  -- local rpl_char = xxx
  -- v.Cursor.char__rpl(rpl_char) -- refactoring
end

function v.Cursor.c_char__tgl_swtch01()

  local c_char = v.Cursor.c_char()
  local rpl_char

  if     v.Char.is__num(c_char) then

    v.Cursor.str__icl()
    return

  elseif v.Char.is__alpha(c_char) then

    v.Cursor.c_char__tgl_case()
    return
  end

  rpl_char = v.Char.bracket_pair_char(c_char)
  if not v.Str.is__emp(rpl_char) then
    v.Cursor.char__rpl(rpl_char)
    return
  end

  rpl_char = v.Char.symbol_tgl(c_char)
  if not v.Str.is__emp(rpl_char) then

    v.Cursor.char__rpl(rpl_char)
    return
  end
end

function v.Char.__tgl_swtch02()

  local c_char = v.Cursor.c_char()

  if v.Char.is__num(c_char) then

    v.Cursor.str__dcl()
    return

  else
    v.Cursor.char__tgl_type_shift(c_char)
    return
  end
end

function v.Cursor.char__tgl_type_shift(c)

  local rpl = ''

  if     c == "'" then
    rpl = '"'
  elseif c == '"' then
    rpl = '`'
  elseif c == '`' then
    rpl = "'"

  elseif c == "(" then
    rpl = '['
  elseif c == "[" then
    rpl = '{'
  elseif c == "{" then
    rpl = '<'
  elseif c == "<" then
    rpl = '('

  elseif c == ")" then
    rpl = ']'
  elseif c == "]" then
    rpl = '}'
  elseif c == "}" then
    rpl = '>'
  elseif c == ">" then
    rpl = ')'
  end

  if not v.Str.is__emp(rpl) then

    v.Cursor.char__rpl(rpl)
    return
  end
end

function v.Cursor.c_char__del()

  v.Nml.exe(v.Nml.n.rgstr.nul  .. v.Nml.n.edit.char.del) -- "zx
end

function v.Cursor.c_char__del_ynk()

  v.Nml.exe(v.Nml.n.rgstr.main .. v.Nml.n.edit.char.del) -- "ax
end

-- cursor char cnd

function v.Cursor.is_c_char__ptn(ptn_vim)

  local ret = bl.f

  local c = v.Cursor.c_char()

  if v.Str.is__ptn(c, ptn_vim) then
    ret = bl.t
  end

  return ret
end

function v.Cursor.is_c_char__space()

  local ret = v.Cursor.is_c_char__ptn(v.Ptn.vim.space_char)
  return ret
end

function v.Cursor.is_c_char__alph()

  local ret = v.Cursor.is_c_char__ptn(v.Ptn.vim.alph_char_set)
  return ret
end

-- cursor str

-- cursor str __

function v.Cursor.str__icl()

  v.Nml.exe(v.Nml.n.edit.word.icl)
end

function v.Cursor.str__dcl()

  v.Nml.exe(v.Nml.n.edit.word.dcl)
end

function v.Cursor.str_week__icl()

  local week_str = v.Cursor.word()
  local week_idx = v.Tbl.idx(v.Date.week_def, week_str)

  if not week_idx then return end

  local week_nxt_idx = v.Idx.__icl(week_idx, v.Tbl.len(v.Date.week_def))
  local week_nxt_str = v.Date.week_def[week_nxt_idx]

  v.Slctd.__cursor_word()
  v.Nml.exe(v.Nml.n.rgstr.nul .. v.Nml.n.edit.del) -- "zd

  v.Cursor.__ins(week_nxt_str)
end

function v.Cursor.str_week__dcl()

  local week_str = v.Cursor.word()
  local week_idx = v.Tbl.idx(v.Date.week_def, week_str)

  if not week_idx then return end

  local week_nxt_idx = v.Idx.__dcl(week_idx, v.Tbl.len(v.Date.week_def))
  local week_nxt_str = v.Date.week_def[week_nxt_idx]

  v.Slctd.__cursor_word()
  v.Nml.exe(v.Nml.n.rgstr.nul  .. v.Nml.n.edit.del) -- "zd

  v.Cursor.__ins(week_nxt_str)
end

-- cursor etc

function v.Cursor.word()

  local word = vf.expand('<cword>')
  return word
end

function v.Cursor.filepath()

  local str

  if     v.Env.is__('mac') then

    str = vf.expand('<cfile>')

  elseif v.Env.is__('win64') then

    str = v.Cursor.line_str()

  elseif v.Env.is__('win32unix') then

    str = v.Cursor.line_str()

  else
    str = v.Cursor.line_str()
  end

  str = v.Str.trim(str)

  return str
end

-- cursor __ ins line

function v.Cursor.__ins_line(str)

  str = str or ''

  local line_num = v.Cursor.line_num() - 1
  vf.append(line_num, str)
  v.Cursor.__mv_u()
end

function v.Cursor.__ins_line_emp()

  local str = ''
  v.Cursor.__ins_line(str)
end

function v.Cursor.__ins_line_buf_file_path()

  local path = v.Buf.file_path()
  v.Cursor.__ins_line(path)
end

function v.Cursor.__ins_line_anchor(str)

  str  = v.Str.cmnt.line_1() .. str
  v.Cursor.__ins_line(str)
  v.Cursor.line_indnt__crct()
end

function v.Cursor.__ins_line_anchor_dev()

  v.Cursor.__ins_line_anchor('dev anchor')
end

function v.Cursor.__ins_line_anchor_srch_start()

  v.Cursor.__ins_line_anchor('srch start' .. ' ' .. vf.strftime('%H:%M'))
end

function v.Cursor.__ins_line_anchor__del() -- use not

  v.Cursor.__ins_line_anchor('')
  v.Cursor.line__del()
end

function v.Cursor.d__ins_line(str)

  local line_num = v.Cursor.line_num()
  vf.append(line_num, str)
end

function v.Cursor.d__ins_line_space() -- range

  local space_len = v.Cursor.byte_idx() - 1
  local space_str = v.Str.space(space_len)
  v.Cursor.d__ins_line(space_str)
end

-- cursor line

function v.Cursor.line_num(ref_drct) -- alias

  local line_num = vf.line('.')

  if     ref_drct == 'u' then
    line_num = line_num - 1
  elseif ref_drct == 'd' then
    line_num = line_num + 1
  end

  return line_num
end

function v.Cursor.line_end_byte_idx() -- alias

  local byte_idx = v.Cursor.byte_idx_with_vim('$')
  return byte_idx
end

-- cursor line str

function v.Cursor.line_str()

  return vf.getline('.')
end

function v.Cursor.line_str_len_byte()

  local line_str = v.Cursor.line_str()
  local len_byte = v.Str.len_byte(line_str)
  return len_byte
end

function v.Cursor.line_str_len_char()

  local line_str = v.Cursor.line_str()
  local len_char_idx = v.Str.len_char(line_str)
  return len_char
end

function v.Cursor.line_str_len_ruler()

  local line_str = v.Cursor.line_str()
  local len_ruler = v.Str.len_ruler(line_str)
  return len_ruler
end

function v.Cursor.line_str_side_l()

  local line_l = v.Str.sub_by_byte_idx(v.Cursor.line_str(),                       1, v.Cursor.byte_idx() - 1)
  return line_l
end

function v.Cursor.line_str_side_r(c_char_flg)

  local line_str   = v.Cursor.line_str()
  local c_byte_idx = v.Cursor.byte_idx()

  local line_r

  if not c_char_flg then
    line_r = v.Str.sub_by_byte_idx(line_str, c_byte_idx + 1)
  else
    line_r = v.Str.sub_by_byte_idx(line_str, c_byte_idx    )
  end

  return line_r
end

function v.Cursor.line_str_side_r_with_c()

  return v.Cursor.line_str_side_r(bl.t)
end

-- cursor line str __

function v.Cursor.line_char_by_char_idx(char_idx)

  local line_str = v.Cursor.line_str()
  local char     = v.Str.char_by_char_idx(line_str, char_idx)
  return char
end

function v.Cursor.line_top0_char()

  local char = v.Cursor.line_char_by_char_idx(1)
  return char
end

function v.Cursor.line_top1_char()

  local top1_byte_idx = v.Cursor.line_top1_byte_idx()
  local char = v.Cursor.line_char_by_char_idx(top1_byte_idx)
  return char
end

function v.Cursor.line_top1_byte_idx()

  local line_num = v.Cursor.line_num()
  local byte_idx = vf.indent(line_num) + 1

  if v.Cursor.is_line__markdown_itm() then
    byte_idx = byte_idx + 2
  end

  return byte_idx
end

function v.Cursor.line_top0__ins(str)

  v.Cursor.__mv_line_top0()
  v.Cursor.__ins(str)
end

function v.Cursor.line_top1__ins(str)

  v.Cursor.__mv_line_top1()
  v.Cursor.__ins(str)
end

function v.Cursor.line_end__ins(str)

  local line_num = v.Cursor.line_num()
  v.Line.end__ins(line_num, str)
end

function v.Cursor.line_end_dots__care()

  local line_str = v.Cursor.line_str()
  local is_line_dots__exist = v.Str.is__ptn(line_str, v.Str.dots.ptn_vim)

  if not is_line_dots__exist then
    v.Cursor.line_end__ins_dots()
  else
    v.Cursor.line_end_dots__adjst()
  end
end

function v.Cursor.line_end__ins_dots()

  local line_str_len_ruler = v.Cursor.line_str_len_ruler()

  local space_len_byte = v.Str.dots.plt_ruler_idx - line_str_len_ruler
  if space_len_byte < 0 then
    space_len_byte = 0
  end

  local space_str = v.Str.space(space_len_byte)
  local line_str  = v.Cursor.line_str()
  line_str = line_str .. space_str .. v.Str.dots.str
  v.Cursor.line__(line_str)
end

function v.Cursor.line_end_dots__adjst()

  local line_str = v.Cursor.line_str()
  local end_flg = bl.t
  local byte_idx = v.Str.srch_byte_idx_by_ptn_vim(line_str, v.Str.dots.ptn_vim, 1, end_flg)

  local status_str = v.Str.sub_by_byte_idx(line_str, byte_idx + 1)

  v.Cursor.line_end_dots__del()
  v.Cursor.line_end__ins_dots()
  v.Cursor.line_end__ins(status_str)
end

function v.Cursor.line_end_dots__del()

  local line_str = v.Cursor.line_str()
  local ptn_vim  = v.Ptn.vim.space_str .. v.Str.dots.ptn_vim
  local byte_idx = v.Str.srch_byte_idx_by_ptn_vim(line_str, ptn_vim)

  local set_line_str = v.Str.sub_by_byte_idx(line_str, 1, byte_idx - 1)
  v.Cursor.line__(set_line_str)
end

-- cursor f

function v.Cursor.f_space__del()

  local c = v.Cursor.c_char()

  if v.Str.is__ptn(c, v.Ptn.vim.space_char) then
    v.Slctd.str__cursor_f_space()
    v.Nml.exe(v.Nml.n.rgstr.nul .. v.Nml.n.edit.del) -- "zd
  else
    v.Do.nothing()
  end
end

-- cursor __ ins line

function v.Cursor.line__(line_str)

  local line_num = v.Cursor.line_num()
  v.Line.__by_line_num(line_num, line_str)
end

function v.Cursor.line__del()

  if v.Cursor.is_line_str__emp() or v.Cursor.is_line_str__space() then
    v.Nml.exe(v.Nml.n.rgstr.nul2 .. v.Nml.n.edit.line.del) -- "_dd
  else
    v.Nml.exe(v.Nml.n.rgstr.main .. v.Nml.n.edit.line.del) -- "add
    v.Rgstr.clp__ynk()
  end
end

-- cursor f

-- cursor f char

function v.Cursor.f_char()

  local char
  local str = v.Cursor.line_str_side_r_with_c()
  str  = v.Str.trim(str)
  char = v.Str.l_char(str)
  return char
end

function v.Cursor.f_char_byte_idx()

  local f_char_byte_idx

  local ptn_vim = v.Ptn.vim.space_not_char

  local cursor_byte_idx = v.Cursor.byte_idx()
  local str = v.Cursor.line_str()
  f_char_byte_idx = v.Str.srch_byte_idx_by_ptn_vim(str, ptn_vim, cursor_byte_idx)
  return f_char_byte_idx
end

function v.Cursor.f_char_ruler_idx()

  local f_char_byte_idx = v.Cursor.f_char_byte_idx()
  local line_num = v.Cursor.line_num()
  local ruler_idx = v.Line.ruler_idx_by_byte_idx(line_num, f_char_byte_idx)
  return ruler_idx
end

-- cursor f str

function v.Cursor.f_str__del()

  if v.Cursor.is_byte_idx__line_end() then
    return
  end

  local nml_cmd = 'D'
  v.Nml.exe(nml_cmd)
end

function v.Cursor.f_str__space_crct_with_fzy(ref_drct)

  if v.Cursor.is_byte_idx__line_end() then return end


  local word_ruler_idx = v.Cursor.f_str__space_crct_with_word(ref_drct)

  if word_ruler_idx then return end

  local char_byte_idx = v.Cursor.f_str__space_crct_with_char(ref_drct) -- run case exist ?
end

function v.Cursor.f_str__space_crct_with_word(ref_drct)

  local line_num                = v.Cursor.line_num(ref_drct)
  local cursor_f_char_ruler_idx = v.Cursor.f_char_ruler_idx()
  local word_ruler_idx = v.Line.word_ruler_idx(line_num, cursor_f_char_ruler_idx + 1)

  if not word_ruler_idx then return word_ruler_idx end

  v.Cursor.f_str__space_crct_by_ruler_idx(word_ruler_idx)

  return word_ruler_idx
end

function v.Cursor.f_str__space_crct_with_char(ref_drct)

  local line_num               = v.Cursor.line_num(ref_drct)
  local char                   = v.Cursor.f_char()
  local cursor_f_char_byte_idx = v.Cursor.f_char_byte_idx()
  local char_byte_idx          = v.Line.char_byte_idx(line_num, char, cursor_f_char_byte_idx)

  if not char_byte_idx then return char_byte_idx end

  v.Cursor.f_str__space_crct_by_byte_idx(char_byte_idx)

  return char_byte_idx
end

function v.Cursor.f_str__space_crct_by_byte_idx(byte_idx)

  local crct_str
  crct_str = v.Cursor.line_str_side_r_with_c()
  crct_str = v.Str.trim(crct_str)

  local cursor_byte_idx = v.Cursor.byte_idx()
  local space_len = byte_idx - cursor_byte_idx
  local space_str = v.Str.space(space_len)

  v.Cursor.f_str__del()
  v.Cursor.__ins(space_str)
  v.Cursor.__ins(crct_str)

  v.Cursor.__mv_by_byte_idx(cursor_byte_idx)
end

function v.Cursor.f_str__space_crct_by_ruler_idx(ruler_idx)

  local crct_str
  crct_str = v.Cursor.line_str_side_r_with_c()
  crct_str = v.Str.trim(crct_str)

  local cursor_ruler_idx = v.Cursor.ruler_idx()
  local space_len = ruler_idx - cursor_ruler_idx
  local space_str = v.Str.space(space_len)

  v.Cursor.f_str__del()
  v.Cursor.__ins(space_str)
  v.Cursor.__ins(crct_str)

  v.Cursor.__mv_by_ruler_idx(cursor_ruler_idx)
end

function v.Cursor.__ins_sys_cmd(sys_cmd) -- read

  local is_line_num_eq_1 = v.Cursor.is_line_num__file_edge_bgn()

  if is_line_num_eq_1 then
    v.Cursor.__ins_line_emp()
    -- v.Nml.exe(v.Nml.n.mode.ins_line_pre) -- O
  else
    v.Cursor.__mv_u()
  end

  local cmd = 'read ! ' .. sys_cmd
  v.Cmd.cmd(cmd)

  if is_line_num_eq_1 then
    v.Line.__del_by_line_num(1)
  end
end

-- cursor line cnd

function v.Cursor.is_line_num__(line_num)

  local ret = bl.f

  local cursor_line_num = v.Cursor.line_num()
  if cursor_line_num == line_num then
    ret = bl.t
  end
  return ret
end

function v.Cursor.is_line_num__file_edge_bgn()

  local line_num = 1
  local ret = v.Cursor.is_line_num__(line_num)
  return ret
end

function v.Cursor.is_line_num__file_edge_end()

  local line_num = v.Line.num_file_edge_end()
  local ret = v.Cursor.is_line_num__(line_num)
  return ret
end

function v.Cursor.is_line_num__file_edge()

  local ret = bl.f

  if v.Cursor.is_line_num__file_edge_bgn() or v.Cursor.is_line_num__file_edge_end() then
    ret = bl.t
  end

  return ret
end

function v.Cursor.is_line_str__emp()

  if v.Cursor.line_end_byte_idx() == 1 then
    return bl.t
  else
    return bl.f
  end
end

function v.Cursor.is_line_str__space()

  local str = v.Cursor.line_str()
  local ret = v.Str.is__space(str)
  return ret
end

function v.Cursor.is_line_str_side_l__space()

  local str = v.Cursor.line_str_side_l()
  local ret = v.Str.is__space(str)
  return ret
end

function v.Cursor.is_line_str_side_r__space()

  local str = v.Cursor.line_str_side_r()
  local ret = v.Str.is__space(str)
  return ret
end

function v.Cursor.is_line_str__ptn(ptn_vim) -- todo dev

  local str = v.Cursor.line_str_side_r()

  local ret = bl.f

  if v.Str.is__ptn(str, ptn_vim) then
    ret = bl.t
  end
  return ret
end

-- indnt

function v.Cursor.line_indnt__add(byte_idx)

  if byte_idx <= 0 then return end

  v.Cursor.__mv_line_top0()

  local char

  v.Log.val(vim.bo.expandtab)
  if not vim.bo.expandtab then
    char = ' '
    byte_idx = byte_idx -- todo dev

  else
    char = '<tab>'
    byte_idx = byte_idx / 2
  end
  v.Cursor.__ins_mlt(char, byte_idx)

  v.Cursor.__mv_line_top1()
end

function v.Cursor.line_indnt__del() -- alias

  v.Cmd.cmd('left')
end

function v.Cursor.line_indnt__shft_l()

  v.Nml.exe(v.Nml.n.edit.line.shft_l) -- <<
  v.Cursor.__mv_line_top1()
end

function v.Cursor.line_indnt__shft_r()

  local byte_idx = 2
  v.Cursor.line_indnt__add(byte_idx)
end


function v.Cursor.line_indnt__crct()

  local byte_idx = 0

  if bl.t then -- dflt
    byte_idx = v.Cursor.line_indnt__crct_with_c()
    return byte_idx
  else
    byte_idx = v.Cursor.line_indnt__crct_with_nml()
    return byte_idx
  end
end

function v.Cursor.line_indnt__crct_with_nml()

  local line_mlt_num = '1'
  local indnt_crct   = '=='
  local nml_cmd = line_mlt_num .. indnt_crct
  v.Nml.exe(nml_cmd)
  return 0 -- todo dev
end

function v.Cursor.line_indnt__crct_with_c()

  v.Cursor.line_indnt__del()

  local byte_idx = v.Cursor.line_indnt_byte_idx_with_c()
  v.Cursor.line_indnt__add(byte_idx)
  return byte_idx
end

function v.Cursor.line_indnt_byte_idx_with_c()

  local line_num = v.Cursor.line_num()
  local byte_idx = vf.cindent(line_num)
  return byte_idx
end

