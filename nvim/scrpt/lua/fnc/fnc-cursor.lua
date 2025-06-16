
-- cursor

-- cursor pos

function v.Cursor_pos() -- alias

  local pos = f.getpos('.')
  return pos
end

-- cursor col

function v.Cursor_col_num()

  return f.col('.')
end

function v.Cursor_col_idx()

  local idx = f.col('.') - 1
  return idx
end

-- cursor col cnd

function v.Is_cursor_col__line_end()

  if v.Cursor_col_num() == v.Cursor_line_end_col() then
    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_end_ovr() -- range

  if v.Cursor_col_num() >= v.Cursor_line_end_col() then
    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_end_inr()

  if v.Cursor_col_num() == v.Cursor_line_end_col() - 1 then

    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_top0()

  if v.Cursor_col_num() == 1 then
    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_top1()

  local pos_c = v.Cursor_pos()

  local col_c = v.Cursor_col_num()
  
  v.Cursor__mv_line_top1()
  local col_s1 = v.Cursor_col_num()
  
  f.setpos('.', pos_c)
  
  if col_c == col_s1 then
    return true
  else
    return false
  end
end

-- cursor __ mv

function v.Cursor__mv_by_col_num(col_num)

  if not v.Is_str__num(col_num) then
    return
  end

  local line_num = v.Cursor_line_num()

  v.Cursor__mv_by_line_col(line_num, col_num)
end

function v.Cursor__mv_by_line_num(line_num)

  if not v.Is_str__num(line_num) then
    return
  end

  -- dev anchor
  v.Normal(line_num .. 'G')
end

function v.Cursor__mv_by_line_col(line_num, col)

  local line_num = (line_num == nil) and v.Cursor_line_num() or line_num

  f.cursor(line_num, col)
end

function v.Cursor__mv_by_line_info(line_info)

  v.log = line_info

  local line_num = v.Line_num_by_Line_info(line_info)
  v.Cursor__mv_by_line_num(line_num)
end

function v.Cursor__mv_by_pos(pos)
  
  f.setpos('.', pos)
end

function v.Cursor__mv_line_top0()

  if v.Is_cursor_line_str__emp() then
    return
  end

  v.Normal('0')
end

function v.Cursor__mv_line_top1()

  if     v.Is_cursor_line_str__space() then
    v.Cursor__mv_line_end()

  elseif v.Is_line_markdown_itm() then
    v.Normal('^2l')
  else
    v.Normal('^')
  end
end

function v.Cursor__mv_line_end()

  if v.Is_cursor_line_str__emp() then
    return
  end

  if v.Mode.is__normal() then
    v.Normal('$l')
  else
    v.Normal('$')
  end
end

function v.Cursor__mv_line_end_in()

  if v.Mode.is__normal() then
    v.Normal('$')
  else
    v.Normal('$h')
  end
end

function v.Cursor__mv_char_f()

  v.Normal('l')
end

function v.Cursor__mv_char_b()

  v.Normal('h')
end

function v.Cursor__mv_word_f()

  if     v.Is_cursor_col__line_end() or v.Is_cursor_col__line_end_inr() then

    v.Cursor__mv_char_f()
    return

  elseif v.Is_cursor_line_str_side_r__space() then

    v.Cursor__mv_line_end()
    return
  end

  local c_char = v.Cursor_c_char()
  local r_char = v.Cursor_r_char()

  if v.Is_str__ptn(c_char, ' ') and v.Is_str__ptn(r_char, ' ') then
    v.Normal('w')
  else
    v.Normal('el')
  end
end

function v.Cursor__mv_word_b()

  local l_char = v.Cursor_l_char()

  if     v.Is_cursor_col__line_top0() then
    v.Cursor__mv_u_line_end()

  elseif v.Is_cursor_line_str_side_l__space() then
    v.Cursor__mv_line_top0()

  elseif v.Is_cursor_col__line_top1() then
    v.Cursor__mv_line_top0()

  elseif v.Is_char__symbol(l_char) then
    v.Cursor__mv_char_b()

  else
    v.Normal('b')
  end
end

function v.Cursor__mv_word_dlm_f()

  local ptn = '[_ABCDEFGHIJKLMNOPQRSTUVWXYZ]'

  local line_num = v.Cursor_line_num()

  f.search(ptn, 'zW', line_num)
end

