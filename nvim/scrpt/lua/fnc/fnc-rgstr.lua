
-- rgstr

v.Rgstr = {}

function v.Rgstr_get(rgstr_name)

  return f.getreg(rgstr_name)
end

function v.Rgstr_info_rgstr(rgstr_info)

  local rgstr = u.Str.sub(rgstr_info, 7, 7)
  return rgstr
end

function v.Rgstr__(rgstr_name, val)

  f.setreg(rgstr_name, val)
end

function v.Rgstr__clr()

  v.Rgstr__('a', '')
end

function v.Rgstr__shft()

  local a = v.Rgstr_get('a')
  local b = v.Rgstr_get('b')

  if a == b then
    return
  end

  v.Rgstr__('h', v.Rgstr_get('g'))
  v.Rgstr__('g', v.Rgstr_get('f'))
  v.Rgstr__('f', v.Rgstr_get('e'))

  v.Rgstr__('e', v.Rgstr_get('d'))
  v.Rgstr__('d', v.Rgstr_get('c'))
  v.Rgstr__('c', b            )
  v.Rgstr__('b', a            )
end


-- ynk

v.Ynk = {}


function v.Ynk__clr()

  v.Rgstr__('a', '')
end

function v.Ynk__(str)

  local a = v.Rgstr_get('a')

  if a == str then
    return
  end

  v.Rgstr__shft()
  v.Rgstr__('a', str)
end

function v.Ynk__rgstr()

-- todo dev

end

function v.Ynk__cursor_line()

  v.Cmd.nml('"ayy')
  -- line_str = Cursor.line_str()
  -- let @a = line_str

  v.Clp__ynk()
end

function v.Ynk__line_all()

  local cmd = '%y' -- todo rgstr a direct
  v.Cmd.cmd(cmd)

  v.Rgstr__('a', v.Rgstr_get('0'))
  v.Clp__ynk()
end

function v.Ynk__buf_file_path()

  local path = v.Buf_file_path()

  v.Rgstr__('a', path)
  v.Clp__ynk()
end

function v.Ynk__clp()

  v.Rgstr__('a', v.Rgstr_get('+'))
end

function v.Ynk__slctd()

  v.Slctd.__ltst()

  local str, cmd_nml

  if v.Mode.is__box() then

    -- dev anchor
    cmd_nml = '"ay'
    v.Cmd.nml(cmd_nml)

    -- v.Ynk__(str)

  else
    str = v.Slctd.str()
    v.Ynk__(str)
  end

  v.Clp__ynk()

  v.Slctd.__cancel()
end

function v.Ynk__add_slctd()

  v.Cmd.nml('gv"Ay')
  v.Clp__ynk()
end

function v.Ynk__by_rgstr_info(rgstr_info)

  local rgstr = v.Rgstr_info_rgstr(rgstr_info)
  local scrpt = 'let @a = @' .. rgstr
  f.execute(scrpt) -- refactoring ?
end

-- clp

function v.Clp__ynk()

  if v.Is_env__('linux') then
    -- v.C9clp__ynk() -- off
  else
    vim.cmd('let @+ = @a')
    -- v.Rgstr__('+', v.Rgstr_get('a'))
  end
end

