
-- cursor

v.Cursor = {}

v.Cursor.cnst = {}

-- cursor pos

function v.Cursor.pos() -- alias

  local pos = vf.getpos('.')
  return pos
end

-- cursor col

function v.Cursor.col_num()

  local col_num = vf.col('.')
  return col_num
end

function v.Cursor.col_idx() -- alias

  local col_idx = v.Cursor.col_num()
  return col_idx
end

function v.Cursor.ruler_num()

  local str = v.Cursor.line_str_side_l()

  local ruler_num = v.Str.ruler_len(str) + 1
  -- v.Log.val(ruler_num)

  return ruler_num
end

-- cursor col cnd

function v.Cursor.is_col__line_end()

  if v.Cursor.col_num() == v.Cursor.line_end_col() then
    return bl.t
  else
    return bl.f
  end
end

function v.Cursor.is_col__line_end_inr()

  if v.Cursor.col_num() == v.Cursor.line_end_col() - 1 then

    return bl.t
  else
    return bl.f
  end
end

function v.Cursor.is_col__line_end_ovr() -- range

  if v.Cursor.col_num() >= v.Cursor.line_end_col() then
    return bl.t
  else
    return bl.f
  end
end

function v.Cursor.is_col__line_top0()

  if v.Cursor.col_num() == 1 then
    return bl.t
  else
    return bl.f
  end
end

function v.Cursor.is_col__line_top1()

  local pos_c = v.Cursor.pos()

  local col_c = v.Cursor.col_num()
  
  v.Cursor.__mv_line_top1()
  local col_s1 = v.Cursor.col_num()
  
  vf.setpos('.', pos_c)
  
  if col_c == col_s1 then
    return bl.t
  else
    return bl.f
  end
end

-- cursor __ mv

function v.Cursor.__mv_by_col_num(col_num)

  if not v.Str.is__num(col_num) then
    return
  end

  local line_num = v.Cursor.line_num()

  v.Cursor.__mv_by_line_col(line_num, col_num)
end

function v.Cursor.__mv_by_line_num(line_num)

  if v.Var.is__emp(line_num) then
    return
  end

  if not v.Str.is__num(line_num) then
    return
  end

  local win_id = 0 -- crnt
  local cursor = vim.api.nvim_win_get_cursor(win_id)
  local cursor_col_num = cursor[2]
  vim.api.nvim_win_set_cursor(win_id, {line_num, cursor_col_num})

  -- v.Cmd.nml(line_num .. 'G')
end

function v.Cursor.__mv_by_line_col(line_num, col_num)

  line_num = line_num or v.Cursor.line_num()

  vf.cursor(line_num, col_num)
end

function v.Cursor.__mv_by_line_info(line_info)

  v.log = line_info

  local line_num = v.Line.num_by_Line_info(line_info)
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

function v.Cursor.__mv_char_f()

  v.Cmd.nml('l')
end

function v.Cursor.__mv_char_b()

  v.Cmd.nml('h')
end

function v.Cursor.__mv_word_f()

  if     v.Cursor.is_col__line_end() or v.Cursor.is_col__line_end_inr() then

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

  if     v.Cursor.is_col__line_top0() then
    v.Cursor.__mv_u_line_end()

  elseif v.Cursor.is_line_str_side_l__space() then
    v.Cursor.__mv_line_top0()

  elseif v.Cursor.is_col__line_top1() then
    v.Cursor.__mv_line_top0()

  elseif v.Char.is__symbol(l_char) then
    v.Cursor.__mv_char_b()

  else
    v.Cmd.nml('b')
  end
end

function v.Cursor.__mv_word_dlm_f()

  local ptn = v.Srch.ptn.word_dlm

  local line_num = v.Cursor.line_num()

  local st = v.Srch.srch(ptn, 'zW', line_num)

  if not st then
    v.Cursor.__mv_line_end()
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

  if     v.Cursor.is_col__line_top0() then

    v.Cursor.__ins_line_emp()

  elseif v.Cursor.is_col__line_top1() then

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

    if not ( v.Cursor.is_c_char__space() or v.Cursor.is_col__line_end() ) then
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

    if v.Cursor.is_c_char__space() or v.Cursor.is_col__line_end() then
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
  local is_col__line_end = v.Cursor.is_col__line_end()
  -- v.Log.val('is_c_char__space : ', is_c_char__space)
  -- v.Log.val('is_col__line_end : ', is_col__line_end)

  if is_c_char__space or is_col__line_end then

    -- v.Log.val('__mv_v_jmp_to_char')
    v.Cursor.__mv_v_jmp_to_char(drct_cmd_nml)
  else
    -- v.Log.val('__mv_v_jmp_to_space')
    v.Cursor.__mv_v_jmp_to_space(drct_cmd_nml)
  end