function v.Cursor__mv_word_b_pre() -- use not

  local c_char = v.Cursor_c_char()
  local l_char = v.Cursor_r_char()

  if v.Is_str__ptn(c_char, ' ') and not v.Is_str__ptn(l_char, ' ') then
    v.Normal('gegel')
  else
    v.Normal('gel')
  end
end

function v.Cursor__mv_fnc_name()

  local col
  col = v.Cursor__mv_srch_ptn('(', 'f')

  if col > 0 then
    v.Cursor__mv_word_b()
  end
end

function v.Cursor__mv_u() -- alias

  v.Normal('k')
end

function v.Cursor__mv_d() -- alias

  v.Normal('j')
end

function v.Cursor__mv_v(drct)

  if     drct == 'u' then
    v.Cursor__mv_u()

  elseif drct == 'd' then
    v.Cursor__mv_d()

  else
    v.Cursor__mv_u()
  end
end

g.cursor_mv_line_step_dflt = 10

function v.Cursor__mv_mlt_u() -- alias

  g.cursor_mv_line_step = g.cursor_mv_line_step_dflt

  -- local n_cmd = g.cursor_mv_line_step .. '\\<c-y>'
  -- v.Normal(n_cmd)
  vim.cmd('exe "normal! ' .. g.cursor_mv_line_step .. '\\<c-y>"')
end

function v.Cursor__mv_mlt_d() -- alias

  g.cursor_mv_line_step = g.cursor_mv_line_step_dflt

  -- local n_cmd = g.cursor_mv_line_step .. '\\<c-e>'
  -- v.Normal(n_cmd)
  vim.cmd('exe "normal! ' .. g.cursor_mv_line_step .. '\\<c-e>"')
end

function v.Cursor__mv_u_line_end()

  v.Cursor__mv_u()
  v.Cursor__mv_line_end()
end

function v.Cursor__mv_line_top_or_new_line()

  if     v.Is_cursor_col__line_top0() then

    v.Cursor__ins_line_emp()

  elseif v.Is_cursor_col__line_top1() then

    v.Cursor__mv_line_top0()
  else
    v.Cursor__mv_line_top1()
  end
end

function v.Cursor__mv_slctd_edge_tgl() -- range

  v.Slctd__ltst()
  v.Normal('o')
end

function v.Cursor__mv_slctd_edge_l() -- range

  v.Slctd__ltst()

  if not v.Is_slctd_cursor_pos__r() then
    return
  end

  v.Cursor__mv_slctd_edge_tgl()

  -- local n_cmd = '`<'
  -- v.Normal(n_cmd)
end

function v.Cursor__mv_file_edge(n_cmd)

  if v.Is_cursor_line_num__file_edge() then
    v.Normal(n_cmd)
  end

  local cnt = 1
  local cnt_max = 10000

  while ( not v.Is_cursor_line_num__file_edge() and cnt < cnt_max ) do

    v.Normal(n_cmd)
    cnt = cnt + 1
  end
end

function v.Cursor__mv_file_edge_bgn() -- alias

  v.Cursor__mv_file_edge('k')
end

function v.Cursor__mv_file_edge_end() -- alias

  v.Cursor__mv_file_edge('j')
end

function v.Cursor__mv_v_jmp_char(drct, is_space_through)

  local is_space_through = is_space_through

  local n_cmd = drct

  if drct == 'k' or drct == 'j' then

    n_cmd = drct
  else
    return
  end

  v.Normal(n_cmd)
  local cnt = 1
  local cnt_max = 10000

  while ( not v.Is_cursor_line_num__file_edge() and cnt < cnt_max ) do

    if not ( v.Is_cursor_c_char__space() or v.Is_cursor_col__line_end() ) then
      break
    end

    if ( is_space_through == 'f' and v.Is_cursor_c_char__space() ) then
      break
    end

    v.Normal(n_cmd)
    cnt = cnt + 1
  end
end

function v.Cursor__mv_v_jmp_md_h(drct) -- todo dev

  local n_cmd

  if drct == 'k' or drct == 'j' then
    n_cmd = drct
  else
    return
  end

  -- logic write ..

end

function v.Cursor__mv_v_jmp_space(drct)

  local n_cmd

  if drct == 'k' or drct == 'j' then
     n_cmd = drct
  else
    return
  end

  v.Normal(n_cmd)

  local cnt = 1
  local cnt_max = 10000

  while ( not v.Is_cursor_line_num__file_edge() and cnt < cnt_max ) do

    if v.Is_cursor_c_char__space() or v.Is_cursor_col__line_end() then
      break
    end

    v.Normal(n_cmd)
    cnt = cnt + 1
  end
