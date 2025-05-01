-- 
-- fnc
-- 

-- global

g_dotfiles_dir    = '~/wrk/prj-pri/dotfiles'
g_vimrc_dir       = g_dotfiles_dir .. '/nvim/scrpt'
g_vimrc_file_path = g_vimrc_dir    .. '/dflt/init.vim'

g_init_lua_file_path         = g_vimrc_dir .. '/dflt/lua/init.lua'
g_init_lua_opt_file_path     = g_vimrc_dir .. '/dflt/lua/init-opt.lua'
g_init_lua_hl_file_path      = g_vimrc_dir .. '/dflt/lua/init-hl.lua'
g_init_lua_key_map_file_path = g_vimrc_dir .. '/dflt/lua/init-key-map.lua'
g_init_lua_fnc_file_path     = g_vimrc_dir .. '/dflt/lua/init-fnc.lua'


local v = {}

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

  -- if char =~ '\\d' then
  if vim.fn.is_match(char, '\\d') then
    ret = true
  end

  return ret
end

function v.Is_char__alpha(char)

  local ret = false

  -- if char =~ '\\a' then
  if vim.fn.is_match(char, '\\a') then
    ret = true
  end

  return ret
end

function v.Is_char__symbol(char)

  local ret = false

  -- if char !~ '\\s' and char !~ '\\w' then
  if not vim.fn.is_match(char, '\\s') and not vim.fn.is_match(char, '\\w') then
    ret = true
  end

  return ret
end

-- char cnd  -  char pair __

function v.Is_char_pair__(ptn, c1, c2)

  local ret = false

  -- if c1 =~ ptn and c2 =~ ptn then
  if vim.fn.is_match(c1, ptn) and vim.fn.is_match(c2, ptn) then
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

function v.Is_char__tgl_alpha_trn(c) -- use not
  
  local rpl = ''

  if     c ==# 'T' then
    rpl = 'f'
  elseif c ==# 'F' then
    rpl = 't'
  end

  return rpl
end

-- str

function v.Str_len(str) -- alias

  return strchars(str)
end

function v.Str_l_char(str)

  local l_idx = 0
  local str_l = str[l_idx]
  --echo str_l
  return str_l
end

function v.Str_r_char(str)

  local r_idx = Str_len(str) - 1
  local str_r = str[r_idx]
  --echo str_r
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

  local str = a:1
  local ptn = a:2
  local idx = ( a:0 >= 3 ) and a:3 or nil

  local r_idx = match(str, ptn, idx)
  return r_idx -- -1 : match not
end

function v.Str_srch_end(str, ptn) -- alias

  local idx = matchend(str, ptn)
  return idx
end

-- str __ rpl

function v.Str__rpl(str, srch, rpl) -- alias

  local r_str = substitute(str, srch, rpl, 'g')
  return r_str
end

function v.Str_path_unix__cnv_win(path)

  local path = path
  local path = Str__rpl(path, '/c/', 'C:/')
  local path = Str__rpl(path, '/', '\\')
  return path
end

function v.Str_path_win__cnv_unix(path)

  local path = path
  local path = Str__rpl(path, 'C:', '/c')
  local path = Str__rpl(path, '\\', '/')
  return path
end

function v.Str_cmnt_1()

  local cmnt_1_def = {
    'lua'       : '-- ',
    'text'      : '# ' ,
    'vim'       : '" ' ,
    'fish'      : '# ' ,
    'sh'        : '# ' ,
    'css'       : '/* ',
    'javascript': '// ',
    'java'      : '// ',
    'sql'       : '-- ',
    'dflt'      : '# '
  }

  local str = get(cmnt_1_def, &filetype, cmnt_1_def['dflt'])
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

  local ret = false

  -- if str =~ ptn then
  if vim.fn.is_match(str, ptn) then
    ret = true
  end
  return ret
end

function v.Is_str__space(str)

  local ptn = '^\\s\\+$'
  local ret = Is_str__ptn(str, ptn)
  return ret
end

function v.Is_str__num(str)

  local ptn = '^\\d\\+$'
  local ret = Is_str__ptn(str, ptn)
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

  local num_str = printf('%o', num)
  return num_str
end

-- ar ( list )

-- txt

function v.Txt_to_ar(txt)

  local line_ar  = split(txt, "\\n")
  return line_ar
end

-- vim

-- vim basic

function v.Nothing() -- use by tst

  -- echo "do nothing.."
end

function v.Echo(str) -- alias

  echo str
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

  v.feedkeys(':call ' .. str)
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

  echo synIDattr(synID(line('.'), col('.'), 1), 'name')
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

  local dir = expand('%:p:h')
  return dir
end

-- function v.Dir__slf()
function v.Dir__buf_file_dir()

  local dir = Buf_file_dir()
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

  local sys_cmd = 'dpl ' .. Buf_file_path()
  v.Sys_cmd(sys_cmd)
end

function v.Buf_file__mv(file_name_aft)

  local file_path_bfr = Buf_file_path()

  local sys_cmd = 'str_mv_f ' .. l:file_path_bfr .. ' ' .. file_name_aft
  local file_path_aft = Sys_cmd(l:sys_cmd)

  local sys_cmd = 'mv ' .. l:file_path_bfr .. ' ' .. l:file_path_aft
  v.Sys_cmd(l:sys_cmd)

  local cmd = 'file ' .. l:file_path_aft -- save file_path ch
  v.Exe(l:cmd)
end

function v.Buf_file_path()
  
  local path = expand('%:p')
  return path
end

function v.Rgstr__clr()

  let @0 = ''
end

function v.File_txt(file_path)

  if not filereadable(file_path) then
    return
  end

  local cmd = 'cat ' .. file_path

  local pth_lst_txt = Sys_cmd(l:cmd)
  return pth_lst_txt
end

function v.File_line_ar(file_path)

  local file_txt = File_txt(file_path)
  local file_line_ar = Txt_to_ar(file_txt)
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

  local tmp_path = system('mktemp ')
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

  local path = File_tmp__cre()
  echo l:path
  v.Opn(l:path)
end

function v.Opn_vimrc()

  v.Opn(g_vimrc_file_path)

  if has('nvim') then
    v.Opn(g_init_lua_file_path        )
    v.Opn(g_init_lua_key_map_file_path)
    v.Opn(g_init_lua_lua_file_path    )
  end

  if     Is_env__('linux')     then    -- c9 s9

    local vimrc_c9_file_path      = g_vimrc_dir .. '/c9/init.vim'
    -- v.Opn(l:vimrc_c9_file_path)

  elseif Is_env__('win32unix') then -- gitbash

    local vimrc_gitbash_file_path = g_vimrc_dir .. '/gitbash/init.vim'
    v.Opn(l:vimrc_gitbash_file_path)
  end
end

function v.Opn_fish_cnf()

  local path = '~/.config/fish/config.fish'
  v.Opn(l:path)
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

  local file_type = getftype(g_grep_wk_path)

  if Is_str__emp(l:file_type) then

    v.Opn(g_grep_wk_path)
  else
    v.Opn_tmp_file()
  end
end

-- opn app

function v.Opn_app(path)
  
  local path = path
  
  if     Is_env__('mac') then

    local cmd_sys = 'open'

  elseif Is_env__('win64') then

    local cmd_sys = 'start'

  elseif Is_env__('win32unix') then

    local cmd_sys = 'start'

  else
    return
  end

  if Is_env__('win64') then

    local path = Str_path_unix__cnv_win(l:path)
  end

  local res = system(l:cmd_sys .. " '" .. l:path .. "'")
end

function v.Opn_app_by_cursor_path()
  
  local path = Cursor_filepath()
  v.Opn_app(l:path)
end

function v.Opn_app_by_line_path(line_num)

  --local path = Line_str_by_line_num(line_num)
  local path = getline(line_num)

  local path = trim(l:path)
  v.Opn_app(l:path)
end

function v.Opn_app_by_slctd_str()
  
  local path = Slctd_str()
  local path = trim(l:path)
  v.Opn_app(l:path)
end

function v.Opn_app_buf_file()

  local path = Buf_file_path()
  echo l:path

  v.Opn_app(l:path)
end

-- function v.Opn_dir_slf()
function v.Opn_buf_file_dir()

  local dir = Buf_file_dir()
  --echo l:path

  v.Opn_app(l:dir)
end

function v.Opn_brwsr()

  local url = 'https://www.google.com/'
  v.Opn_app(l:url)
end

function v.Opn_ggl_srch(word)

  local url = 'https://www.google.com/search?q=' .. word
  v.Opn_app(l:url)
end

function v.Opn_yt(yt_video_id)

  local url = 'https://www.youtube.com/watch?v=' .. yt_video_id
  v.Opn_app(l:url)
end

-- tag jmp

-- tag jmp by str

function v.Tag_jmp_by_str(rg_rslt_line)

  local rg_rslt_line = trim(rg_rslt_line)

  if Is_str__emp(l:rg_rslt_line) then
    echo 'empty'
    return
  end

  local rg_rslt_line = matchstr(l:rg_rslt_line, '\\S\\+')
  -- echo l:rg_rslt_line

  local rg_rslt_line_ar = Rg_rslt_line_parse(l:rg_rslt_line)
  -- echo l:rg_rslt_line_ar

  local filename = l:rg_rslt_line_ar[0]
  local line_num = get(l:rg_rslt_line_ar, 1, 1)
  -- echo l:line_num
  -- return

  if not filereadable(l:filename) then
    echo 'file does not exist'
    return
  end

  v.Exe('tab drop ' .. l:filename)
  v.Normal(l:line_num .. 'G')
end

function v.Tag_jmp_by_cursor_line()

  local base_buf_num = Buf_num()

  local str = Cursor_line_str()
  v.Tag_jmp_by_str(l:str)

  v.Exe('sbuffer ' .. l:base_buf_num)
  -- v.Normal('j')
  v.Cursor__mv_d()
end

function v.Tag_jmp_by_slctd_line() -- range

  local base_buf_num = Buf_num()

  for line_num in range(a:firstline, a:lastline)

    local line = getline(l:line_num)
    v.Tag_jmp_by_str(l:line)
    v.Exe('sbuffer ' .. l:base_buf_num)
  endfor
end

-- buf

function v.Buf__quit()

  local cmd = 'bd'
  v.Exe(l:cmd)
end

function v.Buf__quit_swtch()

  local win_num = winnr('$')

  if l:win_num > 1 then
    v.Win_splt__quit()
  else
    v.Buf__quit()
  end
end

function v.Buf_num()

  return bufnr('%')
end

function v.Buf__fltr() -- use not

end

-- win splt

function v.Win__splt_h()

  local cmd = 'split'
  v.Exe(l:cmd)
end

function v.Win__splt_v()

  local cmd = 'vsplit'
  v.Exe(l:cmd)
end

function v.Win_splt_cursor__mv_nxt()

  local n_cmd = "\\<c-w>w"
  v.Normal(l:n_cmd)
end

function v.Win_splt__quit()

  local n_cmd = "\\<c-w>c"
  v.Normal(l:n_cmd)
end

-- 
-- line
-- 

