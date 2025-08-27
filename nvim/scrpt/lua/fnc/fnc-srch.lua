
-- srch

v.Srch = {}

-- srch exe, ref: cursor __ mv srch ptn

function v.Srch._or(...)

  local arg = {...}

  local str = '\\(' .. vf.join(arg, '\\|') .. '\\)'
  --print( str )

  -- v.Rgstr.__('/', str)
  v.Srch.str__ptn(str)

  v.Cursor.__mv_srch('f')
end

function v.Srch.str()

  -- local str = @/
  local str = vf.getref('/')
  return str
end

function v.Srch.str_flt()

  -- local str = @/
  local str = v.Rgstr.get('/')

  if v.Srch.is__word1() then
    str = vf.strcharpart(str, 2, vf.strchars(str) - 4)
  end
  -- print( str )

  return str
end

function v.Srch.str_word1(str)

  if str == nil then
    str = v.Srch.str_flt()
  end

  str = '\\<' .. str .. '\\>'
  return str
end

-- srch str __

function v.Srch.str__(str, op_word1)

  local exe_str = str

  exe_str = vf.escape(exe_str, '.*~[]\\^$')

  exe_str = vf.substitute(exe_str, '\\n', '\\\\n', 'g')
  -- print( exe_str )

  if op_word1 == true then
    exe_str = v.Srch.str_word1(exe_str)
  end

  if v.Rgstr.get('/') == exe_str then -- same ltst 01
    return
  end

  v.Rgstr.__('/', exe_str) -- highlight

  v.Cmd.nml('/' .. exe_str) -- srch hstry add
end

function v.Srch.str__ptn(ptn)

  v.Rgstr.__('/', ptn)
end

function v.Srch.str__cursor_word()

  local str = v.Cursor.word()
  v.Srch.str__(str, false)
end

function v.Srch.str__word1_tgl()

  local str = v.Srch.str_flt()

  if v.Srch.is__word1() then

    v.Srch.str__(str, false)
  else
    v.Srch.str__(str, true)
  end
end

function v.Srch.str_ltst(idx)

  local str = vf.histget('/', - idx)
  return str
end

function v.Srch.str__prv_tgl()

  local srch_str

  if v.Rgstr.get('/') == v.Srch.str_ltst(1) then

    if              v.Srch.str_ltst(1)          == '\\<' .. v.Srch.str_ltst(2) .. '\\>' then

      srch_str = v.Srch.str_ltst(3)

    elseif '\\<' .. v.Srch.str_ltst(1) .. '\\>' ==          v.Srch.str_ltst(2)          then

      srch_str = v.Srch.str_ltst(3)
    else

      srch_str = v.Srch.str_ltst(2)
    end
  else
    srch_str = v.Srch.str_ltst(1)
  end
  u.Log.val(srch_str)

  v.Rgstr.__('/', srch_str)
end

function v.Srch.str__slctd_str() -- range

  if v.Slctd.is_str__srch_str() then
    v.Slctd.__cancel()
    return
  end

  v.Slctd.__ltst()

  local str = v.Slctd.str()
  v.Srch.str__(str, false)
  v.Slctd.__cancel()
end

function v.Srch.slct(drct)

  if     drct == 'f' then
    v.Cmd.nml('gn')

  elseif drct == 'b' then
    v.Cmd.nml('gN')
  end
end

-- refactoring fnc name re ?
function v.Srch.srch_7_slctd__srch_nxt(drct) -- srch rpl skip

  if     drct == 'f' then
    v.Cmd.nml('`>lgn')

  elseif drct == 'b' then
    v.Cmd.nml('`<hgN')
  end
end

function v.Srch._7_cursor__mv_srch_str_end_o()

  local drct = 'f'
  v.Srch.slct(drct)
  v.Esc()
  -- v.Cmd.nml("\\<esc>")
  v.Esc()
  v.Cursor.__mv_char_f()
end

function v.Srch.char(drct, char)

  -- v.Rgstr.__('/', '[' .. char .. ']')
  v.Srch.str__ptn('[' .. char .. ']')

  v.Cursor.__mv_srch(drct)
end

function v.Srch.char_bracket(drct)

  local char_bracket = "'" .. '")}\\]'
  v.Srch.char(drct, char_bracket)
end

function v.Srch.str__h_swtch()

  -- dev anchor
  local fnc_def_lang_lst = {
    'lua', 'vim', 'python', 'javascript',
    'typescript', 'typescriptreact',
  }

  if     vim.bo.filetype == 'markdown' then
    v.Srch.str__markdown_h()

  elseif v.Tbl.is_in(fnc_def_lang_lst, vim.bo.filetype) then
    v.Srch.str__fnc_def()

  else
    v.Srch.str__markdown_h()
  end
end

function v.Srch.str__markdown_h()

  v.Srch.str__ptn('^#\\+ ')
end

function v.Srch.str__markdown_itm()

  v.Srch.str__ptn('^ *- ')
end

function v.Srch.str__fnc_def()

  if     vim.bo.filetype == 'lua'    then
    v.Srch.str__ptn('^function')

  elseif vim.bo.filetype == 'python' then
    v.Srch.str__ptn('^def')

  else
    v.Srch.str__ptn('^function')
  end
end

-- srch cnd

function v.Srch.is__word1()

  -- local str = @/
  local str = v.Rgstr.get('/')
  local ret = false

  local str_l = vf.strcharpart(str, 0, 2)
  local str_r = vf.strcharpart(str, vf.strchars(str) - 2)

  if str_l == '\\<' and str_r == '\\>' then
    ret = true
  end

  return ret
end

-- srch init

function v.Srch.init()

  vim.cmd('silent! /dmy')
  vim.defer_fn(function()
    v.Srch.str__prv_tgl()
  end, 100)
end

