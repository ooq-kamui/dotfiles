-- 
-- fnc
-- 

-- global

g_home_dir        = os.getenv("HOME")
g_dotfiles_dir    = g_home_dir     .. '/wrk/prj-pri/dotfiles'
g_vimrc_dir       = g_dotfiles_dir .. '/nvim/scrpt'
g_vimrc_file_path = g_vimrc_dir    .. '/dflt/init.vim'

g_init_lua_file_path         = g_vimrc_dir .. '/dflt/lua/init.lua'
g_init_lua_opt_file_path     = g_vimrc_dir .. '/dflt/lua/init-opt.lua'
g_init_lua_hl_file_path      = g_vimrc_dir .. '/dflt/lua/init-hl.lua'
g_init_lua_key_map_file_path = g_vimrc_dir .. '/dflt/lua/init-key-map.lua'
g_init_lua_fnc_file_path     = g_vimrc_dir .. '/dflt/lua/init-fnc.lua'

f = vim.fn
v = {}

_G.v = v

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

--[[

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

function v.Is_char__tgl_alpha_trn(c) -- use not
  
  local rpl = ''

  if     c == 'T' then
    rpl = 'f'
  elseif c == 'F' then
    rpl = 't'
  end

  return rpl
end

-- str

function v.Str_len(str) -- alias

  return f.strchars(str)
end

function v.Str_l_char(str)

  local l_idx = 0
  local str_l = str[l_idx]
  --print(str_l)
  return str_l
end

function v.Str_r_char(str)

  local r_idx = v.Str_len(str) - 1
  local str_r = str[r_idx]
  --print( str_r )
  return str_r
end

function v.Str_sub(str, idx, len) -- dev doing

  local str = str
  return str
end

function v.Str_space(len)

  local space_str = ''

  local idx = 0
  while idx < len do

    space_str = space_str .. ' '

    idx = idx + 1
  end
  return space_str
end

function v.Str_srch(...) -- alias

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

  local str = f.get(cmnt_1_def, &filetype, cmnt_1_def['dflt'])
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

--]]

function v.Is_str__ptn(str, ptn)

  local ret

  if f.match(str, ptn) == -1 then
    ret = false
  else
    ret = true
  end

  return ret
end

