
v.Plg = {}



v.Plg.mng = {}

-- v.Plg.mng.vim_plg = {}
-- 
-- function v.Plg.mng.vim_plg.path()
-- 
--   local vim_plg_dir_linux = v.Dir.c.home_dir .. '/.local/share/nvim/site'
--   local vim_plg_dir_mac   = vim_plg_dir_linux
--   local vim_plg_dir_win   = v.Dir.c.home_dir .. '/AppData/Local/nvim-data/site'
-- 
--   local vim_plg_dir = vim_plg_dir_linux -- dflt
-- 
--   if     v.Env.is__('mac') then
-- 
--     vim_plg_dir = vim_plg_dir_mac
-- 
--   elseif v.Env.is__('linux') then
-- 
--     vim_plg_dir = vim_plg_dir_linux
-- 
--   elseif v.Env.is__('win64') then
-- 
--     vim_plg_dir = vim_plg_dir_win
-- 
--   elseif v.Env.is__('win32unix') then -- gitbash
-- 
--     vim_plg_dir = vim_plg_dir_win
--   end
-- 
--   local vim_plg_path = vim_plg_dir .. '/autoload/plug.vim'
--   return vim_plg_path
-- end
-- 
-- function v.Plg.mng.vim_plg.is__installed()
-- 
--   local vim_plg_path = v.Plg.mng.vim_plg.path()
--   -- v.Log.val( vim_plg_path )
-- 
--   local ret = vf.empty(vf.glob(vim_plg_path)) == 0
--   -- v.Log.val( 'vim-plug installed : ', ret)
--   return ret
-- end

