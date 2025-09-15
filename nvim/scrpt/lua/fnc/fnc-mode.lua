
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

  local ret = c.f

  if vf.mode() == 'n' then
    ret = c.t
  end
  return ret
end

-- visual

function v.Mode.is__visual()

  local ret = c.f

  if v.Mode.is__str() or v.Mode.is__line() or v.Mode.is__box() then
    ret = c.t
  end
  return ret
end

function v.Mode.is__str()

  local ret = c.f

  if vf.mode() == 'v' then
    ret = c.t
  end
  return ret
end

function v.Mode.is__line()

  local ret = c.f

  if vf.mode() == 'V' then
    ret = c.t
  end
  return ret
end

function v.Mode.is__box()

  local ret = c.f

  if vf.mode() == vim.api.nvim_replace_termcodes('<c-v>', c.f, c.f, c.t) then
    ret = c.t
  end
  return ret
end

-- ins

function v.Mode.is__ins_menu()

  local ret = c.f

  if vf.pumvisible() == 1 then
    ret = c.t
  end

  return ret
end


