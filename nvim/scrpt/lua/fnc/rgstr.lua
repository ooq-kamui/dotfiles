
-- rgstr

v.Rgstr = {}

v.Ynk = v.Rgstr

v.Rgstr.ynk_key_dflt = 'a'
v.Rgstr.ynk_key_lst  = v.Str.alph_lst('h')

function v.Rgstr.get(rgstr_key) -- alias

  return vf.getreg(rgstr_key)
end

function v.Rgstr.info_rgstr(rgstr_info)

  local rgstr = v.Str.sub_by_char_idx(rgstr_info, 7, 7)
  -- v.Log.val(rgstr)
  return rgstr
end

function v.Rgstr.__(rgstr_key, val) -- alias

  vf.setreg(rgstr_key, val)
end

function v.Rgstr.__clr() -- use not

  for idx, key in pairs(v.Rgstr.ynk_key_lst) do

    v.Rgstr.__(key, '')
  end
end

function v.Rgstr.__shft()

  local a = v.Rgstr.get(v.Rgstr.ynk_key_lst[1])
  local b = v.Rgstr.get(v.Rgstr.ynk_key_lst[2])

  if a == b then
    return
  end

  local idx = v.Tbl.len(v.Rgstr.ynk_key_lst)
  while idx >= 2 do
    v.Rgstr.__(v.Rgstr.ynk_key_lst[idx], v.Rgstr.get(v.Rgstr.ynk_key_lst[idx - 1]))
    idx = idx - 1
  end
end

-- ynk

function v.Rgstr.ynk(ynk_key)

  ynk_key = ynk_key or v.Rgstr.ynk_key_dflt

  return v.Rgstr.get(ynk_key)
end

function v.Rgstr.ynk__(str, ynk_key)

  ynk_key = ynk_key or v.Rgstr.ynk_key_dflt

  local str_crnt = v.Rgstr.get(ynk_key)

  if str_crnt == str then
    return
  end

  v.Rgstr.__shft()
  v.Rgstr.__(ynk_key, str)
end

function v.Rgstr.ynk__clr(ynk_key)

  ynk_key = ynk_key or v.Rgstr.ynk_key_dflt

  v.Rgstr.__(ynk_key, '')
end

function v.Rgstr.ynk__cursor_line()

  v.Cmd.nml('"ayy') -- refactoring
  -- line_str = Cursor.line_str()
  -- let @a = line_str

  v.Rgstr.clp__ynk()
end

function v.Rgstr.ynk__line_all()

  local cmd = '%y' -- todo rgstr a direct
  v.Cmd.cmd(cmd)

  v.Rgstr.ynk__(v.Rgstr.get('0'))
  v.Rgstr.clp__ynk()
end

function v.Rgstr.ynk__buf_file_path()

  local path = v.Buf.file_path()

  v.Rgstr.ynk__(path)
  v.Rgstr.clp__ynk()
end

function v.Rgstr.ynk__clp()

  local str = v.Rgstr.clp()
  v.Rgstr.ynk__(str)
end

function v.Rgstr.ynk__slctd()

  v.Slctd.__ltst()

  local str, cmd_nml

  if v.Mode.is__box() then

    cmd_nml = '"a' .. 'y'
    v.Cmd.nml(cmd_nml)

  else
    str = v.Slctd.str()
    v.Rgstr.ynk__(str)
  end

  v.Rgstr.clp__ynk()

  v.Slctd.__clr()
end

function v.Rgstr.ynk__add_slctd()

  v.Cmd.nml('gv"Ay')
  v.Rgstr.clp__ynk()
end

function v.Rgstr.ynk__by_rgstr_info(rgstr_info)

  local rgstr = v.Rgstr.info_rgstr(rgstr_info)
  local scrpt = 'let @a = @' .. rgstr
  v.Cmd.cmd(scrpt)
end

-- clp

function v.Rgstr.clp()

  local str = v.Rgstr.get('+')
  return str
end

function v.Rgstr.clp__ynk()

  if v.Env.is__('linux') then
    return
  end

  local str = v.Rgstr.ynk()
  v.Rgstr.__('+', str)
end

