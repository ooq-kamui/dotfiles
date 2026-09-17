
v.Statusline = {}

function v.Statusline.show__on()

  vim.opt.laststatus = 2
end

function v.Statusline.show__off()

  vim.opt.laststatus = 0
end

function v.Statusline.show__tgl()

  if v.Statusline.is_show__on() then
    v.Statusline.show__off()
  else
    v.Statusline.show__on()
  end
end

-- cnd

function v.Statusline.is_show__on()

  local ret = bl.t

  if vim.opt.laststatus:get() == 0 then
    ret = bl.f
  end
  return ret
end

