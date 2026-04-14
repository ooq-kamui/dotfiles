
v.Srch = {}

function v.Srch.srch(ptn_vim, opt, line_num) -- exe vim srch

  local ret = bl.t

  -- v.Log.log('vf.search()', ptn_vim, opt, line_num)
  local st = vf.search(ptn_vim, opt, line_num)

  if st == 0 then
    ret = bl.f
  end

  return ret
end

-- srch str

function v.Srch.str_plain()

  v.Srch.str_plain__restore()

  return v.Srch._str_plain
end

function v.Srch.str_plain__restore()

  local str_vim = v.Srch.str_vim()

  local str_plain = v.Srch._str_plain
  local str_vim_by_plain = v.Srch.str_plain_to_str_vim(str_plain)
  if v.Srch.is_str_vim__word1() then
    str_vim_by_plain = v.Srch.str_vim_to_word1(str_vim_by_plain)
  end

  if str_vim_by_plain == str_vim then
    return
  end

  v.Srch._str_plain = str_vim
end

function v.Srch.str_plain__(str)

  if v.Srch._str_plain == str then return end

  v.Srch._str_plain_prv = v.Srch._str_plain
  v.Srch._str_plain     = str
end

function v.Srch.str_plain__tgl()

  local tmp = v.Srch._str_plain_prv or ''
  v.Srch._str_plain_prv = v.Srch._str_plain
  v.Srch._str_plain     = tmp
end

function v.Srch.str_vim()

  local str_vim = v.Rgstr.get('/')
  return str_vim
end

function v.Srch.str_vim__(str_plain, word1_flg)

  v.Srch.str_plain__(str_plain)

  local str_vim = v.Srch.str_plain_to_str_vim(str_plain)

  if word1_flg then
    str_vim = v.Srch.str_vim_to_word1(str_vim)
  end

  if str_vim == v.Srch.str_vim() then -- same ltst
    return
  end

  v.Srch.str_vim__ptn(str_vim)
end

function v.Srch.str_plain_to_str_vim(str_plain)

  local escape_chars = '.*~[]^$' .. [[\]]
  local str_vim = v.Str.escape(str_plain, escape_chars)
  return str_vim
end

function v.Srch.str_vim_to_word1(str_vim)

  if not str_vim then
    str_vim = v.Srch.str_vim()
  end

  if v.Str.is__ptn(str_vim, '^' .. v.Ptn.vim.word_char_set       ) then
    str_vim = [[\<]] .. str_vim
  end

  if v.Str.is__ptn(str_vim,        v.Ptn.vim.word_char_set .. '$') then
    str_vim =           str_vim .. [[\>]]
  end

  return str_vim
end

function v.Srch.str_vim__ptn(ptn_vim)

  if v.Str.is__cr_in(ptn_vim) then return end

  v.Srch.hl__(ptn_vim)
  v.Srch.hstry__add(ptn_vim)
end

function v.Srch.hl__(ptn_vim) -- highlight

  v.Rgstr.__('/', ptn_vim)
end

function v.Srch.hstry__add(ptn_vim)

  ptn_vim = v.Str.escape(ptn_vim, [[\"]])
  v.Cmd.cmd('exe "normal! ' .. '/' .. ptn_vim .. '"') -- not v.Nml.exe()
end

function v.Srch.str__cursor_word()

  local str = v.Cursor.word()

  if v.Str.is__emp(str) then return end

  local word1_flg = bl.f
  v.Srch.str_vim__(str, word1_flg)
end

function v.Srch.str_vim__word1_tgl()

  local word1_flg

  if v.Srch.is_str_vim__word1() then
    word1_flg = bl.f
  else
    word1_flg = bl.t
  end

  local str = v.Srch.str_plain()
  v.Srch.str_vim__(str, word1_flg)
end

function v.Srch.str_vim_ltst(idx)

  local str = vf.histget('/', - idx)
  return str
end

function v.Srch.str_vim_prv()

  local str_plain_prv = v.Srch._str_plain_prv or ''
  local str_vim_prv = v.Srch.str_plain_to_str_vim(str_plain_prv)
  return str_vim_prv
end

-- srch str vim __ xx

function v.Srch.str_vim__prv_tgl()

  local str_vim_prv = v.Srch.str_vim_prv()
  v.Srch.str_plain__tgl()
  v.Srch.str_vim__ptn(str_vim_prv)
end

function v.Srch.str_vim__heading_swtch()

  if     v.Buf.is_file_type__('markdown') then
    v.Srch.str_vim__markdown_heading()

  elseif v.Tbl.is__in(v.File.type.fnc_def_lang_lst, v.Buf.file_type()) then
    v.Srch.str_vim__fnc_def()

  else -- default
    v.Srch.str_vim__markdown_heading()
  end

  v.Cursor.__mv_srch_str('b')
end

function v.Srch.str_vim__markdown_heading()

  v.Srch.str_vim__ptn(v.Ptn.vim.markdown_heading)
end

function v.Srch.str_vim__markdown_itm()

  v.Srch.str_vim__ptn(v.Ptn.vim.markdown_itm)
end

function v.Srch.str_vim__fnc_def()

  local file_type = v.Buf.file_type()
  local ptn = v.Ptn.vim.fnc.def[file_type] or v.Ptn.vim.fnc.def.dflt
  v.Srch.str_vim__ptn(ptn)
end

function v.Srch.str_vim__clp()

  local str = v.Rgstr.clp()
  v.Srch.str_vim__ptn(str)
end

-- slctd

function v.Srch.str_vim__slctd_str() -- range

  if v.Slctd.is_str__srch_str_plain() then
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

function v.Srch.__slct(drct) -- alias

  v.Slctd.__srch(drct)
end

-- srch char

function v.Srch.char(drct, char)

  v.Srch.str_vim__ptn('[' .. char .. ']')
  v.Cursor.__mv_srch_str(drct)
end

function v.Srch.char_bracket(drct)

  local char_bracket_ptn = "'" .. '"'

  if     drct == 'f' then
    char_bracket_ptn = char_bracket_ptn .. ')}\\]'
  elseif drct == 'b' then
    char_bracket_ptn = char_bracket_ptn .. '({\\['
  end

  v.Srch.char(drct, char_bracket_ptn)
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
    local str_vim = v.Srch.str_vim_ltst(1)
    v.Srch.str_vim__ptn(str_vim)
  end, 500)
end

