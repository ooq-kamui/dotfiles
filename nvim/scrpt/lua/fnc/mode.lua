
-- mode

v.Mode = {}

-- mode ch

function v.Mode.__ins() -- use not

  v.Cmd.cmd('startinsert')
  -- v.Cmd.nml('i')
end

-- cnd

-- normal

function v.Mode.is__normal()

  local ret = bl.f

  if vf.mode() == 'n' then
    ret = bl.t
  end
  return ret
end

-- visual

function v.Mode.is__visual()

  local ret = bl.f

  if v.Mode.is__str() or v.Mode.is__line() or v.Mode.is__box() then
    ret = bl.t
  end
  return ret
end

function v.Mode.is__str()

  local ret = bl.f

  if vf.mode() == 'v' then
    ret = bl.t
  end
  return ret
end

function v.Mode.is__line()

  local ret = bl.f

  if vf.mode() == 'V' then
    ret = bl.t
  end
  return ret
end

function v.Mode.is__box()

  local ret = bl.f

  if vf.mode() == vim.api.nvim_replace_termcodes('<c-v>', bl.f, bl.f, bl.t) then
    ret = bl.t
  end
  return ret
end

-- ins

function v.Mode.is__ins_menu()

  local ret = bl.f

  if vf.pumvisible() == 1 then
    ret = bl.t
  end

  return ret
end


