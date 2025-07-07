
-- fnc

require('fnc/fnc-utl'   )

-- global

g.home_dir         = vim.fn.expand('$HOME')
g.dotfiles_dir     = g.home_dir      .. '/wrk/prj-pri/dotfiles'
g.nvim_init_dir    = g.dotfiles_dir  .. '/nvim/scrpt'

g.nvim_lua_dir     = g.nvim_init_dir .. '/lua'
g.nvim_lua_fnc_dir = g.nvim_lua_dir  .. '/fnc'
g.nvim_lua_etc_dir = g.nvim_lua_dir  .. ''

g.nvim_lua_env_dir = g.nvim_lua_dir  .. '/env'

require('fnc/fnc-cmd'    )
require('fnc/fnc-line'   )
require('fnc/fnc-mode'   )
require('fnc/fnc-rgstr'  )
-- require('fnc/fnc-ynk'    )
require('fnc/fnc-cursor' )
require('fnc/fnc-slctd'  )
require('fnc/fnc-srch'   )
require('fnc/fnc-etc'    )

require('fnc/fnc-buf'    )
require('fnc/fnc-sys'    )

require('fnc/fnc-tst'    )

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

function v.Esc() -- alias

  -- v.Cmd.nml('\\<esc>')
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

-- syntax color

function v.Hl_grp()

  -- print( f.synIDattr(f.synID(f.line('.'), f.col('.'), 1), 'name') )
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

-- dir

function v.Pth()

  v.Cmd.cmd('pwd')
end

-- dir __ ch

function v.Dir__(dir)

  v.Cmd.cmd('cd ' .. dir)
  v.Pth()
end

-- dir __ ch slf

function v.Dir__buf_file_dir()

  local dir = v.Buf_file_dir()
  v.Dir__(dir)
end

-- dir __ ch parent

function v.Dir__parent(lvl)

  local cnt = 1
  while cnt <= lvl do

    v.Cmd.cmd('cd ..')

    cnt = cnt + 1
  end

  v.Pth()
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

-- mode ins

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

-- rg

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
  local rg_rslt_cnt = v.Sys.cmd(rg_cmd)
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
  local r_rslt_txt = v.Sys.cmd(rg_cmd)
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

-- env

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

  local ret = f.empty(f.glob(vim_plg_path)) == 0
  -- print( 'vim-plug installed : ', ret)
  return ret
end

-- repeat fnc

function v.Repeat_fnc()
  print('repeat fnc')

  v.Tst.tst()

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

  v.Cmd.cmd('DoShowMarks')
end

function v.Mark_add()

  local alph = v.Mark_alph_useabl()
  v.Cmd.cmd('mark ' .. alph)
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

  v.Cmd.cmd('delmark ' .. alph)
end

function v.Mark_del_all()

  v.Cmd.cmd('delmark!')
  v.Cmd.cmd('DoShowMarks')
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

