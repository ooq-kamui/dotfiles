
v.Ptn = {}

-- vim

v.Ptn.vim = {}

v.Ptn.vim.space_char     = [[\s]]
v.Ptn.vim.space_not_char = [[\S]]
v.Ptn.vim.space_entire   = '^' .. [[\s\+]] .. '$'

v.Ptn.vim.num_entire     = '^' .. [[\d\+]] .. '$'

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
-- ref
-- 
-- ptn vim
-- 
-- ptn lua
-- 