end

function v.Cursor__mv_v_jmp(drct)

  local n_cmd

  if drct == 'k' or drct == 'j' then
    n_cmd = drct
  else
    return
  end

  v.Normal(n_cmd)

  if v.Is_cursor_c_char__space() or v.Is_cursor_col__line_end() then

    v.Cursor__mv_v_jmp_char(n_cmd, 't')
  else
    v.Cursor__mv_v_jmp_space(n_cmd)
  end
end

function v.Cursor__mv_srch_ptn(ptn, drct) -- range

  local opt_drct = ''

  if     drct == 'b' then
    opt_drct = 'b'

  elseif drct == 'f' then
    opt_drct = ''
  end

  local opt = 'W' .. opt_drct

  local line_num = v.Cursor_line_num()

  local col
  col = f.search(ptn, opt, line_num)
  return col
end

function v.Cursor__mv_srch(drct)

  local opt = ''

  if     drct == 'f' then
    opt = ''
  elseif drct == 'b' then
    opt = 'b'
  end

  local ptn = v.Rgstr_get('/')
  f.search(ptn, opt)
end

-- cursor __ ins

function v.Cursor__ins(str)

  local cmd = 'i' .. str
  v.Normal(cmd)
  v.Cursor__mv_char_f()
end

function v.Cursor__ins_with_cursor_fix(str) -- todo dev

end

-- cursor __ ins ynk ( paste )

function v.Cursor__ins_ynk()

  v.Normal('"aP')
end

function v.Cursor__ins_clp()

  v.Ynk__clp()
  v.Cursor__ins_ynk()
end

function v.Cursor__ins_mlt(str, num)

  if num == 0 then
    return
  end

  local cmd = num .. 'i' .. str
  v.Normal(cmd)
end

function v.Cursor__ins_cr()

  -- local t_line_num = f.line('.')
  local line_num = v.Cursor_line_num()

  -- v.Normal('i\\<cr> ')
  vim.cmd('exe "normal! i\\<cr> "')
  v.Normal('x')

  v.Line_end_space__del(line_num)
  v.Cursor__mv_d()
end

function v.Cursor__ins_space(is_cursor_mv)

  if is_cursor_mv then
    v.Cursor__ins(' ')
  else
    v.Normal('i ')
    -- v.Normal('l')
  end
end

function v.Cursor__ins_hyphen()

  v.Normal('i-')
  -- v.Cursor__ins('-')
end

function v.Cursor__ins_tilde()

  v.Normal('i~')
  -- v.Cursor__ins('~')
end

function v.Cursor__ins_slash()

  v.Normal('i/')
  -- v.Cursor__ins('/')
end

function v.Cursor__ins_slashback()

  v.Normal('i\\')
  -- v.Cursor__ins('\\')
end

function v.Cursor__ins_quote()

  v.Normal("i' '")
  v.Normal('h')
end

function v.Cursor__ins_da()

  local da = f.strftime('%Y-%m-%d')
  v.Cursor__ins(da)
end

function v.Cursor__ins_tm()

  local tm = f.strftime('%H:%M')
  v.Cursor__ins(tm)
end

function v.Cursor__ins_dt()

  local dt = f.strftime('%Y-%m-%d.%H:%M')
  v.Cursor__ins(dt)
end

function v.Cursor__ins_ts()

  local ts = f.strftime('%Y-%m-%d.%H:%M:%S')
  v.Cursor__ins(ts)
end

