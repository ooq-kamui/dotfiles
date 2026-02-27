
v.Srch = {}

function v.Srch.srch(ptn_vim, opt, line_num) -- run vim srch

  local ret = bl.t

  local st = vf.search(ptn_vim, opt, line_num)

  if st == 0 then
    ret = bl.f
  end

  return ret
end

-- srch str

function v.Srch.str_plain()

  return v.Srch._str_plain
end

function v.Srch.str_plain__(str)

  v.Srch._str_plain = str
end

function v.Srch.str_vim()

  local str = v.Rgstr.get('/')
  return str
end

function v.Srch.str_vim__(str_plain, op_word1)

  v.Srch.str_plain__(str_plain)

  local str_vim

  str_vim = v.Srch.str_plain_to_str_vim(str_plain)

  if op_word1 then
    str_vim = v.Srch.str_vim_to_word1(str_vim)
  end

  if str_vim == v.Srch.str_vim() then -- same ltst
    return
  end

  v.Rgstr.__('/', str_vim)  -- highlight
  v.Cmd.nml('/' .. str_vim) -- srch hstry add
end

function v.Srch.str_plain_to_str_vim(str_plain)

  -- local escape_chars = '.*~[]\\^$'
  local escape_chars = '.*~[]^$' .. [[\]]
  local str_vim = v.Str.escape(str_plain, escape_chars)
  -- v.Log.val(str_vim)

  return str_vim
end

-- function v.Srch.str_vim_flt()
-- 
--   return v.Srch._str_vim_flt
-- end

-- function v.Srch.str_vim_flt__(str)
-- 
--   v.Srch._str_vim_flt = str
-- end

function v.Srch.str_vim_to_word1(str_vim)

  if not str_vim then
    str_vim = v.Srch.str_vim()
  end

  if v.Str.is__ptn(str_vim, '^' .. v.Ptn.vim.word_char       ) then
    str_vim = [[\<]] .. str_vim
  end

  if v.Str.is__ptn(str_vim,        v.Ptn.vim.word_char .. '$') then
    str_vim =           str_vim .. [[\>]]
  end

  return str_vim
end

function v.Srch.str_vim__ptn(ptn_vim)

  v.Rgstr.__('/', ptn_vim)
end

function v.Srch.str__cursor_word()

  local str = v.Cursor.word()

  if v.Str.is__emp(str) then return end

  v.Srch.str_vim__(str, bl.f)
end

function v.Srch.str__word1_tgl()

  local str = v.Srch.str_plain()

  if v.Srch.is_str_vim__word1() then

    v.Srch.str_vim__(str, bl.f)
  else
    v.Srch.str_vim__(str, bl.t)
  end
end

function v.Srch.str_ltst(idx)

  local str = vf.histget('/', - idx)
  return str
end

function v.Srch.prv_tgl_str()

  local prv_tgl_str

  if v.Srch.str_vim() == v.Srch.str_ltst(1) then

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
  v.Srch.str_vim__(str, bl.f)
  v.Slctd.__clr()
end

function v.Srch.__slct(drct)

  v.Slctd.__srch(drct)
end

function v.Srch.char(drct, char)

  -- v.Rgstr.__('/', '[' .. char .. ']')
  v.Srch.str_vim__ptn('[' .. char .. ']')

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

function v.Srch.str__markdown_heading()

  v.Srch.str_vim__ptn(v.Ptn.vim.markdown_heading)
end

v.Ptn.markdown_itm = '^ *- '

function v.Srch.str__markdown_itm()

  v.Srch.str_vim__ptn(v.Ptn.markdown_itm)
end

function v.Srch.str__fnc_def()

  local file_type = v.Buf.file_type()

  if     file_type == 'lua'    then
    v.Srch.str_vim__ptn(v.Ptn.vim.fnc_def.lua   )

  elseif file_type == 'python' then
    v.Srch.str_vim__ptn(v.Ptn.vim.fnc_def.python)

  else
    v.Srch.str_vim__ptn(v.Ptn.vim.fnc_def.dflt  )
  end
end

-- srch cnd

function v.Srch.is_str_vim__word1()

  local ret = bl.f

  local str = v.Srch.str_vim()

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