end

function v.Cursor.__mv_by_ptn(ptn, drct) -- range, on 1 line

  local opt_drct = ''

  if     drct == 'b' then
    opt_drct = 'b'

  elseif drct == 'f' then
    opt_drct = ''
  end

  local opt = 'W' .. opt_drct

  local line_num = v.Cursor.line_num()

  local st = v.Srch.srch(ptn, opt, line_num)
  return st
end

function v.Cursor.__mv_by_srch_str(drct)

  local opt = ''

  if     drct == 'f' then
    opt = ''
  elseif drct == 'b' then
    opt = 'b'
  end

  local ptn = v.Rgstr.get('/')
  v.Srch.srch(ptn, opt)
end

function v.Cursor.__mv_block_out_swtch()

  local block_type_bracket_list = {
    'javascript',
    'java',
  }

  if     v.Buf.is_file_type__in({'markdown'}) then

    v.Srch.str__ptn(v.Srch.ptn.markdown_h)
    v.Cursor.__mv_by_srch_str('b')

  elseif v.Buf.is_file_type__in(block_type_bracket_list) then
    v.Cursor.__mv_bracket_out()

  else
    v.Srch.str__fnc_def()
    v.Cursor.__mv_by_srch_str('b')

    -- v.Cursor.__mv_fnc_out()
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

function v.Cursor.__mv_markdown_h_out()

end

function v.Cursor.__mv_by_line_ruler(line_num, ruler_num)

  local col_num
  col_num = v.Line.col_num_by_ruler_num(line_num, ruler_num)

  v.Cursor.__mv_by_line_col(line_num, col_num)
end

function v.Cursor.__mv_line_u_word_col()

  local ref_drct       = 'u'
  local ref_line_num   = v.Cursor.line_num(ref_drct)
  local cursor_col_idx = v.Cursor.col_idx()
  local word_col_idx        = v.Line.word_col_idx(ref_line_num, cursor_col_idx)

  if not word_col_idx then return end

  v.Cursor.__mv_by_line_col(nil, word_col_idx)
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

  local da = vf.strftime('%Y-%m-%d')
  v.Cursor.__ins(da)
end

function v.Cursor.__ins_tm()

  -- v.Cursor.__ins('.')

  local tm = vf.strftime('%H:%M')
  v.Cursor.__ins(tm)
end

function v.Cursor.__ins_dt()

  local dt = vf.strftime('%Y-%m-%d.%H:%M')
  v.Cursor.__ins(dt)
end

function v.Cursor.__ins_ts()

  local ts = vf.strftime('%Y-%m-%d.%H:%M:%S')
  v.Cursor.__ins(ts)
end

