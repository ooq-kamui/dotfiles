
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

-- dev anchor
function v.Cursor.l_byte_idx()

  
end

function v.Cursor.ruler_idx()

  local str = v.Cursor.line_str_side_l()

  local ruler_idx = v.Str.len_ruler(str) + 1
  -- v.Log.val(ruler_idx)

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

-- dev anchor
function v.Cursor.is_byte_idx__line_top1()

  local c_pos = v.Cursor.pos()

  local c_byte_idx = v.Cursor.byte_idx()

  v.Cursor.__mv_line_top1()
  local top1_byte_idx = v.Cursor.byte_idx()

  v.Cursor.__mv_by_pos(c_pos)

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
  -- v.Log.val(line_num)

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

  -- v.Cmd.nml(line_num .. 'G')
end

function v.Cursor.__mv_by_line_byte_idx(line_num, byte_idx)

  line_num = line_num or v.Cursor.line_num()

  vf.cursor(line_num, byte_idx)
end

function v.Cursor.__mv_by_jmplst_line_info_lst(jmplst_line_info_lst)

  local line_num = v.Line.num_by_jmplst_line_info(jmplst_line_info_lst)
  v.Cursor.__mv_by_line_num(line_num)
end

function v.Cursor.__mv_by_pos(pos)

  vf.setpos('.', pos)
end

function v.Cursor.__mv_line_top0()

  if v.Cursor.is_line_str__emp() then
    return
  end

  v.Cmd.nml('0')
end

function v.Cursor.__mv_line_top1()

  if     v.Cursor.is_line_str__space() then
    v.Cursor.__mv_line_end()

  elseif v.Cursor.is_line__markdown_itm() then
    v.Cmd.nml('^2l')
  else
    v.Cmd.nml('^')
  end
end

function v.Cursor.__mv_line_end()

  if v.Cursor.is_line_str__emp() then
    return
  end

  if v.Mode.is__normal() then
    v.Cmd.nml('$l')
  else
    v.Cmd.nml('$')
  end
end

function v.Cursor.__mv_line_end_in()

  if v.Mode.is__normal() then
    v.Cmd.nml('$')
  else
    v.Cmd.nml('$h')
  end
end

function v.Cursor.__mv_char(drct)

  local cmd_nml

  if     drct == 'f' then
    cmd_nml = 'l'

  elseif drct == 'b' then
    cmd_nml = 'h'
  end

  v.Cmd.nml(cmd_nml)
end

function v.Cursor.__mv_char_f()

  v.Cursor.__mv_char('f')
  -- v.Cmd.nml('l')
end

function v.Cursor.__mv_char_b()

  v.Cursor.__mv_char('b')
  -- v.Cmd.nml('h')
end

function v.Cursor.__mv_word_f()

  if     v.Cursor.is_byte_idx__line_end() or v.Cursor.is_byte_idx__line_end_inr() then

    v.Cursor.__mv_char_f()
    return

  elseif v.Cursor.is_line_str_side_r__space() then

    v.Cursor.__mv_line_end()
    return
  end

  local c_char = v.Cursor.c_char()
  local r_char = v.Cursor.r_char()

  if v.Str.is__ptn(c_char, ' ') and v.Str.is__ptn(r_char, ' ') then
    v.Cmd.nml('w')
  else
    v.Cmd.nml('el')
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
    v.Cmd.nml('b')
  end
end

function v.Cursor.__mv_word_b_pre() -- use not

  local c_char = v.Cursor.c_char()
  local l_char = v.Cursor.r_char()

  if v.Str.is__ptn(c_char, ' ') and not v.Str.is__ptn(l_char, ' ') then
    v.Cmd.nml('gegel')
  else
    v.Cmd.nml('gel')
  end
end

function v.Cursor.__mv_word_dlm_f()

  local ptn_vim  = v.Srch.ptn.vim.word_dlm
  local line_num = v.Cursor.line_num()

  local st = v.Srch.srch(ptn_vim, 'zW', line_num)

  if not st then
    v.Cursor.__mv_line_end()
  end
