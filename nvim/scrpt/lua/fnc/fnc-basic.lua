-- 
-- fnc
-- 

require('fnc/fnc-utl'   )

require('fnc/fnc-line'  )
require('fnc/fnc-rgstr' )
require('fnc/fnc-ynk'   )
require('fnc/fnc-cursor')
require('fnc/fnc-slctd' )
require('fnc/fnc-srch'  )
require('fnc/fnc-etc'   )

require('fnc/fnc-tst'   )

-- global

g.home_dir     = vim.fn.expand('$HOME')
g.dotfiles_dir = g.home_dir .. '/wrk/prj-pri/dotfiles'

g.init_vim_dir     = g.dotfiles_dir .. '/nvim/scrpt/dflt'
g.init_vim_etc_dir = g.init_vim_dir .. '/vim'

g.init_lua_dir     = g.init_vim_dir .. '/lua'
g.init_lua_etc_dir = g.init_lua_dir


-- 
-- primitive
-- 

-- char

function v.Char_lr_2_normal_cmd(lr)

  local n_cmd

  if     lr == 'l' then
    n_cmd = 'h'

  elseif lr == 'r' then
    n_cmd = 'l'
  end

  return n_cmd
end

-- char cnd

function v.Is_char__num(char)

  local ret = false

  if v.Is_str__ptn(char, '\\d') then
    ret = true
  end

  return ret
end

function v.Is_char__alpha(char)

  local ret = false

  if v.Is_str__ptn(char, '\\a') then
    ret = true
  end

  return ret
end

function v.Is_char__symbol(char)

  local ret = false

  if not v.Is_str__ptn(char, '\\s') and not v.Is_str__ptn(char, '\\w') then
    ret = true
  end

  return ret
end

-- char cnd  -  char pair __

function v.Is_char_pair__(ptn, c1, c2)

  local ret = false

  if v.Is_str__ptn(c1, ptn) and v.Is_str__ptn(c2, ptn) then
    ret = true
  end

  return ret
end

function v.Is_char_pair__quote(c1, c2)

  local ret = false

  if     c1 == "'" and c2 == "'" then
    ret = true
  elseif c1 == '"' and c2 == '"' then
    ret = true
  elseif c1 == '`' and c2 == '`' then
    ret = true
  end

  return ret
end

function v.Is_char_pair__bracket(c1, c2)

  local ret = false

  if     c1 == '(' and c2 == ')' then
    ret = true
  elseif c1 == '{' and c2 == '}' then
    ret = true
  elseif c1 == '[' and c2 == ']' then
    ret = true
  elseif c1 == '<' and c2 == '>' then
    ret = true
  end

  return ret
end

-- char cnd tgl

function v.Is_char__tgl_symbol(c)

  local rpl = ''

  if     c == '/' then
    rpl = '|'
  elseif c == '|' then
    rpl = '\\'
  elseif c == '\\' then
    rpl = '/'

  elseif c == "'" then
    rpl = '"'
  elseif c == '"' then
    rpl = '`'
  elseif c == '`' then
    rpl = "'"

  elseif c == '-' then
    rpl = '+'
  elseif c == '+' then
    rpl = '='
  elseif c == '=' then
    rpl = '*'
  elseif c == '*' then
    rpl = '-'

  elseif c == ',' then
    rpl = '.'
  elseif c == '.' then
    rpl = ','

  elseif c == ';' then
    rpl = ':'
  elseif c == ':' then
    rpl = ';'

  elseif c == '?' then
    rpl = '!'
  elseif c == '!' then
    rpl = '?'
  end

  return rpl
end

function v.Is_char__tgl_bracket_trn(c)

  local rpl = ''

  if     c == '<' then
    rpl = '>'
  elseif c == '>' then
    rpl = '<'

  elseif c == '{' then
    rpl = '}'
  elseif c == '}' then
    rpl = '{'

  elseif c == '[' then
    rpl = ']'
  elseif c == ']' then
    rpl = '['

  elseif c == '(' then
    rpl = ')'
  elseif c == ')' then
    rpl = '('
  end

  return rpl
end

-- str

function v.Str_len(str) -- alias

  return f.strchars(str)
end

function v.Str_l_char(str)

  -- local l_idx = 0
  local l_idx = 1
  -- local c = str[l_idx]
  local c = str:sub(l_idx, l_idx)
  --print(c)
  return c
end