function v.Line_num_file_edge_bgn()

  return line('^')
end

function v.Line_num_file_edge_end() -- alias

  return line('$')
end

-- line xx __ ins

let s:line_top_space_ptn = '^[ \\t]*'

let s:line_end_space_ptn = '[ \\t]*$'

function v.Line_end_space__del(line_num)
  
  local rpl_cmd = line_num .. 's/' .. s:line_end_space_ptn .. '//g'
  v.Exe(l:rpl_cmd)
end

function v.Line_end__pad_space(line_num, fil_end_col)

  local line_str     = getline(line_num)
  local line_str_len = Str_len(l:line_str)
  local space_len    = fil_end_col - l:line_str_len

  if l:space_len <= 0 then
    return
  end

  local space_str = Str_space(l:space_len)
  line_str = line_str .. l:space_str
  call setline(line_num, l:line_str)
end

g_dots_str     = ' .. '
g_dots_put_col = 50

function v.Line__del_by_line_num(line_num)

  call deletebufline('%', line_num)
end

-- line num

function v.Line_num_by_Line_info(line_info)

  local line_info = trim(line_info, ' ', 1)
  local line_num  = split(l:line_info, '\\s\\+')[0]
  return line_num
end

-- line cnd


-- 
-- cursor
-- 

-- cursor pos

function v.Cursor_pos() -- alias

  local pos = getpos('.')
  return pos
end

-- cursor col

function v.Cursor_col_num()

  return col('.')
end

function v.Cursor_col_idx()

  local idx = col('.') - 1
  return idx
end

-- cursor col cnd

function v.Is_cursor_col__line_end()

  if Cursor_col_num() == Cursor_line_end_col() then

    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_end_ovr() -- range

  if Cursor_col_num() >= Cursor_line_end_col() then
    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_end_inr()

  if Cursor_col_num() == Cursor_line_end_col() - 1 then

    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_top0()

  if Cursor_col_num() == 1 then
    return true
  else
    return false
  end
end

function v.Is_cursor_col__line_top1()

  local pos_c = Cursor_pos()

  local col_c = Cursor_col_num()
  
  v.Cursor__mv_line_top1()
  local col_s1 = Cursor_col_num()
  
  call setpos('.', l:pos_c)
  
  if l:col_c == l:col_s1 then
    return true
  else
    return false
  end
end

-- cursor __ mv

function v.Cursor__mv_by_col_num(col_num)

  if not Is_str__num(col_num) then
    return
  end

  local line_num = Cursor_line_num()

  v.Cursor__mv_by_line_col(l:line_num, col_num)
end

function v.Cursor__mv_by_line_num(line_num)

  if not Is_str__num(line_num) then
    return
  end

  v.Normal(line_num .. 'G')
end

function v.Cursor__mv_by_line_col(line_num, col)

  local line_num = (line_num == nil) and Cursor_line_num() or line_num
  
  call cursor(l:line_num, col)
end

function v.Cursor__mv_by_line_info(line_info)
  
  local line_num = Line_num_by_Line_info(line_info)
  v.Cursor__mv_by_line_num(l:line_num)
end

function v.Cursor__mv_by_pos(pos)
  
  call setpos('.', pos)
end

function v.Cursor__mv_line_top0()
  
  if Is_cursor_line_str__emp() then
    return
  end

  v.Normal('0')
end

function v.Cursor__mv_line_top1()

  if     Is_cursor_line_str__space() then
    v.Cursor__mv_line_end()

  elseif Is_line_markdown_itm() then
    v.Normal('^2l')
  else
    v.Normal('^')
  end
end

function v.Cursor__mv_line_end()

  if not Is_cursor_line_str__emp() then
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

  if     Is_cursor_col__line_end() or Is_cursor_col__line_end_inr() then

    v.Cursor__mv_char_f()
    return

  elseif Is_cursor_line_str_side_r__space() then

    v.Cursor__mv_line_end()
    return
  end

  local c_char = Cursor_c_char()
  local r_char = Cursor_r_char()

  -- if l:c_char =~ ' ' and l:r_char =~ ' ' then
  if vim.fn.is_match(l:c_char, ' ') and vim.fn.is_match(l:r_char, ' ') then
    v.Normal('w')
  else
    v.Normal('el')
  end
end

function v.Cursor__mv_word_b()
  
  local l_char = Cursor_l_char()

  if     Is_cursor_col__line_top0() then
    v.Cursor__mv_u_line_end()
    
  elseif Is_cursor_line_str_side_l__space() then
    v.Cursor__mv_line_top0()
    
  elseif Is_cursor_col__line_top1() then
    v.Cursor__mv_line_top0()
    
  elseif Is_char__symbol(l:l_char) then
    v.Cursor__mv_char_b()
    
  else
    v.Normal('b')
  end
end

function v.Cursor__mv_word_dlm_f()

  local ptn = '[_ABCDEFGHIJKLMNOPQRSTUVWXYZ]'
  -- local ptn = '[_\\u]'

  local line_num = Cursor_line_num()

  call search(l:ptn, 'zW', l:line_num)
end

function v.Cursor__mv_word_b_pre() -- use not

  local c_char = Cursor_c_char()
  local l_char = Cursor_r_char()

  -- if l:c_char =~ ' ' and l:l_char !~ ' ' then
  if vim.fn.is_match(l:c_char, ' ') and not vim.fn.is_match(l:l_char, ' ') then
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
  v.Normal(l:n_cmd)
end

function v.Cursor__mv_mlt_d() -- alias

  g_cursor_mv_line_step = g_cursor_mv_line_step_dflt

  local n_cmd = g_cursor_mv_line_step .. "\\<c-e>"
  v.Normal(l:n_cmd)
end

function v.Cursor__mv_u_line_end()

  v.Cursor__mv_u()
  v.Cursor__mv_line_end()
end

function v.Cursor__mv_line_top_or_new_line()

  if     Is_cursor_col__line_top0() then

    v.Cursor__ins_line_emp()

  elseif Is_cursor_col__line_top1() then

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

  if not Is_slctd_cursor_pos__r() then
    return
  end

  v.Cursor__mv_slctd_edge_tgl()

  -- local n_cmd = '`<'
  -- v.Normal(l:n_cmd)
end

function v.Cursor__mv_file_edge(n_cmd)

  if Is_cursor_line_num__file_edge() then
    v.Normal(n_cmd)
  end

  local cnt = 1
  local cnt_max = 10000

  while ( !Is_cursor_line_num__file_edge() and l:cnt < l:cnt_max ) do

    v.Normal(n_cmd)
    cnt = l:cnt + 1
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

  v.Normal(l:n_cmd)
  local cnt = 1
  local cnt_max = 10000

  while ( !Is_cursor_line_num__file_edge() and l:cnt < l:cnt_max ) do

    if not ( Is_cursor_c_char__space() or Is_cursor_col__line_end() ) then
      break
    end

    --if ( l:is_space_stop == 't' and Is_cursor_c_char__space() ) then
    if ( l:is_space_through == 'f' and Is_cursor_c_char__space() ) then
      break
    end

    v.Normal(l:n_cmd)
    cnt = l:cnt + 1
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

  v.Normal(l:n_cmd)

  local cnt = 1
  local cnt_max = 10000

  while ( !Is_cursor_line_num__file_edge() and l:cnt < l:cnt_max ) do

    if Is_cursor_c_char__space() or Is_cursor_col__line_end() then
      break
    end

    v.Normal(l:n_cmd)
    cnt = l:cnt + 1
  end
end

function v.Cursor__mv_v_jmp(drct)

  if drct == 'k' or drct == 'j' then

    local n_cmd = drct
  else
    return
  end

  v.Normal(l:n_cmd)

  if Is_cursor_c_char__space() or Is_cursor_col__line_end() then

    v.Cursor__mv_v_jmp_char(l:n_cmd, 't')
  else
    v.Cursor__mv_v_jmp_space(l:n_cmd)
  end
end

function v.Cursor__mv_srch_ptn(ptn, dir) -- range

  local ptn = ptn

  if dir == 'b' then
    local opt_dir = 'b'
  else
    local opt_dir = ''
  end
  local opt = 'W' .. l:opt_dir
  -- local opt = 'zW' .. l:opt_dir

  local line_num = Cursor_line_num()

  call search(l:ptn, l:opt, l:line_num)
end

function v.Cursor__mv_srch(drct)

  if     drct == 'f' then
    local op = ''
  elseif drct == 'b' then
    local op = 'b'
  end

  local ptn = @/
  call search(l:ptn, l:op)
end

-- cursor __ ins

function v.Cursor__ins(str)

  local cmd = 'i' .. str
  v.Normal(l:cmd)
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
  v.Normal(l:cmd)
end

function v.Cursor__ins_cr()

  local t_line_num = line('.')

  v.Normal("i\\<cr> ")
  v.Normal('x')

  v.Line_end_space__del(l:t_line_num)
  v.Cursor__mv_d()
end

function v.Cursor__ins_space(is_cursor_mv)

  if is_cursor_mv then
    v.Cursor__ins(' ')

  else
    v.Normal('i ')
    --"v.Normal('l')
  end
end

function v.Cursor__ins_hyphen()

  v.Normal('i-')
  --v.Cursor__ins('-')
end

function v.Cursor__ins_tilde()

  v.Normal('i~')
  --v.Cursor__ins('~')
end

function v.Cursor__ins_slash()

  v.Normal('i/')
  --v.Cursor__ins('/')
end

function v.Cursor__ins_slashback()

  v.Normal('i\\')
  --v.Cursor__ins('\\')
end

function v.Cursor__ins_quote()

  v.Normal("i' '")
  v.Normal('h')
end

function v.Cursor__ins_da()

  local da = strftime('%Y-%m-%d')
  v.Cursor__ins(l:da)
end

function v.Cursor__ins_tm()

  local tm = strftime('%H:%M')
  v.Cursor__ins(l:tm)
end

function v.Cursor__ins_dt()

  local dt = strftime('%Y-%m-%d.%H:%M')
  v.Cursor__ins(l:dt)
end

function v.Cursor__ins_ts()

  local ts = strftime('%Y-%m-%d.%H:%M:%S')
  v.Cursor__ins(l:ts)
end

