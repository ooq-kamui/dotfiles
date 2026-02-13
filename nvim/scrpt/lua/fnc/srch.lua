
-- srch

v.Srch = {}

v.Srch.ptn = {}

v.Srch.ptn.quote = '[' .. "'" .. '"' .. '`' .. ']'

v.Srch.ptn.word_dlm = '[_ABCDEFGHIJKLMNOPQRSTUVWXYZ]'


function v.Srch.srch(ptn, opt, line_num)-- vim srch exe

  local line_num_st = vf.search(ptn, opt, line_num)

  local ret = bl.t

  if line_num_st == 0 then
    ret = bl.f
  end

  return ret
end

function v.Srch._or(...)

  local arg = {...}

  local str = '\\(' .. vf.join(arg, '\\|') .. '\\)'
  --v.Log.val( str )

  v.Srch.str__ptn(str)
  v.Cursor.__mv_by_srch_str('f')
end

function v.Srch.str()

  local str = v.Rgstr.get('/')
  return str
end

function v.Srch.str_flt()
  -- v.Log.val('str_flt init')

  return v.Srch._str_flt

  -- local str = v.Srch.str()
  -- -- v.Log.val(str)
  -- 
  -- if not v.Srch.is__word1() then
  --   return str
  -- end
  -- 
  -- local str_len = v.Str.len(str)
  -- 
  -- -- dev anchor, todo: rpl by ptn
  -- if v.Str.is__ptn(str, [[\\>$]]) then
  --   str = v.Str.sub_by_char_idx(str, 1, str_len - 2)
  -- end
  -- 
  -- if v.Str.is__ptn(str, [[^\\<]]) then
  --   str = v.Str.sub_by_char_idx(str, 3)
  -- end
  -- 
  -- -- v.Log.val('str_flt')
  -- -- v.Log.val(str)
  -- return str
end

function v.Srch.str_flt__(str)

  v.Srch._str_flt = str
end

function v.Srch.str_word1(str)
  -- v.Log.val('str_word1')
  -- v.Log.val(str)

  if not str then
    str = v.Srch.str_flt()
  end
  -- v.Log.val('str_word1')
  -- v.Log.val(str)

  if v.Str.is__ptn(str, [[^\w]]) then
    str = [[\<]] .. str
  end
  
  if v.Str.is__ptn(str, [[\w$]]) then
    str = str .. [[\>]]
  end

  return str
end

-- srch str __

function v.Srch.str__(str, op_word1)

  v.Srch.str_flt__(str)

  local exe_str
  exe_str = v.Str.escape(str, '.*~[]\\^$')

  exe_str = v.Str.__rpl_with_vim(exe_str, [[\n]], [[\\n]], 'g')
  -- v.Log.val( exe_str )

  if op_word1 == bl.t then
    exe_str = v.Srch.str_word1(exe_str)
  end
  -- v.Log.val( exe_str )

  if v.Srch.str() == exe_str then -- same ltst 01
    return
  end

  v.Rgstr.__('/', exe_str) -- highlight

  exe_str = v.Str.__rpl_with_lua(exe_str, [[\]], [[\\]]) -- \\<aaa\\>
  -- v.Log.val( exe_str )
  v.Cmd.nml('/' .. exe_str) -- srch hstry add
end

function v.Srch.str__ptn(ptn)

  v.Rgstr.__('/', ptn)
end

function v.Srch.str__cursor_word()

  local str = v.Cursor.word()

  if v.Str.is__emp(str) then return end

  v.Srch.str__(str, bl.f)
end

function v.Srch.str__word1_tgl()

  local str = v.Srch.str_flt()
  -- v.Log.val(str)

  if v.Srch.is__word1() then

    v.Srch.str__(str, bl.f)
  else
    v.Srch.str__(str, bl.t)
  end
end

function v.Srch.str_ltst(idx)

  local str = vf.histget('/', - idx)
  return str
end