end

function v.Cursor.__mv_fnc_name()

  local st = v.Cursor.__mv_by_ptn('(', 'f')

  if st then
    v.Cursor.__mv_word_b()
  end
end

function v.Cursor.__mv_u() -- alias

  v.Cmd.nml('k')
end

function v.Cursor.__mv_d() -- alias

  v.Cmd.nml('j')
end

function v.Cursor.__mv_v(drct)

  if     drct == 'u' then
    v.Cursor.__mv_u()

  elseif drct == 'd' then
    v.Cursor.__mv_d()

  else
    v.Cursor.__mv_u()
  end
end

v.Cursor.cnst.mv_line_step_dflt = 10

function v.Cursor.__mv_mlt_u() -- alias

  local cursor_mv_line_step = v.Cursor.cnst.mv_line_step_dflt

  local cmd_nml = cursor_mv_line_step .. [[\<c-y>]]
  -- local cmd_nml = cursor_mv_line_step .. '\\<c-y>'
  v.Cmd.nml(cmd_nml)

  -- v.Cmd.cmd('exe "normal! ' .. cmd_nml .. '"')
end

function v.Cursor.__mv_mlt_d() -- alias

  local cursor_mv_line_step = v.Cursor.cnst.mv_line_step_dflt

  local cmd_nml = cursor_mv_line_step .. [[\<c-e>]]
  -- local cmd_nml = cursor_mv_line_step .. '\\<c-e>'
  v.Cmd.nml(cmd_nml)

  -- v.Cmd.cmd('exe "normal! ' .. cmd_nml .. '"')
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

function v.Cursor.__mv_file_edge(cmd_nml)

  if v.Cursor.is_line_num__file_edge() then
    v.Cmd.nml(cmd_nml)
  end

  local cnt = 1
  local cnt_max = 50000

  while ( not v.Cursor.is_line_num__file_edge() and cnt < cnt_max ) do

    v.Cmd.nml(cmd_nml)
    cnt = cnt + 1
  end

  if not v.Cursor.is_line_num__file_edge() then
    if     cmd_nml == 'k' then
      v.Cmd.nml('gg')
    elseif cmd_nml == 'j' then
      v.Cmd.nml('G' )
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

  if not v.Tbl.is_in(drct_cmd_nml, {'k', 'j'}) then
    return
  end

  v.Cmd.nml(drct_cmd_nml)
  local cnt = 1
  local cnt_max = 10000

  while ( not v.Cursor.is_line_num__file_edge() and cnt < cnt_max ) do

    if not ( v.Cursor.is_c_char__space() or v.Cursor.is_byte_idx__line_end() ) then
      break -- stop
    end

    if is_space_stop and v.Cursor.is_c_char__space() then
      break -- stop
    end

    v.Cmd.nml(drct_cmd_nml)
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

  if not v.Tbl.is_in(drct_cmd_nml, {'k', 'j'}) then
    return
  end

  v.Cmd.nml(drct_cmd_nml)

  local cnt = 1
  local cnt_max = 10000

  while ( not v.Cursor.is_line_num__file_edge() and cnt < cnt_max ) do

    if v.Cursor.is_c_char__space() or v.Cursor.is_byte_idx__line_end() then
      break
    end

    v.Cmd.nml(drct_cmd_nml)
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
  -- v.Log.val('__mv_v_jmp')

  if not v.Tbl.is_in(drct_cmd_nml, {'k', 'j'}) then
    return
  end

  v.Cmd.nml(drct_cmd_nml)

  local is_c_char__space = v.Cursor.is_c_char__space()
  local is_byte_idx__line_end = v.Cursor.is_byte_idx__line_end()
  -- v.Log.val('is_c_char__space : ', is_c_char__space)
  -- v.Log.val('is_byte_idx__line_end : ', is_byte_idx__line_end)

  if is_c_char__space or is_byte_idx__line_end then

    -- v.Log.val('__mv_v_jmp_to_char')
    v.Cursor.__mv_v_jmp_to_char(drct_cmd_nml)
  else
    -- v.Log.val('__mv_v_jmp_to_space')
    v.Cursor.__mv_v_jmp_to_space(drct_cmd_nml)
  end