g_week_def = [ 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' ]

function v.Cursor__ins_week()

  local week_num = strftime('%w')
  local week     = g_week_def[l:week_num]
  v.Cursor__ins(l:week)
  --v.Cursor__ins(' ' .. l:week)
end

-- cmnt

function v.Cursor__ins_cmnt_1(cmd_cursor__mv_line_top)

  if cmd_cursor__mv_line_top ~= nil then
    v.Normal(cmd_cursor__mv_line_top)
  end

  local str = Str_cmnt_1()
  v.Normal('i' .. l:str)
  
  v.Normal('^') -- or '0'
end

function v.V_ins_cmnt_1() -- range

  v.Normal(firstline .. 'G')
  v.Normal('^')
  local col = Cursor_col_num()

  for line_num in range(firstline, lastline)

    v.Line_end__pad_space(l:line_num, l:col - 1)

    v.Cursor__mv_by_line_col(l:line_num, l:col)

    v.Cursor__ins_cmnt_1(nil)
  endfor
end

function v.Cursor__ins_cmnt_mlt_by_pos(pos)

  local cmnt_mlt_def = #{
    lua       : ['--[[' , '--]]'],
    html      : ['<!--' ,  '-->'],
    css       : ['/*'   ,  ' */'],
    javascript: ['/*'   ,  ' */'],
    java      : ['/*'   ,  ' */'],
    dflt      : ['/*'   ,  ' */']
  }

  local str = get(l:cmnt_mlt_def, &filetype, l:cmnt_mlt_def['dflt'])

  --if has_key(l:cmnt_mlt_def, &filetype) then
  --  local filetype = &filetype
  --else
  --  local filetype = 'dflt'
  --end
  --local str = l:cmnt_mlt_def[l:filetype]

  if     pos == 'bgn' then
    v.Normal('O')
    v.Normal('i' .. l:str[0])

  elseif pos == 'end' then
    v.Normal('o')
    v.Normal('i' .. l:str[1])
  end
end

function v.Cursor__ins_cmnt_mlt()

  v.Cursor__ins_cmnt_mlt_by_pos('bgn')
  v.Cursor__ins_cmnt_mlt_by_pos('end')
end

function v.V_ins_cmnt_mlt() -- range

  v.Normal(lastline  .. 'G')
  v.Cursor__ins_cmnt_mlt_by_pos('end')

  v.Normal(firstline .. 'G')
  v.Cursor__ins_cmnt_mlt_by_pos('bgn')
end

-- markdown

function v.Cursor__ins_markdown_h()

  v.Cursor__mv_line_top0()
  local top0_char = Cursor_c_char()

  local str = '#'

  if l:top0_char ~= l:str then
    str = str .. ' '
  end

  v.Cursor__ins(l:str)

  local ptn = '^#* '
  local col = Str_srch_end(Cursor_line_str(), l:ptn) + 1
  v.Cursor__mv_by_line_col(nil, l:col)
end

function v.Cursor__ins_markdown_cr()

  v.Cursor__ins('  ')
end

function v.Cursor__ins_markdown_itm()

  if Is_line_markdown_itm() then
    v.Cursor_line_indnt__shft_r()
    return
  end

  local col = Cursor_line_indnt__crct()

  local str = '- '
  --echo l:str
  v.Cursor_line_top1__ins(l:str)
end

function v.Cursor__ins_markdown_code()

  local str = '```'
  v.Cursor__ins_line(l:str)
end

function v.Char_markdown_chk__tgl()
  
  if Cursor_l_char() ~= '[' or Cursor_r_char() ~= ']' then
    return
  end
  
  local cursor_char = Cursor_c_char()
  
  if l:cursor_char == ' ' then
    local rpl_char = 'x'
  else
    local rpl_char = ' '
  end
  
  v.Cursor_char__rpl(l:rpl_char)
end

-- cursor char

function v.Cursor_c_char()

  local idx = Cursor_col_idx()
  local c = getline('.')[l:idx]
  return c
end

function v.Cursor_l_char()

  local idx = Cursor_col_idx() - 1
  local c = getline('.')[l:idx]
  return c
end

function v.Cursor_r_char()

  local idx = Cursor_col_idx() + 1
  local c = getline('.')[l:idx]
  return c
end

function v.Cursor_u_char() -- dev doing

  if Is_cursor_line_num__file_edge_bgn() then
    return ''
  end

  local idx = Cursor_col_idx()
  local line_num = Cursor_line_num() - 1
  local c = getline(l:line_num)[l:idx]
  return c
end

function v.Cursor_d_char() -- dev doing

  if Is_cursor_line_num__file_edge_end() then
    return ''
  end

  local idx = Cursor_col_idx()
  local line_num = Cursor_line_num() + 1
  local c = getline(l:line_num)[l:idx]
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

  local c = Cursor_c_char()

  if     Is_char__num(l:c) then

    v.Cursor_str__icl()
    return

  elseif Is_char__alpha(l:c) then

    v.Normal('v~') -- upper / lower
    return
  end

  local rpl = Is_char__tgl_bracket_trn(l:c)
  if not Is_str__emp(l:rpl) then
    v.Cursor_char__rpl(l:rpl)
    return
  end

  local rpl = Is_char__tgl_symbol(l:c)
  if not Is_str__emp(l:rpl) then

    v.Cursor_char__rpl(l:rpl)
    return
  end
end

function v.N_char__tgl_swtch02()

  local c = Cursor_c_char()

  if Is_char__num(l:c) then

    v.Cursor_str__dcl()
    return
  end

  v.Cursor_char__tgl_type_shift(l:c)
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

  if not Is_str__emp(l:rpl) then

    v.Cursor_char__rpl(l:rpl)
    return
  end
end

function v.Cursor_c_char__del()

  local cmd = '"zx'
  v.Normal(l:cmd)
end

function v.Cursor_c_char__del_ynk()

  local cmd = '"ax'
  v.Normal(l:cmd)
end

-- cursor char cnd

function v.Is_cursor_c_char__ptn(ptn)

  local c = Cursor_c_char()

  -- if l:c =~ ptn then
  if vim.fn.is_match(l:c, ptn) then
    return true
  else
    return false
  end
end

function v.Is_cursor_c_char__space()

  local c = Cursor_c_char()

  -- if l:c =~ '\\s' then
  if vim.fn.is_match(l:c, '\\s') then
    return true
  else
    return false
  end

  -- local ptn = '\\s'
  -- local ret = Is_cursor_c_char__ptn(l:ptn)
  -- return ret
end

function v.Is_cursor_c_char__alph()

  local ptn = '\\a'
  local ret = Is_cursor_c_char__ptn(l:ptn)
  return ret
end

-- cursor str

-- cursor str __

function v.Cursor_str__icl()

  local n_cmd = "\\<c-a>"
  v.Normal(l:n_cmd)
end

function v.Cursor_str__dcl()

  local n_cmd = "\\<c-x>"
  v.Normal(l:n_cmd)
end

function v.Cursor_str_week__icl()

  local week_str = Cursor_word()
  local week_idx = index(g_week_def, l:week_str)

  if l:week_idx == -1 then
    return
  end

  local week_nxt_idx = Idx__icl(week_idx, len(g_week_def))
  local week_nxt_str = g_week_def[l:week_nxt_idx]

  v.Slctd_str__word()
  v.Normal('"zd')
  v.Normal('i' .. l:week_nxt_str)
end

function v.Cursor_str_week__dcl()

  local week_str = Cursor_word()
  local week_idx = index(g_week_def, l:week_str)

  if l:week_idx == -1 then
    return
  end

  local week_nxt_idx = Idx__dcl(week_idx, len(g_week_def))
  local week_nxt_str = g_week_def[l:week_nxt_idx]

  v.Slctd_str__word()
  v.Normal('"zd')
  v.Normal('i' .. l:week_nxt_str)
end

-- cursor etc

function v.Cursor_word()

  local word = expand('<cword>')
  return word
end

function v.Cursor_filepath()

  local str

  if     Is_env__('mac') then

    str = expand('<cfile>')

  elseif Is_env__('win64') then

    str = Cursor_line_str()

  elseif Is_env__('win32unix') then

    str = Cursor_line_str()

  else
    str = Cursor_line_str()
  end
  
  str = trim(l:str)
  
  return str
end

-- cursor __ ins line

function v.Cursor__ins_line(str)

  local line_num = Cursor_line_num() - 1
  call append(l:line_num, str)
  v.Cursor__mv_u()
end

function v.Cursor__ins_line_emp()

  local str = ''
  v.Cursor__ins_line(l:str)
end

function v.Cursor__ins_line_buf_file_path()

  local path = Buf_file_path()
  v.Cursor__ins_line(l:path)
end

function v.Cursor__ins_line_anchor()

  local str  = Str_cmnt_1()
  str = str .. 'dev '
  str = str .. 'anchor'
  v.Cursor__ins_line(l:str)
  v.Cursor_line_indnt__crct()
end

function v.Cursor_d__ins_line(str)

  local line_num = Cursor_line_num()
  v.append(l:line_num, str)
end

function v.Cursor_d__ins_line_space() -- range

  local space_len = Cursor_col_num() - 1
  local space_str = Str_space(l:space_len)
  v.Cursor_d__ins_line(l:space_str)
end

-- cursor line  -  todo refactoring

function v.Cursor_line_num() -- alias

  return line('.')
end

function v.Cursor_line_end_col() -- alias

  local col = col('$')
  return col
end

-- cursor line str

function v.Cursor_line_str()

  return getline('.')
end

function v.Cursor_line_str_len()

  local len = Cursor_line_end_col() - 1
  return len
end

function v.Cursor_line_str_side_l()

  local line_l = getline('.')[:col('.')-2]
  return line_l
end

function v.Cursor_line_str_side_r()

  local line_r = getline('.')[col('.'):]
  return line_r
end

function v.Cursor_line_str_side_r_with_c()

  local line_r = getline('.')[col('.') - 1:]
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

  local line_str = Cursor_line_str()
  local idx = Str_srch(l:line_str, escape(g_dots_str, '.'))

  if l:idx >= 0 then
    v.Cursor_line_end_dots__crct()
  else
    v.Cursor_line_end__ins_dots()
  end
end

function v.Cursor_line_end_dots__crct()

  local line_str = Cursor_line_str()
  local idx = Str_srch(l:line_str, escape(g_dots_str, '.'))

  if     l:idx < 0 then
    return
  elseif l:idx == g_dots_put_col then
    return
  end

  local line_str_0 = strcharpart(l:line_str,     0, l:idx)
  local line_str_1 = strcharpart(l:line_str, l:idx       )

  if     l:idx < g_dots_put_col then

    local space_str = Str_space(g_dots_put_col - l:idx)
    line_str = l:line_str_0 .. l:space_str .. l:line_str_1
  else
    line_str_0 = strcharpart(l:line_str_0, 0, g_dots_put_col)
    line_str = l:line_str_0 .. l:line_str_1
  end

  local line_num = Cursor_line_num()
  call setline(l:line_num, l:line_str)
end

function v.Cursor_line_end__ins_dots()

  local line_num = Cursor_line_num()

  local line_str = Cursor_line_str()

  local line_str_len = Cursor_line_str_len()

  local space_len = g_dots_put_col - l:line_str_len
  if l:space_len < 0 then
    space_len = 0
  end

  local space_str = Str_space(l:space_len)

  line_str = line_str .. l:space_str .. g_dots_str

  call setline(l:line_num, l:line_str)
end

function v.Curosr_line_end__ins(str)

  local n_cmd = 'A' .. str
  v.Normal(l:n_cmd)
end

-- cursor f

function v.Cursor_f_space__del()

  local c = Cursor_c_char()

  -- if l:c =~ '\\s' then
  if vim.fn.is_match(l:c, '\\s') then
    -- echo "del"
    v.Slctd_str__cursor_f_space()
    v.Normal('"zd')
  else
    v.Nothing()
  end
end

-- cursor __ ins line

