
v.Ptn = {}

-- 
-- vim
-- 

v.Ptn.vim = {}

v.Ptn.vim.nl_char = [[\n]]

v.Ptn.vim.space_char = [[\s]]
v.Ptn.vim.space_str      = v.Ptn.vim.space_char .. [[\+]]
v.Ptn.vim.space_entire   = '^' .. v.Ptn.vim.space_str .. '$'

v.Ptn.vim.space_str_top = '^' .. v.Ptn.vim.space_str
v.Ptn.vim.space_str_end =        v.Ptn.vim.space_str .. '$'

v.Ptn.vim.line_top_space_ptn = '^' .. v.Ptn.vim.space_char .. '*'
v.Ptn.vim.line_end_space_ptn =        v.Ptn.vim.space_char .. '*' .. '$' -- '[ \\t]\\+$'

v.Ptn.vim.space_not_char = [[\S]]
v.Ptn.vim.space_not_str      = v.Ptn.vim.space_not_char .. [[\+]]

v.Ptn.vim.num_entire    = '^' .. [[\d\+]] .. '$'

v.Ptn.vim.alph_char_set = [[\a]] -- [a-zA-Z]

v.Ptn.vim.word_char_set = [[\w]] -- [a-zA-Z0-9_]

v.Ptn.vim.mb_char       = '[^' .. [[\x01-\x7E]] .. ']' -- ^ascii

v.Ptn.vim.quote_char    = '[' .. "'" .. '"`' .. ']'

v.Ptn.vim.word_dlm_02_char  = '[' .. '_ABCDEFGHIJKLMNOPQRSTUVWXYZ' .. ']'

v.Ptn.vim.markdown_heading = '^' .. [[#\+ ]]
v.Ptn.vim.markdown_itm     = '^' .. [[\s*- ]]

v.Ptn.vim.fnc = {}
v.Ptn.vim.fnc.def = {}
v.Ptn.vim.fnc.def.lua    = '^function'
v.Ptn.vim.fnc.def.python = '^ *def'
v.Ptn.vim.fnc.def.dflt   = '^function'

v.Ptn.vim.var = {}
v.Ptn.vim.var.char = '[' .. 'a-zA-Z0-9_:' .. [[\.]] .. ']'
v.Ptn.vim.var.str  = v.Ptn.vim.var.char .. [[\+]]


function v.Ptn.vim.heading(file_type)

  file_type = file_type or v.Buf.file_type()

  local ptn

  if     v.Buf.is_file_type__('markdown') then

    ptn = v.Ptn.vim.markdown_heading

  elseif v.Tbl.is__in(v.File.type.fnc_def_lang_lst, v.Buf.file_type()) then

    ptn = v.Ptn.vim.fnc.def[file_type] or v.Ptn.vim.fnc.def.dflt

  else -- default
    ptn = v.Ptn.vim.markdown_heading
  end

  return ptn
end


-- 
-- lua
-- 

v.Ptn.lua = {}
v.Ptn.lua.cr             = '[\r\n]'
v.Ptn.lua.markdown_itm   = '^%s*- '
v.Ptn.lua.space_not_char = '[^ ]' -- '[^ \t]'


-- 
-- doc
-- 

-- 
-- ptn vim
-- 
-- https://vim-jp.org/vimdoc-ja/vimindex.html
-- 
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