end

function v.Cursor.__mv_by_ptn(ptn_vim, drct) -- range, on 1 line

  local opt_drct = ''

  if     drct == 'b' then
    opt_drct = 'b'

  elseif drct == 'f' then
    opt_drct = ''
  end

  local opt = 'W' .. opt_drct

  local line_num = v.Cursor.line_num()

  local st = v.Srch.srch(ptn_vim, opt, line_num)
  return st
end

function v.Cursor.__mv_by_srch_str(drct, end_flg)

  local opt = ''

  if     drct == 'f' then
    opt = opt .. ''
  elseif drct == 'b' then
    opt = opt .. 'b'
  end

  if end_flg then
    opt = opt .. 'e'
  end

  local ptn_vim = v.Srch.str()

  v.Srch.srch(ptn_vim, opt)
end

function v.Cursor.__mv_block_out_swtch()

  local block_type_bracket_list = {
    'javascript',
    'java',
  }

  if     v.Buf.is_file_type__in({'markdown'}) then

    v.Srch.str__ptn(v.Srch.ptn.vim.markdown_heading)
    v.Cursor.__mv_by_srch_str('b')

  elseif v.Buf.is_file_type__in(block_type_bracket_list) then
    v.Cursor.__mv_bracket_out()

  else
    v.Srch.str__fnc_def()
    v.Cursor.__mv_by_srch_str('b')
  end
end

function v.Cursor.__mv_bracket_out()

  local cmd_nml = '[{'
  v.Cmd.nml(cmd_nml)
end

function v.Cursor.__mv_fnc_out()

  local cmd_nml = '[m'
  v.Cmd.nml(cmd_nml)
end

function v.Cursor.__mv_by_line_ruler_idx(line_num, ruler_idx)

  v.Cursor.__mv_by_line_num(line_num)

  local cmd_nml = ruler_idx .. '|'
  v.Cmd.nml(cmd_nml)
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
  local word_byte_idx    = v.Line.word_byte_idx(ref_line_num, cursor_byte_idx)

  if not word_byte_idx then return end

  v.Cursor.__mv_by_byte_idx(word_byte_idx)
  -- v.Cursor.__mv_by_line_byte_idx(nil, word_byte_idx)
end

-- cursor __ ins

function v.Cursor.__ins(str)

  local cmd = 'i' .. str
  v.Cmd.nml(cmd)
  v.Cursor.__mv_char_f()
end

function v.Cursor.__ins_with_cursor_fix(str) -- todo dev

end

-- cursor __ ins ynk ( paste )

function v.Cursor.__ins_ynk()

  v.Cmd.nml('"aP')
end

function v.Cursor.__ins_ynk_box()

  v.Cmd.nml('""P')
end

function v.Cursor.__ins_clp()

  v.Rgstr.ynk__clp()
  v.Cursor.__ins_ynk()
end

function v.Cursor.__ins_mlt(str, num)

  if num == 0 then
    return
  end

  local cmd = num .. 'i' .. str
  v.Cmd.nml(cmd)
end

function v.Cursor.__ins_cr()

  local line_num = v.Cursor.line_num()

  v.Cmd.nml([[i\<cr> ]])
  -- v.Cmd.nml('i\\<cr> ')
  -- v.Cmd.cmd('exe "normal! i\\<cr> "')
  v.Cmd.nml('x')

  v.Line.end_space__del(line_num)
  v.Cursor.__mv_d()
end

function v.Cursor.__ins_space(is_cursor_mv)

  if is_cursor_mv then
    v.Cursor.__ins(' ')
  else
    v.Cmd.nml('i ')
    -- v.Cmd.nml('l')
  end