function v.Cursor_line__del()

  if Is_cursor_line_str__emp() or Is_cursor_line_str__space() then
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

  local cursor_pos = Cursor_pos()

  local str = Cursor_line_str_side_r_with_c()
  local trim_len = Str_srch(l:str, '[^ ]')
  -- echo l:trim_len
  local str = trim(l:str)

  local cursor_r_char =  Str_l_char(l:str)
  -- echo l:cursor_r_char

  v.Cursor__mv_v(target_line_drct)

  local target_line_str = Cursor_line_str_side_r()

  if target_line_drct == 'u' then
    local turn_drct = 'd'
  else
    local turn_drct = 'u'
  end
  v.Cursor__mv_v(l:turn_drct)

  local crct_len = Str_srch(l:target_line_str, l:cursor_r_char) + 1
  -- echo l:crct_len
  if l:crct_len == -1 then
    return
  end

  local crct_len = l:crct_len - l:trim_len
  local space_str = Str_space(l:crct_len)
  v.Cursor__ins(l:space_str)

  v.Cursor__mv_by_pos(l:cursor_pos)
end

function v.Cursor__ins_sys_cmd(sys_cmd) -- read

  local is_line_num_eq_1 = Is_cursor_line_num__file_edge_bgn()

  if l:is_line_num_eq_1 then
    v.Normal('O')
  else
    -- v.Normal('k')
    v.Cursor__mv_u()
  end

  local cmd = 'read ! ' .. sys_cmd
  v.Exe(l:cmd)

  if l:is_line_num_eq_1 then
    v.Line__del_by_line_num(1)
  end
end

-- cursor line str __ end

-- cursor line cnd

function v.Is_cursor_line_num__(line_num)

  local ret = false

  local line_num = Cursor_line_num()

  if l:line_num == line_num then
    ret = true
  end
  return ret
end

function v.Is_cursor_line_num__file_edge_bgn()

  local line_num = 1
  local ret = Is_cursor_line_num__(l:line_num)
  return ret
end

function v.Is_cursor_line_num__file_edge_end()

  local line_num = Line_num_file_edge_end()
  local ret = Is_cursor_line_num__(l:line_num)
  return ret
end

function v.Is_cursor_line_num__file_edge()

  local ret = false

  if Is_cursor_line_num__file_edge_bgn() or Is_cursor_line_num__file_edge_end() then
    ret = true
  end
  --echo l:ret
  return ret
end

function v.Is_cursor_line_str__emp()
  
  if Cursor_line_end_col() == 1 then
    return true
  else
    return false
  end
end

function v.Is_cursor_line_str__space()
  
  local str = Cursor_line_str()
  local ret = Is_str__space(l:str)
  return ret
end

function v.Is_cursor_line_str_side_l__space()

  local str = Cursor_line_str_side_l()
  local ret = Is_str__space(l:str)
  return ret
end

function v.Is_cursor_line_str_side_r__space()

  local str = Cursor_line_str_side_r()
  local ret = Is_str__space(l:str)
  return ret
end

function v.Is_cursor_line_str__ptn(ptn) -- todo dev

  local str = Cursor_line_str_side_r()

  local ret = false

  if Is_str__ptn(l:str, ptn) then
    ret = true
  end
  return ret
end

-- indnt

function v.Cursor_line_indnt_col_with_c()

  local col = cindent(Cursor_line_num())
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
  v.Cursor__ins_mlt(l:char, l:col)

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

  v.Cursor_line_indnt__add(l:col)
end

function v.Cursor_line_indnt__crct()

  local col = Cursor_line_indnt__crct_with_c()
  return col
end

function v.Cursor_line_indnt__crct_with_c()

  v.Cursor_line_indnt__del()

  local col = Cursor_line_indnt_col_with_c()
  --echo l:col

  v.Cursor_line_indnt__add(l:col)
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

  if mode() == "\\<c-v>" or mode() == "v" then
    return
  end

  v.Normal('gv')
end

function v.Slctd_str__all()

  v.Normal('ggVG')
end

function v.Slctd_str__word()

  local c = Cursor_c_char()

  -- if     l:c =~ '\\w' then
  if     vim.fn.is_match(l:c, '\\w') then
    v.Normal('viw')

  -- elseif l:c =~ '\\s' then
  elseif vim.fn.is_match(l:c, '\\s') then
    v.Slctd_str__cursor_f_space()
  else
    v.Normal('v')
  end
end

function v.Slctd__word_by_under_score()

end

function v.Slctd_str__cursor_f_space()

  local c = Cursor_c_char()

  -- if l:c !~ '\\s' then
  if not vim.fn.is_match(l:c, '\\s') then
    return
  end
  --echo l:c

  if Is_cursor_line_str_side_r__space() then

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

  local s_line = (s_line == nil) and Cursor_line_num() or s_line
  local e_line = (e_line == nil) and Cursor_line_num() or e_line

  v.Cursor__mv_by_line_col(l:s_line, s_col)
  v.Normal('v')
  v.Cursor__mv_by_line_col(l:e_line, e_col)
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

  if   Is_slctd_cursor_pos__r() then
    return
  end

  v.Cursor__mv_slctd_edge_tgl()

  -- local n_cmd = '`>'
  -- v.Normal(l:n_cmd)
end

function v.Slctd_cursor_drct__mv_forward() -- range

  v.Slct_re()

  if Is_slctd_cursor_pos__r() then
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

  if     Is_slctd_mode__box() then

    if Is_cursor_col__line_end_ovr() then
      return
    end

    v.Normal('$h')
    --v.Normal('g_')

  elseif Is_slctd_mode__line() then

    if Is_cursor_line_str__emp() then
      return
    end

    v.Normal('$h')
    --v.Normal('g_')
  else
    echo "v mode else"
  end
end

-- slctd cursor cnd

function v.Is_slctd_cursor_pos__r() -- range

  local ret = false

  v.Slct_re()

  local cursor_pos1 = Cursor_pos()
  -- echo l:cursor_pos1

  v.Cursor__mv_slctd_edge_tgl()
  local cursor_pos2 = Cursor_pos()
  -- echo l:cursor_pos2

  v.Cursor__mv_slctd_edge_tgl()


  if     l:cursor_pos1[1] >  l:cursor_pos2[1] then -- line
    ret = true

  elseif l:cursor_pos1[1] == l:cursor_pos2[1] then -- line

    if   l:cursor_pos1[2] >= l:cursor_pos2[2] then -- col
      ret = true
    end
  end

  -- echo l:ret
  return ret
end

-- slctd str

function v.Slctd_str() -- range

  -- v.Normal('gv"zy')

  v.Slct_re()
  v.Normal('"zy')

  v.Slct_re()

  return @z
end

function v.Slctd_str_len() -- range

  v.Slct_re()

  local slctd_str = Slctd_str()
  local len       = Str_len(l:slctd_str)
  return len
end

function v.Slctd_str_7_opn_ggl_srch()

  local word = Slctd_str()
  local word = trim(l:word)
  v.Opn_ggl_srch(l:word)
end

function v.Slctd_str_7_opn_yt()
  
  local yt_video_id = Slctd_str()
  local yt_video_id = trim(l:yt_video_id)
  v.Opn_yt(l:yt_video_id)
end

-- slctd str __ ( expnd )

function v.Slctd_str__expnd() -- expnd lr, cre re

end

function v.Slctd_str__expnd_srch() -- range -- todo dev

  v.Slct_re()
  v.Cursor__mv_srch("f")
end

function v.Slctd_str__expnd_word_f() -- range

  local slctd_str = Slctd_str()
  local slctd_r_out_char = Slctd_str_edge_r_out_char()

  v.Slct_re()

  if     Is_cursor_line_str_side_r__space() then

    v.Normal('$h')

  -- elseif l:slctd_str =~ '\\s' and l:slctd_r_out_char =~ '\\s' then
  elseif vim.fn.is_match(l:slctd_str, '\\s') and vim.fn.is_match(l:slctd_r_out_char, '\\s') then

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

  -- Is_cursor_line_str__ptn() -- todo dev ?

  v.Slct_re()

  local c = Cursor_c_char()

  -- if l:c !~ g_quote_ptn then
  if not vim.fn.is_match(l:c, g_quote_ptn) then
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

  if not Is_cursor_line_str__ptn(g_quote_ptn) then
    return
  end

  local c_r = Slctd_str_edge_r_out_char()

  -- if l:c_r !~ g_quote_ptn then
  if not vim.fn.is_match(l:c_r, g_quote_ptn) then

    v.Slctd_str__expnd_quote_in_f()
  else
    v.Slctd_str__expnd_quote_in_b()
  end
end

function v.Slctd_str__expnd_quote_swtch() -- range

  v.Slct_re()

  if Is_slctd_str_edge_char__quote() then
    -- v.Esc()
    return
  end

  if Is_slctd_str_edge_out_char__quote() then

    v.Slctd_str__expnd_quote_on()
  else
    v.Slctd_str__expnd_quote_in_swtch()
  end
end

function v.Slctd_str__expnd_bracket_f() -- range -- todo dev

  local bracket_ptn = '[' .. "'" .. '"`)}\\]' .. ']'
  
  local s_col = Slctd_str_edge_l_col()
  
  local line_str_r = Slctd_str_edge_r_out_str()
  local srch_idx = Str_srch(l:line_str_r, l:bracket_ptn, 1)

  if l:srch_idx == -1 then

    v.Normal('gv')
    return
  end

  local len = l:s_col + Slctd_str_len() + l:srch_idx
  v.Slctd_str__by_col_len(l:s_col, l:len)
end

function v.Slctd_str__reduce_dlm_l(char) -- range

  local char = char

  v.Slct_re()

  local slctd_str = Slctd_str()
  local srch_idx = Str_srch(l:slctd_str, l:char)
  if l:srch_idx == -1 then
    v.Slctd__cancel()
    return
  end

  local n_cmd = 'F' .. l:char .. 'h'
  v.Normal(l:n_cmd)
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
  let @+ = @a
end

function v.Slctd__del() -- range

  v.Slct_re()

  local rgstr = 'z'

  local cmd = '"' .. l:rgstr .. 'dgv'
  v.Normal(l:cmd)
end

-- slctd str __ pad

function v.Slctd__pad(char) -- range

  local char = char

  if l:char == '|' then
    local char = "\\<bar>"
  end

  v.Slct_re()

  v.Normal('r' .. l:char)

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

  if Slctd_str() ==# @/ then
    return true
  else
    return false
  end
end

function v.Is_slctd_str__line_mlt()

  -- if Slctd_str() =~ '\\n' then
  if vim.fn.is_match(Slctd_str(), '\\n') then
    return true
  else
    return false
  end
end

-- slctd str edge

function v.Slctd_str_edge_l_col()

  v.Cursor__mv_slctd_edge_l()
  
  local col = Cursor_col_num()
  return col
end

function v.Slctd_str_edge_r_col()

  v.Slctd_cursor__mv_slctd_edge_r()
  
  local col = Cursor_col_num()
  return col
end

function v.Slctd_str_edge_l_pos()

  v.Cursor__mv_slctd_edge_l()
  local pos = Cursor_pos()
  return pos
end

