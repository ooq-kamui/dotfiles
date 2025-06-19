
-- mode

v.Mode = {}

-- normal

function v.Mode.is__normal()

  local ret = false

  if f.mode() == 'n' then
    ret = true
  end
  return ret
end

-- visual

function v.Mode.is__visual()

  local ret = false

  if v.Mode.is__str() or v.Mode.is__line() or v.Mode.is__box() then
    ret = true
  end
  return ret
end

function v.Mode.is__str()

  local ret = false

  if f.mode() == 'v' then
    ret = true
  end
  return ret
end

function v.Mode.is__line()

  local ret = false

  if f.mode() == 'V' then
    ret = true
  end
  return ret
end

function v.Mode.is__box()

  local ret = false

  if f.mode() == vim.api.nvim_replace_termcodes('<c-v>', false, false, true) then
    ret = true
  end
  return ret
end

-- ins

function v.Is_ins_mode__menu()

  local ret = false

  if vim.fn.pumvisible() == 1 then
    ret = true
  end

  return ret
end


