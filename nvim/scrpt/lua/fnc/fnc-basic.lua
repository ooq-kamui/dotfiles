
-- fnc

require('fnc/fnc-log'   )

require('fnc/fnc-dir'   )
require('fnc/fnc-file'  )
require('fnc/fnc-env'   )
require('fnc/fnc-cmd'   )
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

require('fnc/fnc-mb'    )

require('fnc/fnc-tst'   )


-- doc

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

