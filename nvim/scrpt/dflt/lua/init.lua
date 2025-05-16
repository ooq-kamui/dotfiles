
-- print('init.lua')

-- require('init-fnc'     )
-- require('init-fnc-tst' )

-- require('init-plg-mng' )
-- require('init-plg-fzf' )

require('init-opt'     )
require('init-cmd-usr' )
require('init-hl'      )
require('init-key-map' )

-- env

vim.g.env_dir = ''

if     f.Is_env__('mac')       then -- mac
  vim.g.env_dir = 'mac'
  vim.opt.shell = 'fish'

elseif f.Is_env__('linux')     then -- c9, s9
  vim.g.env_dir = 'c9'
  vim.opt.shell = 'fish'

elseif f.Is_env__('win64')     then -- pwsh
  vim.g.env_dir = 'pwsh'
  vim.opt.shell = 'pwsh'

elseif f.Is_env__('win32unix') then -- gitbash
  vim.g.env_dir = 'gitbash'
  vim.opt.shell = 'bash'
end

if vim.g.env_dir ~= '' then
  -- dev anchor
  print("env dir : " .. vim.g.env_dir)
  -- require(vim.g.init_vim_dir .. '/' .. vim.g.env_dir .. '/init.lua')
else
  print("is env else")
end


