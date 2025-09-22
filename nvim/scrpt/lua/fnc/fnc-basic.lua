
-- fnc

require('fnc/fnc-log'   )

-- global

g.dots_str     = ' .. '
g.dots_str_ptn = ' %.%. '
g.dots_put_col = 50

g.home_dir         = vf.expand('$HOME')
g.dotfiles_dir     = g.home_dir      .. '/wrk/prj-pri/dotfiles'
g.nvim_init_dir    = g.dotfiles_dir  .. '/nvim/scrpt'

g.nvim_lua_dir     = g.nvim_init_dir .. '/lua'
g.nvim_lua_fnc_dir = g.nvim_lua_dir  .. '/fnc'
g.nvim_lua_etc_dir = g.nvim_lua_dir  .. ''

g.nvim_lua_env_dir = g.nvim_lua_dir  .. '/env'

require('fnc/fnc-cmd'   )
require('fnc/fnc-dir'   )
require('fnc/fnc-line'  )
require('fnc/fnc-mode'  )
require('fnc/fnc-rgstr' )
require('fnc/fnc-cursor')
require('fnc/fnc-slctd' )
require('fnc/fnc-srch'  )
require('fnc/fnc-ins'   )

require('fnc/fnc-buf'   )
require('fnc/fnc-sys'   )
require('fnc/fnc-mcr'   )

require('fnc/fnc-rg'    )
require('fnc/fnc-jmplst')

require('fnc/fnc-mark'  )

require('fnc/fnc-tst'   )


-- function v.Echo(str) -- alias -- old -- del
-- 
--   print(str)
-- end

-- vim

-- vim basic

function v.Esc() -- alias

  -- v.Cmd.nml('\\<esc>')
  v.Cmd.cmd('exe "normal! \\<esc>"')
end

-- undo clr, file ( crnt buf ? )

function v.Undo__clr()

  local undo_lvl_tmp = vim.bo.undolevels

  vim.opt_local.undolevels = -1
  v.Cmd.cmd([[exe "normal! a \<bs>\<esc>"]])

  vim.bo.undolevels = undo_lvl_tmp
end

-- syntax color

function v.Hl_grp()

  -- print( vf.synIDattr(vf.synID(vf.line('.'), vf.col('.'), 1), 'name') )
  local cmd = "echo synIDattr(synID(line('.'), col('.'), 1), 'name')"
  v.Cmd.cmd(cmd)
  -- print(  )
end
-- and
-- :hi [grp name]

function v.Color_name_lst()

  local cmd = "so $VIMRUNTIME/syntax/colortest.vim"
  v.Cmd.cmd(cmd)
end

-- env

function v.Is_env__(env) -- alias

  -- env : 'mac', 'win64', 'win32', 'wsl', 'linux'

  local ret = ( vf.has(env) == 1 )

  -- print( env .. ' : ', ret )
  -- print( 'hostname : ' .. vf.hostname() )

  return ret
end

function v.Is_nvim() -- alias

  local ret = ( vf.has('nvim') == 1 )
  print('nvim : ', ret)
  return ret
end

function v.Env_dir()

  local env_dir

  if     v.Is_env__('mac')       then -- mac
    env_dir = 'mac'

  elseif v.Is_env__('linux')     then -- c9, s9
    env_dir = 'c9'

  elseif v.Is_env__('win64')     then -- pwsh
    env_dir = 'pwsh'

  elseif v.Is_env__('win32unix') then -- gitbash
    env_dir = 'gitbash'
  end

  return env_dir
end

function v.Env_dir__()

  vim.g.env_dir = v.Env_dir()
end

-- plg

function v.Vim_plg_path()

  local vim_plg_dir_linux = g.home_dir .. '/.local/share/nvim/site'
  local vim_plg_dir_mac   = vim_plg_dir_linux
  local vim_plg_dir_win   = g.home_dir .. '/AppData/Local/nvim-data/site'

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

  local ret = vf.empty(vf.glob(vim_plg_path)) == 0
  -- print( 'vim-plug installed : ', ret)
  return ret
end

-- repeat fnc

function v.Repeat_fnc()
  print('fnc repeat')

  -- v.Tst.tst()

  -- v.Cursor.__mv_srch('f')
  -- v.Cursor.__mv_d()
  -- v.Cursor.__ins_ynk()
end

-- fnc end


-- 
-- ref
-- 

-- https://vim-jp.org/vimdoc-ja/vimindex.html
-- 
-- ptn ( regex )
-- 
-- \n : 改行
-- \t : tab
-- 
-- \s : space, tab
-- 
-- \w : [0-9A-Za-z_]  word
-- \h : [A-Za-z_]     単語の先頭文字, \w から数字を除いたもの
-- \a : [A-Za-z]      alph
-- \l : [a-z]         小文字
-- \u : [A-Z]         大文字
-- 
-- \d : [0-9]         10進数
-- \x : [0-9A-Fa-f]   16進数
-- \o : [0-7]          8進数
-- 
-- \S : \s 以外
-- \D : \d 以外
-- \X : \x 以外
-- \O : \o 以外
-- \W : \w 以外
-- \H : \h 以外
-- \A : \a 以外
-- \L : \l 以外
-- \U : \u 以外
-- 
-- 上記のそれぞれ + 改行
-- ex
--   \_s : 改行, space, tab のいずれか
-- 
-- [^\x01-\x7E] : 全角
-- 
-- ref: [url]
-- 
-- when unknown server )
--   curl https://raw.githubusercontent.com/ooq-kamui/dotfiles/refs/heads/main/nvim/scrpt/dflt/init.vim > init.vim
--   vim -u init.vim