function v.Slctd_str_edge_r_pos()

  v.Slctd_cursor__mv_slctd_edge_r()
  local pos = Cursor_pos()
  return pos
end

function v.Slctd_str_edge_l_char()

  v.Cursor__mv_slctd_edge_l()

  local c_char = Cursor_c_char()
  return c_char
end

function v.Slctd_str_edge_r_char()

  v.Slctd_cursor__mv_slctd_edge_r()

  local c_char = Cursor_c_char()
  return c_char
end

function v.Slctd_str_edge_l_out_char()

  v.Cursor__mv_slctd_edge_l()

  local l_char = Cursor_l_char()
  return l_char
end

function v.Slctd_str_edge_r_out_char()

  v.Slctd_cursor__mv_slctd_edge_r()

  local r_char = Cursor_r_char()
  return r_char
end

function v.Slctd_str_edge_l_out_str()

  v.Cursor__mv_slctd_edge_l()

  local str = Cursor_line_str_side_l()
  return str
end

function v.Slctd_str_edge_r_out_str()

  v.Slctd_cursor__mv_slctd_edge_r()

  local str = Cursor_line_str_side_r()
  return str
end

-- slctd str edge __ ( edit )

function v.Slctd_str_edge_out__ins(c) -- range

  v.Slct_re()

  if firstline ~= lastline then
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
  v.Cursor__ins(l:c_l .. l:c_r)

  local str_len = Str_len(l:c_l)
  v.Normal(l:str_len .. 'h')

  v.Normal('"zP')
  v.Normal('gv')

  local cnt = 0
  while l:cnt < l:str_len do

    v.Slctd_box__mv('r')

    cnt = cnt + 1
  end
end

function v.Slctd_str_edge_out__ins_markdown_strikethrough()

  v.Slct_re()

  if firstline ~= lastline then
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
  local c_l = Slctd_str_edge_l_out_char()
  local c_r = Slctd_str_edge_r_out_char()
  -- echo l:c_l l:c_r

  if     l:c_l == "'" and l:c_l == l:c_r then
    v.Slctd_str_edge_out_quote__tgl()
  elseif l:c_l == '"' and l:c_l == l:c_r then
    v.Slctd_str_edge_out_quote__tgl()
  elseif l:c_l == '`' and l:c_l == l:c_r then
    v.Slctd_str_edge_out_quote__tgl()

  elseif l:c_l == '(' and l:c_r == ')' then
    v.Slctd_str_edge_out_bracket__tgl()
  elseif l:c_l == '{' and l:c_r == '}' then
    v.Slctd_str_edge_out_bracket__tgl()
  elseif l:c_l == '[' and l:c_r == ']' then
    v.Slctd_str_edge_out_bracket__tgl()
  elseif l:c_l == '<' and l:c_r == '>' then
    v.Slctd_str_edge_out_bracket__tgl()

  else
    v.Slctd_str_edge_out_quote__tgl()
  end
end

function v.Slctd_str_edge_out_quote__tgl() -- range

  v.Slct_re()

  if firstline ~= lastline then
    return
  end

  if Is_cursor_col__line_end() then
    return
  end

  -- char chk
  local c_l = Slctd_str_edge_l_out_char()
  local c_r = Slctd_str_edge_r_out_char()
  -- echo l:c_l l:c_r

  if     l:c_l == "'" and l:c_l == l:c_r then

    v.Slctd_str_edge_out_char__del()
    local c = '"'
    v.Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '"' and l:c_l == l:c_r then

    v.Slctd_str_edge_out_char__del()
    local c = '`'
    v.Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '`' and l:c_l == l:c_r then

    v.Slctd_str_edge_out_char__del()
  else
    local c = "'"
    v.Slctd_str_edge_out__ins(l:c)
  end
end

function v.Slctd_str_edge_out_bracket__tgl() -- range

  v.Slct_re()

  if firstline ~= lastline then
    return
  end

  if Is_cursor_col__line_end() then
    return
  end

  -- char chk
  local c_l = Slctd_str_edge_l_out_char()
  local c_r = Slctd_str_edge_r_out_char()
  -- echo l:c_l l:c_r

  if     l:c_l == '(' and l:c_r == ')' then

    v.Slctd_str_edge_out_char__del()
    local c = '{'
    v.Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '{' and l:c_r == '}' then

    v.Slctd_str_edge_out_char__del()
    local c = '['
    v.Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '[' and l:c_r == ']' then

    v.Slctd_str_edge_out_char__del()
    local c = '<'
    v.Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '<' and l:c_r == '>' then

    v.Slctd_str_edge_out_char__del()
  else
    local c = '('
    v.Slctd_str_edge_out__ins(l:c)
  end
end

function v.Slctd_str_edge_out__tgl_shft() -- range

  v.Slct_re()

  if firstline ~= lastline then
    return
  end

  if Is_cursor_col__line_end() then
    return
  end

  -- char chk
  local c_l = Slctd_str_edge_l_out_char()
  local c_r = Slctd_str_edge_r_out_char()
  -- echo l:c_l l:c_r

  if     Is_char_pair__quote(l:c_l, l:c_r) then
    v.Slctd_str_edge_out_char__del()
    v.Slctd_str_edge_out_bracket__tgl()

  elseif Is_char_pair__bracket(l:c_l, l:c_r) then
    v.Slctd_str_edge_out_char__del()
    v.Slctd_str_edge_out_quote__tgl()

  else
    v.Slctd_str_edge_out_bracket__tgl()
  end
end

function v.Slctd_str_edge_out_char__del() -- range

  v.Slct_re()

  if Is_slctd_str_edge_l_col__line_top() then
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

  local c1 = Slctd_str_edge_l_char()
  local c2 = Slctd_str_edge_r_char()

  local ret = Is_char_pair__(ptn, l:c1, l:c2)
  return ret
end

function v.Is_slctd_str_edge_char__quote()

  local ret = Is_slctd_str_edge_char__(g_quote_ptn)
  return ret
end

function v.Is_slctd_str_edge_out_char__(ptn)

  local c1 = Slctd_str_edge_l_out_char()
  local c2 = Slctd_str_edge_r_out_char()

  local ret = Is_char_pair__(ptn, l:c1, l:c2)
  return ret
end

function v.Is_slctd_str_edge_out_char__quote()

  local ret = Is_slctd_str_edge_out_char__(g_quote_ptn)
  return ret
end

function v.Is_slctd_str_edge_l_col__line_top() -- range

  local ret = false

  v.Slct_re()

  v.Cursor__mv_slctd_edge_tgl()
  local cursor_l_pos = Cursor_pos()
  -- echo l:cursor_l_pos

  v.Cursor__mv_slctd_edge_tgl()

  if l:cursor_l_pos[2] == 1 then -- col
    ret = true
  end

  return ret
end

-- slctd line

function v.Slctd_line_7_opn_app() -- range

  for line_num in range(firstline, lastline)

    v.Opn_app_by_line_path(l:line_num)
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
  --echo l:cmd
  v.Exe(l:cmd)
end

function v.Slctd_line__rpl_by_line1_line2() -- range

  local srch = getline(1)
  local rpl  = getline(2)

  --local rng = '3,$'
  local rng = g_v_rng
  local cmd = l:rng .. 's/' .. l:srch .. '/' .. l:rpl .. '/g'
  --echo l:cmd
  v.Exe(l:cmd)
end

function v.Slctd_line__rpl_sys_cmd(sys_cmd) -- range -- read

  local cmd = "'<,'>" .. " ! " .. sys_cmd
  v.Exe(l:cmd)
end

function v.Slctd_line_srch_str__rpl_cr() -- range

  local srch = @/

  local cmd = g_v_rng .. 's/\\(' .. l:srch .. '\\)/\\1\\r/g'
  v.Exe(l:cmd)
end

function v.Slctd_line__markdown_strikethrough() -- range -- todo dev

end

function v.Slctd__sys_cmd(sys_cmd) -- range

  local cmd = g_v_rng .. '! ' .. sys_cmd
  v.Exe(l:cmd)
end

function v.Slctd_line_top_space__del() -- refactoring ?

  local rpl_cmd = 's/' .. s:line_top_space_ptn .. '//g'
  v.Exe(l:rpl_cmd)
end

function v.Slctd_line_end_space__del() -- range

  for line_num in range(firstline, lastline)

    v.Line_end_space__del(l:line_num)
  endfor
end

function v.Slctd_line_end__pad_space() -- range -- use not

  -- use recommend "aygvr gv

  v.Slct_re()
  v.Normal('o')

  local fil_end_col = Cursor_col_num() - 1

  for line_num in range(firstline, lastline)

    v.Line_end__pad_space(l:line_num, l:fil_end_col)
  endfor
end

function v.Slctd_line__join_per_line(per_line_num) -- range

  local n_cmd = per_line_num .. 'Jj'

  local line_num = lastline - firstline + 1

  local exe_num = l:line_num / per_line_num
  --echo l:exe_num

  for idx in range(1, l:exe_num)

    v.Normal(l:n_cmd)
  endfor
end

function v.Slctd_line_indnt__space(indnt_col) -- range

  if Is_env__('win64') then
    '<,'>:call Slctd_line_tab__rpl_space(indnt_col)

  else
    local sys_cmd = '  expand   -t ' .. indnt_col
    '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
  end
end

function v.Slctd_line_indnt__tab(indnt_col) -- range

  if Is_env__('win64') then
    v.Nothing()
  else
    local sys_cmd = 'unexpand   -t ' .. indnt_col
    '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
  end
end

-- slctd line tab

function v.Slctd_line_tab__rpl_space(space_col) -- range

  local space_str = Str_space(space_col)
  local cmd = g_v_rng .. 's/\\t/' .. l:space_str .. '/g'
  v.Exe(l:cmd)
end

-- slctd line indnt __ shft

function v.Slctd_indnt__shft_l() -- todo

end

function v.Slctd_indnt__shft_r() -- todo

end

-- slctd line __ crct tbl

function v.Slctd_line__crct_tbl() -- range

  local sys_cmd

  if     Is_env__('linux') then
    sys_cmd = '/usr/bin/column -t'
  elseif Is_env__('mac') then
    sys_cmd = 'column -t'
  else
    sys_cmd = 'column -t'
  end

  '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
end

-- markdown tbl header

function v.Slctd_line__cnv_markdown_tbl_header() -- range -- ??

  '<,'>:call Slctd_line__rpl('[^|]', '-')
  '<,'>:call Slctd_line__rpl( '|.',  '| ')
  '<,'>:call Slctd_line__rpl('.|' , ' |' )
end

-- slctd line mb

function v.Slctd_line_mb__cnv() -- range

  local sys_cmd = 'mb__cnv'
  '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
end

-- slctd box __ mv

function v.Slctd_box__mv(lr) -- range

  v.Slct_re()

  local n_cmd = Char_lr_2_normal_cmd(lr)
  v.Normal('o' .. l:n_cmd)
  v.Normal('o' .. l:n_cmd)
end

function v.Slctd_box_width__1() -- range

  v.Slct_re()

  if not Is_slctd_mode__box() then
    return
  end

  v.Normal('o')
  local col_num = Cursor_col_num()

  v.Normal('o')
  v.Cursor__mv_by_col_num(l:col_num)
