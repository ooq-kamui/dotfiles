
-- srch

v.Srch = {}


-- srch exe, ref: cursor __ mv srch ptn

function v.Srch_or(...)

  local arg = {...}

  local str = '\\(' .. f.join(arg, '\\|') .. '\\)'
  --print( str )

  -- v.Rgstr__('/', str)
  v.Srch_str__ptn(str)

  v.Cursor__mv_srch('f')
end

function v.Srch_str()

  -- local str = @/
  local str = f.getref('/')
  return str
end

function v.Srch_str_flt()

  -- local str = @/
  local str = v.Rgstr_get('/')

  if v.Is_srch__word1() then
    str = f.strcharpart(str, 2, f.strchars(str) - 4)
  end
  -- print( str )

  return str
end

function v.Srch_str_word1(str)

  if str == nil then
    str = v.Srch_str_flt()
  end

  str = '\\<' .. str .. '\\>'
  return str
end

-- srch str __

function v.Srch_str__(str, op_word1)

  local exe_str = str

  exe_str = f.escape(exe_str, '.*~[]\\^$')

  exe_str = f.substitute(exe_str, '\\n', '\\\\n', 'g')
  -- print( exe_str )

  if op_word1 == true then
    exe_str = v.Srch_str_word1(exe_str)
  end

  if v.Rgstr_get('/') == exe_str then -- same ltst 01
    return
  end

  v.Rgstr__('/', exe_str) -- highlight

  v.Cmd.nml('/' .. exe_str) -- srch hstry add
end

function v.Srch_str__ptn(ptn)

  v.Rgstr__('/', ptn)
end

function v.Srch_str__cursor_word()

  local str = v.Cursor_word()
  v.Srch_str__(str, false)
end

function v.Srch_str__word1_tgl()

  local str = v.Srch_str_flt()

  if v.Is_srch__word1() then

    v.Srch_str__(str, false)
  else
    v.Srch_str__(str, true)
  end
end

function v.Srch_str_ltst(idx)

  local str = f.histget('/', - idx)
  return str
end

function v.Srch_str__prv_tgl()

  local srch_str

  -- if @/ == v.Srch_str_ltst(1) then
  if v.Rgstr_get('/') == v.Srch_str_ltst(1) then

    if              v.Srch_str_ltst(1)          == '\\<' .. v.Srch_str_ltst(2) .. '\\>' then

      srch_str = v.Srch_str_ltst(3)

    elseif '\\<' .. v.Srch_str_ltst(1) .. '\\>' ==          v.Srch_str_ltst(2)          then

      srch_str = v.Srch_str_ltst(3)
    else

      srch_str = v.Srch_str_ltst(2)
    end
  else
    srch_str = v.Srch_str_ltst(1)
  end

  v.Rgstr__('/', srch_str)
end

function v.Srch_str__slctd_str() -- range

  if v.Is_slctd_str__srch_str() then
    v.Slctd__cancel()
    return
  end

  v.Slctd__ltst()

  local str = v.Slctd_str()
  v.Srch_str__(str, false)
  v.Slctd__cancel()
end

function v.Srch_slct(drct)

  if     drct == 'f' then
    v.Cmd.nml('gn')

  elseif drct == 'b' then
    v.Cmd.nml('gN')
  end
end

-- refactoring fnc name re ?
function v.Slctd_srch_7_slctd__srch_nxt(drct) -- srch rpl skip

  if     drct == 'f' then
    v.Cmd.nml('`>lgn')

  elseif drct == 'b' then
    v.Cmd.nml('`<hgN')
  end
end

function v.Srch_7_cursor__mv_srch_str_end_o()

  local drct = 'f'
  v.Srch_slct(drct)
  v.Esc()
  -- v.Cmd.nml("\\<esc>")
  v.Esc()
  v.Cursor__mv_char_f()
end

function v.Srch_char(drct, char)

  -- v.Rgstr__('/', '[' .. char .. ']')
  v.Srch_str__ptn('[' .. char .. ']')

  v.Cursor__mv_srch(drct)
end

function v.Srch_char_bracket(drct)

  local char_bracket = "'" .. '")}\\]'
  v.Srch_char(drct, char_bracket)
end

function v.Srch_str__h_swtch()

  if     vim.bo.filetype == 'markdown' then
    v.Srch_str__markdown_h()

  elseif vim.bo.filetype == 'lua' then
    v.Srch_str__fnc_def()

  elseif vim.bo.filetype == 'vim' then
    v.Srch_str__fnc_def()

  else
    v.Srch_str__markdown_h()
  end
end

function v.Srch_str__markdown_h()

  v.Srch_str__ptn('^#\\+ ')
end

function v.Srch_str__markdown_itm()

  v.Srch_str__ptn('^ *- ')
end

function v.Srch_str__fnc_def()

  v.Srch_str__ptn('^func')
end

-- srch cnd

function v.Is_srch__word1()

  -- local str = @/
  local str = v.Rgstr_get('/')
  local ret = false

  local str_l = f.strcharpart(str, 0, 2)
  local str_r = f.strcharpart(str, f.strchars(str) - 2)

  if str_l == '\\<' and str_r == '\\>' then
    ret = true
  end

  return ret
end