--[[

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

-- num ( idx )

function v.Idx__icl(idx, ar_len)

  local r_idx = idx + 1

  if r_idx >= ar_len then
    r_idx = 0
  end

  return r_idx
end

function v.Idx__dcl(idx, ar_len)

  local r_idx = idx - 1

  if r_idx < 0 then
    r_idx = ar_len - 1
  end

  return r_idx
end

function v.Int_2_str(num)

  local num_str = f.printf('%o', num)
  return num_str
end

-- ar ( list )

-- txt

function v.Txt_to_ar(txt)

  local line_ar  = f.split(txt, "\\n")
  return line_ar
end

-- vim

-- vim basic

function v.Nothing() -- use by tst

  -- print( "do nothing.." )
end

function v.Echo(str) -- alias

  print( str )
end

function v.Exe(cmd) -- alias

  exe cmd
end

function v.Normal(cmd) -- alias

  v.Exe('normal! ' .. cmd)
end

function v.Esc() -- alias

  v.Normal("\\<esc>")
end

function v.Cmdline__(str)

  v.Ynk__(str)

  f.feedkeys(':call ' .. str)
end

-- undo clr, file ( crnt buf ? )

function v.Undo__clr()

  local undo_lvl_tmp = &undolevels

  setlocal undolevels=-1

  exe "normal! a \\<BS>\\<Esc>"

  let &undolevels = undo_lvl_tmp
end

function v.Sys_cmd(sys_cmd)

  return system(sys_cmd)
end

-- syntax color

function v.Hl_grp()

  print( f.synIDattr(f.synID(f.line('.'), f.col('.'), 1), 'name') )
end
-- and
-- :hi [grp name]

function v.Color_name_lst()

  local cmd = "so $VIMRUNTIME/syntax/colortest.vim"
  v.Exe(cmd)
end

-- dir

function v.Pth()

  v.Exe('pwd')
end

-- dir __ ch

function v.Dir__(dir)

  v.Exe('cd ' .. dir)
  v.Pth()
end

-- dir __ ch slf

-- function v.Slf_dir()
function v.Buf_file_dir()

  local dir = f.expand('%:p:h')
  return dir
end

-- function v.Dir__slf()
function v.Dir__buf_file_dir()

  local dir = v.Buf_file_dir()
  v.Dir__(dir)
  -- v.Exe('cd ' .. dir)

  -- v.Pth()
end

-- dir __ ch parent

function v.Dir__parent(lvl)

  local cnt = 1
  while cnt <= lvl do

    v.Exe('cd ..')

    cnt = cnt + 1
  end

  v.Pth()
end

-- file ( buf file )

function v.Save()

  v.Exe('w')
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
  v.Exe(cmd)
end

function v.Buf_file_path()
  
  local path = f.expand('%:p')
  return path
end

function v.Rgstr__clr()

  -- let @0 = ''
  f.setreg('0', '')
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

  v.Exe('e ')
end

-- load re  -  encode sjis

function v.Load_re__sjis()

  v.Exe('e ++enc=sjis')
end

-- encode

function v.Buf_file_encode()

  v.Exe('set enc?')
end

function v.Buf_file_bom()

  v.Exe('set bomb?')
end

-- file tmp

function v.File_tmp__cre() -- alias

  local tmp_path = f.system('mktemp ')
  return tmp_path
end

-- file cnd

function v.Is_file_type__(type)

  if &filetype == type then
    return true
  else
    return false
  end
end

-- opn xxx

-- opn file

function v.Opn(filename)

  v.Exe('tab drop ' .. filename)
end

function v.Opn_tmp_file()

  local path = v.File_tmp__cre()
  print( path )
  v.Opn(path)
end

function v.Opn_vimrc()

  v.Opn(g_vimrc_file_path)

  if f.has('nvim') then
    v.Opn(g_init_lua_file_path        )
    v.Opn(g_init_lua_key_map_file_path)
    v.Opn(g_init_lua_lua_file_path    )
  end

  if     v.Is_env__('linux')     then    -- c9 s9

    local vimrc_c9_file_path      = g_vimrc_dir .. '/c9/init.vim'
    -- v.Opn(vimrc_c9_file_path)

  elseif v.Is_env__('win32unix') then -- gitbash

    local vimrc_gitbash_file_path = g_vimrc_dir .. '/gitbash/init.vim'
    v.Opn(vimrc_gitbash_file_path)
  end
end

function v.Opn_fish_cnf()

  local path = '~/.config/fish/config.fish'
  v.Opn(path)
end

function v.Opn_man(cmd)

  v.Exe('tab new')
  v.Exe('Man ' .. cmd)
  v.Exe('only')
end

g_opn_memo_path = 'doc/memo.md'

function v.Opn_memo()

  v.Opn(g_opn_memo_path)
end

function v.Opn_grep_wk()

  g_grep_wk_path = '~/wrk/tmp/rg.md'

  local file_type = f.getftype(g_grep_wk_path)

  if v.Is_str__emp(file_type) then

    v.Opn(g_grep_wk_path)
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

  --local path = v.Line_str_by_line_num(line_num)
  local path = f.getline(line_num)

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
  print( path )

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

-- tag jmp by str

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

  local filename = rg_rslt_line_ar[0]
  local line_num = f.get(rg_rslt_line_ar, 1, 1)
  -- print( line_num )
  -- return

  if not f.filereadable(filename) then
    print( 'file does not exist' )
    return
  end

  v.Exe('tab drop ' .. filename)
  v.Normal(line_num .. 'G')
end

function v.Tag_jmp_by_cursor_line()

  local base_buf_num = v.Buf_num()

  local str = v.Cursor_line_str()
  v.Tag_jmp_by_str(str)

  v.Exe('sbuffer ' .. base_buf_num)
  -- v.Normal('j')
  v.Cursor__mv_d()
end

function v.Tag_jmp_by_slctd_line() -- range

  local base_buf_num = v.Buf_num()

  for line_num in f.range(a_firstline, a_lastline)

    local line = f.getline(line_num)
    v.Tag_jmp_by_str(line)
    v.Exe('sbuffer ' .. base_buf_num)
  endfor
end

-- buf

function v.Buf__quit()

  local cmd = 'bd'
  v.Exe(cmd)
end

function v.Buf__quit_swtch()

  local win_num = f.winnr('$')

  if win_num > 1 then
    v.Win_splt__quit()
  else
    v.Buf__quit()
  end
end

function v.Buf_num()

  return f.bufnr('%')
end

function v.Buf__fltr() -- use not

end

-- win splt

function v.Win__splt_h()

  local cmd = 'split'
  v.Exe(cmd)
end

function v.Win__splt_v()

  local cmd = 'vsplit'
  v.Exe(cmd)
end

function v.Win_splt_cursor__mv_nxt()

  local n_cmd = "\\<c-w>w"
  v.Normal(n_cmd)
end

function v.Win_splt__quit()

  local n_cmd = "\\<c-w>c"
  v.Normal(n_cmd)
end

-- 
-- line
-- 

function v.Line_num_file_edge_bgn()

  return f.line('^')
end

function v.Line_num_file_edge_end() -- alias

  return f.line('$')
end

-- line xx __ ins

g_line_top_space_ptn = '^[ \\t]*'

g_line_end_space_ptn = '[ \\t]*$'

function v.Line_end_space__del(line_num)
  
  local rpl_cmd = line_num .. 's/' .. g_line_end_space_ptn .. '//g'
  v.Exe(rpl_cmd)
end

function v.Line_end__pad_space(line_num, fil_end_col)

  local line_str     = f.getline(line_num)
  local line_str_len = v.Str_len(line_str)
  local space_len    = fil_end_col - line_str_len

  if space_len <= 0 then
    return
  end

  local space_str = v.Str_space(space_len)
  line_str = line_str .. space_str
  f.setline(line_num, line_str)
end

g_dots_str     = ' .. '
g_dots_put_col = 50

function v.Line__del_by_line_num(line_num)

  f.deletebufline('%', line_num)
end

-- line num

function v.Line_num_by_Line_info(line_info)

  local line_info = f.trim(line_info, ' ', 1)
  local line_num  = f.split(line_info, '\\s\\+')[0]
  return line_num
end

-- line cnd


-- 
-- cursor
-- 

-- cursor pos

function v.Cursor_pos() -- alias

  local pos = f.getpos('.')
  return pos
end

-- cursor col

function v.Cursor_col_num()

  return f.col('.')
end

function v.Cursor_col_idx()

  local idx = f.col('.') - 1
  return idx
end

-- cursor col cnd

function v.Is_cursor_col__line_end()

  if v.Cursor_col_num() == v.Cursor_line_end_col() then

    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_end_ovr() -- range

  if v.Cursor_col_num() >= v.Cursor_line_end_col() then
    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_end_inr()

  if v.Cursor_col_num() == v.Cursor_line_end_col() - 1 then

    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_top0()

  if v.Cursor_col_num() == 1 then
    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_top1()

  local pos_c = v.Cursor_pos()

  local col_c = v.Cursor_col_num()
  
  v.Cursor__mv_line_top1()
  local col_s1 = v.Cursor_col_num()
  
  f.setpos('.', pos_c)
  
  if col_c == col_s1 then
    return true
  else
    return false
  end
end

-- cursor __ mv

function v.Cursor__mv_by_col_num(col_num)

  if not v.Is_str__num(col_num) then
    return
  end

  local line_num = v.Cursor_line_num()

  v.Cursor__mv_by_line_col(line_num, col_num)
end

function v.Cursor__mv_by_line_num(line_num)

  if not v.Is_str__num(line_num) then
    return
  end

  v.Normal(line_num .. 'G')
end

function v.Cursor__mv_by_line_col(line_num, col)

  local line_num = (line_num == nil) and v.Cursor_line_num() or line_num
  
  f.cursor(line_num, col)
end

function v.Cursor__mv_by_line_info(line_info)
  
  local line_num = v.Line_num_by_Line_info(line_info)
  v.Cursor__mv_by_line_num(line_num)
end

function v.Cursor__mv_by_pos(pos)
  
  f.setpos('.', pos)
end

function v.Cursor__mv_line_top0()
  
  if v.Is_cursor_line_str__emp() then
    return
  end

  v.Normal('0')
end

function v.Cursor__mv_line_top1()

  if     v.Is_cursor_line_str__space() then
    v.Cursor__mv_line_end()

  elseif v.Is_line_markdown_itm() then
    v.Normal('^2l')
  else
    v.Normal('^')
  end
end

function v.Cursor__mv_line_end()

  if not v.Is_cursor_line_str__emp() then
    v.Normal('$l')
  end
end

function v.Cursor__mv_char_f()

  v.Normal('l')
end

function v.Cursor__mv_char_b()

  v.Normal('h')
end

function v.Cursor__mv_word_f()

  if     v.Is_cursor_col__line_end() or v.Is_cursor_col__line_end_inr() then

    v.Cursor__mv_char_f()
    return

  elseif v.Is_cursor_line_str_side_r__space() then

    v.Cursor__mv_line_end()
    return
  end

  local c_char = v.Cursor_c_char()
  local r_char = v.Cursor_r_char()

  -- if c_char =~ ' ' and r_char =~ ' ' then
  if v.Is_str__ptn(c_char, ' ') and v.Is_str__ptn(r_char, ' ') then
    v.Normal('w')
  else
    v.Normal('el')
  end
end

function v.Cursor__mv_word_b()
  
  local l_char = v.Cursor_l_char()

  if     v.Is_cursor_col__line_top0() then
    v.Cursor__mv_u_line_end()
    
  elseif v.Is_cursor_line_str_side_l__space() then
    v.Cursor__mv_line_top0()
    
  elseif v.Is_cursor_col__line_top1() then
    v.Cursor__mv_line_top0()
    
  elseif v.Is_char__symbol(l_char) then
    v.Cursor__mv_char_b()
    
  else
    v.Normal('b')
  end
end

function v.Cursor__mv_word_dlm_f()

  local ptn = '[_ABCDEFGHIJKLMNOPQRSTUVWXYZ]'
  -- local ptn = '[_\\u]'

  local line_num = v.Cursor_line_num()

  f.search(ptn, 'zW', line_num)
end

function v.Cursor__mv_word_b_pre() -- use not

  local c_char = v.Cursor_c_char()
  local l_char = v.Cursor_r_char()

  -- if c_char =~ ' ' and l_char !~ ' ' then
  if v.Is_str__ptn(c_char, ' ') and not v.Is_str__ptn(l_char, ' ') then
    v.Normal('gegel')
  else
    v.Normal('gel')
  end
end

function v.Cursor__mv_fnc_name() -- use not

  v.Cursor__mv_srch_ptn('(', 'f')
  v.Cursor__mv_word_b()
end

function v.Cursor__mv_u() -- alias

  v.Normal('k')
end

function v.Cursor__mv_d() -- alias

  v.Normal('j')
end

function v.Cursor__mv_v(drct)

  if     drct == 'u' then
    v.Cursor__mv_u()

  elseif drct == 'd' then
    v.Cursor__mv_d()

  else
    v.Cursor__mv_u()
  end
end

g_cursor_mv_line_step_dflt = 10

function v.Cursor__mv_mlt_u() -- alias

  g_cursor_mv_line_step = g_cursor_mv_line_step_dflt

  local n_cmd = g_cursor_mv_line_step .. "\\<c-y>"
  v.Normal(n_cmd)
end

function v.Cursor__mv_mlt_d() -- alias

  g_cursor_mv_line_step = g_cursor_mv_line_step_dflt

  local n_cmd = g_cursor_mv_line_step .. "\\<c-e>"
  v.Normal(n_cmd)
end

function v.Cursor__mv_u_line_end()

  v.Cursor__mv_u()
  v.Cursor__mv_line_end()
end

function v.Cursor__mv_line_top_or_new_line()

  if     v.Is_cursor_col__line_top0() then

    v.Cursor__ins_line_emp()

  elseif v.Is_cursor_col__line_top1() then

    v.Cursor__mv_line_top0()
  else
    v.Cursor__mv_line_top1()
  end
end

function v.Cursor__mv_slctd_edge_tgl() -- range

  v.Slct_re()
  v.Normal('o')
end

function v.Cursor__mv_slctd_edge_l() -- range

  v.Slct_re()

  if not v.Is_slctd_cursor_pos__r() then
    return
  end

  v.Cursor__mv_slctd_edge_tgl()

  -- local n_cmd = '`<'
  -- v.Normal(n_cmd)
end

function v.Cursor__mv_file_edge(n_cmd)

  if v.Is_cursor_line_num__file_edge() then
    v.Normal(n_cmd)
  end

  local cnt = 1
  local cnt_max = 10000

  while ( ! v.Is_cursor_line_num__file_edge() and cnt < cnt_max ) do

    v.Normal(n_cmd)
    cnt = cnt + 1
  end
end

function v.Cursor__mv_file_edge_bgn() -- alias

  v.Cursor__mv_file_edge('k')
end

function v.Cursor__mv_file_edge_end() -- alias

  v.Cursor__mv_file_edge('j')
end

function v.Cursor__mv_v_jmp_char(drct, is_space_through)

  --local is_space_stop = is_space_stop
  local is_space_through = is_space_through

  if drct == 'k' or drct == 'j' then

    local n_cmd = drct
  else
    return
  end

  v.Normal(n_cmd)
  local cnt = 1
  local cnt_max = 10000

  while ( ! v.Is_cursor_line_num__file_edge() and cnt < cnt_max ) do

    if not ( v.Is_cursor_c_char__space() or v.Is_cursor_col__line_end() ) then
      break
    end

    --if ( is_space_stop == 't' and v.Is_cursor_c_char__space() ) then
    if ( is_space_through == 'f' and v.Is_cursor_c_char__space() ) then
      break
    end

    v.Normal(n_cmd)
    cnt = cnt + 1
  end
end

function v.Cursor__mv_v_jmp_md_h(drct) -- todo dev

  if drct == 'k' or drct == 'j' then

    local n_cmd = drct
  else
    return
  end

  -- logic write ..

end

function v.Cursor__mv_v_jmp_space(drct)

  if drct == 'k' or drct == 'j' then

    local n_cmd = drct
  else
    return
  end

  v.Normal(n_cmd)

  local cnt = 1
  local cnt_max = 10000

  while ( ! v.Is_cursor_line_num__file_edge() and cnt < cnt_max ) do

    if v.Is_cursor_c_char__space() or v.Is_cursor_col__line_end() then
      break
    end

    v.Normal(n_cmd)
    cnt = cnt + 1
  end
end

function v.Cursor__mv_v_jmp(drct)

  if drct == 'k' or drct == 'j' then

    local n_cmd = drct
  else
    return
  end

  v.Normal(n_cmd)

  if v.Is_cursor_c_char__space() or v.Is_cursor_col__line_end() then

    v.Cursor__mv_v_jmp_char(n_cmd, 't')
  else
    v.Cursor__mv_v_jmp_space(n_cmd)
  end
end

function v.Cursor__mv_srch_ptn(ptn, dir) -- range

  local ptn = ptn

  if dir == 'b' then
    local opt_dir = 'b'
  else
    local opt_dir = ''
  end
  local opt = 'W' .. opt_dir
  -- local opt = 'zW' .. opt_dir

  local line_num = v.Cursor_line_num()

  f.search(ptn, opt, line_num)
end

function v.Cursor__mv_srch(drct)

  if     drct == 'f' then
    local op = ''
  elseif drct == 'b' then
    local op = 'b'
  end

  local ptn = f.getreg('/')
  f.search(ptn, op)
end

-- cursor __ ins

function v.Cursor__ins(str)

  local cmd = 'i' .. str
  v.Normal(cmd)
  v.Cursor__mv_char_f()
end

function v.Cursor__ins_with_cursor_fix(str) -- todo dev

end

-- cursor __ ins ynk ( paste )

function v.Cursor__ins_ynk()

  v.Normal('"aP')
end

function v.Cursor__ins_clp()

  v.Ynk__clp()
  v.Cursor__ins_ynk()
end

function v.Cursor__ins_mlt(str, num)

  if num == 0 then
    return
  end

  local cmd = num.'i'.str
  v.Normal(cmd)
end

function v.Cursor__ins_cr()

  local t_line_num = f.line('.')

  v.Normal("i\\<cr> ")
  v.Normal('x')

  v.Line_end_space__del(t_line_num)
  v.Cursor__mv_d()
end

function v.Cursor__ins_space(is_cursor_mv)

  if is_cursor_mv then
    v.Cursor__ins(' ')

  else
    v.Normal('i ')
    -- v.Normal('l')
  end
end

function v.Cursor__ins_hyphen()

  v.Normal('i-')
  -- v.Cursor__ins('-')
end

function v.Cursor__ins_tilde()

  v.Normal('i~')
  -- v.Cursor__ins('~')
end

function v.Cursor__ins_slash()

  v.Normal('i/')
  -- v.Cursor__ins('/')
end

function v.Cursor__ins_slashback()

  v.Normal('i\\')
  -- v.Cursor__ins('\\')
end

function v.Cursor__ins_quote()

  v.Normal("i' '")
  v.Normal('h')
end

function v.Cursor__ins_da()

  local da = f.strftime('%Y-%m-%d')
  v.Cursor__ins(da)
end

function v.Cursor__ins_tm()

  local tm = f.strftime('%H:%M')
  v.Cursor__ins(tm)
end

function v.Cursor__ins_dt()

  local dt = f.strftime('%Y-%m-%d.%H:%M')
  v.Cursor__ins(dt)
end

function v.Cursor__ins_ts()

  local ts = f.strftime('%Y-%m-%d.%H:%M:%S')
  v.Cursor__ins(ts)
end

g_week_def = { 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' }

function v.Cursor__ins_week()

  local week_num = f.strftime('%w') + 1
  local week     = g_week_def[week_num]
  v.Cursor__ins(week)
  -- v.Cursor__ins(' ' .. week)
end

-- cmnt

function v.Cursor__ins_cmnt_1(cmd_cursor__mv_line_top)

  if cmd_cursor__mv_line_top ~= nil then
    v.Normal(cmd_cursor__mv_line_top)
  end

  local str = v.Str_cmnt_1()
  v.Normal('i' .. str)
  
  v.Normal('^') -- or '0'
end

function v.V_ins_cmnt_1() -- range

  v.Normal(a_firstline .. 'G')
  v.Normal('^')
  local col = v.Cursor_col_num()

  for line_num in f.range(a_firstline, a_lastline)

    v.Line_end__pad_space(line_num, col - 1)

    v.Cursor__mv_by_line_col(line_num, col)

    v.Cursor__ins_cmnt_1(nil)
  endfor
end

function v.Cursor__ins_cmnt_mlt_by_pos(pos)

  local cmnt_mlt_def = {
    lua        = {'--[[' , '-- ** '},
    html       = {'<!--' ,  '-->'},
    css        = {'/*'   ,  ' */'},
    javascript = {'/*'   ,  ' */'},
    java       = {'/*'   ,  ' */'},
    dflt       = {'/*'   ,  ' */'},
  }

  local str = f.get(cmnt_mlt_def, &filetype, cmnt_mlt_def['dflt'])

  --if f.has_key(cmnt_mlt_def, &filetype) then
  --  local filetype = &filetype
  --else
  --  local filetype = 'dflt'
  --end
  --local str = cmnt_mlt_def[filetype]

  if     pos == 'bgn' then
    v.Normal('O')
    v.Normal('i' .. str[0])

  elseif pos == 'end' then
    v.Normal('o')
    v.Normal('i' .. str[1])
  end
end

function v.Cursor__ins_cmnt_mlt()

  v.Cursor__ins_cmnt_mlt_by_pos('bgn')
  v.Cursor__ins_cmnt_mlt_by_pos('end')
end

function v.V_ins_cmnt_mlt() -- range

  v.Normal(a_lastline  .. 'G')
  v.Cursor__ins_cmnt_mlt_by_pos('end')

  v.Normal(a_firstline .. 'G')
  v.Cursor__ins_cmnt_mlt_by_pos('bgn')
end

-- markdown

function v.Cursor__ins_markdown_h()

  v.Cursor__mv_line_top0()
  local top0_char = v.Cursor_c_char()

  local str = '#'

  if top0_char ~= str then
    str = str .. ' '
  end

  v.Cursor__ins(str)

  local ptn = '^#* '
  local col = v.Str_srch_end(v.Cursor_line_str(), ptn) + 1
  v.Cursor__mv_by_line_col(nil, col)
end

function v.Cursor__ins_markdown_cr()

  v.Cursor__ins('  ')
end

function v.Cursor__ins_markdown_itm()

  if v.Is_line_markdown_itm() then
    v.Cursor_line_indnt__shft_r()
    return
  end

  local col = v.Cursor_line_indnt__crct()

  local str = '- '
  --print( str )
  v.Cursor_line_top1__ins(str)
end

function v.Cursor__ins_markdown_code()

  local str = '```'
  v.Cursor__ins_line(str)
end

function v.Char_markdown_chk__tgl()
  
  if v.Cursor_l_char() ~= '[' or v.Cursor_r_char() ~= ']' then
    return
  end
  
  local cursor_char = v.Cursor_c_char()
  
  if cursor_char == ' ' then
    local rpl_char = 'x'
  else
    local rpl_char = ' '
  end
  
  v.Cursor_char__rpl(rpl_char)
end

-- cursor char

function v.Cursor_c_char()

  local idx = v.Cursor_col_idx()
  local c = f.getline('.')[idx]
  return c
end

function v.Cursor_l_char()

  local idx = v.Cursor_col_idx() - 1
  local c = f.getline('.')[idx]
  return c
end

function v.Cursor_r_char()

  local idx = v.Cursor_col_idx() + 1
  local c = f.getline('.')[idx]
  return c
end

function v.Cursor_u_char() -- dev doing

  if v.Is_cursor_line_num__file_edge_bgn() then
    return ''
  end

  local idx = v.Cursor_col_idx()
  local line_num = v.Cursor_line_num() - 1
  local c = f.getline(line_num)[idx]
  return c
end

function v.Cursor_d_char() -- dev doing

  if v.Is_cursor_line_num__file_edge_end() then
    return ''
  end

  local idx = v.Cursor_col_idx()
  local line_num = v.Cursor_line_num() + 1
  local c = f.getline(line_num)[idx]
  return c
end

-- cursor char __

function v.Cursor_char__rpl(rpl)

  v.Normal('r' .. rpl)
end

function v.Cursor_char__rpl_underscore() -- alias

  -- todo, case: line end

  v.Cursor_char__rpl('_')
  v.Normal('l')
  -- v.Cursor__mv_char_forward() -- todo, fnc cre
end

function v.N_char__tgl_swtch01() -- todo fnc name mod

  local c = v.Cursor_c_char()

  if     v.Is_char__num(c) then

    v.Cursor_str__icl()
    return

  elseif v.Is_char__alpha(c) then

    v.Normal('v~') -- upper / lower
    return
  end

  local rpl = v.Is_char__tgl_bracket_trn(c)
  if not v.Is_str__emp(rpl) then
    v.Cursor_char__rpl(rpl)
    return
  end

  local rpl = v.Is_char__tgl_symbol(c)
  if not v.Is_str__emp(rpl) then

    v.Cursor_char__rpl(rpl)
    return
  end
end

function v.N_char__tgl_swtch02()

  local c = v.Cursor_c_char()

  if v.Is_char__num(c) then

    v.Cursor_str__dcl()
    return
  end

  v.Cursor_char__tgl_type_shift(c)
end

function v.Cursor_char__tgl_type_shift(c)

  local rpl = ''

  if     c == "'" then
    rpl = '"'
  elseif c == '"' then
    rpl = '`'
  elseif c == '`' then
    rpl = "'"

  elseif c == "(" then
    rpl = '['
  elseif c == "[" then
    rpl = '{'
  elseif c == "{" then
    rpl = '<'
  elseif c == "<" then
    rpl = '('

  elseif c == ")" then
    rpl = ']'
  elseif c == "]" then
    rpl = '}'
  elseif c == "}" then
    rpl = '>'
  elseif c == ">" then
    rpl = ')'
  end

  if not v.Is_str__emp(rpl) then

    v.Cursor_char__rpl(rpl)
    return
  end
end

function v.Cursor_c_char__del()

  local cmd = '"zx'
  v.Normal(cmd)
end

function v.Cursor_c_char__del_ynk()

  local cmd = '"ax'
  v.Normal(cmd)
end

-- cursor char cnd

function v.Is_cursor_c_char__ptn(ptn)

  local c = v.Cursor_c_char()

  -- if c =~ ptn then
  if v.Is_str__ptn(c, ptn) then
    return true
  else
    return false
  end
end

function v.Is_cursor_c_char__space()

  local c = v.Cursor_c_char()

  -- if c =~ '\\s' then
  if v.Is_str__ptn(c, '\\s') then
    return true
  else
    return false
  end

  -- local ptn = '\\s'
  -- local ret = v.Is_cursor_c_char__ptn(ptn)
  -- return ret
end

function v.Is_cursor_c_char__alph()

  local ptn = '\\a'
  local ret = v.Is_cursor_c_char__ptn(ptn)
  return ret
end

-- cursor str

-- cursor str __

function v.Cursor_str__icl()

  local n_cmd = "\\<c-a>"
  v.Normal(n_cmd)
end

function v.Cursor_str__dcl()

  local n_cmd = "\\<c-x>"
  v.Normal(n_cmd)
end

function v.Cursor_str_week__icl()

  local week_str = v.Cursor_word()
  local week_idx = f.index(g_week_def, week_str)

  if week_idx == -1 then
    return
  end

  local week_nxt_idx = v.Idx__icl(week_idx, f.len(g_week_def))
  local week_nxt_str = g_week_def[week_nxt_idx]

  v.Slctd_str__word()
  v.Normal('"zd')
  v.Normal('i' .. week_nxt_str)
end

function v.Cursor_str_week__dcl()

  local week_str = v.Cursor_word()
  local week_idx = f.index(g_week_def, week_str)

  if week_idx == -1 then
    return
  end

  local week_nxt_idx = v.Idx__dcl(week_idx, f.len(g_week_def))
  local week_nxt_str = g_week_def[week_nxt_idx]

  v.Slctd_str__word()
  v.Normal('"zd')
  v.Normal('i' .. week_nxt_str)
end

-- cursor etc

function v.Cursor_word()

  local word = f.expand('<cword>')
  return word
end

function v.Cursor_filepath()

  local str

  if     v.Is_env__('mac') then

    str = f.expand('<cfile>')

  elseif v.Is_env__('win64') then

    str = v.Cursor_line_str()

  elseif v.Is_env__('win32unix') then

    str = v.Cursor_line_str()

  else
    str = v.Cursor_line_str()
  end
  
  str = f.trim(str)
  
  return str
end

-- cursor __ ins line

function v.Cursor__ins_line(str)

  local line_num = v.Cursor_line_num() - 1
  f.append(line_num, str)
  v.Cursor__mv_u()
end

function v.Cursor__ins_line_emp()

  local str = ''
  v.Cursor__ins_line(str)
end

function v.Cursor__ins_line_buf_file_path()

  local path = v.Buf_file_path()
  v.Cursor__ins_line(path)
end

function v.Cursor__ins_line_anchor()

  local str  = v.Str_cmnt_1()
  str = str .. 'dev '
  str = str .. 'anchor'
  v.Cursor__ins_line(str)
  v.Cursor_line_indnt__crct()
end

function v.Cursor_d__ins_line(str)

  local line_num = v.Cursor_line_num()
  v.append(line_num, str)
end

function v.Cursor_d__ins_line_space() -- range

  local space_len = v.Cursor_col_num() - 1
  local space_str = v.Str_space(space_len)
  v.Cursor_d__ins_line(space_str)
end

-- cursor line  -  todo refactoring

function v.Cursor_line_num() -- alias

  return f.line('.')
end

function v.Cursor_line_end_col() -- alias

  local col = f.col('$')
  return col
end

-- cursor line str

function v.Cursor_line_str()

  return f.getline('.')
end

function v.Cursor_line_str_len()

  local len = v.Cursor_line_end_col() - 1
  return len
end

function v.Cursor_line_str_side_l()

  local line_l = f.getline('.')[:f.col('.')-2]
  return line_l
end

function v.Cursor_line_str_side_r()

  local line_r = f.getline('.')[f.col('.'):]
  return line_r
end

function v.Cursor_line_str_side_r_with_c()

  local line_r = f.getline('.')[f.col('.') - 1:]
  return line_r
end

-- cursor line str end

-- cursor line str __

function v.Cursor_line_top0__ins(str)

  v.Cursor__mv_line_top0()
  v.Cursor__ins(str)
end

function v.Cursor_line_top1__ins(str)

  v.Cursor__mv_line_top1()
  v.Cursor__ins(str)
end

function v.Cursor_line_end__dots_adjst() -- todo dev, mb_str

  local line_str = v.Cursor_line_str()
  local idx = v.Str_srch(line_str, f.escape(g_dots_str, '.'))

  if idx >= 0 then
    v.Cursor_line_end_dots__crct()
  else
    v.Cursor_line_end__ins_dots()
  end
end

function v.Cursor_line_end_dots__crct()

  local line_str = v.Cursor_line_str()
  local idx = v.Str_srch(line_str, f.escape(g_dots_str, '.'))

  if     idx < 0 then
    return
  elseif idx == g_dots_put_col then
    return
  end

  local line_str_0 = f.strcharpart(line_str,     0, idx)
  local line_str_1 = f.strcharpart(line_str, idx       )

  if     idx < g_dots_put_col then

    local space_str = v.Str_space(g_dots_put_col - idx)
    line_str = line_str_0 .. space_str .. line_str_1
  else
    line_str_0 = f.strcharpart(line_str_0, 0, g_dots_put_col)
    line_str = line_str_0 .. line_str_1
  end

  local line_num = v.Cursor_line_num()
  f.setline(line_num, line_str)
end

function v.Cursor_line_end__ins_dots()

  local line_num = v.Cursor_line_num()

  local line_str = v.Cursor_line_str()

  local line_str_len = v.Cursor_line_str_len()

  local space_len = g_dots_put_col - line_str_len
  if space_len < 0 then
    space_len = 0
  end

  local space_str = v.Str_space(space_len)

  line_str = line_str .. space_str .. g_dots_str

  f.setline(line_num, line_str)
end

function v.Curosr_line_end__ins(str)

  local n_cmd = 'A' .. str
  v.Normal(n_cmd)
end

-- cursor f

function v.Cursor_f_space__del()

  local c = v.Cursor_c_char()

  -- if c =~ '\\s' then
  if v.Is_str__ptn(c, '\\s') then
    -- print( "del" )
    v.Slctd_str__cursor_f_space()
    v.Normal('"zd')
  else
    v.Nothing()
  end
end

-- cursor __ ins line

function v.Cursor_line__del()

  if v.Is_cursor_line_str__emp() or v.Is_cursor_line_str__space() then
    v.Normal('"_dd') -- rgstr del
  else
    v.Normal('"add')
    v.Clp__ynk()
  end
end

function v.Cursor_f_str__crct_by_line_u()

  v.Cursor_f_str__crct_by_line('u')
end

function v.Cursor_f_str__crct_by_line_d()

  v.Cursor_f_str__crct_by_line('d')
end

function v.Cursor_f_str__crct_by_line(target_line_drct)

  local cursor_pos = v.Cursor_pos()

  local str = v.Cursor_line_str_side_r_with_c()
  local trim_len = v.Str_srch(str, '[^ ]')
  -- print( trim_len )
  local str = f.trim(str)

  local cursor_r_char =  v.Str_l_char(str)
  -- print( cursor_r_char )

  v.Cursor__mv_v(target_line_drct)

  local target_line_str = v.Cursor_line_str_side_r()

  if target_line_drct == 'u' then
    local turn_drct = 'd'
  else
    local turn_drct = 'u'
  end
  v.Cursor__mv_v(turn_drct)

  local crct_len = v.Str_srch(target_line_str, cursor_r_char) + 1
  -- print( crct_len )
  if crct_len == -1 then
    return
  end

  local crct_len = crct_len - trim_len
  local space_str = v.Str_space(crct_len)
  v.Cursor__ins(space_str)

  v.Cursor__mv_by_pos(cursor_pos)
end

function v.Cursor__ins_sys_cmd(sys_cmd) -- read

  local is_line_num_eq_1 = v.Is_cursor_line_num__file_edge_bgn()

  if is_line_num_eq_1 then
    v.Normal('O')
  else
    -- v.Normal('k')
    v.Cursor__mv_u()
  end

  local cmd = 'read ! ' .. sys_cmd
  v.Exe(cmd)

  if is_line_num_eq_1 then
    v.Line__del_by_line_num(1)
  end
end

-- cursor line str __ end

-- cursor line cnd

function v.Is_cursor_line_num__(line_num)

  local ret = false

  local line_num = v.Cursor_line_num()

  if line_num == line_num then
    ret = true
  end
  return ret
end

function v.Is_cursor_line_num__file_edge_bgn()

  local line_num = 1
  local ret = v.Is_cursor_line_num__(line_num)
  return ret
end

function v.Is_cursor_line_num__file_edge_end()

  local line_num = v.Line_num_file_edge_end()
  local ret = v.Is_cursor_line_num__(line_num)
  return ret
end

function v.Is_cursor_line_num__file_edge()

  local ret = false

  if v.Is_cursor_line_num__file_edge_bgn() or v.Is_cursor_line_num__file_edge_end() then
    ret = true
  end
  --print( ret )
  return ret
end

function v.Is_cursor_line_str__emp()
  
  if v.Cursor_line_end_col() == 1 then
    return true
  else
    return false
  end
end

function v.Is_cursor_line_str__space()
  
  local str = v.Cursor_line_str()
  local ret = v.Is_str__space(str)
  return ret
end

function v.Is_cursor_line_str_side_l__space()

  local str = v.Cursor_line_str_side_l()
  local ret = v.Is_str__space(str)
  return ret
end

function v.Is_cursor_line_str_side_r__space()

  local str = v.Cursor_line_str_side_r()
  local ret = v.Is_str__space(str)
  return ret
end

function v.Is_cursor_line_str__ptn(ptn) -- todo dev

  local str = v.Cursor_line_str_side_r()

  local ret = false

  if v.Is_str__ptn(str, ptn) then
    ret = true
  end
  return ret
end

-- indnt

function v.Cursor_line_indnt_col_with_c()

  local col = f.cindent(Cursor_line_num())
  return col
end

function v.Cursor_line_indnt__add(col)

  if col == 0 then
    return
  end

  v.Normal('0')

  if &expandtab then -- 1:'expandtab', 0:'noexpandtab'
    local char = ' '
    col = col
  else
    local char = "\\t"
    col = col / 2
  end
  v.Cursor__ins_mlt(char, col)

  v.Cursor__mv_line_top1()
end

function v.Cursor_line_indnt__del() -- alias

  v.Exe('left')
end

function v.Cursor_line_indnt__shft_l()

  v.Normal('<<')
  v.Cursor__mv_line_top1()
end

function v.Cursor_line_indnt__shft_r()

  local col = 2

  v.Cursor_line_indnt__add(col)
end

function v.Cursor_line_indnt__crct()

  local col = v.Cursor_line_indnt__crct_with_c()
  return col
end

function v.Cursor_line_indnt__crct_with_c()

  v.Cursor_line_indnt__del()

  local col = v.Cursor_line_indnt_col_with_c()
  --print( col )

  v.Cursor_line_indnt__add(col)
  return col
end

g_v_rng = "'<,'>"

-- 
-- slctd
-- 

-- slctd __ ( slct )

function v.Slctd__cancel() -- range -- alias

  v.Esc()
end

-- refactoring slct > slctd __ xxx

function v.Slct_re() -- range

  if f.mode() == "\\<c-v>" or f.mode() == "v" then
    return
  end

  v.Normal('gv')
end

function v.Slctd_str__all()

  v.Normal('ggVG')
end

function v.Slctd_str__word()

  local c = v.Cursor_c_char()

  -- if     c =~ '\\w' then
  if     v.Is_str__ptn(c, '\\w') then
    v.Normal('viw')

  -- elseif c =~ '\\s' then
  elseif v.Is_str__ptn(c, '\\s') then
    v.Slctd_str__cursor_f_space()
  else
    v.Normal('v')
  end
end

function v.Slctd__word_by_under_score()

end

function v.Slctd_str__cursor_f_space()

  local c = v.Cursor_c_char()

  -- if c !~ '\\s' then
  if not v.Is_str__ptn(c, '\\s') then
    return
  end
  --print( c )

  if v.Is_cursor_line_str_side_r__space() then

    v.Normal('v')
    v.Normal('$h')
    --v.Cursor__mv_word_f()
    --v.Normal('h')

  else
    v.Normal('vwh')
  end
end

function v.Slctd_str__by_col_len(s_col, len)

  local e_col = len - 1

  v.Slct_by_line_col(nil, s_col, nil, e_col)
end

-- refactoring slct > slctd __ xxx

function v.Slct_by_pos(s_pos, e_pos) -- use not

  v.Cursor__mv_by_pos(s_pos)
  v.Normal('v')
  v.Cursor__mv_by_pos(e_pos)
end

-- refactoring slct > slctd __ xxx

function v.Slct_by_line_col(s_line, s_col, e_line, e_col)

  local s_line = (s_line == nil) and v.Cursor_line_num() or s_line
  local e_line = (e_line == nil) and v.Cursor_line_num() or e_line

  v.Cursor__mv_by_line_col(s_line, s_col)
  v.Normal('v')
  v.Cursor__mv_by_line_col(e_line, e_col)
end

-- refactoring slct > slctd __ xxx

function v.Slct_by_line_rng(line_num_fr, line_num_to)
  
  v.Cursor__mv_by_line_num(line_num_fr)
  v.Normal('V')
  v.Cursor__mv_by_line_num(line_num_to)
end

-- slctd cursor __ mv

function v.Slctd_cursor__mv_slctd_edge_r() -- range
  
  v.Slct_re()

  if v.Is_slctd_cursor_pos__r() then
    return
  end

  v.Cursor__mv_slctd_edge_tgl()

  -- local n_cmd = '`>'
  -- v.Normal(n_cmd)
end

function v.Slctd_cursor_drct__mv_forward() -- range

  v.Slct_re()

  if v.Is_slctd_cursor_pos__r() then
    return
  end

  v.Cursor__mv_slctd_edge_tgl()
end

function v.Slctd_cursor__mv_file_edge(n_cmd)

  v.Slct_re()

  v.Cursor__mv_file_edge(n_cmd)
end

function v.Slctd_cursor__mv_v_jmp(drct) -- range

  v.Slct_re()
  v.Cursor__mv_v_jmp(drct)
end

function v.Slctd_cursor__mv_line_end() -- range

  v.Slct_re()

  if     v.Is_slctd_mode__box() then

    if v.Is_cursor_col__line_end_ovr() then
      return
    end

    v.Normal('$h')
    --v.Normal('g_')

  elseif v.Is_slctd_mode__line() then

    if v.Is_cursor_line_str__emp() then
      return
    end

    v.Normal('$h')
    --v.Normal('g_')
  else
    print( "v mode else" )
  end
end

-- slctd cursor cnd

function v.Is_slctd_cursor_pos__r() -- range

  local ret = false

  v.Slct_re()

  local cursor_pos1 = v.Cursor_pos()
  -- print( cursor_pos1 )

  v.Cursor__mv_slctd_edge_tgl()
  local cursor_pos2 = v.Cursor_pos()
  -- print( cursor_pos2 )

  v.Cursor__mv_slctd_edge_tgl()


  if     cursor_pos1[1] >  cursor_pos2[1] then -- line
    ret = true

  elseif cursor_pos1[1] == cursor_pos2[1] then -- line

    if   cursor_pos1[2] >= cursor_pos2[2] then -- col
      ret = true
    end
  end

  -- print( ret )
  return ret
end

-- slctd str

function v.Slctd_str() -- range

  -- v.Normal('gv"zy')

  v.Slct_re()
  v.Normal('"zy')

  v.Slct_re()

  -- return @z
  return f.getreg('z')
end

function v.Slctd_str_len() -- range

  v.Slct_re()

  local slctd_str = v.Slctd_str()
  local len       = v.Str_len(slctd_str)
  return len
end

function v.Slctd_str_7_opn_ggl_srch()

  local word = v.Slctd_str()
  local word = f.trim(word)
  v.Opn_ggl_srch(word)
end

function v.Slctd_str_7_opn_yt()
  
  local yt_video_id = v.Slctd_str()
  local yt_video_id = f.trim(yt_video_id)
  v.Opn_yt(yt_video_id)
end

-- slctd str __ ( expnd )

function v.Slctd_str__expnd() -- expnd lr, cre re

end

function v.Slctd_str__expnd_srch() -- range -- todo dev

  v.Slct_re()
  v.Cursor__mv_srch("f")
end

function v.Slctd_str__expnd_word_f() -- range

  local slctd_str = v.Slctd_str()
  local slctd_r_out_char = v.Slctd_str_edge_r_out_char()

  v.Slct_re()

  if     v.Is_cursor_line_str_side_r__space() then

    v.Normal('$h')

  -- elseif slctd_str =~ '\\s' and slctd_r_out_char =~ '\\s' then
  elseif v.Is_str__ptn(slctd_str, '\\s') and v.Is_str__ptn(slctd_r_out_char, '\\s') then

    v.Normal('wh')
  else
    v.Normal('e')
  end
end

-- slctd __ expnd quote

g_quote_ptn = '[' .. "'" .. '"' .. '`' .. ']'

function v.Slctd_str__expnd_quote_on_f() -- range

  v.Slct_re()
  v.Cursor__mv_srch_ptn(g_quote_ptn, 'f')
end

function v.Slctd_str__expnd_quote_on_b() -- range

  v.Slct_re()

  v.Cursor__mv_slctd_edge_tgl()
  v.Cursor__mv_srch_ptn(g_quote_ptn, 'b')
  -- v.Cursor__mv_slctd_edge_tgl ()
end

function v.Slctd_str__expnd_quote_on_swtch() -- range

  -- v.Is_cursor_line_str__ptn() -- todo dev ?

  v.Slct_re()

  local c = v.Cursor_c_char()

  -- if c !~ g_quote_ptn then
  if not v.Is_str__ptn(c, g_quote_ptn) then
    v.Slctd_str__expnd_quote_on_f()
  else
    v.Slctd_str__expnd_quote_on_b()
  end
end

function v.Slctd_str__expnd_quote_on() -- range

  v.Slct_re()

  v.Slctd_str__expnd_quote_on_f()
  v.Slctd_str__expnd_quote_on_b()
end

function v.Slctd_str__expnd_quote_in_f() -- range

  v.Slctd_str__expnd_quote_on_f()
  v.Normal('h')
end

function v.Slctd_str__expnd_quote_in_b() -- range

  v.Slctd_str__expnd_quote_on_b()
  v.Normal('l')
  -- v.Cursor__mv_slctd_edge_tgl()
end

function v.Slctd_str__expnd_quote_in_swtch() -- range

  v.Slct_re()

  if not v.Is_cursor_line_str__ptn(g_quote_ptn) then
    return
  end

  local c_r = v.Slctd_str_edge_r_out_char()

  -- if c_r !~ g_quote_ptn then
  if not v.Is_str__ptn(c_r, g_quote_ptn) then

    v.Slctd_str__expnd_quote_in_f()
  else
    v.Slctd_str__expnd_quote_in_b()
  end
end

function v.Slctd_str__expnd_quote_swtch() -- range

  v.Slct_re()

  if v.Is_slctd_str_edge_char__quote() then
    -- v.Esc()
    return
  end

  if v.Is_slctd_str_edge_out_char__quote() then

    v.Slctd_str__expnd_quote_on()
  else
    v.Slctd_str__expnd_quote_in_swtch()
  end
end

function v.Slctd_str__expnd_bracket_f() -- range -- todo dev

  local bracket_ptn = '[' .. "'" .. '"`)}\\]' .. ']'
  
  local s_col = v.Slctd_str_edge_l_col()
  
  local line_str_r = v.Slctd_str_edge_r_out_str()
  local srch_idx = v.Str_srch(line_str_r, bracket_ptn, 1)

  if srch_idx == -1 then

    v.Normal('gv')
    return
  end

  local len = s_col + v.Slctd_str_len() + srch_idx
  v.Slctd_str__by_col_len(s_col, len)
end

function v.Slctd_str__reduce_dlm_l(char) -- range

  local char = char

  v.Slct_re()

  local slctd_str = v.Slctd_str()
  local srch_idx = v.Str_srch(slctd_str, char)
  if srch_idx == -1 then
    v.Slctd__cancel()
    return
  end

  local n_cmd = 'F' .. char .. 'h'
  v.Normal(n_cmd)
end

-- slctd str __ ( edit )

function v.Slctd_str__ynk() -- range

  v.Slct_re()
  v.Normal('"zd')
  v.Cursor__ins_ynk()
end

function v.Slctd_str__clp() -- range

  v.Ynk__clp()
  v.Slctd_str__ynk()
end

-- slctd str __ rpl

function v.Slctd_str__rpl(srch, rpl) -- range

  v.Slctd_box__rpl(srch, rpl)
end

-- slctd str __ ( rpl )

function v.Slctd_str__(str) -- range -- todo dev

end

-- slctd str __ rpl, srch nxt slctd

function v.Slctd__rpl_7_srch_nxt() -- dir forward only

  v.Slct_re()
  v.Normal('"zd"aPlgn')
end

-- slctd str __ del

function v.V_slctd__del() -- dev doing, can

  v.Slct_re()

  v.Normal('"ad')
  -- let @+ = @a
  f.getreg('+', f.getreg('a'))
end

function v.Slctd__del() -- range

  v.Slct_re()

  local rgstr = 'z'

  local cmd = '"' .. rgstr .. 'dgv'
  v.Normal(cmd)
end

-- slctd str __ pad

function v.Slctd__pad(char) -- range

  local char = char

  if char == '|' then
    local char = "\\<bar>"
  end

  v.Slct_re()

  v.Normal('r' .. char)

  v.Slct_re()
end

function v.Slctd__pad_space() -- range

  v.Slctd__pad(' ')
end

function v.Slctd__pad_bar() -- range

  v.Slctd__pad('|')
end

function v.Slctd_str_space__underscore() -- range

  v.Slctd_str__rpl(' ', '_')
end

-- slctd str cnd

function v.Is_slctd_str__srch_str()

  -- if v.Slctd_str() == @/ then
  if v.Slctd_str() == f.getreg('/') then
    return true
  else
    return false
  end
end

function v.Is_slctd_str__line_mlt()

  -- if Slctd_str() =~ '\\n' then
  if v.Is_str__ptn(v.Slctd_str(), '\\n') then
    return true
  else
    return false
  end
end

-- slctd str edge

function v.Slctd_str_edge_l_col()

  v.Cursor__mv_slctd_edge_l()
  
  local col = v.Cursor_col_num()
  return col
end

function v.Slctd_str_edge_r_col()

  v.Slctd_cursor__mv_slctd_edge_r()
  
  local col = v.Cursor_col_num()
  return col
end

function v.Slctd_str_edge_l_pos()

  v.Cursor__mv_slctd_edge_l()
  local pos = v.Cursor_pos()
  return pos
end

function v.Slctd_str_edge_r_pos()

  v.Slctd_cursor__mv_slctd_edge_r()
  local pos = v.Cursor_pos()
  return pos
end

function v.Slctd_str_edge_l_char()

  v.Cursor__mv_slctd_edge_l()

  local c_char = v.Cursor_c_char()
  return c_char
end

function v.Slctd_str_edge_r_char()

  v.Slctd_cursor__mv_slctd_edge_r()

  local c_char = v.Cursor_c_char()
  return c_char
end

function v.Slctd_str_edge_l_out_char()

  v.Cursor__mv_slctd_edge_l()

  local l_char = v.Cursor_l_char()
  return l_char
end

function v.Slctd_str_edge_r_out_char()

  v.Slctd_cursor__mv_slctd_edge_r()

  local r_char = v.Cursor_r_char()
  return r_char
end

function v.Slctd_str_edge_l_out_str()

  v.Cursor__mv_slctd_edge_l()

  local str = v.Cursor_line_str_side_l()
  return str
end

function v.Slctd_str_edge_r_out_str()

  v.Slctd_cursor__mv_slctd_edge_r()

  local str = v.Cursor_line_str_side_r()
  return str
end

-- slctd str edge __ ( edit )

function v.Slctd_str_edge_out__ins(c) -- range

  v.Slct_re()

  if a_firstline ~= a_lastline then
    v.Slctd__cancel()
    return
  end

  local c_l = c

  local c_r = c
  if     c == '(' then
    c_r = ')'
  elseif c == '{' then
    c_r = '}'
  elseif c == '[' then
    c_r = ']'
  elseif c == '<' then
    c_r = '>'
  end

  v.Normal('"zx')
  v.Cursor__ins(c_l .. c_r)

  local str_len = v.Str_len(c_l)
  v.Normal(str_len .. 'h')

  v.Normal('"zP')
  v.Normal('gv')

  local cnt = 0
  while cnt < str_len do

    v.Slctd_box__mv('r')

    cnt = cnt + 1
  end
end

function v.Slctd_str_edge_out__ins_markdown_strikethrough()

  v.Slct_re()

  if a_firstline ~= a_lastline then
    v.Slctd__cancel()
    return
  end

  v.Slctd_str_edge_out__ins('~~')
end

function v.Slctd_str_edge_out__ins_markdown_bold()

  v.Slctd_str_edge_out__ins('**')
end

function v.Slctd_str_edge_out_char__tgl() -- range

  v.Slctd_str_edge_out_char__tgl_swtch()
end

function v.Slctd_str_edge_out_char__tgl_swtch() -- range

  -- char chk
  local c_l = v.Slctd_str_edge_l_out_char()
  local c_r = v.Slctd_str_edge_r_out_char()
  -- print( c_l c_r )

  if     c_l == "'" and c_l == c_r then
    v.Slctd_str_edge_out_quote__tgl()
  elseif c_l == '"' and c_l == c_r then
    v.Slctd_str_edge_out_quote__tgl()
  elseif c_l == '`' and c_l == c_r then
    v.Slctd_str_edge_out_quote__tgl()

  elseif c_l == '(' and c_r == ')' then
    v.Slctd_str_edge_out_bracket__tgl()
  elseif c_l == '{' and c_r == '}' then
    v.Slctd_str_edge_out_bracket__tgl()
  elseif c_l == '[' and c_r == ']' then
    v.Slctd_str_edge_out_bracket__tgl()
  elseif c_l == '<' and c_r == '>' then
    v.Slctd_str_edge_out_bracket__tgl()

  else
    v.Slctd_str_edge_out_quote__tgl()
  end
end

function v.Slctd_str_edge_out_quote__tgl() -- range

  v.Slct_re()

  if a_firstline ~= a_lastline then
    return
  end

  if v.Is_cursor_col__line_end() then
    return
  end

  -- char chk
  local c_l = v.Slctd_str_edge_l_out_char()
  local c_r = v.Slctd_str_edge_r_out_char()
  -- print( c_l c_r )

  if     c_l == "'" and c_l == c_r then

    v.Slctd_str_edge_out_char__del()
    local c = '"'
    v.Slctd_str_edge_out__ins(c)

  elseif c_l == '"' and c_l == c_r then

    v.Slctd_str_edge_out_char__del()
    local c = '`'
    v.Slctd_str_edge_out__ins(c)

  elseif c_l == '`' and c_l == c_r then

    v.Slctd_str_edge_out_char__del()
  else
    local c = "'"
    v.Slctd_str_edge_out__ins(c)
  end
end

function v.Slctd_str_edge_out_bracket__tgl() -- range

  v.Slct_re()

  if a_firstline ~= a_lastline then
    return
  end

  if v.Is_cursor_col__line_end() then
    return
  end

  -- char chk
  local c_l = v.Slctd_str_edge_l_out_char()
  local c_r = v.Slctd_str_edge_r_out_char()
  -- print( c_l c_r )

  if     c_l == '(' and c_r == ')' then

    v.Slctd_str_edge_out_char__del()
    local c = '{'
    v.Slctd_str_edge_out__ins(c)

  elseif c_l == '{' and c_r == '}' then

    v.Slctd_str_edge_out_char__del()
    local c = '['
    v.Slctd_str_edge_out__ins(c)

  elseif c_l == '[' and c_r == ']' then

    v.Slctd_str_edge_out_char__del()
    local c = '<'
    v.Slctd_str_edge_out__ins(c)

  elseif c_l == '<' and c_r == '>' then

    v.Slctd_str_edge_out_char__del()
  else
    local c = '('
    v.Slctd_str_edge_out__ins(c)
  end
end

function v.Slctd_str_edge_out__tgl_shft() -- range

  v.Slct_re()

  if a_firstline ~= a_lastline then
    return
  end

  if v.Is_cursor_col__line_end() then
    return
  end

  -- char chk
  local c_l = v.Slctd_str_edge_l_out_char()
  local c_r = v.Slctd_str_edge_r_out_char()
  -- print( c_l c_r )

  if     v.Is_char_pair__quote(c_l, c_r) then
    v.Slctd_str_edge_out_char__del()
    v.Slctd_str_edge_out_bracket__tgl()

  elseif v.Is_char_pair__bracket(c_l, c_r) then
    v.Slctd_str_edge_out_char__del()
    v.Slctd_str_edge_out_quote__tgl()

  else
    v.Slctd_str_edge_out_bracket__tgl()
  end
end

function v.Slctd_str_edge_out_char__del() -- range

  v.Slct_re()

  if v.Is_slctd_str_edge_l_col__line_top() then
    return
  end

  v.Normal('"zx')
  v.Normal('xhx')
  v.Normal('"zP')
  v.Normal('gv')
  v.Slctd_box__mv('l')
end

-- slctd str edge cnd

function v.Is_slctd_str_edge_char__(ptn)

  local c1 = v.Slctd_str_edge_l_char()
  local c2 = v.Slctd_str_edge_r_char()

  local ret = v.Is_char_pair__(ptn, c1, c2)
  return ret
end

function v.Is_slctd_str_edge_char__quote()

  local ret = v.Is_slctd_str_edge_char__(g_quote_ptn)
  return ret
end

function v.Is_slctd_str_edge_out_char__(ptn)

  local c1 = v.Slctd_str_edge_l_out_char()
  local c2 = v.Slctd_str_edge_r_out_char()

  local ret = v.Is_char_pair__(ptn, c1, c2)
  return ret
end

function v.Is_slctd_str_edge_out_char__quote()

  local ret = v.Is_slctd_str_edge_out_char__(g_quote_ptn)
  return ret
end

function v.Is_slctd_str_edge_l_col__line_top() -- range

  local ret = false

  v.Slct_re()

  v.Cursor__mv_slctd_edge_tgl()
  local cursor_l_pos = v.Cursor_pos()
  -- print( cursor_l_pos )

  v.Cursor__mv_slctd_edge_tgl()

  if cursor_l_pos[2] == 1 then -- col
    ret = true
  end

  return ret
end

-- slctd line

function v.Slctd_line_7_opn_app() -- range

  for line_num in f.range(a_firstline, a_lastline)

    v.Opn_app_by_line_path(line_num)
  endfor
end

-- slctd line __ ( edit )

function v.Slctd_line__del() -- use not, todo dev

  v.Normal('gvj')
  --v.Normal('"ad')

  v.Clp__ynk()
end

-- todo refactoring, fnc name mod, v > slctd

-- slctd line __ rpl

function v.Slctd_line__rpl(srch, rpl) -- range

  local cmd = g_v_rng .. 's/' .. srch .. '/' .. rpl .. '/g'
  --print( cmd )
  v.Exe(cmd)
end

function v.Slctd_line__rpl_by_line1_line2() -- range

  local srch = f.getline(1)
  local rpl  = f.getline(2)

  --local rng = '3,$'
  local rng = g_v_rng
  local cmd = rng .. 's/' .. srch .. '/' .. rpl .. '/g'
  --print( cmd )
  v.Exe(cmd)
end

function v.Slctd_line__rpl_sys_cmd(sys_cmd) -- range -- read

  local cmd = "'<,'>" .. " ! " .. sys_cmd
  v.Exe(cmd)
end

function v.Slctd_line_srch_str__rpl_cr() -- range

  -- local srch = @/
  local srch = f.getreg('/')

  local cmd = g_v_rng .. 's/\\(' .. srch .. '\\)/\\1\\r/g'
  v.Exe(cmd)
end

function v.Slctd_line__markdown_strikethrough() -- range -- todo dev

end

function v.Slctd__sys_cmd(sys_cmd) -- range

  local cmd = g_v_rng .. '! ' .. sys_cmd
  v.Exe(cmd)
end

function v.Slctd_line_top_space__del() -- refactoring ?

  local rpl_cmd = 's/' .. g_line_top_space_ptn .. '//g'
  v.Exe(rpl_cmd)
end

function v.Slctd_line_end_space__del() -- range

  for line_num in f.range(a_firstline, a_lastline)

    v.Line_end_space__del(line_num)
  endfor
end

function v.Slctd_line_end__pad_space() -- range -- use not

  -- use recommend "aygvr gv

  v.Slct_re()
  v.Normal('o')

  local fil_end_col = v.Cursor_col_num() - 1

  for line_num in f.range(a_firstline, a_lastline)

    v.Line_end__pad_space(line_num, fil_end_col)
  endfor
end

function v.Slctd_line__join_per_line(per_line_num) -- range

  local n_cmd = per_line_num .. 'Jj'

  local line_num = a_lastline - a_firstline + 1

  local exe_num = line_num / per_line_num
  --print( exe_num )

  for idx in f.range(1, exe_num)

    v.Normal(n_cmd)
  endfor
end

function v.Slctd_line_indnt__space(indnt_col) -- range

  if v.Is_env__('win64') then
    '<,'>:call v.Slctd_line_tab__rpl_space(indnt_col)

  else
    local sys_cmd = '  expand   -t ' .. indnt_col
    '<,'>:call v.Slctd_line__rpl_sys_cmd(sys_cmd)
  end
end

function v.Slctd_line_indnt__tab(indnt_col) -- range

  if v.Is_env__('win64') then
    v.Nothing()
  else
    local sys_cmd = 'unexpand   -t ' .. indnt_col
    '<,'>:call v.Slctd_line__rpl_sys_cmd(sys_cmd)
  end
end

-- slctd line tab

function v.Slctd_line_tab__rpl_space(space_col) -- range

  local space_str = v.Str_space(space_col)
  local cmd = g_v_rng .. 's/\\t/' .. space_str .. '/g'
  v.Exe(cmd)
end

-- slctd line indnt __ shft

function v.Slctd_indnt__shft_l() -- todo

end

function v.Slctd_indnt__shft_r() -- todo

end

-- slctd line __ crct tbl

function v.Slctd_line__crct_tbl() -- range

  local sys_cmd

  if     v.Is_env__('linux') then
    sys_cmd = '/usr/bin/column -t'
  elseif v.Is_env__('mac') then
    sys_cmd = 'column -t'
  else
    sys_cmd = 'column -t'
  end

  '<,'>:call v.Slctd_line__rpl_sys_cmd(sys_cmd)
end

-- markdown tbl header

function v.Slctd_line__cnv_markdown_tbl_header() -- range -- ??

  '<,'>:call v.Slctd_line__rpl('[^|]', '-')
  '<,'>:call v.Slctd_line__rpl( '|.',  '| ')
  '<,'>:call v.Slctd_line__rpl('.|' , ' |' )
end

-- slctd line mb

function v.Slctd_line_mb__cnv() -- range

  local sys_cmd = 'mb__cnv'
  '<,'>:call v.Slctd_line__rpl_sys_cmd(sys_cmd)
end

-- slctd box __ mv

function v.Slctd_box__mv(lr) -- range

  v.Slct_re()

  local n_cmd = v.Char_lr_2_normal_cmd(lr)
  v.Normal('o' .. n_cmd)
  v.Normal('o' .. n_cmd)
end

function v.Slctd_box_width__1() -- range

  v.Slct_re()

  if not v.Is_slctd_mode__box() then
    return
  end

  v.Normal('o')
  local col_num = v.Cursor_col_num()

  v.Normal('o')
  v.Cursor__mv_by_col_num(col_num)
end

function v.Slctd_box_str__mv(lr) -- range

  local n_cmd = v.Char_lr_2_normal_cmd(lr)

  v.Slct_re()
  v.Normal('"zx')
  v.Normal(n_cmd)
  v.Normal('"zP')

  v.Slct_re()
  v.Slctd_box__mv(lr)
end

-- slctd box __ ( edit )

function v.Slctd_box_edge_l__ynk_line_1() -- range

  if v.Is_str__ptn(f.getreg('a'), '\\n') then
    print( 'yank is include cr' )
    return
  end

  v.Slct_re()

  if v.Is_cursor_col__line_end() then
    v.Slctd__pad_space()

    v.Slctd__del()
    -- v.Normal('"zdgv') -- see
  end

  v.Cursor__mv_slctd_edge_l()
  v.Esc()
  -- v.Normal("\\<esc>")

  -- local col_num = v.Cursor_col_num()

  for line_num in f.range(a_firstline, a_lastline)

    local col_num = v.Cursor_col_num()

    v.Cursor__ins_ynk()

    v.Cursor__mv_by_line_col(line_num, col_num)
    v.Cursor__mv_d()
    -- if line_num ~= a_lastline then
    --   v.Normal('j')
    -- end
  endfor
end

-- slctd box __ rpl

function v.Slctd_box__rpl(srch, rpl) -- range

  local srch = srch
  local rpl  = rpl

  local cmd = g_v_rng .. 's/' .. '\\%V' .. srch .. '/' .. rpl .. '/g'
  v.Exe(cmd)
end

-- slctd box space __ del

function v.Slctd_box_space__del() -- range

  local srch = ' '
  local rpl  = ''

  '<,'>:call v.Slctd_str__rpl(srch, rpl)
end

-- slctd box char __ shft

function v.Slctd_box_edge_r_char__shft_in() -- range

  local cmd = g_v_rng .. 's/' .. '\\%V\\([ ]\\+\\)\\([^ ]\\)' .. '/' .. '\\2\\1' .. '/g'
  v.Exe(cmd)

  v.Slct_re()
end

function v.Slctd_box_cursor_r_space__crct() -- range

  v.Slct_re()
  local col = v.Cursor_col_num()
  -- print( col )
  v.Slctd__cancel()

  -- print( a_firstline .. ' ' .. a_lastline )
  v.Cursor__mv_by_line_col(a_firstline, col)

  for line_num in f.range(a_firstline, a_lastline)
    -- print( line_num .. ' ' .. col )
    -- v.Cursor__mv_by_line_col(line_num, col)

    v.Cursor_f_space__del()
    -- v.Normal('j')
    v.Cursor__mv_d()
  endfor
end

function v.Is_slctd_mode__box() -- range

  -- v.Slct_re()

  local ret = false

  if f.mode() == "\\<c-v>" then
    -- print( "c-v" )
    ret = true
  end
  return ret
end

function v.Is_slctd_mode__line() -- range

  -- v.Slct_re()

  local ret = false

  if f.mode() == "v" then
    -- print( "v" )
    ret = true
  end
  return ret
end

-- slctd etc

function v.Slctd_srch__swtch() -- srch, set or run

  if v.Is_slctd_str__line_mlt() then

    v.Slctd_str__expnd_srch()
  else
    v.Srch_str__slctd_str()
  end
end

-- 
-- ynk
-- 

function v.Ynk__clr()

  f.setreg('a', '')
end

function v.Ynk__(str)

  f.setreg('a', str)
end

function v.Ynk__line()

  v.Normal('"ayy')
  --line_str = Cursor_line_str()
  --let @a = line_str

  v.Clp__ynk()
end

function v.Ynk__line_all()

  local cmd = '%y' -- todo rgstr a direct
  v.Exe(cmd)

  -- let @a = @0
  f.setreg('a', f.getreg('0'))
  v.Clp__ynk()
end

function v.Ynk__buf_file_path()
  
  local path = v.Buf_file_path()

  -- let @a = path
  f.setreg('a', path)
  v.Clp__ynk()
end

function v.Ynk__clp()

  -- let @a = @+
  f.setreg('a', getreg('+'))
end

function v.Ynk__slctd()

  f.setreg('e', f.getreg('d')) -- let @e = @d
  f.setreg('d', f.getreg('c')) -- let @d = @c
  f.setreg('c', f.getreg('b')) -- let @c = @b
  f.setreg('b', f.getreg('a')) -- let @b = @a

  v.Normal('gv"ay')
  v.Clp__ynk()
end

function v.Ynk__add_slctd()

  v.Normal('gv"Ay')
  v.Clp__ynk()
end

function v.Ynk__by_rgstr_info(rgstr_info)
  
  local rgstr = v.Rgstr_info_rgstr(rgstr_info)
  local scrpt = 'let @a = @' .. rgstr
  f.execute(scrpt) -- refactoring ?
end

-- clp

function v.Clp__ynk()

  if v.Is_env__('linux') then

    --v.C9clp__ynk() -- off

  else
    -- let @+ = @a
    f.setreg('+', f.getreg('a'))
  end
end

-- 
-- srch
-- 

-- srch exe, ref: cursor __ mv srch ptn

function v.Srch_or(...)

  local arg = {...}

  local str = '\\(' .. f.join(arg, '\\|') .. '\\)'
  --print( str )

  -- let @/ = str
  f.setreg('/', str)
  v.Cursor__mv_srch('f')
end

function v.Srch_str()

  -- local str = @/
  str = f.getref('/')
  return str
end

function v.Srch_str_flt()

  -- local str = @/
  local str = f.getreg('/')

  if v.Is_srch__word1() then
    str = f.strcharpart(str, 2, f.strchars(str) - 4)
  end
  -- print( str )

  return str
end

function v.Srch_str_word1(str)

  -- local str

  if str == nil then
    str = v.Srch_str_flt()
  else
    str = str
  end

  str = '\\<' .. str .. '\\>'
  return str
end

-- srch str __

function v.Srch_str__(str, op_word1)

  local exe_str = str

  exe_str = f.escape(exe_str, '.*~[]\\^$')

  exe_str = f.substitute(exe_str, '\\n', '\\\\n', 'g')
  -- print( exe_str )

  if op_word1 == true then
    exe_str = v.Srch_str_word1(exe_str)
  end

  if "@/" == exe_str then -- same ltst 01
    return
  end

  -- let @/ = exe_str -- highlight
  f.setreg('/', exe_str) -- highlight
  v.Normal('/' .. exe_str) -- srch hstry add
end

function v.Srch_str__cursor_word()

  local str = v.Cursor_word()
  v.Srch_str__(str, false)
end

function v.Srch_str__word1_tgl()

  local str = v.Srch_str_flt()

  if v.Is_srch__word1() then

    v.Srch_str__(str, false)
  else
    v.Srch_str__(str, true)
  end
end

function v.Srch_str_ltst(idx)

  local str = f.histget('/', - idx)
  return str
end

function v.Srch_str__prv_tgl()

  local srch_str

  -- if @/ == v.Srch_str_ltst(1) then
  if f.getreg('/') == v.Srch_str_ltst(1) then

    if            v.Srch_str_ltst(1)        == '\\<' .. v.Srch_str_ltst(2) .. '\\>' then
      srch_str = v.Srch_str_ltst(3)

    elseif '\\<' .. v.Srch_str_ltst(1) .. '\\>' ==        v.Srch_str_ltst(2) then

      srch_str = v.Srch_str_ltst(3)
    else
      srch_str = v.Srch_str_ltst(2)
    end
  else
    srch_str = v.Srch_str_ltst(1)
  end

  -- let @/ = srch_str
  f.setreg('/', srch_str)
end

function v.Srch_str__slctd_str() -- range

  if v.Is_slctd_str__srch_str() then
    v.Slctd__cancel()
    return
  end

  v.Slct_re()

  local str = v.Slctd_str()
  v.Srch_str__(str, false)
  v.Slctd__cancel()
end

function v.Srch_slct(drct)

  if     drct == 'f' then
    v.Normal('gn')

  elseif drct == 'b' then
    v.Normal('gN')
  end
end

-- dev anchor refactoring fnc name re ?
function v.Slctd_srch_7_slctd__srch_nxt(drct) -- srch rpl skip

  if     drct == 'f' then
    v.Normal('`>lgn')

  elseif drct == 'b' then
    v.Normal('`<hgN')
  end
end

function v.Srch_7_cursor__mv_srch_str_end_o()

  local drct = 'f'
  v.Srch_slct(drct)
  v.Esc()
  -- v.Normal("\\<esc>")
  v.Esc()
  v.Cursor__mv_char_f()
end

function v.Srch_char(drct, char)

  -- let @/ = '[' .. char .. ']'
  f.setreg('/', '[' .. char .. ']')
  v.Cursor__mv_srch(drct)
end

function v.Srch_char_bracket(drct)

  local char_bracket = "'" .. '")}\\]'
  v.Srch_char(drct, char_bracket)
end

function v.Srch_str__markdown_h() -- range

  -- let @/ = '^#\\+ '
  f.setreg('/', '^#\\+ ')
end

-- srch cnd

function v.Is_srch__word1()

  -- local str = @/
  local str = f.getreg('/')
  local ret = false

  local str_l = f.strcharpart(str, 0, 2)
  local str_r = f.strcharpart(str, f.strchars(str) - 2)

  if str_l == '\\<' and str_r == '\\>' then
    ret = true
  end

  return ret
end

-- markdown cnd

function v.Is_line_markdown_itm()

  local ptn = '^\\s*- '
  local str = v.Cursor_line_str()
  local idx = v.Str_srch(str, ptn)

  if idx == -1 then
    return false
  else
    return true
  end
end

-- complete  -  mode insert ins lst

function v.I_symbol01()

  local lst = { '$', '@', '#', ';', '%' }
  f.complete(f.col('.'), lst)
  return ''
end

function v.I_symbol02()

  local lst = { '?', '!', '~', '^', '&', '|', '\\', '/' }
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

  f.complete(f.col('.'), g_week_def)
  return ''
end

function v.I_num()

  local lst = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' }
  f.complete(f.col('.'), lst)
  return ''
end

function v.I_reg()
  -- local lst = { @0, @1, @2, @3 }
  local lst = { f.getreg('0'), f.getreg('1'), f.getreg('2'), f.getreg('3') }
  f.complete(f.col('.'), lst )
  return ''
end

function v.I_todo_status()

  local lst = { 'done', 'doing', 'on hold' }
  f.complete(f.col('.'), lst)
  return ''
end

function v.I_reserved_lua()
  f.complete(f.col('.'), {
    'end'                           ,
    'local'                         ,
    'return'                        ,
    'if elseif else end'            ,
    'for key, val in pairs() do end',
    'function'                      ,
  })
  return ''
end

function v.I_ooq()
  f.complete(f.col('.'), {
    '_s:'         ,
    '_s._'        ,
    'log._("", )' ,
    'log.pp("", )',
    '-- dbg'      ,
    '--'          ,
    '_.f'         ,
    '_.t'         ,
  })
  return ''
--     'function',
--     'local',
--     'return',
--     'if _.t then return end',
--     'if  then',
--     'elseif  then',
--     'else',
--     'then',
--     'then return end',
--     'for key, val in pairs() do end',
--     'not',
--     'or',
--     'and',
--     'end',
--     'nil',
--     'alias',
end


-- mark

g_mark_alph_def = {
  'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
  'o','p','q','r','s','t','u','v','w','x','y','z'
}

function v.Mark_show_tgl()
  
  if f.exists('g_mark_show_flg') == 0 then
    
    g_mark_show_flg = false
  end
  
  if not g_mark_show_flg then
    
    exe 'DoShowMarks'
    g_mark_show_flg = true
  else
    exe 'NoShowMarks'
    g_mark_show_flg = false
  end
end

function v.Mark_lst()
  
  local mark = {}
  for _mark in f.bufname()->getmarklist()
    
    local _alph = _mark['mark'][1]
    
    if f.count(g_mark_alph_def, _alph) == 0 then
      continue
    end
    
    mark = f.add(mark, _mark['mark'][1])
  endfor
  --print( mark )
  return mark
end

function v.Mark_alph_line()
  
  local line_c = f.line('.')
  
  for _mark in f.bufname()->getmarklist()
    
    local _alph = _mark['mark'][1]
    
    if f.count(g_mark_alph_def, _alph) == 0 then
      continue
    end
    
    if _mark['pos'][1] == line_c then
      --print( _alph )
      return _alph
    end
  endfor
  return ''
end

function v.Mark_tgl()
  
  local alph = v.Mark_alph_line()
  --print( 'Mark_tgl ' .. alph )
  
  --if alph == '' then
  if v.Is_str__emp(alph) then
    v.Mark_add()
  else
    v.Mark_del(alph)
  end
  
  v.Exe('DoShowMarks')
end
  
function v.Mark_add()
  
  local alph = v.Mark_alph_useabl()
  v.Exe('mark ' .. alph)
end

function v.Mark_alph_useabl()
  
  local mark = v.Mark_lst()
  
  for _alph in g_mark_alph_def
    if f.count(mark, _alph) == 0 then
      --print( _alph )
      return _alph
    end
  endfor
  
  print( 'use alph all' )
  return ''
end

function v.Mark_del(alph)
  
  v.Exe('delmark ' .. alph)
end

function v.Mark_del_all()
  
  v.Exe('delmark!')
  v.Exe('DoShowMarks')
end

-- trns

function v.Slctd_trns() -- range

  local str = v.Slctd_str()

  local str = f.substitute(str, "\\n", ' ', 'g')

  -- if str =~ '[^\\x01-\\x7E]' then -- mlt byte
  if v.Is_str__ptn(str, '[^\\x01-\\x7E]') then -- mlt byte
    local lang = '{ja=en}'
  else
    local lang = '{en=ja}'
    --local lang = ''
  end

  local str = f.escape(str, "'")
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
  -- let @a = rslt
  f.setreg('a', rslt)
end

-- url encdoe

function v.Slctd_url_encode() -- range

  local str = v.Slctd_str()
  local sys_cmd = 'url_encode "' .. str .. '"'
  local rslt = v.Sys_cmd(sys_cmd)
  --print( rslt )
  v.Cursor__ins(rslt)
end


-- env

function v.Is_env__(env) -- alias

  -- env : 'mac', 'win64', 'win32', 'wsl', 'linux'

  local ret = f.has(env)

  if env ~= 'mac' then
    -- print( env .. ' : ' .. ret )
    -- print( hostname() )
  end

  return ret
end

function v.Is_nvim() -- alias

  local ret = f.has('nvim')
  return ret
end

-- 
-- plugin
-- 

function v.Vim_plug_path()

  if v.Is_nvim() then
    if     v.Is_env__('mac') then

      local vim_plug_dir_dflt_nvim = "~/.local/share/nvim/site"
      local vim_plug_dir_mac_nvim  = $HOME .. '/.local/share/nvim/site'

      if     f.isdirectory(vim_plug_dir_mac_nvim) then
        local vim_plug_dir = vim_plug_dir_mac_nvim
      else
        local vim_plug_dir = vim_plug_dir_mac_nvim
      end

    elseif v.Is_env__('linux') then

      local vim_plug_dir_dflt_nvim = "~/.local/share/nvim/site"
      local vim_plug_dir_ec2_nvim  = "/home/ec2-user/.local/share/nvim/site"
      local vim_plug_dir_c9_nvim   = "/home/ec2-user/.local/share/nvim/site"
      local vim_plug_dir_s9_nvim   = "/home/centos/.local/share/nvim/site"

      if     f.isdirectory(vim_plug_dir_dflt_nvim) then
        local vim_plug_dir = vim_plug_dir_dflt_nvim

      elseif f.isdirectory(vim_plug_dir_ec2_nvim) then
        local vim_plug_dir = vim_plug_dir_ec2_nvim

      elseif f.isdirectory(vim_plug_dir_c9_nvim) then
        local vim_plug_dir = vim_plug_dir_c9_nvim

      elseif f.isdirectory(vim_plug_dir_s9_nvim) then
        local vim_plug_dir = vim_plug_dir_s9_nvim

      else
        local vim_plug_dir = vim_plug_dir_ec2_nvim
      end

    elseif v.Is_env__('win64') then

      local vim_plug_dir = '~/appdata/local/nvim-data/site'

    elseif v.Is_env__('win32unix') then -- gitbash

      local vim_plug_dir = '~/appdata/local/nvim-data/site'
    else
      local vim_plug_dir = '~/appdata/local/nvim-data/site'
    end

  else -- vim
    if     v.Is_env__('mac') then

      -- local vim_plug_dir_mac_nvim = $HOME .. '/.local/share/nvim/site'
      local vim_plug_dir_mac_vim  = $HOME .. '/.vim'

      if f.isdirectory(vim_plug_dir_mac_vim) then
        local vim_plug_dir = vim_plug_dir_mac_vim

      else
        local vim_plug_dir = vim_plug_dir_mac_vim
      end

    elseif v.Is_env__('linux') then

      local vim_plug_dir_ec2_vim  = "/home/ec2-user/.vim"
      local vim_plug_dir_c9_vim   = "/home/ec2-user/.vim"
      -- local vim_plug_dir_c9_nvim  = "/home/ec2-user/.local/share/nvim/site"
      -- local vim_plug_dir_s9_nvim  = "/home/centos/.local/share/nvim/site"

      if f.isdirectory(vim_plug_dir_c9_vim) then
        local vim_plug_dir = vim_plug_dir_c9_vim

      else
        local vim_plug_dir = vim_plug_dir_ec2_vim
      end

    elseif v.Is_env__('win64') then
      local vim_plug_dir = '~/.vim'

    elseif v.Is_env__('win32unix') then -- gitbash
      local vim_plug_dir = '~/.vim'

    else
      local vim_plug_dir = '~/.vim'
    end
  end

  local vim_plug_path = vim_plug_dir .. '/autoload/plug.vim'
  return vim_plug_path
end

function v.Is_vim_plug__installed()

  local vim_plug_path = v.Vim_plug_path()
  -- print( vim_plug_path )

  local ret = not f.empty(f.glob(vim_plug_path))
  -- print( 'vim_plug installed : ' .. ret )

  return ret
end

-- fnc end


-- 
-- init
-- 

-- ynk init
v.Ynk__clp()


if     v.Is_env__('mac')   then -- mac

  source ~/wrk/prj-pri/dotfiles/nvim/scrpt/mac/init.vim

elseif v.Is_env__('linux') then -- c9 s9

  source ~/wrk/prj-pri/dotfiles/nvim/scrpt/c9/init.vim

elseif v.Is_env__('win64') then -- pwsh ( for fzf )

  source ~/wrk/prj-pri/dotfiles/nvim/scrpt/pwsh/init.vim

elseif v.Is_env__('win32unix') then -- gitbash ( for fzf )

  source ~/wrk/prj-pri/dotfiles/nvim/scrpt/gitbash/init.vim
else
  print( "is env else" )
end


-- srch init
function v.Srch_init() -- use not

  local cmd = '/<cr>N'
  v.Normal(cmd)
end
--v.Srch_init()

-- init end


-- 
-- fnc repeat tmp
-- 

function v.Repeat_tmp()

  v.Cursor__mv_srch('f')
  v.Cursor__mv_d()
  v.Cursor__ins_ynk()
end

--]]


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