end

function v.Slctd_box_str__mv(lr) -- range

  local n_cmd = Char_lr_2_normal_cmd(lr)

  v.Slct_re()
  v.Normal('"zx')
  v.Normal(l:n_cmd)
  v.Normal('"zP')

  v.Slct_re()
  v.Slctd_box__mv(lr)
end

-- slctd box __ ( edit )

function v.Slctd_box_edge_l__ynk_line_1() -- range

  -- if @a =~ '\\n' then
  if vim.fn.is_match(@a, '\\n') then
    echo 'yank is include cr'
    return
  end

  v.Slct_re()

  if Is_cursor_col__line_end() then
    v.Slctd__pad_space()

    v.Slctd__del()
    -- v.Normal('"zdgv') -- see
  end

  v.Cursor__mv_slctd_edge_l()
  v.Esc()
  -- v.Normal("\\<esc>")

  -- local col_num = Cursor_col_num()

  for line_num in range(firstline, lastline)

    local col_num = Cursor_col_num()

    v.Cursor__ins_ynk()

    v.Cursor__mv_by_line_col(l:line_num, l:col_num)
    v.Cursor__mv_d()
    -- if l:line_num ~= lastline then
    --   v.Normal('j')
    -- end
  endfor
end

-- slctd box __ rpl

function v.Slctd_box__rpl(srch, rpl) -- range

  local srch = srch
  local rpl  = rpl

  local cmd = g_v_rng .. 's/' .. '\\%V' .. l:srch .. '/' .. l:rpl .. '/g'
  v.Exe(l:cmd)
end

-- slctd box space __ del

function v.Slctd_box_space__del() -- range

  local srch = ' '
  local rpl  = ''

  '<,'>:call Slctd_str__rpl(srch, rpl)
end

-- slctd box char __ shft

function v.Slctd_box_edge_r_char__shft_in() -- range

  local cmd = g_v_rng .. 's/' .. '\\%V\\([ ]\\+\\)\\([^ ]\\)' .. '/' .. '\\2\\1' .. '/g'
  v.Exe(l:cmd)

  v.Slct_re()
end

function v.Slctd_box_cursor_r_space__crct() -- range

  v.Slct_re()
  local col = Cursor_col_num()
  -- echo l:col
  v.Slctd__cancel()

  -- echo firstline .. ' ' .. lastline
  v.Cursor__mv_by_line_col(firstline, l:col)

  for line_num in range(firstline, lastline)
    -- echo l:line_num .. ' ' .. l:col
    -- v.Cursor__mv_by_line_col(l:line_num, l:col)

    v.Cursor_f_space__del()
    -- v.Normal('j')
    v.Cursor__mv_d()
  endfor
end

function v.Is_slctd_mode__box() -- range

  -- v.Slct_re()

  local ret = false

  if mode() == "\\<c-v>" then
    -- echo "c-v"
    ret = true
  end
  return ret
end

function v.Is_slctd_mode__line() -- range

  -- v.Slct_re()

  local ret = false

  if mode() == "v" then
    -- echo "v"
    ret = true
  end
  return ret
end

-- slctd etc

function v.Slctd_srch__swtch() -- srch, set or run

  if Is_slctd_str__line_mlt() then

    v.Slctd_str__expnd_srch()
  else
    v.Srch_str__slctd_str()
  end
end

-- 
-- ynk
-- 

function v.Ynk__clr()

  let @a = ''
end

function v.Ynk__(str)

  let @a = str
end

function v.Ynk__line()

  v.Normal('"ayy')
  --l:line_str = Cursor_line_str()
  --let @a = l:line_str

  v.Clp__ynk()
end

function v.Ynk__line_all()

  local cmd = '%y' -- todo rgstr a direct
  v.Exe(l:cmd)

  let @a = @0
  v.Clp__ynk()
end

function v.Ynk__buf_file_path()
  
  local path = Buf_file_path()

  let @a = l:path
  v.Clp__ynk()
end

function v.Ynk__clp()

  let @a = @+
end

function v.Ynk__slctd()

  let @e = @d
  let @d = @c
  let @c = @b
  let @b = @a

  v.Normal('gv"ay')
  v.Clp__ynk()
end

function v.Ynk__add_slctd()

  v.Normal('gv"Ay')
  v.Clp__ynk()
end

function v.Ynk__by_rgstr_info(rgstr_info)
  
  local rgstr = Rgstr_info_rgstr(rgstr_info)
  local scrpt = 'let @a = @' .. l:rgstr
  execute(l:scrpt)
end

-- clp

function v.Clp__ynk()

  if Is_env__('linux') then

    --v.C9clp__ynk() -- off

  else
    let @+ = @a
  end
end

-- 
-- srch
-- 

-- srch exe, ref: cursor __ mv srch ptn

function v.Srch_or(...)

  local str = '\\(' .. join(000, '\\|') .. '\\)'
  --echo l:str

  let @/ = l:str
  v.Cursor__mv_srch('f')
end

function v.Srch_str()

  local str = @/
  return str
end

function v.Srch_str_flt()

  local str = @/

  if Is_srch__word1() then
    str = strcharpart(l:str, 2, strchars(l:str) - 4)
  end
  -- echo l:str

  return str
end

function v.Srch_str_word1(str)

  -- local str

  if str == nil then
    str = Srch_str_flt()
  else
    str = str
  end

  str = '\\<' .. l:str .. '\\>'
  return str
end

-- srch str __

function v.Srch_str__(str, op_word1)

  local exe_str = str

  exe_str = escape(l:exe_str, '.*~[]\\^$')

  exe_str = substitute(l:exe_str, '\\n', '\\\\n', 'g')
  -- echo l:exe_str

  if op_word1 == true then
    exe_str = Srch_str_word1(l:exe_str)
  end

  if "@/" == "l:exe_str" then -- same ltst 01
    return
  end

  let @/ = l:exe_str -- highlight
  v.Normal('/' .. l:exe_str) -- srch hstry add
end

function v.Srch_str__cursor_word()

  local str = Cursor_word()
  v.Srch_str__(l:str, false)
end

function v.Srch_str__word1_tgl()

  local str = Srch_str_flt()

  if Is_srch__word1() then

    v.Srch_str__(l:str, false)
  else
    v.Srch_str__(l:str, true)
  end
end

function v.Srch_str_ltst(idx)

  local str = histget('/', - idx)
  return str
end

function v.Srch_str__prv_tgl()

  local srch_str

  if @/ == Srch_str_ltst(1) then

    if            Srch_str_ltst(1)        == '\\<' .. Srch_str_ltst(2) .. '\\>' then
      srch_str = Srch_str_ltst(3)

    elseif '\\<' .. Srch_str_ltst(1) .. '\\>' ==        Srch_str_ltst(2) then

      srch_str = Srch_str_ltst(3)
    else
      srch_str = Srch_str_ltst(2)
    end
  else
    srch_str = Srch_str_ltst(1)
  end

  let @/ = l:srch_str
end

function v.Srch_str__slctd_str() -- range

  if Is_slctd_str__srch_str() then
    v.Slctd__cancel()
    return
  end

  v.Slct_re()

  local str = Slctd_str()
  v.Srch_str__(l:str, false)
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
  v.Srch_slct(l:drct)
  v.Esc()
  -- v.Normal("\\<esc>")
  v.Esc()
  v.Cursor__mv_char_f()
end

function v.Srch_char(drct, char)

  let @/ = '[' .. char .. ']'
  v.Cursor__mv_srch(drct)
end

function v.Srch_char_bracket(drct)

  local char_bracket = "'" .. '")}\\]'
  v.Srch_char(drct, l:char_bracket)
end

function v.Srch_str__markdown_h() -- range

  let @/ = '^#\\+ '
end

-- srch cnd

function v.Is_srch__word1()

  local str = @/
  local ret = false

  local str_l = strcharpart(l:str, 0, 2)
  local str_r = strcharpart(l:str, strchars(l:str) - 2)

  if l:str_l == '\\<' and l:str_r == '\\>' then
    ret = true
  end

  return ret
end

-- markdown cnd

function v.Is_line_markdown_itm()

  local ptn = '^\\s*- '
  local str = Cursor_line_str()
  local idx = Str_srch(l:str, l:ptn)

  if l:idx == -1 then
    return false
  else
    return true
  end
end

-- complete  -  mode insert ins lst

function v.I_symbol01()

  local lst = [ '$', '@', '#', ';', '%' ]
  call complete(col('.'), l:lst)
  return ''
end

function v.I_symbol02()

  local lst = [ '!', '?', '~', '^', '&', '|', '\\', '/' ]
  call complete(col('.'), l:lst)
  return ''
end

function v.I_symbol03()

  local lst = [ '=', '+', '-' ]
  call complete(col('.'), l:lst)
  return ''
end

function v.I_bracket()

  local lst = [ '()', '{}', '[]', '<>', '[]()', '[][]', '(){}' ]
  call complete(col('.'), l:lst)
  return ''
end

function v.I_quote()

  local lst = [ "''", '""', '``' ]
  call complete(col('.'), l:lst)
  return ''
end

function v.I_markdown_lnk()

  local lst = [ '[]()', '[][]', '![]()' ]
  call complete(col('.'), l:lst)
  return ''
end

function v.I_week()

  call complete(col('.'), g_week_def)
  return ''
end

function v.I_num()

  local lst = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ]
  call complete(col('.'), l:lst)
  return ''
end

function v.I_reg()
  call complete(col('.'), [@0, @1, @2, @3])
  return ''
end

function v.I_todo_status()

  local lst = [ 'done', 'doing', 'on hold' ]
  call complete(col('.'), l:lst)
  return ''
end

function v.I_reserved_lua()
  call complete(col('.'), [
    'end',
    'local',
    'return',
    'if elseif else end',
    'for key, val in pairs() do end',
    'function'
  ])
  return ''
end

function v.I_ooq()
  call complete(col('.'), [
    '_s:',
    '_s._',
    'log._("", )',
    'log.pp("", )',
    '-- dbg',
    '--',
    '_.f',
    '_.t'
  ])
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

-- fzf fnc

function v.Fzf_rg(...) -- alias

  local ptn   = ( a:0 >= 1 ) and a:1 or ''
  -- local ptn   = ( a:0 >= 1 ) and a:1 or g_rg_some_line_ptn

  local ext   = ( a:0 >= 2 ) and a:2 or nil
  local word1 = ( a:0 >= 3 ) and a:3 or false

  v.Fzf_rg_with_grep(l:ptn, l:ext, l:word1)
end

function v.Fzf_rg_with_grep(...)

  if not ( Is_env__('mac') or Is_env__('linux') or Is_env__('win64') ) then
    return
  end

  local ptn   = ( a:0 >= 1 ) and a:1 or ''
  -- local ptn   = ( a:0 >= 1 ) and a:1 or g_rg_some_line_ptn

  local ext   = ( a:0 >= 2 ) and a:2 or nil
  local word1 = ( a:0 >= 3 ) and a:3 or false

  local rg_cmd = Rg_cmd(l:ptn, l:ext, l:word1, nil)
  -- echo l:rg_cmd

  call fzf#vim#grep(
        l:rg_cmd,
        0,
        fzf#vim#with_preview(
          {'options': '--exact --delimiter : --nth 3..'},
          'up:70%:hidden',
          'ctrl-u'
        ),
        1
      )

  -- ref
  -- fzf#vim#grep(
  --   command,
  --   [has_column bool],
  --   [spec dict],
  --   [fullscreen bool]
  -- )