end

function v.Cursor.__ins_hyphen()

  v.Cmd.nml('i-')
  -- v.Cursor.__ins('-')
end

function v.Cursor.__ins_tilde()

  v.Cmd.nml('i~')
  -- v.Cursor.__ins('~')
end

function v.Cursor.__ins_slash()

  v.Cmd.nml('i/')
  -- v.Cursor.__ins('/')
end

function v.Cursor.__ins_slashback()

  v.Cmd.nml('i\\')
  -- v.Cursor.__ins('\\')
end

function v.Cursor.__ins_quote()

  v.Cmd.nml("i' '")
  v.Cmd.nml('h')
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
    v.Cmd.nml(cmd_cursor__mv_line_top)
  end

  local str = v.Str.cmnt.line_1()
  v.Cmd.nml('i' .. str)
  
  v.Cmd.nml('^') -- or '0'
end

function v.Cursor.__ins_rgstr_by_rgstr_info(rgstr_info)

  local rgstr = v.Rgstr.info_rgstr(rgstr_info)
  -- v.Cmd.nml('"' .. rgstr .. rgstr .. 'P')
  v.Cmd.nml('"' .. rgstr .. 'P')
end

function v.Cursor.__ins_cmnt_mlt() -- call when mode normal

  v.Cursor.__ins_cmnt_mlt_by_pos_key('end')
  v.Cursor.__ins_cmnt_mlt_by_pos_key('bgn')
end

function v.Cursor.__ins_cmnt_mlt_by_pos_key(pos_key)

  local str_ar = v.Str.cmnt.line_mlt()

  if     pos_key == 'bgn' then
    v.Cmd.nml('O')
    v.Cmd.nml('i' .. str_ar[1])

  elseif pos_key == 'end' then
    v.Cmd.nml('o')
    v.Cmd.nml('i' .. str_ar[2])
  end
end

-- markdown

function v.Cursor.__ins_markdown_heading()

  v.Cursor.__mv_line_top0()
  local top0_char = v.Cursor.c_char()

  local str = '#'

  if top0_char ~= str then
    str = str .. ' '
  end

  v.Cursor.__ins(str)

  local ptn_vim  = v.Srch.ptn.vim.markdown_heading
  local line_str = v.Cursor.line_str()

  local byte_idx = v.Str.srch_byte_idx_by_ptn_vim_end(line_str, ptn_vim) + 1

  if not byte_idx then return end

  v.Cursor.__mv_by_byte_idx(byte_idx)
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
  -- v.Log.val('Cursor.is_line__markdown_itm')

  local ptn_lua = '^%s*- '

  local str = v.Cursor.line_str()
  -- v.Log.val(str, ptn_lua)
  local byte_idx = v.Str.srch_byte_idx_by_ptn_lua(str, ptn_lua)
  -- v.Log.val(byte_idx)

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
  -- v.Log.val(l_char)
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

function v.Cursor.char__rpl(rpl)

  if v.Str.is__ptn(rpl, [[\\]]) then
    rpl = v.Str.__rpl_with_vim(rpl, [[\\]], [[\\\\]])
  end

  v.Cmd.nml('r' .. rpl)
end

function v.Cursor.char__rpl_underscore() -- alias

  -- todo, case: line end

  v.Cursor.char__rpl('_')
  v.Cursor__mv_char_f()
  -- v.Cursor.__mv_char_forward() -- todo, fnc cre
end

-- todo fnc name mod ?
-- dev anchor
function v.Char.__tgl_swtch01()

  local c = v.Cursor.c_char()

  if     v.Char.is__num(c) then

    v.Cursor.str__icl()
    return

  elseif v.Char.is__alpha(c) then

    v.Cmd.nml('v~') -- upper / lower
    return
  end

  local rpl = v.Char.is__tgl_bracket_trn(c)
  if not v.Str.is__emp(rpl) then
    v.Cursor.char__rpl(rpl)
    return
  end

  local rpl = v.Char.is__symbol_tgl(c)
  if not v.Str.is__emp(rpl) then

    v.Cursor.char__rpl(rpl)
    return
  end
