
v.Ptn = {}

-- vim

v.Ptn.vim = {}

v.Ptn.vim.nl = [[\n]]

v.Ptn.vim.space_char     = [[\s]]
v.Ptn.vim.space_str      = v.Ptn.vim.space_char .. [[\+]]
v.Ptn.vim.space_entire   = '^' .. v.Ptn.vim.space_str .. '$'
v.Ptn.vim.space_not_char = [[\S]]
v.Ptn.vim.space_not_str  = v.Ptn.vim.space_not_char .. [[\+]]

v.Ptn.vim.num_entire     = '^' .. [[\d\+]] .. '$'

v.Ptn.vim.alph_char = [[\a]]

v.Ptn.vim.word_char = [[\w]]

v.Ptn.vim.mb_char_lst    = '[^' .. [[\x01-\x7E]] .. ']' -- ascii not

v.Ptn.vim.quote_char_lst    = '[' .. "'" .. '"`' .. ']'
v.Ptn.vim.word_dlm_char_lst = '[' .. '_ABCDEFGHIJKLMNOPQRSTUVWXYZ' .. ']'

v.Ptn.vim.markdown_heading = '^' .. [[#\+ ]]
v.Ptn.vim.markdown_itm     = '^' .. [[\s*- ]]


-- lua

v.Ptn.lua = {}
v.Ptn.lua.markdown_itm   = '^%s*- '
v.Ptn.lua.space_not_char = '[^ ]' -- '[^ \t]'


-- 
-- ptn vim
-- 
-- https://vim-jp.org/vimdoc-ja/vimindex.html
-- 
-- \n : 改行
-- \t : tab
-- 
-- \s : space, tab
-- 
-- \w : [0-9A-Za-z_]  word ( alph + num + _ )
-- \a : [A-Za-z]      alph
-- \h : [A-Za-z_]     alph + _
-- \l : [a-z]         alph low
-- \u : [A-Z]         alph upper
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
-- 
-- ptn lua
-- 