end

-- fzf rg ext

function v.Fzf_rg_ext(ext)

  local ext = ext
  v.Fzf_rg(nil, l:ext)
end

-- rg word1
function v.Fzf_rg_word1(ptn)

  v.Fzf_rg(ptn, nil, true)
end

-- fzf rg by run

g_fzf_line_cnt_max = 30000

function v.Fzf_rg_with_run(...)

  local ptn = ( a:0 >= 1 ) and a:1 or nil

  if l:ptn == nil then

    local rg_rslt_cnt = Rg_all_cnt()

    if l:rg_rslt_cnt > g_fzf_line_cnt_max then
      echo "l:rg_rslt_cnt, end"
      return
    end

    local fzf_src_ar = Rg_all_rslt_ar()

  else
    local rg_rslt_cnt = Rg_ptn_cnt(l:ptn, nil)

    if l:rg_rslt_cnt > g_fzf_line_cnt_max then
      echo "l:rg_rslt_cnt, end"
      return
    end

    local fzf_src_ar = Rg_ptn_rslt_ar(l:ptn, nil)
  end

  call fzf#run(
        {
          'source' : l:fzf_src_ar,
          'sink'   : funcref('Tag_jmp_by_str'),
          'window' : '-tabnew',
        }
      )
  --     'options': ['--reverse'],
  --     'options': ['--no-sort'],
end

function v.Fzf_by_txt(...)

  local src_txt  = ( a:0 >= 1 ) and a:1 or nil
  local fnc_name = ( a:0 >= 2 ) and a:2 or nil

  local src_ar = Txt_to_ar(l:src_txt)

  v.Fzf_by_ar(l:src_ar, fnc_name)
end

function v.Fzf_by_ar(...)

  local src_ar   = ( a:0 >= 1 ) and a:1 or nil
  local fnc_name = ( a:0 >= 2 ) and a:2 or nil

  if len(l:src_ar) > g_fzf_line_cnt_max then
    echo "l:fzf src_ar, end"
    return
  end

  call fzf#run(
        {
          'source' : l:src_ar,
          'sink'   : funcref(l:fnc_name),
          'window' : '-tabnew',
        }
      )
  --     'options': ['--reverse'],
  --     'options': ['--no-sort'],
end

-- fzf tag jmp by file

function v.Fzf_tag_jmp_by_file(...)

  local file_path = ( a:0 >= 1 ) and a:1 or 'doc/memo.md'

  local fzf_src_txt = File_txt(l:file_path)
  local fnc_name    = 'Tag_jmp_by_str'
  v.Fzf_by_txt(fzf_src_txt, fnc_name)
end

-- fzf buf

function v.N_fzf_buf()
  
  exe 'FzfBufCrnt '
end

function v.V_fzf_buf()

  v.Srch_str__slctd_str()
  exe 'FzfBufCrnt ' .. escape(@z, '.*~')
end

function v.Fzf_rgstr()

  local rgstr_info = execute(':reg')->split("\\n")
  call remove(l:rgstr_info, 0)
  
  call fzf#run(
    {
      'source': l:rgstr_info,
      'sink'  : funcref('Ynk__by_rgstr_info'),
      'window': '-tabnew'
    }
  )
  --      'sink'  : funcref('Cursor__ins_rgstr_by_rgstr_info'),
end

-- fzf jmplst

function v.Fzf_jmplst()
  
  call fzf#run(
    {
      'source' : Jmplst_line_info(),
      'sink'   : funcref('Cursor__mv_by_line_info'),
      'window' : '-tabnew',
      'options': ['--reverse'],
    }
  )
  --     'options': ['--no-sort'],
end

-- fzf file

function v.Fzf_file()

  local sys_cmd = 'fd --type f'
  local fzf_src_txt  = Sys_cmd(l:sys_cmd)

  local fnc_name = 'Opn'
  v.Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
end

-- fzf dir

function v.Fzf_dir()

  local sys_cmd = 'fd --type d'
  local fzf_src_txt  = Sys_cmd(l:sys_cmd)

  local fnc_name = 'Dir__'
  v.Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
end

function v.Fzf_dir_jmp()

  local sys_cmd = 'dir_jmp_lst_with_z'
  -- local sys_cmd = 'dir_jmp_lst_with_zoxide'

  local fzf_src_txt  = Sys_cmd(l:sys_cmd)

  local fnc_name = 'Dir__'
  v.Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
end

function v.Fzf_doc_memo_opn()

  local dir = '~'

  local memo_file_list = [
    l:dir .. '/wrk/prj-pri/dotfiles/doc/memo.md',
    l:dir .. '/wrk/prj-pri/doc-tech-ds/doc/memo.md',
    l:dir .. '/wrk/prj-pri/life/doc/memo.md',
    l:dir .. '/wrk/prj-pri/wall-paper/doc/memo.md'
  ]

  local fzf_src_ar = l:memo_file_list
  local fnc_name    = 'Opn'
  v.Fzf_by_ar(l:fzf_src_ar, l:fnc_name)
end

function v.Fzf_vim_fnc_call()

  local rg_ptn = '^function v.[\\w]+\\(.*\\)'

  local sys_cmd_rg = "rg " .. "-No '" .. l:rg_ptn .. "' " .. g_vimrc_file_path

  local sys_cmd_sed = 'sed "s/function v.//g"'

  local sys_cmd = l:sys_cmd_rg .. ' | ' .. l:sys_cmd_sed
  local fzf_src_txt  = Sys_cmd(l:sys_cmd)

  local fnc_name = 'Cmdline__'

  v.Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
end

g_doc_tech_dir_rel = 'wrk/prj-pri/doc-tech-ds/docs/md'

function v.Fzf_doc_tech()

  local ptn = g_rg_emp_line_ptn
  local opt  = ' -v'
  opt = opt .. ' --no-heading'
  -- opt = opt .. ' --line-number'
  local sys_cmd_rg = "rg" .. l:opt .. " '" .. l:ptn .. "' ~/" .. g_doc_tech_dir_rel
  -- echo l:sys_cmd

  local sys_cmd_sed = 'sed "s|^.*' .. g_doc_tech_dir_rel .. '/||g"'

  local sys_cmd = l:sys_cmd_rg .. ' | ' .. l:sys_cmd_sed

  local fzf_src_txt = Sys_cmd(l:sys_cmd)

  local fnc_name = 'Doc_tech_tag_jmp'
  v.Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
end

function v.Doc_tech_tag_jmp(str)

  local str = $HOME .. '/' .. g_doc_tech_dir_rel .. '/' .. str
  -- echo l:str
  v.Tag_jmp_by_str(l:str)
end

-- rg

function v.Rg_rslt_line_parse(line)

  local dlm = ':'
  local ret = split(line, l:dlm)
  --echo l:ret

  local idx = 0
  while l:idx < len(l:ret) do

    ret[l:idx] = trim(l:ret[l:idx])

    idx = l:idx + 1
  end

  if ( len(l:ret) > 1 ) and ( not Is_char__num(l:ret[1]) ) then
    ret[1] = '1'
  end

  return ret
end

g_fzf_rg_opt = ''
  .. ' --color=always'
  .. ' --line-number'
  .. ' --smart-case'
  .. ' --no-multiline'
  .. ' --no-heading'
  .. ' --hidden'

function v.Rg_cmd(ptn, ext, word1, opt)

  if ptn == nil then
    local ptn = ''
  else
    local ptn = ptn
  end

  if ext == nil then
    local fzf_rg_opt_ext = ''
  else
    local fzf_rg_opt_ext = ' -g "*.' .. ext .. '"'
  end

  if word1 == true then
    local fzf_rg_opt_word1 = ' -w'
  else
    local fzf_rg_opt_word1 = ''
  end

  if opt == nil then
    local opt = ''
  else
    local opt = ' ' .. opt
  end

  local rg_cmd = 'rg '
       .. g_fzf_rg_opt
       .. l:fzf_rg_opt_ext
       .. l:fzf_rg_opt_word1
       .. l:opt
       .. ' -- ' .. '"' .. escape(l:ptn, '().$') .. '"'

  return rg_cmd
end

g_rg_emp_line_ptn  = '^[ \\t]*$'
g_rg_some_line_ptn = '^[^ \\t]+$'
-- g_rg_some_line_ptn = '[^ \\t]'

function v.Rg_ptn_cnt(ptn, opt)

  if opt == nil then
    local opt = ''
  else
    local opt = opt
  end

  local rg_cmd = "rg " .. l:opt .. " -e '" .. ptn .. "' | count"
  local rg_rslt_cnt = Sys_cmd(l:rg_cmd)
  return rg_rslt_cnt
end

function v.Rg_all_cnt()

  local ptn = g_rg_emp_line_ptn
  local opt = '-v'

  local rg_rslt_cnt = Rg_ptn_cnt(l:ptn, l:opt)
  return rg_rslt_cnt
end

function v.Rg_all_rslt_ar()

  local ptn = g_rg_emp_line_ptn
  local opt = '-v'

  local rslt_ar = Rg_ptn_rslt_ar(l:ptn, l:opt)
  return rslt_ar
end

function v.Rg_ptn_rslt_ar(ptn, opt)

  local rg_rslt_txt = Rg_ptn_rslt_txt(ptn, opt)
  local rg_rslt_ar  = split(l:rg_rslt_txt, "\\n")
  return rg_rslt_ar
end

function v.Rg_ptn_rslt_txt(ptn, opt)
  
  local rg_cmd = Rg_cmd(ptn, nil, nil, opt) -- todo dev
  local r_rslt_txt = Sys_cmd(l:rg_cmd)
  return r_rslt_txt
end

function v.Cursor__ins_rgstr_by_rgstr_info(rgstr_info)
  
  local rgstr = Rgstr_info_rgstr(rgstr_info)
  v.Normal('"' .. l:rgstr .. l:rgstr .. 'P')
end

function v.Rgstr_info_rgstr(rgstr_info)

  local rgstr = strcharpart(rgstr_info, 6, 1)
  return rgstr
end

function v.Jmplst()

  local jmplst_tmp = getjumplist()[0]
  --echo l:jmplst_tmp

  local buf_num_key_prefix = 'key_'
  local jmplst = {}
  for _jmplst_tmp in l:jmplst_tmp

    local _buf_num_key = l:buf_num_key_prefix .. l:_jmplst_tmp['bufnr']

    if not has_key(l:jmplst, l:_buf_num_key) then
      jmplst[l:_buf_num_key] = []
    end

    call add(l:jmplst[l:_buf_num_key], l:_jmplst_tmp)
  endfor

  for _buf_num_key in keys(l:jmplst)

    call sort(l:jmplst[l:_buf_num_key], 'Jmplst_cmp')
  endfor

  local buf_num_key = l:buf_num_key_prefix .. Buf_num()
  local r_jmplst    = get(l:jmplst, buf_num_key, [])
  --echo l:r_jmplst

  return r_jmplst
