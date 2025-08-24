
-- rgstr

v.Rgstr = {}

function v.Rgstr.get(rgstr_name) -- alias

  return vf.getreg(rgstr_name)
end

function v.Rgstr.info_rgstr(rgstr_info)

  local rgstr = v.Str.sub_by_char_idx(rgstr_info, 7, 7)
  -- print(rgstr)
  return rgstr
end

function v.Rgstr.__(rgstr_name, val)

  vf.setreg(rgstr_name, val)
end

function v.Rgstr.__clr()

  v.Rgstr.__('a', '')
end

function v.Rgstr.__shft()

  local a = v.Rgstr.get('a')
  local b = v.Rgstr.get('b')

  if a == b then
    return
  end

  v.Rgstr.__('h', v.Rgstr.get('g'))
  v.Rgstr.__('g', v.Rgstr.get('f'))
  v.Rgstr.__('f', v.Rgstr.get('e'))

  v.Rgstr.__('e', v.Rgstr.get('d'))
  v.Rgstr.__('d', v.Rgstr.get('c'))
  v.Rgstr.__('c', b               )
  v.Rgstr.__('b', a               )
end

-- ynk

v.Rgstr.Ynk = {}

function v.Rgstr.ynk__clr()

  v.Rgstr.__('a', '')
end

function v.Rgstr.ynk__(str)

  local a = v.Rgstr.get('a')

  if a == str then
    return
  end

  v.Rgstr.__shft()
  v.Rgstr.__('a', str)
end

function v.Rgstr.ynk__rgstr()

-- todo dev

end

function v.Rgstr.ynk__cursor_line()

  v.Cmd.nml('"ayy')
  -- line_str = Cursor.line_str()
  -- let @a = line_str

  v.Rgstr.clp__ynk()
end

function v.Rgstr.ynk__line_all()

  local cmd = '%y' -- todo rgstr a direct
  v.Cmd.cmd(cmd)

  v.Rgstr.__('a', v.Rgstr.get('0'))
  v.Rgstr.clp__ynk()
end

function v.Rgstr.ynk__buf_file_path()

  local path = v.Buf_file_path()

  v.Rgstr.__('a', path)
  v.Rgstr.clp__ynk()
end

function v.Rgstr.ynk__clp()

  v.Rgstr.__('a', v.Rgstr.get('+'))
end

function v.Rgstr.ynk__slctd()

  v.Slctd.__ltst()

  local str, cmd_nml

  if v.Mode.is__box() then

    -- dev anchor
    cmd_nml = '"ay'
    v.Cmd.nml(cmd_nml)

    -- v.Rgstr.ynk__(str)

  else
    str = v.Slctd.str()
    v.Rgstr.ynk__(str)
  end

  v.Rgstr.clp__ynk()

  v.Slctd.__cancel()
end

function v.Rgstr.ynk__add_slctd()

  v.Cmd.nml('gv"Ay')
  v.Rgstr.clp__ynk()
end

function v.Rgstr.ynk__by_rgstr_info(rgstr_info)

  local rgstr = v.Rgstr.info_rgstr(rgstr_info)
  local scrpt = 'let @a = @' .. rgstr
  vf.execute(scrpt) -- refactoring ?
end

-- clp

function v.Rgstr.clp__ynk()

  if v.Is_env__('linux') then
    -- v.C9clp__ynk() -- off
  else
    vim.cmd('let @+ = @a')
    -- v.Rgstr.__('+', v.Rgstr.get('a'))
  end
end