function v.Str_r_char(str)

  -- local r_idx = v.Str_len(str) - 1
  local r_idx = v.Str_len(str)
  -- local c = str[r_idx]
  local c = str:sub(r_idx, r_idx)
  --print( c )
  return c
end

-- dev anchor
function v.Str_sub(str, idx, len) -- dev doing

  local str = str
  return str
end

function v.Str_space(len)

  local space_str = ''

  local idx = 1
  while idx <= len do

    space_str = space_str .. ' '

    idx = idx + 1
  end
  return space_str
end

function v.Str_srch_idx(...) -- alias

  local arg = {...}

  local str = arg[1]
  local ptn = arg[2]
  local idx = ( #arg >= 3 ) and arg[3] or nil

  local r_idx = f.match(str, ptn, idx)
  return r_idx -- -1 : match not
end

function v.Str_srch_end(str, ptn) -- alias

  local idx = f.matchend(str, ptn)
  return idx
end

-- str __ rpl

function v.Str__rpl(str, srch, rpl) -- alias

  local r_str = f.substitute(str, srch, rpl, 'g')
  return r_str
end

function v.Str_path_unix__cnv_win(path)

  local path = path
  local path = v.Str__rpl(path, '/c/', 'C:/')
  local path = v.Str__rpl(path, '/', '\\')
  return path
end

function v.Str_path_win__cnv_unix(path)

  local path = path
  local path = v.Str__rpl(path, 'C:', '/c')
  local path = v.Str__rpl(path, '\\', '/')
  return path
end

function v.Str_cmnt_1()

  local cmnt_1_def = {
    lua        = '-- ',
    text       = '# ' ,
    vim        = '" ' ,
    fish       = '# ' ,
    sh         = '# ' ,
    css        = '/* ',
    javascript = '// ',
    java       = '// ',
    sql        = '-- ',
    dflt       = '# ' ,
  }

  -- dev anchor
  local str = f.get(cmnt_1_def, vim.bo.filetype, cmnt_1_def['dflt'])
  return str
end

-- str cnd

function v.Is_str__emp(str)

  local ret = false

  if str == '' then
    ret = true
  end
  return ret
end

function v.Is_str__ptn(str, ptn)

  local ret

  if f.match(str, ptn) == -1 then
    ret = false
  else
    ret = true
  end

  return ret
end

function v.Is_str__space(str)

  local ptn = '^\\s\\+$'
  local ret = v.Is_str__ptn(str, ptn)
  return ret
end

function v.Is_str__num(str)

  local ptn = '^\\d\\+$'
  local ret = v.Is_str__ptn(str, ptn)
  return ret
end

-- idx

function v.Idx__icl(idx, ar_len)

  local r_idx = idx + 1

  if r_idx > ar_len then
    -- r_idx = 0
    r_idx = 1
  end

  return r_idx
end

function v.Idx__dcl(idx, ar_len)

  local r_idx = idx - 1

  -- if r_idx < 0 then
  if r_idx <= 0 then
    -- r_idx = ar_len - 1
    r_idx = ar_len
  end

  return r_idx
end

-- int

function v.Int_2_str(num)

  local num_str = f.printf('%o', num)
  return num_str
end

-- ar ( list )

-- txt

function v.Txt_to_ar(txt)

  local line_ar  = f.split(txt, '\\n')
  return line_ar
end

function v.Nothing() -- use by tst

  -- print( "do nothing.." )
end

-- function v.Echo(str) -- alias -- old -- del
-- 
--   print(str)
-- end

-- vim

-- vim basic

function v.Cmd(cmd) -- alias

  vim.cmd(cmd)
end

function v.Normal(n_cmd) -- alias

  v.Cmd('normal! ' .. n_cmd)
  -- vim.cmd('exe "normal! ' .. n_cmd .. '"')
end

function v.Sys_cmd(sys_cmd)

  -- print(sys_cmd)
  local ret = f.system(sys_cmd)
  -- print(ret)
  return ret
end

function v.Cmdline__(str)

  -- v.Ynk__(str)

  f.feedkeys(':call ' .. str)
end

function v.Esc() -- alias

  -- v.Normal('\\<esc>')
  vim.cmd('exe "normal! \\<esc>"')
end

-- undo clr, file ( crnt buf ? )

function v.Undo__clr()

  -- local undo_lvl_tmp = &undolevels
  local undo_lvl_tmp = vim.bo.undolevels

  vim.opt_local.undolevels = -1
  vim.cmd([[exe "normal! a \<bs>\<esc>"]])

  vim.bo.undolevels = undo_lvl_tmp
end

-- mode

v.Mode = {}

function v.Mode.is__normal()

  local ret = false

  if f.mode() == 'n' then
    ret = true
  end
  return ret
end

function v.Mode.is__visual()

  local ret = false

  if v.Mode.is__str() or v.Mode.is__line() or v.Mode.is__box() then
    ret = true
  end
  return ret
end

function v.Mode.is__str()

  local ret = false

  if f.mode() == 'v' then
    ret = true
  end
  return ret
end

function v.Mode.is__line()

  local ret = false

  if f.mode() == 'V' then
    ret = true
  end
  return ret
end

function v.Mode.is__box()

  local ret = false

  if f.mode() == vim.api.nvim_replace_termcodes('<c-v>', false, false, true) then
    ret = true
  end
  return ret
end

-- syntax color

function v.Hl_grp()

  -- print( f.synIDattr(f.synID(f.line('.'), f.col('.'), 1), 'name') )
  local cmd = "echo synIDattr(synID(line('.'), col('.'), 1), 'name')"
  v.Cmd(cmd)
  -- print(  )
end
-- and
-- :hi [grp name]

function v.Color_name_lst()

  local cmd = "so $VIMRUNTIME/syntax/colortest.vim"
  v.Cmd(cmd)
end

-- dir

function v.Pth()

  v.Cmd('pwd')
end

-- dir __ ch

function v.Dir__(dir)

  v.Cmd('cd ' .. dir)
  v.Pth()
end

-- dir __ ch slf

function v.Buf_file_dir()

  local dir = f.expand('%:p:h')
  return dir
end

function v.Dir__buf_file_dir()

  local dir = v.Buf_file_dir()
  v.Dir__(dir)
end

-- dir __ ch parent

function v.Dir__parent(lvl)

  local cnt = 1
  while cnt <= lvl do

    v.Cmd('cd ..')

    cnt = cnt + 1
  end

  v.Pth()
end

-- file ( buf file )

function v.Save()

  v.Cmd('w')
end

function v.Buf_file__dpl()

  local sys_cmd = 'dpl ' .. v.Buf_file_path()
  v.Sys_cmd(sys_cmd)
end

function v.Buf_file__mv(file_name_aft)

  local file_path_bfr = v.Buf_file_path()

  local sys_cmd = 'str_mv_f ' .. file_path_bfr .. ' ' .. file_name_aft
  local file_path_aft = v.Sys_cmd(sys_cmd)

  local sys_cmd = 'mv ' .. file_path_bfr .. ' ' .. file_path_aft
  v.Sys_cmd(sys_cmd)

  local cmd = 'file ' .. file_path_aft -- save file_path ch
  v.Cmd(cmd)
end

function v.Buf_file_path()

  local path = f.expand('%:p')
  return path
end

function v.File_txt(file_path)

  if not f.filereadable(file_path) then
    return
  end

  local cmd = 'cat ' .. file_path

  local pth_lst_txt = v.Sys_cmd(cmd)
  return pth_lst_txt
end

function v.File_line_ar(file_path)

  local file_txt = v.File_txt(file_path)
  local file_line_ar = v.Txt_to_ar(file_txt)
  return file_line_ar
end

-- load re

function v.Load_re()

  v.Cmd('e ')
end

-- load re  -  encode sjis

function v.Load_re__sjis()

  v.Cmd('e ++enc=sjis')
end

-- encode

function v.Buf_file_encode()

  v.Cmd('set enc?')
end

function v.Buf_file_bom()

  v.Cmd('set bomb?')
end

-- file tmp

function v.File_tmp__cre() -- alias

  local tmp_path = f.system('mktemp ')
  return tmp_path
end

-- file cnd

function v.Is_file_type__(type)

  if vim.bo.filetype == type then
    return true
  else
    return false
  end
end

-- opn xxx

-- opn file

function v.Opn(filename)

  v.Cmd('tab drop ' .. filename)
end

function v.Opn_tmp_file()

  local path = v.File_tmp__cre()
  print( path )
  v.Opn(path)
end

g.init_lua_file_path         = g.init_lua_dir     .. '/init.lua'
g.init_lua_opt_file_path     = g.init_lua_etc_dir .. '/init-opt.lua'
g.init_lua_cmd_file_path     = g.init_lua_etc_dir .. '/init-cmd-usr.lua'
g.init_lua_hl_file_path      = g.init_lua_etc_dir .. '/init-hl.lua'
g.init_lua_key_map_file_path = g.init_lua_etc_dir .. '/init-key-map.lua'

g.init_lua_fnc_file_path     = g.init_lua_etc_dir .. '/init-fnc.lua'
g.init_lua_plg_fzf_file_path = g.init_lua_etc_dir .. '/init-plg-fzf.lua'

function v.Opn_init_vim()

  -- lua
  v.Opn(g.init_lua_fnc_file_path    )
  v.Opn(g.init_lua_plg_fzf_file_path)

  local vimrc_c9_file_path
  local vimrc_gitbash_file_path

  if     v.Is_env__('linux')     then -- c9, s9

    vimrc_c9_file_path      = g.init_vim_dir .. '/c9/init.vim'
    -- v.Opn(vimrc_c9_file_path)

  elseif v.Is_env__('win32unix') then -- gitbash

    vimrc_gitbash_file_path = g.init_vim_dir .. '/gitbash/init.vim'
    v.Opn(vimrc_gitbash_file_path)
  end
end

function v.Opn_init_vim_l()

  v.Opn(g.init_lua_opt_file_path    )
  v.Opn(g.init_lua_cmd_file_path    )

  v.Opn(g.init_lua_file_path        )

  v.Opn(g.init_lua_key_map_file_path)
  v.Opn(g.init_lua_hl_file_path     )
end

function v.Opn_fish_cnf()

  local path = '~/.config/fish/config.fish'
  v.Opn(path)
end

function v.Opn_man(cmd)

  v.Cmd('tab new')
  v.Cmd('Man ' .. cmd)
  v.Cmd('only')
end

g.memo_path = 'doc/memo.md'

function v.Opn_memo()

  v.Opn(g.memo_path)
end

g.grep_wk_path = '~/wrk/tmp/rg.md'

function v.Opn_grep_wk()

  local file_type = f.getftype(g.grep_wk_path)

  if v.Is_str__emp(file_type) then

    v.Opn(g.grep_wk_path)
  else
    v.Opn_tmp_file()
  end
end

-- opn app

function v.Opn_app(path)

  local path = path
  local cmd_sys

  if     v.Is_env__('mac') then
    cmd_sys = 'open'

  elseif v.Is_env__('win64') then
    cmd_sys = 'start'

  elseif v.Is_env__('win32unix') then
    cmd_sys = 'start'

  else
    return
  end

  if v.Is_env__('win64') then
    path = v.Str_path_unix__cnv_win(path)
  end

  local res = f.system(cmd_sys .. " '" .. path .. "'")
end

function v.Opn_app_by_cursor_path()
  
  local path = v.Cursor_filepath()
  v.Opn_app(path)
end

function v.Opn_app_by_line_path(line_num)

  -- local path = f.getline(line_num)
  local path = v.Line_str_by_line_num(line_num)

  path = f.trim(path)
  v.Opn_app(path)
end

function v.Opn_app_by_slctd_str()

  local path = v.Slctd_str()
  path = f.trim(path)
  v.Opn_app(path)
end

function v.Opn_app_buf_file()

  local path = v.Buf_file_path()
  -- print( path )
  v.Opn_app(path)
end

function v.Opn_buf_file_dir()

  local dir = v.Buf_file_dir()
  v.Opn_app(dir)
end

function v.Opn_brwsr()

  local url = 'https://www.google.com/'
  v.Opn_app(url)
end

function v.Opn_ggl_srch(word)

  local url = 'https://www.google.com/search?q=' .. word
  v.Opn_app(url)
end

function v.Opn_yt(yt_video_id)

  local url = 'https://www.youtube.com/watch?v=' .. yt_video_id
  v.Opn_app(url)
end

-- tag jmp

-- tag jmp by str ( refactoring path )

function v.Tag_jmp_by_str(rg_rslt_line)

  local rg_rslt_line = f.trim(rg_rslt_line)

  if v.Is_str__emp(rg_rslt_line) then
    print( 'empty' )
    return
  end

  local rg_rslt_line = f.matchstr(rg_rslt_line, '\\S\\+')
  -- print( rg_rslt_line )

  local rg_rslt_line_ar = v.Rg_rslt_line_parse(rg_rslt_line)
  -- print( rg_rslt_line_ar )

  local filename = rg_rslt_line_ar[1]
  local line_num = f.get(rg_rslt_line_ar, 1, 1)
  -- print( line_num )
  -- return

  if not f.filereadable(filename) then
    print( 'file does not exist' )
    return
  end

  v.Cmd('tab drop ' .. filename)
  -- v.Normal(line_num .. 'G')
  v.Cursor__mv_by_line_num(line_num)
end

function v.Tag_jmp_by_cursor_line()

  local base_buf_num = v.Buf_num()

  local str = v.Cursor_line_str()
  v.Tag_jmp_by_str(str)

  v.Cmd('sbuffer ' .. base_buf_num)
  -- v.Normal('j')
  v.Cursor__mv_d()
end

function v.Tag_jmp_by_slctd_line() -- range

  local base_buf_num = v.Buf_num()

  local line_str

  for idx, line_num in pairs(v.Slctd_line_num_seq()) do

    line_str = v.Line_str_by_line_num(line_num)

    v.Tag_jmp_by_str(line_str)
    v.Cmd('sbuffer ' .. base_buf_num)
  end
end

-- buf

function v.Buf_num()

  return f.bufnr('%')
end

function v.Buf__quit()

  local cmd = 'bd'
  v.Cmd(cmd)
end

function v.Buf__quit_swtch()

  local win_num = f.winnr('$')

  if win_num > 1 then
    v.Win_splt__quit()
  else
    v.Buf__quit()
  end
end

function v.Buf__fltr() -- use not

end

-- win splt

function v.Win__splt_h()

  local cmd = 'split'
  v.Cmd(cmd)
end

function v.Win__splt_v()

  local cmd = 'vsplit'
  v.Cmd(cmd)

  v.Win_splt_cursor__mv_nxt()
end

function v.Win_splt_cursor__mv_nxt()

  vim.cmd('exe "normal! \\<c-w>w>"')
end

function v.Win_splt__quit()

  vim.cmd('exe "normal! \\<c-w>c>"')
end

-- markdown cnd

function v.Is_line_markdown_itm()

  local ptn = '^\\s*- '
  local str = v.Cursor_line_str()
  local idx = v.Str_srch_idx(str, ptn)

  if idx == -1 then
    return false
  else
    return true
  end
end

-- 
-- mode ins
-- 

-- complete  -  mode insert ins lst

function v.I_symbol01()

  local lst = { '$', '@', '#', ';', '%' }
  f.complete(f.col('.'), lst)
  return ''
end

function v.I_symbol02()

  local lst = { '?', '!', '&', '~', '^', '|', '\\', '/' }
  f.complete(f.col('.'), lst)
  return ''
end

function v.I_symbol03()

  local lst = { '=', '+', '-' }
  f.complete(f.col('.'), lst)
  return ''
end

function v.I_bracket()

  local lst = { '()', '{}', '[]', '<>', '[]()', '[][]', '(){}' }
  f.complete(f.col('.'), lst)
  return ''
end

function v.I_quote()

  local lst = { "''", '""', '``' }
  f.complete(f.col('.'), lst)
  return ''
end

function v.I_markdown_lnk()

  local lst = { '[]()', '[][]', '![]()' }
  f.complete(f.col('.'), lst)
  return ''
end

function v.I_week()

  f.complete(f.col('.'), g.week_def)
  return ''
end

function v.I_num()

  local lst = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' }
  f.complete(f.col('.'), lst)
  return ''
end

function v.I_reg()

  local lst = {
    v.Rgstr_get('0'),
    v.Rgstr_get('1'),
    v.Rgstr_get('2'),
    v.Rgstr_get('3')
  }
  f.complete(f.col('.'), lst )
  return ''
end

function v.Is_ins_mode__menu()

  local ret = false

  if vim.fn.pumvisible() == 1 then
    ret = true
  end

  return ret
end

-- trns

function v.Slctd_trns() -- range

  local str = v.Slctd_str()
  str = f.substitute(str, "\\n", ' ', 'g')

  local lang
  -- if str =~ '[^\\x01-\\x7E]' then -- mlt byte
  if v.Is_str__ptn(str, '[^\\x01-\\x7E]') then -- mlt byte
    lang = '{ja=en}'
  else
    lang = '{en=ja}'
  end

  str = f.escape(str, "'")
  local sys_cmd = 'trans -no-ansi ' .. lang .. " '" .. str .. "'"
  local rslt = v.Sys_cmd(sys_cmd)
  print( rslt )
end

-- math

function v.Slctd_math() -- range

  local str = v.Slctd_str()
  local sys_cmd = 'echo ' .. "'" .. str .. "'" .. ' | math'
  local rslt = v.Sys_cmd(sys_cmd)
  print( rslt )
  v.Rgstr__('a', rslt)
end

-- url encdoe

function v.Slctd_url_encode() -- range

  local str = v.Slctd_str()
  local sys_cmd = 'url_encode "' .. str .. '"'
  local rslt = v.Sys_cmd(sys_cmd)
  --print( rslt )
  v.Cursor__ins(rslt)
end

-- 
-- rg
-- 

-- dev anchor
function v.Rg_rslt_line_parse(line)

  local dlm = ':'
  local ret = f.split(line, dlm)
  --echo ret

  local idx = 1
  while idx <= f.len(ret) do

    ret[idx] = f.trim(ret[idx])

    idx = idx + 1
  end

  if ( f.len(ret) > 1 ) and ( not v.Is_char__num(ret[2]) ) then
    ret[2] = '1'
  end

  return ret
end

g.fzf_rg_opt = ''
  .. ' --color=always'
  .. ' --line-number'
  .. ' --smart-case'
  .. ' --no-multiline'
  .. ' --no-heading'
  .. ' --hidden'

function v.Rg_cmd(ptn, ext, word1, opt)

  if ptn == nil then
    ptn = ''
  else
    ptn = ptn
  end

  local fzf_rg_opt_ext

  if ext == nil then
    fzf_rg_opt_ext = ''
  else
    fzf_rg_opt_ext = ' -g "*.' .. ext .. '"'
  end

  local fzf_rg_opt_word1 = ''

  if word1 == true then
    fzf_rg_opt_word1 = ' -w'
  end

  if opt == nil then
    opt = ''
  else
    opt = ' ' .. opt
  end

  local rg_cmd = 'rg '
          .. g.fzf_rg_opt
          .. fzf_rg_opt_ext
          .. fzf_rg_opt_word1
          .. opt
          .. ' -- ' .. '"' .. f.escape(ptn, '().$') .. '"'

  return rg_cmd
end

g.rg_emp_line_ptn  = '^[ \\t]*$'
g.rg_some_line_ptn = '^[^ \\t]+$'
-- g.rg_some_line_ptn = '[^ \\t]'

function v.Rg_ptn_cnt(ptn, opt)

  local opt

  if opt == nil then
    opt = ''
  else
    opt = opt
  end

  local rg_cmd = "rg " .. opt .. " -e '" .. ptn .. "' | count"
  local rg_rslt_cnt = v.Sys_cmd(rg_cmd)
  rg_rslt_cnt = tonumber(rg_rslt_cnt)
  return rg_rslt_cnt
end

function v.Rg_all_cnt()

  local ptn = g.rg_emp_line_ptn
  local opt = '-v'

  local rg_rslt_cnt = v.Rg_ptn_cnt(ptn, opt)
  return rg_rslt_cnt
end

function v.Rg_all_rslt_ar()

  local ptn = g.rg_emp_line_ptn
  local opt = '-v'

  local rslt_ar = v.Rg_ptn_rslt_ar(ptn, opt)
  return rslt_ar
end

function v.Rg_ptn_rslt_ar(ptn, opt)

  local rg_rslt_txt = v.Rg_ptn_rslt_txt(ptn, opt)
  local rg_rslt_ar  = f.split(rg_rslt_txt, "\\n")
  return rg_rslt_ar
end

function v.Rg_ptn_rslt_txt(ptn, opt)
  
  local rg_cmd = v.Rg_cmd(ptn, nil, nil, opt) -- todo dev
  local r_rslt_txt = v.Sys_cmd(rg_cmd)
  return r_rslt_txt
end

-- 
-- jmplst
-- 

function v.Jmplst()

  local jmplst_tmp = f.getjumplist()[1]
  -- u.Log.tbl(jmplst_tmp)

  local buf_num_key_prefix = 'key_'
  local jmplst = {}
  local _buf_num_key

  for idx, _jmplst_tmp in pairs(jmplst_tmp) do

    _buf_num_key = buf_num_key_prefix .. _jmplst_tmp['bufnr']

    if jmplst[_buf_num_key] == nil then
      -- u.Log.val(_buf_num_key)
      jmplst[_buf_num_key] = {}
    end

    u.Tbl.add(jmplst[_buf_num_key], _jmplst_tmp)
  end
  -- u.Log.tbl(jmplst)

  for idx, _buf_num_key in pairs(f.keys(jmplst)) do

    u.Tbl.srt(jmplst[_buf_num_key], v.Jmplst_cmp)
  end
  -- u.Log.tbl(jmplst)

  local buf_num_key = buf_num_key_prefix .. v.Buf_num()
  -- u.Log.val(buf_num_key)

  local r_jmplst    = f.get(jmplst, buf_num_key, {})
  -- u.Log.tbl(r_jmplst)

  return r_jmplst
end

function v.Jmplst_line_info()

  local jmplst = v.Jmplst()

  local jmplst_line_info = {}

  local line_num
  for idx, _jmplst in pairs(jmplst) do

    line_num  = _jmplst['lnum']

    -- line_info = line_num .. ' ' .. f.getline(line_num)
    line_info = line_num .. ' ' .. v.Line_str_by_line_num(line_num)

    u.Tbl.add(jmplst_line_info, line_info)
  end
  -- u.Log.tbl(jmplst_line_info)

  return jmplst_line_info
end

function v.Jmplst_cmp(jmplst1, jmplst2)

  local ret

  return jmplst1['lnum'] <  jmplst2['lnum']
end

-- 
-- env
-- 

function v.Is_env__(env) -- alias

  -- env : 'mac', 'win64', 'win32', 'wsl', 'linux'

  local ret = ( f.has(env) == 1 )

  -- print( env .. ' : ', ret )
  -- print( 'hostname : ' .. f.hostname() )

  return ret
end

function v.Is_nvim() -- alias

  local ret = ( f.has('nvim') == 1 )
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

-- repeat fnc

function v.Repeat_fnc()
  print('repeat fnc')

  v.Tst()

  -- v.Cursor__mv_srch('f')
  -- v.Cursor__mv_d()
  -- v.Cursor__ins_ynk()
end

-- priority l

-- 
-- mark
-- 

g.mark_alph_def = {
  'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
  'o','p','q','r','s','t','u','v','w','x','y','z'
}

function v.Mark_show_tgl()

  if f.exists('g.mark_show_flg') == 0 then

    g.mark_show_flg = false
  end

  if not g.mark_show_flg then

    -- exe 'DoShowMarks'
    vim.cmd('DoShowMarks')
    g.mark_show_flg = true
  else
    -- exe 'NoShowMarks'
    vim.cmd('NoShowMarks')
    g.mark_show_flg = false
  end
end

function v.Mark_lst()

  local mark = {}
  for idx, _mark in pairs(f.bufname():getmarklist()) do

    local _alph = _mark['mark'][2]

    if f.count(g.mark_alph_def, _alph) == 0 then
      -- continue
    else
      mark = u.Tbl.add(mark, _mark['mark'][2])
    end
  end

  --print( mark )
  return mark
end

function v.Mark_alph_line()

  local line_num = v.Cursor_line_num()

  for idx, _mark in pairs(f.bufname():getmarklist()) do

    local _alph = _mark['mark'][2]

    if f.count(g.mark_alph_def, _alph) == 0 then
      -- continue
    else
      if _mark['pos'][2] == line_num then
        --print( _alph )
        return _alph
      end
    end
  end
  return ''
end

function v.Mark_tgl()

  local alph = v.Mark_alph_line()
  --print( 'Mark_tgl ' .. alph )

  if v.Is_str__emp(alph) then
    v.Mark_add()
  else
    v.Mark_del(alph)
  end

  v.Cmd('DoShowMarks')
end

function v.Mark_add()

  local alph = v.Mark_alph_useabl()
  v.Cmd('mark ' .. alph)
end

function v.Mark_alph_useabl()

  local mark = v.Mark_lst()

  for idx, _alph in pairs(g.mark_alph_def) do
    if f.count(mark, _alph) == 0 then
      --print( _alph )
      return _alph
    end
  end

  print( 'use alph all' )
  return ''
end

function v.Mark_del(alph)

  v.Cmd('delmark ' .. alph)
end

function v.Mark_del_all()

  v.Cmd('delmark!')
  v.Cmd('DoShowMarks')
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