end

function v.Jmplst_line_info()

  local jmplst = Jmplst()

  local jmplst_line_info = []
  for _jmplst in l:jmplst

    local line_num  = l:_jmplst['lnum']
    local line_info = l:line_num .. ' ' .. getline(l:line_num)
    call add(l:jmplst_line_info, l:line_info)
  endfor
  --echo l:jmplst_line_info

  return jmplst_line_info
end

function v.Jmplst_cmp(jmplst1, jmplst2)

  local ret

  if     jmplst1['lnum'] >  jmplst2['lnum'] then
    ret =  1
  elseif jmplst1['lnum'] == jmplst2['lnum'] then
    ret =  0
  else
    ret = -1
  end

  return ret
end

-- mark

g_mark_alph_def = [
  'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
  'o','p','q','r','s','t','u','v','w','x','y','z'
]

function v.Mark_show_tgl()
  
  if exists('g_mark_show_flg') == 0 then
    
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
  
  local mark = []
  for _mark in bufname()->getmarklist()
    
    local _alph = l:_mark['mark'][1]
    
    if count(g_mark_alph_def, l:_alph) == 0 then
      continue
    end
    
    mark = add(l:mark, l:_mark['mark'][1])
  endfor
  --echo l:mark
  return mark
end

function v.Mark_alph_line()
  
  local line_c = line('.')
  
  for _mark in bufname()->getmarklist()
    
    local _alph = l:_mark['mark'][1]
    
    if count(g_mark_alph_def, l:_alph) == 0 then
      continue
    end
    
    if l:_mark['pos'][1] == l:line_c then
      --echo l:_alph
      return _alph
    end
  endfor
  return ''
end

function v.Mark_tgl()
  
  local alph = Mark_alph_line()
  --echo 'Mark_tgl ' .. l:alph
  
  --if l:alph == '' then
  if Is_str__emp(l:alph) then
    v.Mark_add()
  else
    v.Mark_del(l:alph)
  end
  
  v.Exe('DoShowMarks')
end
  
function v.Mark_add()
  
  local alph = Mark_alph_useabl()
  v.Exe('mark ' .. l:alph)
end

function v.Mark_alph_useabl()
  
  local mark = Mark_lst()
  
  for _alph in g_mark_alph_def
    if count(l:mark, _alph) == 0 then
      --echo _alph
      return _alph
    end
  endfor
  
  echo 'use alph all'
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

  local str = Slctd_str()

  local str = substitute(l:str, "\\n", ' ', 'g')

  -- if l:str =~ '[^\\x01-\\x7E]' then -- mlt byte
  if vim.fn.is_match(l:str, '[^\\x01-\\x7E]') then -- mlt byte
    local lang = '{ja=en}'
  else
    local lang = '{en=ja}'
    --local lang = ''
  end

  local str = escape(l:str, "'")
  local sys_cmd = 'trans -no-ansi ' .. l:lang .. " '" .. l:str .. "'"
  local rslt = Sys_cmd(l:sys_cmd)
  echo l:rslt
end

-- math

function v.Slctd_math() -- range

  local str = Slctd_str()
  local sys_cmd = 'echo ' .. "'" .. l:str .. "'" .. ' | math'
  local rslt = Sys_cmd(l:sys_cmd)
  echo l:rslt
  let @a = l:rslt
end

-- url encdoe

function v.Slctd_url_encode() -- range

  local str = Slctd_str()
  local sys_cmd = 'url_encode "' .. l:str .. '"'
  local rslt = Sys_cmd(l:sys_cmd)
  --echo l:rslt
  v.Cursor__ins(l:rslt)
end

function v.Defold_err_cnv()

  exe '%s/^ERROR:SCRIPT:/ERROR:SCRIPT:\\r/g'
  exe '%s/\\/assets\\///g'
  exe '%s/^ *//g'
end

-- env

function v.Is_env__(env) -- alias

  -- env : 'mac', 'win64', 'win32', 'wsl', 'linux'

  local ret = has(env)

  if env ~= 'mac' then
    -- echo env .. ' : ' .. l:ret
    -- echo hostname()
  end

  return ret
end

function v.Is_nvim() -- alias

  local ret = has('nvim')
  return ret
end

-- 
-- plugin
-- 

function v.Vim_plug_path()

  if Is_nvim() then
    if     Is_env__('mac') then

      local vim_plug_dir_dflt_nvim = "~/.local/share/nvim/site"
      local vim_plug_dir_mac_nvim  = $HOME .. '/.local/share/nvim/site'

      if     isdirectory(l:vim_plug_dir_mac_nvim) then
        local vim_plug_dir = l:vim_plug_dir_mac_nvim
      else
        local vim_plug_dir = l:vim_plug_dir_mac_nvim
      end

    elseif Is_env__('linux') then

      local vim_plug_dir_dflt_nvim = "~/.local/share/nvim/site"
      local vim_plug_dir_ec2_nvim  = "/home/ec2-user/.local/share/nvim/site"
      local vim_plug_dir_c9_nvim   = "/home/ec2-user/.local/share/nvim/site"
      local vim_plug_dir_s9_nvim   = "/home/centos/.local/share/nvim/site"

      if     isdirectory(l:vim_plug_dir_dflt_nvim) then
        local vim_plug_dir = l:vim_plug_dir_dflt_nvim

      elseif isdirectory(l:vim_plug_dir_ec2_nvim) then
        local vim_plug_dir = l:vim_plug_dir_ec2_nvim

      elseif isdirectory(l:vim_plug_dir_c9_nvim) then
        local vim_plug_dir = l:vim_plug_dir_c9_nvim

      elseif isdirectory(l:vim_plug_dir_s9_nvim) then
        local vim_plug_dir = l:vim_plug_dir_s9_nvim

      else
        local vim_plug_dir = l:vim_plug_dir_ec2_nvim
      end

    elseif Is_env__('win64') then

      local vim_plug_dir = '~/appdata/local/nvim-data/site'

    elseif Is_env__('win32unix') then -- gitbash

      local vim_plug_dir = '~/appdata/local/nvim-data/site'
    else
      local vim_plug_dir = '~/appdata/local/nvim-data/site'
    end

  else -- vim
    if     Is_env__('mac') then

      -- local vim_plug_dir_mac_nvim = $HOME .. '/.local/share/nvim/site'
      local vim_plug_dir_mac_vim  = $HOME .. '/.vim'

      if isdirectory(l:vim_plug_dir_mac_vim) then
        local vim_plug_dir = l:vim_plug_dir_mac_vim

      else
        local vim_plug_dir = l:vim_plug_dir_mac_vim
      end

    elseif Is_env__('linux') then

      local vim_plug_dir_ec2_vim  = "/home/ec2-user/.vim"
      local vim_plug_dir_c9_vim   = "/home/ec2-user/.vim"
      -- local vim_plug_dir_c9_nvim  = "/home/ec2-user/.local/share/nvim/site"
      -- local vim_plug_dir_s9_nvim  = "/home/centos/.local/share/nvim/site"

      if isdirectory(l:vim_plug_dir_c9_vim) then
        local vim_plug_dir = l:vim_plug_dir_c9_vim

      else
        local vim_plug_dir = l:vim_plug_dir_ec2_vim
      end

    elseif Is_env__('win64') then
      local vim_plug_dir = '~/.vim'

    elseif Is_env__('win32unix') then -- gitbash
      local vim_plug_dir = '~/.vim'

    else
      local vim_plug_dir = '~/.vim'
    end
  end

  local vim_plug_path = l:vim_plug_dir .. '/autoload/plug.vim'
  return vim_plug_path
end

function v.Is_vim_plug__installed()

  local vim_plug_path = Vim_plug_path()
  -- echo l:vim_plug_path

  local ret = not empty(glob(l:vim_plug_path))
  -- echo 'vim_plug installed : ' .. l:ret

  return ret
end

-- fnc end


-- 
-- init
-- 

if Is_vim_plug__installed() then
  --echo 'plug#begin'

  call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/vim-molder'
  -- Plug 'mattn/vim-molder-operations'
  -- Plug 'jacquesbh/vim-showmarks'

  -- nvim
  Plug 'ojroques/nvim-osc52'

  -- Plug 'shellRaining/hlchunk.nvim'
  -- Plug 'sphamba/smear-cursor.nvim'
  -- Plug 'folke/noice.nvim'
  -- Plug 'MunifTanjim/nui.nvim'
  call plug#end()

  -- lua require('smear_cursor').enabled = true
  -- lua require("noice").setup()
end
-- do :PlugInstall
-- or :PlugUpdate
-- or :PlugClean

-- ynk init
v.Ynk__clp()

-- shell & .vimrc_env
set shell=fish           -- default

if     Is_env__('mac')   then -- mac

  source ~/wrk/prj-pri/dotfiles/nvim/scrpt/mac/init.vim

elseif Is_env__('linux') then -- c9 s9

  source ~/wrk/prj-pri/dotfiles/nvim/scrpt/c9/init.vim

elseif Is_env__('win64') then -- pwsh ( for fzf )

  source ~/wrk/prj-pri/dotfiles/nvim/scrpt/pwsh/init.vim

elseif Is_env__('win32unix') then -- gitbash ( for fzf )

  source ~/wrk/prj-pri/dotfiles/nvim/scrpt/gitbash/init.vim
else
  echo "is env else"
end

-- fzf init

g_fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
g_fzf_action = {
  'ctrl-o': 'tab drop',
}

--  'ctrl-o': 'enter',
--  'ctrl-i': 'item slct mtl',
--  'ctrl-s': 'backward-char',

g_fzf_colors = {
  'hl'     : ['fg', 'Statement'  ],
  'hl+'    : ['fg', 'Statement'  ],
}

--   'bg+'    : ['bg', 'CursorLine' ],
--   'bg+'    : ['bg', 'Normal'     ],

--   'info'   : ['fg', 'Comment'    ],
--   'border' : ['fg', 'Ignore'     ],
--   'prompt' : ['fg', 'Function'   ],
--   'pointer': ['fg', 'Statement'  ],
--   'marker' : ['fg', 'Conditional'],

--   'info'   : ['Comment'],
--   'border' : ['Comment'],
--   'prompt' : ['Comment'],
--   'pointer': ['Comment'],
--   'marker' : ['Comment'],

-- use ??
--g_fzf_buffers_jump = 1
--fzf#vim#complete#buffer_line([spec])

-- fzf var def ( in plugin ) end

if Is_env__('mac') or Is_env__('linux') or Is_env__('win64') then

  if Is_env__('win64') then
    g_fzf_rg_opt = g_fzf_rg_opt .. ' -g "!.git/"'
  else
    g_fzf_rg_opt = g_fzf_rg_opt .. ' -g "!.git/"'
  end
end

-- srch init
function v.Srch_init() -- use not

  local cmd = '/<cr>N'
  v.Normal(l:cmd)
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


