
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

require('fnc/fnc-env'   )
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

require('fnc/fnc-plg'   )
require('fnc/fnc-rg'    )
require('fnc/fnc-jmplst')

require('fnc/fnc-mark'  )

require('fnc/fnc-tst'   )


-- function v.Echo(str) -- alias -- old -- del
-- 
--   v.Log.val(str)
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

  -- v.Log.val( vf.synIDattr(vf.synID(vf.line('.'), vf.col('.'), 1), 'name') )
  local cmd = "echo synIDattr(synID(line('.'), col('.'), 1), 'name')"
  v.Cmd.cmd(cmd)
  -- v.Log.val(  )
end
-- and
-- :hi [grp name]

function v.Color_name_lst()

  local cmd = "so $VIMRUNTIME/syntax/colortest.vim"
  v.Cmd.cmd(cmd)
end

-- repeat fnc

function v.Repeat_fnc()
  v.Log.val('fnc repeat')

  -- v.Tst.tst()

  -- v.Cursor.__mv_by_srch_str('f')
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

