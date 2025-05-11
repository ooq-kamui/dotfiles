
-- print('init.lua')

-- 
-- plugin mng
-- 

-- lazy.nvim

-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
--   local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
--   if vim.v.shell_error ~= 0 then
--     vim.api.nvim_echo({
--       { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
--       { out, "WarningMsg" },
--       { "\nPress any key to exit..." },
--     }, true, {})
--     vim.fn.getchar()
--     os.exit(1)
--   end
-- end
-- vim.opt.rtp:prepend(lazypath)
-- 
-- require("lazy").setup({
--   spec = {
--     'ojroques/nvim-osc52',
--   },
-- })


-- require('init-fnc' )

require('init-opt'     )
require('init-cmd-usr' )
require('init-hl'      )
require('init-key-map' )


vim.g.env_dir = ''

if     f.Is_env__('mac')       then -- mac
  vim.g.env_dir = 'mac'

elseif f.Is_env__('linux')     then -- c9, s9
  vim.g.env_dir = 'c9'

elseif f.Is_env__('win64')     then -- pwsh
  vim.g.env_dir = 'pwsh'

elseif f.Is_env__('win32unix') then -- gitbash
  vim.g.env_dir = 'gitbash'
end

if vim.g.env_dir ~= '' then
  -- dev anchor
  -- require(vim.g.init_vim_dir .. '/' .. vim.g.env_dir .. '/init.lua')
  print("env : " .. vim.g.env_dir)
else
  print("is env else")
end


-- 
-- tst
-- 

-- vim.keymap.set('n', 'T', '<cmd>call Tst_fnc_call_fr_lua()<cr>')

-- vim.fn.Tst_fnc_call_fr_lua()


