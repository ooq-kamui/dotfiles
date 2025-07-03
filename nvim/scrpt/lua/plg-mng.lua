
-- plg

-- vim-plug

g.plg_mng_cmd = [[
  call plug#begin()

  " vim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " nvim
  Plug 'ojroques/nvim-osc52'
  Plug 'stevearc/oil.nvim'

  " Plug 'shellRaining/hlchunk.nvim'
  " Plug 'sphamba/smear-cursor.nvim'
  " Plug 'folke/noice.nvim'
  " Plug 'MunifTanjim/nui.nvim'
  call plug#end()

  " lua require('smear_cursor').enabled = true
  " lua require("noice").setup()
]]

if v.Is_vim_plg__installed() then

  -- print('plug#begin')
  vim.cmd(g.plg_mng_cmd)
end
-- do :PlugInstall
-- or :PlugUpdate
-- or :PlugClean

osc52 = require('osc52')
require("oil").setup({
  keymaps = {
    ["<c-j>"] = { "actions.select", opts = { tab = true } },
  },
})

-- lazy

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


