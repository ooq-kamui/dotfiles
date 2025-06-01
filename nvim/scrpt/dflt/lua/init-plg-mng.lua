-- 
-- plg
-- 

-- 
-- vim-plug
-- 

function v.Vim_plg_path()

  local vim_plg_dir_linux = g_home_dir .. '/.local/share/nvim/site'
  local vim_plg_dir_mac   = vim_plg_dir_linux
  local vim_plg_dir_win   = g_home_dir .. '/AppData/Local/nvim-data/site'

  local vim_plg_dir = vim_plg_dir_linux -- dflt

  if     v.Is_env__('mac') then

    vim_plg_dir = vim_plg_dir_mac

  elseif v.Is_env__('linux') then

    vim_plg_dir = vim_plg_dir_linux

  elseif v.Is_env__('win64') then

    vim_plg_dir = vim_plg_dir_win

  elseif v.Is_env__('win32unix') then -- gitbash

    vim_plg_dir = vim_plg_dir_win
  end

  local vim_plg_path = vim_plg_dir .. '/autoload/plug.vim'
  return vim_plg_path
end

function v.Is_vim_plg__installed()

  local vim_plg_path = v.Vim_plg_path()
  -- print( vim_plg_path )

  local ret = f.empty(f.glob(vim_plg_path)) == 0
  -- print( 'vim-plug installed : ', ret)
  return ret
end

-- 
-- init
-- 

g_plg_mng_cmd = [[
  call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/vim-molder'
  " Plug 'mattn/vim-molder-operations'
  " Plug 'jacquesbh/vim-showmarks'

  " nvim
  Plug 'ojroques/nvim-osc52'

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

  vim.cmd(g_plg_mng_cmd)
end
-- do :PlugInstall
-- or :PlugUpdate
-- or :PlugClean


-- 
-- lazy
-- 

-- require('init-plg' )

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