end

-- todo fnc name mod ?
-- dev anchor
function v.Char.__tgl_swtch02()

  local c = v.Cursor.c_char()

  if v.Char.is__num(c) then

    v.Cursor.str__dcl()
    return
  end

  v.Cursor.char__tgl_type_shift(c)
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

  local cmd = '"zx'
  v.Cmd.nml(cmd)
end

function v.Cursor.c_char__del_ynk()

  local cmd = '"ax'
  v.Cmd.nml(cmd)
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

  local ptn_vim = '\\s'
  local ret = v.Cursor.is_c_char__ptn(ptn_vim)
  return ret
end

function v.Cursor.is_c_char__alph()

  local ptn_vim = '\\a'
  local ret = v.Cursor.is_c_char__ptn(ptn_vim)
  return ret
end

-- cursor str

-- cursor str __

function v.Cursor.str__icl()

  local cmd_nml = [[\<c-a>]]
  -- local cmd_nml = "\\<c-a>"
  v.Cmd.nml(cmd_nml)
  -- v.Cmd.cmd('exe "normal! \\<c-a>"')
end

function v.Cursor.str__dcl()

  local cmd_nml = [[\<c-x>]]
  -- local cmd_nml = "\\<c-x>"
  v.Cmd.nml(cmd_nml)
  -- v.Cmd.cmd('exe "normal! \\<c-x>"')
end

function v.Cursor.str_week__icl()

  local week_str = v.Cursor.word()
  local week_idx = v.Tbl.idx(v.Date.week_def, week_str)

  if not week_idx then return end

  local week_nxt_idx = v.Idx.__icl(week_idx, v.Tbl.len(v.Date.week_def))
  local week_nxt_str = v.Date.week_def[week_nxt_idx]

  v.Slctd.str__word()
  v.Cmd.nml('"zd')

  v.Cursor.__ins(week_nxt_str)
end

function v.Cursor.str_week__dcl()

  local week_str = v.Cursor.word()
  local week_idx = v.Tbl.idx(v.Date.week_def, week_str)

  if not week_idx then return end

  local week_nxt_idx = v.Idx.__dcl(week_idx, v.Tbl.len(v.Date.week_def))
  local week_nxt_str = v.Date.week_def[week_nxt_idx]

  v.Slctd.str__word()
  v.Cmd.nml('"zd')

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

  -- local len_byte = v.Cursor.line_end_byte_idx() - 1
  local line_str = v.Cursor.line_str()
  local len_byte = v.Str.len_byte(line_str)
  return len_byte
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

function v.Cursor.line_top0__ins(str)

  v.Cursor.__mv_line_top0()
  v.Cursor.__ins(str)
end

function v.Cursor.line_top1__ins(str)

  v.Cursor.__mv_line_top1()
  v.Cursor.__ins(str)
end

function v.Cursor.line_end_dots__care()

  local line_str = v.Cursor.line_str()
  local is_line_dots__exist = v.Str.is__ptn(line_str, v.Str.dots.ptn_vim)

  if is_line_dots__exist then
    v.Cursor.line_end_dots__del()
  end

  v.Cursor.line_end__ins_dots()
end

function v.Cursor.line_end__ins_dots()

  local line_str_len_ruler = v.Cursor.line_str_len_ruler()

  local space_len_byte = v.Str.dots.plt_ruler_idx - line_str_len_ruler
  if space_len_byte < 0 then
    space_len_byte = 0
  end

  local line_str  = v.Cursor.line_str()
  local space_str = v.Str.space(space_len_byte)
  line_str = line_str .. space_str .. v.Str.dots.str
  v.Cursor.line__(line_str)
end

