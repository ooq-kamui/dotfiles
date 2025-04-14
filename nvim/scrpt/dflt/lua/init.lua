
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


-- 
-- key map
-- 

require('init-key-map')




-- 
-- tst
-- 

-- vim.keymap.set('n', 'T', '<cmd>call Tst_fnc_call_fr_lua()<cr>')

-- vim.fn.Tst_fnc_call_fr_lua()