g.week_def = { 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' }

function v.Cursor__ins_week()

  local idx  = f.strftime('%w') + 1
  local week = g.week_def[idx]
  v.Cursor__ins(week)
end

-- cmnt

function v.Cursor__ins_cmnt_1(cmd_cursor__mv_line_top)

  -- if cmd_cursor__mv_line_top ~= nil then
  if cmd_cursor__mv_line_top then
    v.Normal(cmd_cursor__mv_line_top)
  end

  local str = v.Str_cmnt_1()
  v.Normal('i' .. str)
  
  v.Normal('^') -- or '0'
end

function v.Cursor__ins_rgstr_by_rgstr_info(rgstr_info)

  local rgstr = v.Rgstr_info_rgstr(rgstr_info)
  -- v.Normal('"' .. rgstr .. rgstr .. 'P')
  v.Normal('"' .. rgstr .. 'P')
end

function v.Cursor__ins_cmnt_mlt(pos_key) -- call when mode normal

  v.Cursor__ins_cmnt_mlt_by_pos_key('end')
  v.Cursor__ins_cmnt_mlt_by_pos_key('bgn')
end

function v.Cursor__ins_cmnt_mlt_by_pos_key(pos_key)

  local cmnt_mlt_def = {
    lua        = {[[--[[]] , '--]]'},
    html       = {'<!--'   ,  '-->'},
    css        = {'/*'     ,  ' */'},
    javascript = {'/*'     ,  ' */'},
    java       = {'/*'     ,  ' */'},
    dflt       = {'/*'     ,  ' */'},
  }

  local str = f.get(cmnt_mlt_def, vim.bo.filetype, cmnt_mlt_def['dflt'])

  if     pos_key == 'bgn' then
    v.Normal('O')
    v.Normal('i' .. str[1])

  elseif pos_key == 'end' then
    v.Normal('o')
    v.Normal('i' .. str[2])
  end
end

-- markdown

function v.Cursor__ins_markdown_h()

  v.Cursor__mv_line_top0()
  local top0_char = v.Cursor_c_char()

  local str = '#'

  if top0_char ~= str then
    str = str .. ' '
  end

  v.Cursor__ins(str)

  local ptn = '^#* '
  local col = v.Str_srch_end(v.Cursor_line_str(), ptn) + 1
  v.Cursor__mv_by_line_col(nil, col)
end

function v.Cursor__ins_markdown_cr()

  v.Cursor__ins('  ')
end

function v.Cursor__ins_markdown_itm()

  if v.Is_line_markdown_itm() then
    v.Cursor_line_indnt__shft_r()
    return
  end

  local col = v.Cursor_line_indnt__crct()

  local str = '- '
  --print( str )
  v.Cursor_line_top1__ins(str)
end

function v.Cursor__ins_markdown_code()

  local str = '```'
  v.Cursor__ins_line(str)
end

function v.Char_markdown_chk__tgl()

  if v.Cursor_l_char() ~= '[' or v.Cursor_r_char() ~= ']' then
    return
  end

  local cursor_char = v.Cursor_c_char()

  local rpl_char

  if cursor_char == ' ' then
    rpl_char = 'x'
  else
    rpl_char = ' '
  end

  v.Cursor_char__rpl(rpl_char)
end

-- cursor char

function v.Cursor_c_char()

  -- local idx = v.Cursor_col_idx()
  local idx = v.Cursor_col_idx() + 1
  -- local c = v.Cursor_line_str()[idx]
  local str = v.Cursor_line_str()
  c = str:sub(idx, idx)
  return c
end

function v.Cursor_l_char()

  -- local idx = v.Cursor_col_idx() - 1
  local idx = v.Cursor_col_idx()
  -- local c = v.Cursor_line_str()[idx]
  local c = v.Cursor_line_str():sub(idx, idx)
  return c
end

function v.Cursor_r_char()

  -- local idx = v.Cursor_col_idx() + 1
  local idx = v.Cursor_col_idx() + 2
  -- local c = v.Cursor_line_str()[idx]
  local c = v.Cursor_line_str():sub(idx, idx)
  return c
end

function v.Cursor_u_char()

  if v.Is_cursor_line_num__file_edge_bgn() then
    return ''
  end

  local idx = v.Cursor_col_idx() + 1
  local line_num = v.Cursor_line_num() - 1

  -- local c = f.getline(line_num):sub(idx, idx)
  local c = v.Line_str_by_line_num(line_num):sub(idx, idx)
  return c
end

function v.Cursor_d_char()

  if v.Is_cursor_line_num__file_edge_end() then
    return ''
  end

  local idx = v.Cursor_col_idx() + 1
  local line_num = v.Cursor_line_num() + 1
  -- local c = f.getline(line_num):sub(idx, idx)
  local c = v.Line_str_by_line_num(line_num):sub(idx, idx)
  return c
end

-- cursor char __

function v.Cursor_char__rpl(rpl)

  v.Normal('r' .. rpl)
end

function v.Cursor_char__rpl_underscore() -- alias

  -- todo, case: line end

  v.Cursor_char__rpl('_')
  v.Cursor__mv_char_f()
  -- v.Cursor__mv_char_forward() -- todo, fnc cre
end

function v.N_char__tgl_swtch01() -- todo fnc name mod

  local c = v.Cursor_c_char()

  if     v.Is_char__num(c) then

    v.Cursor_str__icl()
    return

  elseif v.Is_char__alpha(c) then

    v.Normal('v~') -- upper / lower
    return
  end

  local rpl = v.Is_char__tgl_bracket_trn(c)
  if not v.Is_str__emp(rpl) then
    v.Cursor_char__rpl(rpl)
    return
  end

  local rpl = v.Is_char__tgl_symbol(c)
  if not v.Is_str__emp(rpl) then

    v.Cursor_char__rpl(rpl)
    return
  end
end

function v.N_char__tgl_swtch02()

  local c = v.Cursor_c_char()

  if v.Is_char__num(c) then

    v.Cursor_str__dcl()
    return
  end

  v.Cursor_char__tgl_type_shift(c)
end

function v.Cursor_char__tgl_type_shift(c)

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

  if not v.Is_str__emp(rpl) then

    v.Cursor_char__rpl(rpl)
    return
  end
end

function v.Cursor_c_char__del()

  local cmd = '"zx'
  v.Normal(cmd)
end

function v.Cursor_c_char__del_ynk()

  local cmd = '"ax'
  v.Normal(cmd)
end

-- cursor char cnd

function v.Is_cursor_c_char__ptn(ptn)

  local c = v.Cursor_c_char()

  -- if c =~ ptn then
  if v.Is_str__ptn(c, ptn) then
    return true
  else
    return false
  end
end

function v.Is_cursor_c_char__space()

  local ptn = '\\s'
  local ret = v.Is_cursor_c_char__ptn(ptn)
  return ret

  -- local c = v.Cursor_c_char()
  -- 
  -- if v.Is_str__ptn(c, '\\s') then
  --   return true
  -- else
  --   return false
  -- end
end

function v.Is_cursor_c_char__alph()

  local ptn = '\\a'
  local ret = v.Is_cursor_c_char__ptn(ptn)
  return ret
end

-- cursor str

-- cursor str __

function v.Cursor_str__icl()

  -- local n_cmd = "\\<c-a>"
  -- v.Normal(n_cmd)
  vim.cmd('exe "normal! \\<c-a>"')
end

function v.Cursor_str__dcl()

  -- local n_cmd = "\\<c-x>"
  -- v.Normal(n_cmd)
  vim.cmd('exe "normal! \\<c-x>"')
end

function v.Cursor_str_week__icl()

  local week_str = v.Cursor_word()
  local week_idx = f.index(g.week_def, week_str)

  if week_idx == -1 then
    return
  end

  local week_nxt_idx = v.Idx__icl(week_idx, f.len(g.week_def))
  local week_nxt_str = g.week_def[week_nxt_idx]

  v.Slctd_str__word()
  v.Normal('"zd')
  v.Normal('i' .. week_nxt_str)
end

function v.Cursor_str_week__dcl()

  local week_str = v.Cursor_word()
  local week_idx = f.index(g.week_def, week_str)

  if week_idx == -1 then
    return
  end

  local week_nxt_idx = v.Idx__dcl(week_idx, f.len(g.week_def))
  local week_nxt_str = g.week_def[week_nxt_idx]

  v.Slctd_str__word()
  v.Normal('"zd')
  v.Normal('i' .. week_nxt_str)
end

-- cursor etc

function v.Cursor_word()

  local word = f.expand('<cword>')
  return word
end

function v.Cursor_filepath()

  local str

  if     v.Is_env__('mac') then

    str = f.expand('<cfile>')

  elseif v.Is_env__('win64') then

    str = v.Cursor_line_str()

  elseif v.Is_env__('win32unix') then

    str = v.Cursor_line_str()

  else
    str = v.Cursor_line_str()
  end
  
  str = f.trim(str)
  
  return str
end

-- cursor __ ins line

function v.Cursor__ins_line(str)

  local line_num = v.Cursor_line_num() - 1
  f.append(line_num, str)
  v.Cursor__mv_u()
end

function v.Cursor__ins_line_emp()

  local str = ''
  v.Cursor__ins_line(str)
end

function v.Cursor__ins_line_buf_file_path()

  local path = v.Buf_file_path()
  v.Cursor__ins_line(path)
end

function v.Cursor__ins_line_anchor()

  local str  = v.Str_cmnt_1()
  str = str .. 'dev anchor' -- del not
  v.Cursor__ins_line(str)
  v.Cursor_line_indnt__crct()
end

function v.Cursor_d__ins_line(str)

  local line_num = v.Cursor_line_num()
  f.append(line_num, str)
end

function v.Cursor_d__ins_line_space() -- range

  local space_len = v.Cursor_col_num() - 1
  local space_str = v.Str_space(space_len)
  v.Cursor_d__ins_line(space_str)
end

-- cursor line

function v.Cursor_line_num() -- alias

  return f.line('.')
end

function v.Cursor_line_end_col() -- alias

  local col = f.col('$')
  return col
end

-- cursor line str

function v.Cursor_line_str()

  return f.getline('.')
end

function v.Cursor_line_str_len()

  local len = v.Cursor_line_end_col() - 1
  return len
end

function v.Cursor_line_str_side_l()

  local line_l = v.Cursor_line_str():sub(1             , f.col('.') - 1)
  return line_l
end

function v.Cursor_line_str_side_r()

  local line_r = v.Cursor_line_str():sub(f.col('.') + 1)
  return line_r
end

-- todo refactoring Cursor_line_str_side_r() + opt arg
function v.Cursor_line_str_side_r_with_c()

  local line_r = v.Cursor_line_str():sub(f.col('.'))
  return line_r
end

-- cursor line str __

function v.Cursor_line_top0__ins(str)

  v.Cursor__mv_line_top0()
  v.Cursor__ins(str)
end

function v.Cursor_line_top1__ins(str)

  v.Cursor__mv_line_top1()
  v.Cursor__ins(str)
end

function v.Cursor_line_end__dots_adjst() -- todo dev, mb_str

  local line_str = v.Cursor_line_str()
  local idx = v.Str_srch_idx(line_str, f.escape(g.dots_str, '.'))

  if idx >= 0 then
    v.Cursor_line_end_dots__crct()
  else
    v.Cursor_line_end__ins_dots()
  end
end

function v.Cursor_line_end_dots__crct()

  local line_str = v.Cursor_line_str()
  local idx = v.Str_srch_idx(line_str, f.escape(g.dots_str, '.'))

  if     idx < 0 then
    return
  elseif idx == g.dots_put_col then
    return
  end

  local line_str_0 = f.strcharpart(line_str,     0, idx)
  local line_str_1 = f.strcharpart(line_str, idx       )

  if     idx < g.dots_put_col then

    local space_str = v.Str_space(g.dots_put_col - idx)
    line_str = line_str_0 .. space_str .. line_str_1
  else
    line_str_0 = f.strcharpart(line_str_0, 0, g.dots_put_col)
    line_str = line_str_0 .. line_str_1
  end

  local line_num = v.Cursor_line_num()
  f.setline(line_num, line_str)
end

function v.Cursor_line_end__ins_dots()

  local line_num = v.Cursor_line_num()

  local line_str = v.Cursor_line_str()

  local line_str_len = v.Cursor_line_str_len()

  local space_len = g.dots_put_col - line_str_len
  if space_len < 0 then
    space_len = 0
  end

  local space_str = v.Str_space(space_len)

  line_str = line_str .. space_str .. g.dots_str

  f.setline(line_num, line_str)
end

function v.Curosr_line_end__ins(str)

  local n_cmd = 'A' .. str
  v.Normal(n_cmd)
end

-- cursor f

function v.Cursor_f_space__del()

  local c = v.Cursor_c_char()

  -- if c =~ '\\s' then
  if v.Is_str__ptn(c, '\\s') then
    -- print( "del" )
    v.Slctd_str__cursor_f_space()
    v.Normal('"zd')
  else
    v.Nothing()
  end
end

-- cursor __ ins line

function v.Cursor_line__del()

  if v.Is_cursor_line_str__emp() or v.Is_cursor_line_str__space() then
    v.Normal('"_dd') -- rgstr del
  else
    v.Normal('"add')
    v.Clp__ynk()
  end
end

function v.Cursor_f_str__crct_by_line_u()

  v.Cursor_f_str__crct_by_line('u')
end

function v.Cursor_f_str__crct_by_line_d()

  v.Cursor_f_str__crct_by_line('d')
end

function v.Cursor_f_str__crct_by_line(target_line_drct)

  local cursor_pos = v.Cursor_pos()

  local str = v.Cursor_line_str_side_r_with_c()
  local trim_len = v.Str_srch_idx(str, '[^ ]')
  -- print( trim_len )
  local str = f.trim(str)

  local cursor_r_char =  v.Str_l_char(str)
  -- print( cursor_r_char )

  -- todo refactoring, cursor u/d line str
  v.Cursor__mv_v(target_line_drct)

  local target_line_str = v.Cursor_line_str_side_r()

  local turn_drct
  if target_line_drct == 'u' then
    turn_drct = 'd'
  else
    turn_drct = 'u'
  end
  v.Cursor__mv_v(turn_drct)

  local char_idx = v.Str_srch_idx(target_line_str, cursor_r_char)
  if char_idx == -1 then
    return
  end

  local space_len = char_idx + 1
  -- print( space_len )

  space_len = space_len - trim_len
  local space_str = v.Str_space(space_len)
  v.Cursor__ins(space_str)

  v.Cursor__mv_by_pos(cursor_pos)
end

function v.Cursor__ins_sys_cmd(sys_cmd) -- read

  local is_line_num_eq_1 = v.Is_cursor_line_num__file_edge_bgn()

  if is_line_num_eq_1 then
    v.Normal('O')
  else
    -- v.Normal('k')
    v.Cursor__mv_u()
  end

  local cmd = 'read ! ' .. sys_cmd
  v.Cmd(cmd)

  if is_line_num_eq_1 then
    v.Line__del_by_line_num(1)
  end
end

-- cursor line cnd

function v.Is_cursor_line_num__(line_num)

  local ret = false

  local cursor_line_num = v.Cursor_line_num()
  if cursor_line_num == line_num then
    ret = true
  end
  return ret
end

function v.Is_cursor_line_num__file_edge_bgn()

  local line_num = 1
  local ret = v.Is_cursor_line_num__(line_num)
  return ret
end

function v.Is_cursor_line_num__file_edge_end()

  local line_num = v.Line_num_file_edge_end()
  local ret = v.Is_cursor_line_num__(line_num)
  return ret
end

function v.Is_cursor_line_num__file_edge()

  local ret = false

  if v.Is_cursor_line_num__file_edge_bgn() or v.Is_cursor_line_num__file_edge_end() then
    ret = true
  end
  --print( ret )
  return ret
end

function v.Is_cursor_line_str__emp()

  if v.Cursor_line_end_col() == 1 then
    return true
  else
    return false
  end
end

function v.Is_cursor_line_str__space()

  local str = v.Cursor_line_str()
  local ret = v.Is_str__space(str)
  return ret
end

function v.Is_cursor_line_str_side_l__space()

  local str = v.Cursor_line_str_side_l()
  local ret = v.Is_str__space(str)
  return ret
end

function v.Is_cursor_line_str_side_r__space()

  local str = v.Cursor_line_str_side_r()
  local ret = v.Is_str__space(str)
  return ret
end

function v.Is_cursor_line_str__ptn(ptn) -- todo dev

  local str = v.Cursor_line_str_side_r()

  local ret = false

  if v.Is_str__ptn(str, ptn) then
    ret = true
  end
  return ret
end

-- indnt

function v.Cursor_line_indnt_col_with_c()

  local col = f.cindent(v.Cursor_line_num())
  return col
end

function v.Cursor_line_indnt__add(col)

  if col == 0 then
    return
  end

  v.Normal('0')

  local char = ' '
  -- print(vim.bo.expandtab)
  if not vim.bo.expandtab then
    char = ' '
    col = col
  else
    -- dev anchor : todo dev
    char = '\t'
    -- char = vim.api.nvim_replace_termcodes('\t', false, false, true)
    col = col / 2
  end
  v.Cursor__ins_mlt(char, col)

  v.Cursor__mv_line_top1()
end

function v.Cursor_line_indnt__del() -- alias

  v.Cmd('left')
end

function v.Cursor_line_indnt__shft_l()

  v.Normal('<<')
  v.Cursor__mv_line_top1()
end

function v.Cursor_line_indnt__shft_r()

  local col = 2
  v.Cursor_line_indnt__add(col)
end


function v.Cursor_line_indnt__crct()

  local col = v.Cursor_line_indnt__crct_with_c()
  return col
end

function v.Cursor_line_indnt__crct_with_c()

  v.Cursor_line_indnt__del()

  local col = v.Cursor_line_indnt_col_with_c()
  --print( col )

  v.Cursor_line_indnt__add(col)
  return col
end