function v.Cursor.line_end_dots__del()

  local line_str = v.Cursor.line_str()

  local byte_idx = v.Str.srch_byte_idx_by_ptn_vim(line_str, [[\s\+]] .. v.Str.dots.ptn_vim)
  line_str = v.Str.sub_by_byte_idx(line_str, 1, byte_idx)
  v.Cursor.line__(line_str)
end

function v.Cursor.line_end__ins(str)

  local cmd_nml = 'A' .. str
  v.Cmd.nml(cmd_nml)
end

-- cursor f

function v.Cursor.f_space__del()

  local c = v.Cursor.c_char()

  if v.Str.is__ptn(c, '\\s') then
    -- v.Log.val( "del" )
    v.Slctd.str__cursor_f_space()
    v.Cmd.nml('"zd')
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
    v.Cmd.nml('"_dd') -- rgstr del
  else
    v.Cmd.nml('"add')
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

  -- local ptn_lua = '[^ \t]'
  local ptn_lua = '[^ ]'
  local cursor_byte_idx = v.Cursor.byte_idx()
  local str = v.Cursor.line_str()
  f_char_byte_idx = v.Str.srch_byte_idx_by_ptn_lua(str, ptn_lua, cursor_byte_idx)
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

  local cmd_nml = 'D'
  v.Cmd.nml(cmd_nml)
end

function v.Cursor.f_str__space_crct_with_fzy(ref_drct)

  if v.Cursor.is_byte_idx__line_end() then
    return
  end

  local word_ruler_idx = v.Cursor.f_str__space_crct_with_word(ref_drct)

  if word_ruler_idx then return end

  -- dev anchor, logic confirm
  local char_byte_idx = v.Cursor.f_str__space_crct_with_char(ref_drct)
end

function v.Cursor.f_str__space_crct_with_word(ref_drct)

  local cursor_f_char_ruler_idx = v.Cursor.f_char_ruler_idx()
  local line_num                = v.Cursor.line_num(ref_drct)

  local word_ruler_idx = v.Line.word_ruler_idx(line_num, cursor_f_char_ruler_idx)

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

-- dev anchor
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
    v.Cmd.nml('O')
  else
    -- v.Cmd.nml('k')
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
  --v.Log.val( ret )
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

  if byte_idx == 0 then
    return
  end

  v.Cmd.nml('0')

  local char = ' '
  -- v.Log.val(vim.bo.expandtab)
  if not vim.bo.expandtab then
    char = ' '
    byte_idx = byte_idx
  else
    -- dev anchor : todo dev
    char = '\t'
    -- char = vim.api.nvim_replace_termcodes('\t', bl.f, bl.f, bl.t)
    byte_idx = byte_idx / 2
  end
  v.Cursor.__ins_mlt(char, byte_idx)

  v.Cursor.__mv_line_top1()
end

function v.Cursor.line_indnt__del() -- alias

  v.Cmd.cmd('left')
end

function v.Cursor.line_indnt__shft_l()

  v.Cmd.nml('<<')
  v.Cursor.__mv_line_top1()
end

function v.Cursor.line_indnt__shft_r()

  local byte_idx = 2
  v.Cursor.line_indnt__add(byte_idx)
end


function v.Cursor.line_indnt__crct() -- alias

  local byte_idx = 0

  if bl.t then -- dflt
    byte_idx = v.Cursor.line_indnt__crct_with_c()
    return byte_idx
  else
    -- dev anchor
    v.Cursor.line_indnt__crct_with_nml()
    return byte_idx
  end
end

function v.Cursor.line_indnt__crct_with_nml()

  v.Cmd.nml('1==')
  return
end

function v.Cursor.line_indnt__crct_with_c()

  v.Cursor.line_indnt__del()

  local byte_idx = v.Cursor.line_indnt_byte_idx_with_c()
  --v.Log.val( byte_idx )

  v.Cursor.line_indnt__add(byte_idx)
  return byte_idx
end

function v.Cursor.line_indnt_byte_idx_with_c()

  local line_num = v.Cursor.line_num()
  local byte_idx = vf.cindent(line_num)
  return byte_idx
end

