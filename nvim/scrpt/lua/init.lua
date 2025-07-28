
-- print('init.lua')

f = vim.fn
v = {}
g = {}
-- _G.v = v

require('fnc/fnc-prmtv')
require('fnc/fnc-basic')
require('fnc/fnc-plg-fzf') -- todo refactoring
require('plg-mng' )

require('opt'     )
require('cmd-usr' )
require('hl'      )
require('key-map' )

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

  require('env/env-pwsh')

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
  v.Rgstr.ynk__clp()
end

-- srch init
function v.Srch_init() -- use not

  local cmd_nml = '/<cr>N'
  v.Cmd.nml(cmd_nml)
end
--v.Srch_init()

-- init end