function v.Srch.prv_tgl_str()

  local prv_tgl_str

  if v.Srch.str() == v.Srch.str_ltst(1) then

    if               v.Srch.str_ltst(1)           == [[\<]] .. v.Srch.str_ltst(2) .. [[\>]] then

      prv_tgl_str = v.Srch.str_ltst(3)

    elseif [[\<]] .. v.Srch.str_ltst(1) .. [[\>]] ==           v.Srch.str_ltst(2)           then

      prv_tgl_str = v.Srch.str_ltst(3)

    else -- default
      prv_tgl_str = v.Srch.str_ltst(2)
    end

  else -- default
    prv_tgl_str = v.Srch.str_ltst(1)
  end
  -- v.Log.val(prv_tgl_str)

  -- dev anchor
  -- if prv_tgl_str == '[ \t]*$' then skip ?

  return prv_tgl_str
end

function v.Srch.str__prv_tgl()

  local prv_tgl_str = v.Srch.prv_tgl_str()

  if prv_tgl_str == '[ \\t]*$' then
    return
  end

  v.Rgstr.__('/', prv_tgl_str)
end

function v.Srch.str__slctd_str() -- range

  if v.Slctd.is_str__srch_str() then
    v.Slctd.__clr()
    return
  end

  v.Slctd.__ltst()

  if v.Slctd.is_line__mlt() then
    return
  end

  local str = v.Slctd.str()
  v.Srch.str__(str, bl.f)
  v.Slctd.__clr()
end

function v.Srch.__slct(drct)

  v.Slctd.__srch(drct)
end

function v.Srch.char(drct, char)

  -- v.Rgstr.__('/', '[' .. char .. ']')
  v.Srch.str__ptn('[' .. char .. ']')

  v.Cursor.__mv_by_srch_str(drct)
end

function v.Srch.char_bracket(drct)

  local char_bracket = "'" .. '")}\\]'
  v.Srch.char(drct, char_bracket)
end

function v.Srch.str__heading()

  local fnc_def_lang_lst = {
    'lua',
    'vim',
    'python',
    'javascript',
    'typescript',
    'typescriptreact',
    'ps1',
  }

  if     v.Buf.is_file_type__('markdown') then
    v.Srch.str__markdown_heading()

  elseif v.Tbl.is_in(v.Buf.file_type(), fnc_def_lang_lst) then
    v.Srch.str__fnc_def()

  else -- default
    v.Srch.str__markdown_heading()
  end
end

v.Srch.ptn.markdown_heading = '^#\\+ '

function v.Srch.str__markdown_heading()

  -- v.Srch.str__ptn('^#\\+ ')
  v.Srch.str__ptn(v.Srch.ptn.markdown_heading)
end

v.Srch.ptn.markdown_itm = '^ *- '

function v.Srch.str__markdown_itm()

  -- v.Srch.str__ptn('^ *- ')
  v.Srch.str__ptn(v.Srch.ptn.markdown_itm)
end

function v.Srch.str__fnc_def()

  local file_type = v.Buf.file_type()

  if     file_type == 'lua'    then
    v.Srch.str__ptn('^function')

  elseif file_type == 'python' then
    v.Srch.str__ptn('^ *def')

  else
    v.Srch.str__ptn('^function')
  end
end

-- srch cnd

function v.Srch.is__word1()

  local ret = bl.f

  local str = v.Srch.str()
  local len = v.Str.len(str)

  -- if v.Str.is__ptn(str, [[^\\<]]) and v.Str.is__ptn(str, [[\\>$]]) then
  if v.Str.is__ptn(str, [[^\\<]]) or v.Str.is__ptn(str, [[\\>$]]) then
    ret = bl.t
  end

  return ret
end

-- srch init

function v.Srch.__init()

  v.Cmd.cmd('silent! /dmy')
  vim.defer_fn(function()
    v.Srch.str__prv_tgl()
  end, 500)
end