g.week_def = { 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' }

function v.Cursor.__ins_week()

  local idx  = vf.strftime('%w') + 1
  local week = g.week_def[idx]
  v.Cursor.__ins(week)
end

-- cmnt

function v.Cursor.__ins_cmnt_1(cmd_cursor__mv_line_top)

  if cmd_cursor__mv_line_top then
    v.Cmd.nml(cmd_cursor__mv_line_top)
  end

  local str = v.Str.cmnt_1()
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

  local cmnt_mlt_def = {
    lua        = {[[--[[]] , '--]]'},
    html       = {'<!--'   ,  '-->'},
    css        = {'/*'     ,  ' */'},
    javascript = {'/*'     ,  ' */'},
    typescript = {'/*'     ,  ' */'},
    java       = {'/*'     ,  ' */'},
    dflt       = {'/*'     ,  ' */'},
  }

  local str = vf.get(cmnt_mlt_def, vim.bo.filetype, cmnt_mlt_def['dflt'])

  if     pos_key == 'bgn' then
    v.Cmd.nml('O')
    v.Cmd.nml('i' .. str[1])

  elseif pos_key == 'end' then
    v.Cmd.nml('o')
    v.Cmd.nml('i' .. str[2])
  end
end

-- markdown

function v.Cursor.__ins_markdown_h()

  v.Cursor.__mv_line_top0()
  local top0_char = v.Cursor.c_char()

  local str = '#'

  if top0_char ~= str then
    str = str .. ' '
  end

  v.Cursor.__ins(str)

  local ptn = '^#* '
  local col = v.Str.srch_end(v.Cursor.line_str(), ptn) + 1
  v.Cursor.__mv_by_line_col(nil, col)
end

function v.Cursor.__ins_markdown_cr()

  v.Cursor.__ins('  ')
end

function v.Cursor.__ins_markdown_itm()

  if v.Cursor.is_line__markdown_itm() then
    return
  end

  local col = v.Cursor.line_indnt__crct()

  local str = '- '
  v.Cursor.line_top1__ins(str)
end

-- cnd line  markdown

function v.Cursor.is_line__markdown_itm()
  -- v.Log.val('Cursor.is_line__markdown_itm')

  local ptn = '^%s*- '
  local str = v.Cursor.line_str()
  -- v.Log.val(str, ptn)
  local idx = v.Str.srch_idx_by_lua(str, ptn)
  -- v.Log.val(idx)

  if not idx then
    return bl.f
  else
    return bl.t
  end
end


function v.Cursor.__ins_markdown_code()

  local str = '```'
  v.Cursor.__ins_line(str)
end

-- dev anchor
-- refactoring , def pos, fnc name re ?
function v.Char_markdown_chk__tgl()

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

function v.Cursor.c_char()

  local idx = v.Cursor.col_num()
  local str = v.Cursor.line_str()
  local c   = str:sub(idx, idx)
  return c
end

function v.Cursor.l_char()

  local idx = v.Cursor.col_num() - 1
  local c = v.Cursor.line_str():sub(idx, idx)
  return c
end

function v.Cursor.r_char()

  local idx = v.Cursor.col_num() + 1
  local c = v.Cursor.line_str():sub(idx, idx)
  return c
end

function v.Cursor.u_char()

  if v.Cursor.is_line_num__file_edge_bgn() then
    return ''
  end

  local idx = v.Cursor.col_num()
  local line_num = v.Cursor.line_num() - 1

  local c = v.Line.str_by_line_num(line_num):sub(idx, idx)
  return c
end

function v.Cursor.d_char()

  if v.Cursor.is_line_num__file_edge_end() then
    return ''
  end

  local idx = v.Cursor.col_num()
  local line_num = v.Cursor.line_num() + 1
  local c = v.Line.str_by_line_num(line_num):sub(idx, idx)
  return c
end

-- cursor char __

function v.Cursor.char__rpl(rpl)

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

  local rpl = v.Char.is__tgl_symbol(c)
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

function v.Cursor.is_c_char__ptn(ptn)
  -- v.Log.val('is_c_char__ptn')

  local ret = bl.f

  local c = v.Cursor.c_char()
  -- v.Log.val('c : ', c)

  if v.Str.is__ptn(c, ptn) then
    ret = bl.t
  end

  -- v.Log.val('is_c_char__ptn : ', ret)
  return ret
end

function v.Cursor.is_c_char__space()

  local ptn = '\\s'
  local ret = v.Cursor.is_c_char__ptn(ptn)
  return ret
end

function v.Cursor.is_c_char__alph()

  local ptn = '\\a'
  local ret = v.Cursor.is_c_char__ptn(ptn)
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
  local week_idx = vf.index(g.week_def, week_str)

  if week_idx == -1 then
    return
  end

  local week_nxt_idx = v.Idx.__icl(week_idx, vf.len(g.week_def))
  local week_nxt_str = g.week_def[week_nxt_idx]

  v.Slctd.str__word()
  v.Cmd.nml('"zd')
  v.Cmd.nml('i' .. week_nxt_str)
end

function v.Cursor.str_week__dcl()

  local week_str = v.Cursor.word()
  local week_idx = vf.index(g.week_def, week_str)

  if week_idx == -1 then
    return
  end

  local week_nxt_idx = v.Idx.__dcl(week_idx, vf.len(g.week_def))
  local week_nxt_str = g.week_def[week_nxt_idx]

  v.Slctd.str__word()
  v.Cmd.nml('"zd')
  v.Cmd.nml('i' .. week_nxt_str)
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

  str = vf.trim(str)

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

function v.Cursor.__ins_line_anchor()

  local str  = v.Str.cmnt_1() .. 'dev anchor'
  v.Cursor.__ins_line(str)
  v.Cursor.line_indnt__crct()
end

function v.Cursor.__ins_line_anchor_7_del()

  -- v.Cursor.__ins_line_anchor()
  v.Cursor.__ins_line()
  v.Cursor.line__del()
end

function v.Cursor.d__ins_line(str)

  local line_num = v.Cursor.line_num()
  vf.append(line_num, str)
end

function v.Cursor.d__ins_line_space() -- range

  local space_len = v.Cursor.col_num() - 1
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

function v.Cursor.line_end_col() -- alias

  local col = vf.col('$')
  return col
end

-- cursor line str

function v.Cursor.line_str()

  return vf.getline('.')
end

function v.Cursor.line_str_len()

  local len = v.Cursor.line_end_col() - 1
  return len
end

function v.Cursor.line_str_side_l()

  local line_l = v.Cursor.line_str():sub(1             , vf.col('.') - 1)
  return line_l
end

function v.Cursor.line_str_side_r()

  local line_r = v.Cursor.line_str():sub(vf.col('.') + 1)
  return line_r
end

-- todo refactoring Cursor.line_str_side_r() + opt arg
function v.Cursor.line_str_side_r_with_c()

  local line_r = v.Cursor.line_str():sub(vf.col('.'))
  return line_r
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

v.Cnst.dots_str     = ' .. '
v.Cnst.dots_str_ptn = ' %.%. '
v.Cnst.dots_put_col = 50

function v.Cursor.line_end__dots_adjst() -- todo dev, mb_str

  local line_str = v.Cursor.line_str()

  local idx = v.Str.srch_idx_by_lua(line_str, v.Cnst.dots_str_ptn)

  if not idx then
    v.Cursor.line_end__ins_dots()

  else -- idx >= 1
    v.Cursor.line_end_dots__crct()
  end
end

function v.Cursor.line_end_dots__crct()

  local line_str = v.Cursor.line_str()
  local idx = v.Str.srch_idx_by_lua(line_str, v.Cnst.dots_str_ptn)

  if not idx then
    return
  end

  idx = idx - 1 -- to idx 0 start

  if idx == v.Cnst.dots_put_col then
    return
  end

  local line_str_0 = vf.strcharpart(line_str,     0, idx)
  local line_str_1 = vf.strcharpart(line_str, idx       )

  if     idx < v.Cnst.dots_put_col then

    local space_str = v.Str.space(v.Cnst.dots_put_col - idx)
    line_str = line_str_0 .. space_str .. line_str_1
  else
    line_str_0 = vf.strcharpart(line_str_0, 0, v.Cnst.dots_put_col)
    line_str = line_str_0 .. line_str_1
  end

  local line_num = v.Cursor.line_num()
  vf.setline(line_num, line_str)
end

function v.Cursor.line_end__ins_dots()

  local line_num = v.Cursor.line_num()

  local line_str = v.Cursor.line_str()

  local line_str_len = v.Cursor.line_str_len()

  local space_len = v.Cnst.dots_put_col - line_str_len
  if space_len < 0 then
    space_len = 0
  end

  local space_str = v.Str.space(space_len)

  line_str = line_str .. space_str .. v.Cnst.dots_str

  vf.setline(line_num, line_str)
end

function v.Cursor.line_end__ins(str)

  local cmd_nml = 'A' .. str
  v.Cmd.nml(cmd_nml)
end

-- cursor f

function v.Cursor.f_space__del()

  local c = v.Cursor.c_char()

  -- if c =~ '\\s' then
  if v.Str.is__ptn(c, '\\s') then
    -- v.Log.val( "del" )
    v.Slctd.str__cursor_f_space()
    v.Cmd.nml('"zd')
  else
    v.Do.nothing()
  end
end

-- cursor __ ins line

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

-- dev anchor
function v.Cursor.f_char_col_idx()

  local f_char_col_idx

  -- local ptn = '[^ \t]'
  local ptn = '[^ ]'
  local cursor_col_idx = v.Cursor.col_num()
  local str = v.Cursor.line_str()
  f_char_col_idx = v.Str.srch_idx_by_lua(str, ptn, cursor_col_idx)

  return f_char_col_idx
end

-- cursor f str

function v.Cursor.f_str__del()

  if v.Cursor.is_col__line_end() then
    return
  end

  local cmd_nml = 'D'
  v.Cmd.nml(cmd_nml)
end

function v.Cursor.f_str__space_crct_with_fzy(ref_drct) -- dev doing

  local word_col_idx = v.Cursor.f_str__space_crct_with_word(ref_drct)
  if word_col_idx then return end

  local char_col_idx = v.Cursor.f_str__space_crct_with_char(ref_drct)
end

function v.Cursor.f_str__space_crct_with_word(ref_drct)

  local line_num              = v.Cursor.line_num(ref_drct)
  local cursor_f_char_col_idx = v.Cursor.f_char_col_idx()
  local word_col_idx          = v.Line.word_col_idx(line_num, cursor_f_char_col_idx)

  if not word_col_idx then return word_col_idx end

  v.Cursor.f_str__space_crct_by_col_idx(word_col_idx)

  return word_col_idx
end

function v.Cursor.f_str__space_crct_with_char(ref_drct)

  local line_num              = v.Cursor.line_num(ref_drct)
  local char                  = v.Cursor.f_char()
  local cursor_f_char_col_idx = v.Cursor.f_char_col_idx()
  local char_col_idx          = v.Line.char_col_idx(line_num, char, cursor_f_char_col_idx)

  if not char_col_idx then return char_col_idx end

  v.Cursor.f_str__space_crct_by_col_idx(char_col_idx)

  return char_col_idx
end

function v.Cursor.f_str__space_crct_by_col_idx(col_idx)

  local crct_str
  crct_str = v.Cursor.line_str_side_r_with_c()
  crct_str = v.Str.trim(crct_str)

  local cursor_col_idx = v.Cursor.col_num()
  local space_len = col_idx - cursor_col_idx
  local space_str = v.Str.space(space_len)

  v.Cursor.f_str__del()
  v.Cursor.__ins(space_str)
  v.Cursor.__ins(crct_str)

  v.Cursor.__mv_by_col_num(cursor_col_idx)
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

  if v.Cursor.line_end_col() == 1 then
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

function v.Cursor.is_line_str__ptn(ptn) -- todo dev

  local str = v.Cursor.line_str_side_r()

  local ret = bl.f

  if v.Str.is__ptn(str, ptn) then
    ret = bl.t
  end
  return ret
end

-- indnt

function v.Cursor.line_indnt__add(col)

  if col == 0 then
    return
  end

  v.Cmd.nml('0')

  local char = ' '
  -- v.Log.val(vim.bo.expandtab)
  if not vim.bo.expandtab then
    char = ' '
    col = col
  else
    -- dev anchor : todo dev
    char = '\t'
    -- char = vim.api.nvim_replace_termcodes('\t', bl.f, bl.f, bl.t)
    col = col / 2
  end
  v.Cursor.__ins_mlt(char, col)

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

  local col = 2
  v.Cursor.line_indnt__add(col)
end


function v.Cursor.line_indnt__crct() -- alias

  local col = 0

  if bl.t then
    col = v.Cursor.line_indnt__crct_with_c()
    return col
  else
    -- dev anchor
    v.Cursor.line_indnt__crct_with_nml()
    return col
  end
end

function v.Cursor.line_indnt__crct_with_nml()

  v.Cmd.nml('1==')
  return
end

function v.Cursor.line_indnt__crct_with_c()

  v.Cursor.line_indnt__del()

  local col = v.Cursor.line_indnt_col_with_c()
  --v.Log.val( col )

  v.Cursor.line_indnt__add(col)
  return col
end

function v.Cursor.line_indnt_col_with_c()

  local line_num = v.Cursor.line_num()
  local col = vf.cindent(line_num)
  return col
end

