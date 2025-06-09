
-- print('init.lua')

f = vim.fn
v = {}

_G.v = v

g = {}

require('init-fnc'     )
require('init-fnc-tst' )

require('init-plg-mng' )
require('init-plg-fzf' )
osc52 = require('osc52')

require('init-opt'     )
require('init-cmd-usr' )
require('init-hl'      )
require('init-key-map' )

-- env

vim.g.env_dir = ''

if     v.Is_env__('mac')       then -- mac
  vim.g.env_dir = 'mac'
  vim.opt.shell = 'fish'

elseif v.Is_env__('linux')     then -- c9, s9
  vim.g.env_dir = 'c9'
  vim.opt.shell = 'fish'

elseif v.Is_env__('win64')     then -- pwsh
  vim.g.env_dir = 'pwsh'

  vim.opt.shell = 'pwsh'
  -- vim.opt.shell = 'powershell'

  require('init_env_pwsh')

elseif v.Is_env__('win32unix') then -- gitbash
  vim.g.env_dir = 'gitbash'
  vim.opt.shell = 'bash'
end


vim.g.env_dir = ''
v.Env_dir__()

if vim.g.env_dir ~= '' then
  print("env : " .. vim.g.env_dir)
  -- require(vim.g.init_vim_dir .. '/' .. vim.g.env_dir .. '/init.lua')
else
  print("is env else")
end


-- 
-- init
-- 

-- ynk init

if vim.g.env_dir ~= 'c9' then -- c9, s9
  v.Ynk__clp()
end

-- srch init
function v.Srch_init() -- use not

  local n_cmd = '/<cr>N'
  v.Normal(n_cmd)
end
--v.Srch_init()

-- init end


