
v.Ptn = {}

v.Ptn.vim = {}

v.Ptn.vim.space_char     = [[\s]]
v.Ptn.vim.space_not_char = [[\S]]
v.Ptn.vim.space          = [[^\s\+$]]

v.Ptn.vim.num   = [[^\d\+$]]

-- v.Ptn.vim.mb = '[^\\x01-\\x7E]'
v.Ptn.vim.mb = '[^' .. [[\x01-\x7E]] .. ']' -- ascii not

v.Ptn.vim.quote    = '[' .. "'" .. '"`' .. ']'
v.Ptn.vim.word_dlm = '[' .. '_ABCDEFGHIJKLMNOPQRSTUVWXYZ' .. ']'

v.Ptn.vim.markdown_heading = [[^#\+ ]]
v.Ptn.vim.markdown_itm     = [[^\s*- ]] -- confirm


v.Ptn.lua = {}

v.Ptn.lua.markdown_itm = '^%s*- '
v.Ptn.lua.space_not_char = '[^ ]' -- '[^ \t]'


-- ref
-- ptn vim
-- 
-- ptn lua
-- 

