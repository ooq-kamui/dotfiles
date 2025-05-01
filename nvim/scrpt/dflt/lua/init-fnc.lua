-- 
-- fnc
-- 

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
  if vim.fn.match(char, '\\d') == -1 then
    ret = true
  end

  return ret
end

function v.Is_char__alpha(char)

  local ret = false

  if char =~ '\\a' then
    local ret = true
  end

  return ret
end

function v.Is_char__symbol(char)

  local ret = false

  if char !~ '\\s' && char !~ '\\w' then
    local ret = true
  end

  return ret
end

-- char cnd  -  char pair __

function v.Is_char_pair__(ptn, c1, c2)

  local ret = false

  if c1 =~ ptn && c2 =~ ptn then
    local ret = true
  end

  return ret
end

function v.Is_char_pair__quote(c1, c2)

  local ret = false

  if     c1 == "'" && c2 == "'" then
    local ret = true
  elseif c1 == '"' && c2 == '"' then
    local ret = true
  elseif c1 == '`' && c2 == '`' then
    local ret = true
  end

  return ret
end

function v.Is_char_pair__bracket(c1, c2)

  local ret = false

  if     c1 == '(' && c2 == ')' then
    local ret = true
  elseif c1 == '{' && c2 == '}' then
    local ret = true
  elseif c1 == '[' && c2 == ']' then
    local ret = true
  elseif c1 == '<' && c2 == '>' then
    local ret = true
  end

  return ret
end

-- char cnd tgl

function v.Is_char__tgl_symbol(c)

  local rpl = ''

  if     c == '/' then
    local rpl = '|'
  elseif c == '|' then
    local rpl = '\\'
  elseif c == '\\' then
    local rpl = '/'

  elseif c == "'" then
    local rpl = '"'
  elseif c == '"' then
    local rpl = '`'
  elseif c == '`' then
    local rpl = "'"

  elseif c == '-' then
    local rpl = '+'
  elseif c == '+' then
    local rpl = '='
  elseif c == '=' then
    local rpl = '*'
  elseif c == '*' then
    local rpl = '-'

  elseif c == ',' then
    local rpl = '.'
  elseif c == '.' then
    local rpl = ','

  elseif c == ';' then
    local rpl = ':'
  elseif c == ':' then
    local rpl = ';'

  elseif c == '?' then
    local rpl = '!'
  elseif c == '!' then
    local rpl = '?'
  end

  return rpl
end

function v.Is_char__tgl_bracket_trn(c)

  local rpl = ''

  if     c == '<' then
    local rpl = '>'
  elseif c == '>' then
    local rpl = '<'

  elseif c == '{' then
    local rpl = '}'
  elseif c == '}' then
    local rpl = '{'

  elseif c == '[' then
    local rpl = ']'
  elseif c == ']' then
    local rpl = '['

  elseif c == '(' then
    local rpl = ')'
  elseif c == ')' then
    local rpl = '('
  end

  return rpl
end

function v.Is_char__tgl_alpha_trn(c) -- use not
  
  local rpl = ''

  if     c ==# 'T' then
    local rpl = 'f'
  elseif c ==# 'F' then
    local rpl = 't'
  end

  return rpl
end

-- str

function v.Str_len(str) -- alias

  return strchars(str)
end

function v.Str_l_char(str)
  
  local l_idx = 0
  local str_l = str[l:l_idx]
  --echo l:str_l
  return str_l
end

function v.Str_r_char(str)
  
  local r_idx = Str_len(str) - 1
  local str_r = str[l:r_idx]
  --echo l:str_r
  return str_r
end

function v.Str_sub(str, idx, len) -- dev doing

  local str = str
  return str
end

function v.Str_space(len)

  local space_str = ''

  local idx = 0
  while l:idx < len

    local space_str .= ' '

    local idx += 1
  endwhile
  return space_str
end

function v.Str_srch(...) -- alias

  local str =                a:1
  local ptn =                a:2
  local idx = ( a:0 >= 3 ) ? a:3 : v:null

  local r_idx = match(l:str, l:ptn, l:idx)
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
  local path = Str__rpl(l:path, '/c/', 'C:/')
  local path = Str__rpl(l:path, '/', '\\')
  return path
end

function v.Str_path_win__cnv_unix(path)

  local path = path
  local path = Str__rpl(l:path, 'C:', '/c')
  local path = Str__rpl(l:path, '\\', '/')
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

  local str = get(l:cmnt_1_def, &filetype, l:cmnt_1_def['dflt'])
  return str
end

-- str cnd

function v.Is_str__emp(str)

  local ret = false

  if str == '' then
    local ret = true
  end
  return ret
end

function v.Is_str__ptn(str, ptn)

  local ret = false

  if str =~ ptn then
    local ret = true
  end
  return ret
end

function v.Is_str__space(str)

  local ptn = '^\\s\\+$'
  local ret = Is_str__ptn(str, l:ptn)
  return ret
end

function v.Is_str__num(str)

  local ptn = '^\\d\\+$'
  local ret = Is_str__ptn(str, l:ptn)
  return ret
end

-- num ( idx )

function v.Idx__icl(idx, ar_len)

  local r_idx = idx + 1

  if r_idx >= ar_len then
    local r_idx = 0
  end

  return r_idx
end

function v.Idx__dcl(idx, ar_len)

  local r_idx = idx - 1

  if r_idx < 0 then
    local r_idx = ar_len - 1
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

  call Exe('normal! ' . cmd)
end

function v.Esc() -- alias

  call Normal("\\<esc>")
end

function v.Cmdline__(str)

  call Ynk__(str)

  call feedkeys(':call ' . str)
end

-- undo clr, file ( crnt buf ? )

function v.Undo__clr()

  local undo_lvl_tmp = &undolevels

  setlocal undolevels=-1

  exe "normal! a \\<BS>\\<Esc>"

  let &l:undolevels = l:undo_lvl_tmp
end

function v.Sys_cmd(sys_cmd)

  return system(sys_cmd)

  --local cmd = '! ' . sys_cmd
  --call Exe(l:cmd)
end

-- syntax color

function v.Hl_grp()

  echo synIDattr(synID(line('.'), col('.'), 1), 'name')
end
-- and
-- :hi [grp name]

function v.Color_name_lst()

  local cmd = "so $VIMRUNTIME/syntax/colortest.vim"
  call Exe(l:cmd)
end

-- dir

function v.Pth()

  call Exe('pwd')
end

-- dir __ ch

function v.Dir__(dir)

  call Exe('cd ' . dir)
  call Pth()
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
  call Dir__(l:dir)
  -- call Exe('cd ' . l:dir)

  -- call Pth()
end

-- dir __ ch parent

function v.Dir__parent(lvl)

  local cnt = 1
  while l:cnt <= lvl

    call Exe('cd ..')

    local cnt += 1
  endwhile

  call Pth()
end

-- file ( buf file )

function v.Save()

  call Exe('w')
end

function v.Buf_file__dpl()

  local sys_cmd = 'dpl ' . Buf_file_path()
  call Sys_cmd(l:sys_cmd)
end

function v.Buf_file__mv(file_name_aft)

  local file_path_bfr = Buf_file_path()

  local sys_cmd = 'str_mv_f ' . l:file_path_bfr . ' ' . file_name_aft
  local file_path_aft = Sys_cmd(l:sys_cmd)

  local sys_cmd = 'mv ' . l:file_path_bfr . ' ' . l:file_path_aft
  call Sys_cmd(l:sys_cmd)

  local cmd = 'file ' . l:file_path_aft -- save file_path ch
  call Exe(l:cmd)
end

function v.Buf_file_path()
  
  local path = expand('%:p')
  return path
end

function v.Rgstr__clr()

  let @0 = ''
end

function v.File_txt(file_path)

  if ! filereadable(file_path) then
    return
  end

  local cmd = 'cat ' . file_path

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

  call Exe('e ')
end

-- load re  -  encode sjis

function v.Load_re__sjis()

  call Exe('e ++enc=sjis')
end

-- encode

function v.Buf_file_encode()

  call Exe('set enc?')
end

function v.Buf_file_bom()

  call Exe('set bomb?')
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

  call Exe('tab drop ' . filename)
end

function v.Opn_tmp_file()

  local path = File_tmp__cre()
  echo l:path
  call Opn(l:path)
end

function v.Opn_vimrc()

  call Opn(g_vimrc_file_path)

  if has('nvim') then
    call Opn(g_init_lua_file_path        )
    call Opn(g_init_lua_key_map_file_path)
    call Opn(g_init_lua_lua_file_path    )
  end

  if     Is_env__('linux')     then    -- c9 s9

    local vimrc_c9_file_path      = g_vimrc_dir . '/c9/init.vim'
    -- call Opn(l:vimrc_c9_file_path)

  elseif Is_env__('win32unix') then -- gitbash

    local vimrc_gitbash_file_path = g_vimrc_dir . '/gitbash/init.vim'
    call Opn(l:vimrc_gitbash_file_path)
  end
end

function v.Opn_fish_cnf()

  local path = '~/.config/fish/config.fish'
  call Opn(l:path)
end

function v.Opn_man(cmd)

  call Exe('tab new')
  call Exe('Man ' . cmd)
  call Exe('only')
end

let g_opn_memo_path = 'doc/memo.md'

function v.Opn_memo()

  call Opn(g_opn_memo_path)
end

function v.Opn_grep_wk()

  let g_grep_wk_path = '~/wrk/tmp/rg.md'

  local file_type = getftype(g_grep_wk_path)

  if Is_str__emp(l:file_type) then

    call Opn(g_grep_wk_path)
  else
    call Opn_tmp_file()
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

  local res = system(l:cmd_sys . " '" . l:path . "'")
end

function v.Opn_app_by_cursor_path()
  
  local path = Cursor_filepath()
  call Opn_app(l:path)
end

function v.Opn_app_by_line_path(line_num)

  --local path = Line_str_by_line_num(line_num)
  local path = getline(line_num)

  local path = trim(l:path)
  call Opn_app(l:path)
end

function v.Opn_app_by_slctd_str()
  
  local path = Slctd_str()
  local path = trim(l:path)
  call Opn_app(l:path)
end

function v.Opn_app_buf_file()

  local path = Buf_file_path()
  echo l:path

  call Opn_app(l:path)
end

-- function v.Opn_dir_slf()
function v.Opn_buf_file_dir()

  local dir = Buf_file_dir()
  --echo l:path

  call Opn_app(l:dir)
end

function v.Opn_brwsr()

  local url = 'https://www.google.com/'
  call Opn_app(l:url)
end

function v.Opn_ggl_srch(word)

  local url = 'https://www.google.com/search?q=' . word
  call Opn_app(l:url)
end

function v.Opn_yt(yt_video_id)

  local url = 'https://www.youtube.com/watch?v=' . yt_video_id
  call Opn_app(l:url)
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

  if ! filereadable(l:filename) then
    echo 'file does not exist'
    return
  end

  call Exe('tab drop ' . l:filename)
  call Normal(l:line_num . 'G')
end

function v.Tag_jmp_by_cursor_line()

  local base_buf_num = Buf_num()

  local str = Cursor_line_str()
  call Tag_jmp_by_str(l:str)

  call Exe('sbuffer ' . l:base_buf_num)
  -- call Normal('j')
  call Cursor__mv_d()
end

function v.Tag_jmp_by_slctd_line() -- range

  local base_buf_num = Buf_num()

  for line_num in range(a:firstline, a:lastline)

    local line = getline(l:line_num)
    call Tag_jmp_by_str(l:line)
    call Exe('sbuffer ' . l:base_buf_num)
  endfor
end

-- buf

function v.Buf__quit()

  local cmd = 'bd'
  call Exe(l:cmd)
end

function v.Buf__quit_swtch()

  local win_num = winnr('$')

  if l:win_num > 1 then
    call Win_splt__quit()
  else
    call Buf__quit()
    -- local cmd = 'bd'
    -- call Exe(l:cmd)
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
  call Exe(l:cmd)
end

function v.Win__splt_v()

  local cmd = 'vsplit'
  call Exe(l:cmd)
end

function v.Win_splt_cursor__mv_nxt()

  local n_cmd = "\\<c-w>w"
  call Normal(l:n_cmd)
end

function v.Win_splt__quit()

  local n_cmd = "\\<c-w>c"
  call Normal(l:n_cmd)
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
  
  local rpl_cmd = line_num . 's/' . s:line_end_space_ptn . '//g'
  call Exe(l:rpl_cmd)
end

function v.Line_end__pad_space(line_num, fil_end_col)

  local line_str     = getline(line_num)
  local line_str_len = Str_len(l:line_str)
  local space_len    = fil_end_col - l:line_str_len

  if l:space_len <= 0 then
    return
  end

  local space_str = Str_space(l:space_len)
  local line_str .= l:space_str
  call setline(line_num, l:line_str)
end

let g_dots_str = ' .. '
let g_dots_put_col = 50

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
  
  call Cursor__mv_line_top1()
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

  if ! Is_str__num(col_num) then
    return
  end

  local line_num = Cursor_line_num()

  call Cursor__mv_by_line_col(l:line_num, col_num)
end

function v.Cursor__mv_by_line_num(line_num)

  if ! Is_str__num(line_num) then
    return
  end

  call Normal(line_num . 'G')
end

function v.Cursor__mv_by_line_col(line_num, col)

  local line_num = (line_num == v:null) ? Cursor_line_num() : line_num
  
  call cursor(l:line_num, col)
end

function v.Cursor__mv_by_line_info(line_info)
  
  local line_num = Line_num_by_Line_info(line_info)
  call Cursor__mv_by_line_num(l:line_num)
end

function v.Cursor__mv_by_pos(pos)
  
  call setpos('.', pos)
end

function v.Cursor__mv_line_top0()
  
  if Is_cursor_line_str__emp() then
    return
  end

  call Normal('0')
end

function v.Cursor__mv_line_top1()

  if     Is_cursor_line_str__space() then
    call Cursor__mv_line_end()

  elseif Is_line_markdown_itm() then
    call Normal('^2l')
  else
    call Normal('^')
  end
end

function v.Cursor__mv_line_end()

  if ! Is_cursor_line_str__emp() then
    call Normal('$l')
  end
end

function v.Cursor__mv_char_f()

  call Normal('l')
end

function v.Cursor__mv_char_b()

  call Normal('h')
end

function v.Cursor__mv_word_f()

  if     Is_cursor_col__line_end() || Is_cursor_col__line_end_inr() then

    call Cursor__mv_char_f()
    return

  elseif Is_cursor_line_str_side_r__space() then

    call Cursor__mv_line_end()
    return
  end

  local c_char = Cursor_c_char()
  local r_char = Cursor_r_char()

  if l:c_char =~ ' ' && l:r_char =~ ' ' then
    call Normal('w')
  else
    call Normal('el')
  end
end

function v.Cursor__mv_word_b()
  
  local l_char = Cursor_l_char()

  if     Is_cursor_col__line_top0() then
    call Cursor__mv_u_line_end()
    
  elseif Is_cursor_line_str_side_l__space() then
    call Cursor__mv_line_top0()
    
  elseif Is_cursor_col__line_top1() then
    call Cursor__mv_line_top0()
    
  elseif Is_char__symbol(l:l_char) then
    call Cursor__mv_char_b()
    
  else
    call Normal('b')
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

  if l:c_char =~ ' ' && l:l_char !~ ' ' then
    call Normal('gegel')
  else
    call Normal('gel')
  end
end

function v.Cursor__mv_fnc_name() -- use not

  call Cursor__mv_srch_ptn('(', 'f')
  call Cursor__mv_word_b()
end

function v.Cursor__mv_u() -- alias

  call Normal('k')
end

function v.Cursor__mv_d() -- alias

  call Normal('j')
end

function v.Cursor__mv_v(drct)

  if     drct == 'u' then
    call Cursor__mv_u()

  elseif drct == 'd' then
    call Cursor__mv_d()

  else
    call Cursor__mv_u()
  end
end

let g_cursor_mv_line_step_dflt = 10

function v.Cursor__mv_mlt_u() -- alias

  let g_cursor_mv_line_step = g_cursor_mv_line_step_dflt

  local n_cmd = g_cursor_mv_line_step . "\\<c-y>"
  call Normal(l:n_cmd)
end

function v.Cursor__mv_mlt_d() -- alias

  let g_cursor_mv_line_step = g_cursor_mv_line_step_dflt

  local n_cmd = g_cursor_mv_line_step . "\\<c-e>"
  call Normal(l:n_cmd)
end

function v.Cursor__mv_u_line_end()

  call Cursor__mv_u()
  call Cursor__mv_line_end()
end

function v.Cursor__mv_line_top_or_new_line()

  if     Is_cursor_col__line_top0() then

    call Cursor__ins_line_emp()

  elseif Is_cursor_col__line_top1() then

    call Cursor__mv_line_top0()
  else
    call Cursor__mv_line_top1()
  end
end

function v.Cursor__mv_slctd_edge_tgl() -- range

  call Slct_re()
  call Normal('o')
end

function v.Cursor__mv_slctd_edge_l() -- range

  call Slct_re()

  if ! Is_slctd_cursor_pos__r() then
    return
  end

  call Cursor__mv_slctd_edge_tgl()

  -- local n_cmd = '`<'
  -- call Normal(l:n_cmd)
end

function v.Cursor__mv_file_edge(n_cmd)

  if Is_cursor_line_num__file_edge() then
    call Normal(n_cmd)
  end

  local cnt = 1
  local cnt_max = 10000

  while ( !Is_cursor_line_num__file_edge() && l:cnt < l:cnt_max )

    call Normal(n_cmd)
    local cnt = l:cnt + 1
  endwhile
end

function v.Cursor__mv_file_edge_bgn() -- alias

  call Cursor__mv_file_edge('k')
end

function v.Cursor__mv_file_edge_end() -- alias

  call Cursor__mv_file_edge('j')
end

function v.Cursor__mv_v_jmp_char(drct, is_space_through)

  --local is_space_stop = is_space_stop
  local is_space_through = is_space_through

  if drct == 'k' || drct == 'j' then

    local n_cmd = drct
  else
    return
  end

  call Normal(l:n_cmd)
  local cnt = 1
  local cnt_max = 10000

  while ( !Is_cursor_line_num__file_edge() && l:cnt < l:cnt_max )

    if ! ( Is_cursor_c_char__space() || Is_cursor_col__line_end() ) then
      break
    end

    --if ( l:is_space_stop == 't' && Is_cursor_c_char__space() ) then
    if ( l:is_space_through == 'f' && Is_cursor_c_char__space() ) then
      break
    end

    call Normal(l:n_cmd)
    local cnt = l:cnt + 1
  endwhile
end

function v.Cursor__mv_v_jmp_md_h(drct) -- todo dev

  if drct == 'k' || drct == 'j' then

    local n_cmd = drct
  else
    return
  end

  -- logic write ..

end

function v.Cursor__mv_v_jmp_space(drct)

  if drct == 'k' || drct == 'j' then

    local n_cmd = drct
  else
    return
  end

  call Normal(l:n_cmd)

  local cnt = 1
  local cnt_max = 10000

  while ( !Is_cursor_line_num__file_edge() && l:cnt < l:cnt_max )

    if Is_cursor_c_char__space() || Is_cursor_col__line_end() then
      break
    end

    call Normal(l:n_cmd)
    local cnt = l:cnt + 1
  endwhile
end

function v.Cursor__mv_v_jmp(drct)

  if drct == 'k' || drct == 'j' then

    local n_cmd = drct
  else
    return
  end

  call Normal(l:n_cmd)

  if Is_cursor_c_char__space() || Is_cursor_col__line_end() then

    call Cursor__mv_v_jmp_char(l:n_cmd, 't')
  else
    call Cursor__mv_v_jmp_space(l:n_cmd)
  end
end

function v.Cursor__mv_srch_ptn(ptn, dir) -- range

  local ptn = ptn

  if dir == 'b' then
    local opt_dir = 'b'
  else
    local opt_dir = ''
  end
  local opt = 'W' . l:opt_dir
  -- local opt = 'zW' . l:opt_dir

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

  local cmd = 'i' . str
  call Normal(l:cmd)
  call Cursor__mv_char_f()
end

function v.Cursor__ins_with_cursor_fix(str) -- todo dev

end

-- cursor __ ins ynk ( paste )

function v.Cursor__ins_ynk()

  call Normal('"aP')
end

function v.Cursor__ins_clp()

  call Ynk__clp()
  call Cursor__ins_ynk()
end

function v.Cursor__ins_mlt(str, num)

  if num == 0 then
    return
  end

  local cmd = num.'i'.str
  call Normal(l:cmd)
end

function v.Cursor__ins_cr()

  local t_line_num = line('.')

  call Normal("i\\<cr> ")
  call Normal('x')

  call Line_end_space__del(l:t_line_num)
  call Cursor__mv_d()
end

function v.Cursor__ins_space(is_cursor_mv)

  if is_cursor_mv then
    call Cursor__ins(' ')

  else
    call Normal('i ')
    --"call Normal('l')
  end
end

function v.Cursor__ins_hyphen()

  call Normal('i-')
  --call Cursor__ins('-')
end

function v.Cursor__ins_tilde()

  call Normal('i~')
  --call Cursor__ins('~')
end

function v.Cursor__ins_slash()

  call Normal('i/')
  --call Cursor__ins('/')
end

function v.Cursor__ins_slashback()

  call Normal('i\\')
  --call Cursor__ins('\\')
end

function v.Cursor__ins_quote()

  call Normal("i' '")
  call Normal('h')
end

function v.Cursor__ins_da()

  local da = strftime('%Y-%m-%d')
  call Cursor__ins(l:da)
end

function v.Cursor__ins_tm()

  local tm = strftime('%H:%M')
  call Cursor__ins(l:tm)
end

function v.Cursor__ins_dt()

  local dt = strftime('%Y-%m-%d.%H:%M')
  call Cursor__ins(l:dt)
end

function v.Cursor__ins_ts()

  local ts = strftime('%Y-%m-%d.%H:%M:%S')
  call Cursor__ins(l:ts)
end

let g_week_def = [ 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' ]

function v.Cursor__ins_week()

  local week_num = strftime('%w')
  local week     = g_week_def[l:week_num]
  call Cursor__ins(l:week)
  --call Cursor__ins(' ' . l:week)
end

-- cmnt

function v.Cursor__ins_cmnt_1(cmd_cursor__mv_line_top)

  if cmd_cursor__mv_line_top != v:null then
    call Normal(cmd_cursor__mv_line_top)
  end

  local str = Str_cmnt_1()
  call Normal('i' . l:str)
  
  call Normal('^') -- or '0'
end

function v.V_ins_cmnt_1() -- range

  call Normal(firstline . 'G')
  call Normal('^')
  local col = Cursor_col_num()

  for line_num in range(firstline, lastline)

    call Line_end__pad_space(l:line_num, l:col - 1)

    call Cursor__mv_by_line_col(l:line_num, l:col)

    call Cursor__ins_cmnt_1(v:null)
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
    call Normal('O')
    call Normal('i' . l:str[0])

  elseif pos == 'end' then
    call Normal('o')
    call Normal('i' . l:str[1])
  end
end

function v.Cursor__ins_cmnt_mlt()

  call Cursor__ins_cmnt_mlt_by_pos('bgn')
  call Cursor__ins_cmnt_mlt_by_pos('end')
end

function v.V_ins_cmnt_mlt() -- range

  call Normal(lastline  . 'G')
  call Cursor__ins_cmnt_mlt_by_pos('end')

  call Normal(firstline . 'G')
  call Cursor__ins_cmnt_mlt_by_pos('bgn')
end

-- markdown

function v.Cursor__ins_markdown_h()

  call Cursor__mv_line_top0()
  local top0_char = Cursor_c_char()

  local str = '#'

  if l:top0_char != l:str then
    local str .= ' '
  end

  call Cursor__ins(l:str)

  local ptn = '^#* '
  local col = Str_srch_end(Cursor_line_str(), l:ptn) + 1
  call Cursor__mv_by_line_col(v:null, l:col)
end

function v.Cursor__ins_markdown_cr()

  call Cursor__ins('  ')
end

function v.Cursor__ins_markdown_itm()

  if Is_line_markdown_itm() then
    call Cursor_line_indnt__shft_r()
    return
  end

  local col = Cursor_line_indnt__crct()

  local str = '- '
  --echo l:str
  call Cursor_line_top1__ins(l:str)
end

function v.Cursor__ins_markdown_code()

  local str = '```'
  call Cursor__ins_line(l:str)
end

function v.Char_markdown_chk__tgl()
  
  if Cursor_l_char() != '[' || Cursor_r_char() != ']' then
    return
  end
  
  local cursor_char = Cursor_c_char()
  
  if l:cursor_char == ' ' then
    local rpl_char = 'x'
  else
    local rpl_char = ' '
  end
  
  call Cursor_char__rpl(l:rpl_char)
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

  call Normal('r' . rpl)
end

function v.Cursor_char__rpl_underscore() -- alias

  -- todo, case: line end

  call Cursor_char__rpl('_')
  call Normal('l')
  -- call Cursor__mv_char_forward() -- todo, fnc cre
end

function v.N_char__tgl_swtch01() -- todo fnc name mod

  local c = Cursor_c_char()

  if     Is_char__num(l:c) then

    call Cursor_str__icl()
    return

  elseif Is_char__alpha(l:c) then

    call Normal('v~') -- upper / lower
    return
  end

  local rpl = Is_char__tgl_bracket_trn(l:c)
  if ! Is_str__emp(l:rpl) then
    call Cursor_char__rpl(l:rpl)
    return
  end

  local rpl = Is_char__tgl_symbol(l:c)
  if ! Is_str__emp(l:rpl) then

    call Cursor_char__rpl(l:rpl)
    return
  end
end

function v.N_char__tgl_swtch02()

  local c = Cursor_c_char()

  if Is_char__num(l:c) then

    call Cursor_str__dcl()
    return
  end

  call Cursor_char__tgl_type_shift(l:c)
end

function v.Cursor_char__tgl_type_shift(c)

  local rpl = ''

  if     c == "'" then
    local rpl = '"'
  elseif c == '"' then
    local rpl = '`'
  elseif c == '`' then
    local rpl = "'"

  elseif c == "(" then
    local rpl = '['
  elseif c == "[" then
    local rpl = '{'
  elseif c == "{" then
    local rpl = '<'
  elseif c == "<" then
    local rpl = '('

  elseif c == ")" then
    local rpl = ']'
  elseif c == "]" then
    local rpl = '}'
  elseif c == "}" then
    local rpl = '>'
  elseif c == ">" then
    local rpl = ')'
  end

  if ! Is_str__emp(l:rpl) then

    call Cursor_char__rpl(l:rpl)
    return
  end
end

function v.Cursor_c_char__del()

  local cmd = '"zx'
  call Normal(l:cmd)
end

function v.Cursor_c_char__del_ynk()

  local cmd = '"ax'
  call Normal(l:cmd)
end

-- cursor char cnd

function v.Is_cursor_c_char__ptn(ptn)

  local c = Cursor_c_char()

  if l:c =~ ptn then
    return true
  else
    return false
  end
end

function v.Is_cursor_c_char__space()

  local c = Cursor_c_char()

  if l:c =~ '\\s' then
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
  call Normal(l:n_cmd)
end

function v.Cursor_str__dcl()

  local n_cmd = "\\<c-x>"
  call Normal(l:n_cmd)
end

function v.Cursor_str_week__icl()

  local week_str = Cursor_word()
  local week_idx = index(g_week_def, l:week_str)

  if l:week_idx == -1 then
    return
  end

  local week_nxt_idx = Idx__icl(week_idx, len(g_week_def))
  local week_nxt_str = g_week_def[l:week_nxt_idx]

  call Slctd_str__word()
  call Normal('"zd')
  call Normal('i' . l:week_nxt_str)
end

function v.Cursor_str_week__dcl()

  local week_str = Cursor_word()
  local week_idx = index(g_week_def, l:week_str)

  if l:week_idx == -1 then
    return
  end

  local week_nxt_idx = Idx__dcl(week_idx, len(g_week_def))
  local week_nxt_str = g_week_def[l:week_nxt_idx]

  call Slctd_str__word()
  call Normal('"zd')
  call Normal('i' . l:week_nxt_str)
end

-- cursor etc

function v.Cursor_word()

  local word = expand('<cword>')
  return word
end

function v.Cursor_filepath()

  if     Is_env__('mac') then

    local str = expand('<cfile>')

  elseif Is_env__('win64') then

    local str = Cursor_line_str()

  elseif Is_env__('win32unix') then

    local str = Cursor_line_str()

  else
    local str = Cursor_line_str()
  end
  
  local str = trim(l:str)
  
  return str
end

-- cursor __ ins line

function v.Cursor__ins_line(str)

  local line_num = Cursor_line_num() - 1
  call append(l:line_num, str)
  call Cursor__mv_u()
end

function v.Cursor__ins_line_emp()

  local str = ''
  call Cursor__ins_line(l:str)
end

function v.Cursor__ins_line_buf_file_path()

  local path = Buf_file_path()
  call Cursor__ins_line(l:path)
end

function v.Cursor__ins_line_anchor()

  local str  = Str_cmnt_1()
  local str .= 'dev '
  local str .= 'anchor'
  call Cursor__ins_line(l:str)
  call Cursor_line_indnt__crct()
end

function v.Cursor_d__ins_line(str)

  local line_num = Cursor_line_num()
  call append(l:line_num, str)
end

function v.Cursor_d__ins_line_space() -- range

  local space_len = Cursor_col_num() - 1
  local space_str = Str_space(l:space_len)
  call Cursor_d__ins_line(l:space_str)
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

  call Cursor__mv_line_top0()
  call Cursor__ins(str)
end

function v.Cursor_line_top1__ins(str)

  call Cursor__mv_line_top1()
  call Cursor__ins(str)
end

function v.Cursor_line_end__dots_adjst() -- todo dev, mb_str

  local line_str = Cursor_line_str()
  local idx = Str_srch(l:line_str, escape(g_dots_str, '.'))

  if l:idx >= 0 then
    call Cursor_line_end_dots__crct()
  else
    call Cursor_line_end__ins_dots()
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
    local line_str = l:line_str_0 . l:space_str . l:line_str_1
  else
    local line_str_0 = strcharpart(l:line_str_0, 0, g_dots_put_col)
    local line_str = l:line_str_0 . l:line_str_1
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
    local space_len = 0
  end

  local space_str = Str_space(l:space_len)

  local line_str .= l:space_str . g_dots_str

  call setline(l:line_num, l:line_str)
end

function v.Curosr_line_end__ins(str)

  local n_cmd = 'A' . str
  call Normal(l:n_cmd)
end

-- cursor f

function v.Cursor_f_space__del()

  local c = Cursor_c_char()

  if l:c =~ '\\s' then
    -- echo "del"
    call Slctd_str__cursor_f_space()
    call Normal('"zd')
  else
    call Nothing()
  end
end

-- cursor __ ins line

function v.Cursor_line__del()

  if Is_cursor_line_str__emp() || Is_cursor_line_str__space() then
    call Normal('"_dd') -- rgstr del
  else
    call Normal('"add')
    call Clp__ynk()
  end
end

function v.Cursor_f_str__crct_by_line_u()

  call Cursor_f_str__crct_by_line('u')
end

function v.Cursor_f_str__crct_by_line_d()

  call Cursor_f_str__crct_by_line('d')
end

function v.Cursor_f_str__crct_by_line(target_line_drct)

  local cursor_pos = Cursor_pos()

  local str = Cursor_line_str_side_r_with_c()
  local trim_len = Str_srch(l:str, '[^ ]')
  -- echo l:trim_len
  local str = trim(l:str)

  local cursor_r_char =  Str_l_char(l:str)
  -- echo l:cursor_r_char

  call Cursor__mv_v(target_line_drct)

  local target_line_str = Cursor_line_str_side_r()

  if target_line_drct == 'u' then
    local turn_drct = 'd'
  else
    local turn_drct = 'u'
  end
  call Cursor__mv_v(l:turn_drct)

  local crct_len = Str_srch(l:target_line_str, l:cursor_r_char) + 1
  -- echo l:crct_len
  if l:crct_len == -1 then
    return
  end

  local crct_len = l:crct_len - l:trim_len
  local space_str = Str_space(l:crct_len)
  call Cursor__ins(l:space_str)

  call Cursor__mv_by_pos(l:cursor_pos)
end

function v.Cursor__ins_sys_cmd(sys_cmd) -- read

  local is_line_num_eq_1 = Is_cursor_line_num__file_edge_bgn()

  if l:is_line_num_eq_1 then
    call Normal('O')
  else
    -- call Normal('k')
    call Cursor__mv_u()
  end

  local cmd = 'read ! ' . sys_cmd
  call Exe(l:cmd)

  if l:is_line_num_eq_1 then
    call Line__del_by_line_num(1)
  end
end

-- cursor line str __ end

-- cursor line cnd

function v.Is_cursor_line_num__(line_num)

  local ret = false

  local line_num = Cursor_line_num()

  if l:line_num == line_num then

    local ret = true
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

  if Is_cursor_line_num__file_edge_bgn() || Is_cursor_line_num__file_edge_end() then

    local ret = true
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

    local ret = true
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

  call Normal('0')

  if &expandtab then -- 1:'expandtab', 0:'noexpandtab'
    local char = ' '
    local col = col
  else
    local char = "\\t"
    local col = col / 2
  end
  call Cursor__ins_mlt(l:char, l:col)

  call Cursor__mv_line_top1()
end

function v.Cursor_line_indnt__del() -- alias

  call Exe('left')
end

function v.Cursor_line_indnt__shft_l()

  call Normal('<<')
  call Cursor__mv_line_top1()
end

function v.Cursor_line_indnt__shft_r()

  local col = 2

  call Cursor_line_indnt__add(l:col)
end

function v.Cursor_line_indnt__crct()

  local col = Cursor_line_indnt__crct_with_c()
  return col
end

function v.Cursor_line_indnt__crct_with_c()

  call Cursor_line_indnt__del()

  local col = Cursor_line_indnt_col_with_c()
  --echo l:col

  call Cursor_line_indnt__add(l:col)
  return col
end

let g_v_rng = "'<,'>"

-- 
-- slctd
-- 

-- slctd __ ( slct )

function v.Slctd__cancel() -- range -- alias

  call Esc()
end

-- refactoring slct > slctd __ xxx

function v.Slct_re() -- range

  if mode() == "\\<c-v>" || mode() == "v" then
    return
  end

  call Normal('gv')
end

function v.Slctd_str__all()

  call Normal('ggVG')
end

function v.Slctd_str__word()

  local c = Cursor_c_char()

  if     l:c =~ '\\w' then
    call Normal('viw')

  elseif l:c =~ '\\s' then
    call Slctd_str__cursor_f_space()
  else
    call Normal('v')
  end
end

function v.Slctd__word_by_under_score()

end

function v.Slctd_str__cursor_f_space()

  local c = Cursor_c_char()

  if l:c !~ '\\s' then
    return
  end
  --echo l:c

  if Is_cursor_line_str_side_r__space() then

    call Normal('v')
    call Normal('$h')
    --call Cursor__mv_word_f()
    --call Normal('h')

  else
    call Normal('vwh')
  end
end

function v.Slctd_str__by_col_len(s_col, len)

  local e_col = len - 1

  call Slct_by_line_col(v:null, s_col, v:null, e_col)
end

-- refactoring slct > slctd __ xxx

function v.Slct_by_pos(s_pos, e_pos) -- use not

  call Cursor__mv_by_pos(s_pos)
  call Normal('v')
  call Cursor__mv_by_pos(e_pos)
end

-- refactoring slct > slctd __ xxx

function v.Slct_by_line_col(s_line, s_col, e_line, e_col)

  local s_line = (s_line == v:null) ? Cursor_line_num() : s_line
  local e_line = (e_line == v:null) ? Cursor_line_num() : e_line

  call Cursor__mv_by_line_col(l:s_line, s_col)
  call Normal('v')
  call Cursor__mv_by_line_col(l:e_line, e_col)
end

-- refactoring slct > slctd __ xxx

function v.Slct_by_line_rng(line_num_fr, line_num_to)
  
  call Cursor__mv_by_line_num(line_num_fr)
  call Normal('V')
  call Cursor__mv_by_line_num(line_num_to)
end

-- slctd cursor __ mv

function v.Slctd_cursor__mv_slctd_edge_r() -- range
  
  call Slct_re()

  if   Is_slctd_cursor_pos__r() then
    return
  end

  call Cursor__mv_slctd_edge_tgl()

  -- local n_cmd = '`>'
  -- call Normal(l:n_cmd)
end

function v.Slctd_cursor_drct__mv_forward() -- range

  call Slct_re()

  if Is_slctd_cursor_pos__r() then
    return
  end

  call Cursor__mv_slctd_edge_tgl()
end

function v.Slctd_cursor__mv_file_edge(n_cmd)

  call Slct_re()

  call Cursor__mv_file_edge(n_cmd)
end

function v.Slctd_cursor__mv_v_jmp(drct) -- range

  call Slct_re()
  call Cursor__mv_v_jmp(drct)
end

function v.Slctd_cursor__mv_line_end() -- range

  call Slct_re()

  if     Is_slctd_mode__box() then

    if Is_cursor_col__line_end_ovr() then
      return
    end

    call Normal('$h')
    --call Normal('g_')

  elseif Is_slctd_mode__line() then

    if Is_cursor_line_str__emp() then
      return
    end

    call Normal('$h')
    --call Normal('g_')
  else
    echo "v mode else"
  end
end

-- slctd cursor cnd

function v.Is_slctd_cursor_pos__r() -- range

  local ret = false

  call Slct_re()

  local cursor_pos1 = Cursor_pos()
  -- echo l:cursor_pos1

  call Cursor__mv_slctd_edge_tgl()
  local cursor_pos2 = Cursor_pos()
  -- echo l:cursor_pos2

  call Cursor__mv_slctd_edge_tgl()


  if     l:cursor_pos1[1] >  l:cursor_pos2[1] then -- line
    local ret = true

  elseif l:cursor_pos1[1] == l:cursor_pos2[1] then -- line

    if   l:cursor_pos1[2] >= l:cursor_pos2[2] then -- col
      local ret = true
    end
  end

  -- echo l:ret
  return ret
end

-- slctd str

function v.Slctd_str() -- range

  -- call Normal('gv"zy')

  call Slct_re()
  call Normal('"zy')

  call Slct_re()

  return @z
end

function v.Slctd_str_len() -- range

  call Slct_re()

  local slctd_str = Slctd_str()
  local len       = Str_len(l:slctd_str)
  return len
end

function v.Slctd_str_7_opn_ggl_srch()

  local word = Slctd_str()
  local word = trim(l:word)
  call Opn_ggl_srch(l:word)
end

function v.Slctd_str_7_opn_yt()
  
  local yt_video_id = Slctd_str()
  local yt_video_id = trim(l:yt_video_id)
  call Opn_yt(l:yt_video_id)
end

-- slctd str __ ( expnd )

function v.Slctd_str__expnd() -- expnd lr, cre re

end

function v.Slctd_str__expnd_srch() -- range -- todo dev

  call Slct_re()
  call Cursor__mv_srch("f")
end

function v.Slctd_str__expnd_word_f() -- range

  local slctd_str = Slctd_str()
  local slctd_r_out_char = Slctd_str_edge_r_out_char()

  call Slct_re()

  if     Is_cursor_line_str_side_r__space() then

    call Normal('$h')

  elseif l:slctd_str =~ '\\s' && l:slctd_r_out_char =~ '\\s' then

    call Normal('wh')
  else
    call Normal('e')
  end
end

-- slctd __ expnd quote

let g_quote_ptn = '[' . "'" . '"' . '`' . ']'

function v.Slctd_str__expnd_quote_on_f() -- range

  call Slct_re()
  call Cursor__mv_srch_ptn(g_quote_ptn, 'f')
end

function v.Slctd_str__expnd_quote_on_b() -- range

  call Slct_re()

  call Cursor__mv_slctd_edge_tgl()
  call Cursor__mv_srch_ptn(g_quote_ptn, 'b')
  -- call Cursor__mv_slctd_edge_tgl ()
end

function v.Slctd_str__expnd_quote_on_swtch() -- range

  -- Is_cursor_line_str__ptn() -- todo dev ?

  call Slct_re()

  local c = Cursor_c_char()

  if l:c !~ g_quote_ptn then
    call Slctd_str__expnd_quote_on_f()
  else
    call Slctd_str__expnd_quote_on_b()
  end
end

function v.Slctd_str__expnd_quote_on() -- range

  call Slct_re()

  call Slctd_str__expnd_quote_on_f()
  call Slctd_str__expnd_quote_on_b()
end

function v.Slctd_str__expnd_quote_in_f() -- range

  call Slctd_str__expnd_quote_on_f()
  call Normal('h')
end

function v.Slctd_str__expnd_quote_in_b() -- range

  call Slctd_str__expnd_quote_on_b()
  call Normal('l')
  -- call Cursor__mv_slctd_edge_tgl()
end

function v.Slctd_str__expnd_quote_in_swtch() -- range

  call Slct_re()

  if ! Is_cursor_line_str__ptn(g_quote_ptn) then
    return
  end

  local c_r = Slctd_str_edge_r_out_char()

  if l:c_r !~ g_quote_ptn then

    call Slctd_str__expnd_quote_in_f()
  else
    call Slctd_str__expnd_quote_in_b()
  end
end

function v.Slctd_str__expnd_quote_swtch() -- range

  call Slct_re()

  if Is_slctd_str_edge_char__quote() then
    -- call Esc()
    return
  end

  if Is_slctd_str_edge_out_char__quote() then

    call Slctd_str__expnd_quote_on()
  else
    call Slctd_str__expnd_quote_in_swtch()
  end
end

function v.Slctd_str__expnd_bracket_f() -- range -- todo dev

  local bracket_ptn = '[' . "'" . '"`)}\\]' . ']'
  
  local s_col = Slctd_str_edge_l_col()
  
  local line_str_r = Slctd_str_edge_r_out_str()
  local srch_idx = Str_srch(l:line_str_r, l:bracket_ptn, 1)

  if l:srch_idx == -1 then

    call Normal('gv')
    return
  end

  local len = l:s_col + Slctd_str_len() + l:srch_idx
  call Slctd_str__by_col_len(l:s_col, l:len)
end

function v.Slctd_str__reduce_dlm_l(char) -- range

  local char = char

  call Slct_re()

  local slctd_str = Slctd_str()
  local srch_idx = Str_srch(l:slctd_str, l:char)
  if l:srch_idx == -1 then
    call Slctd__cancel()
    return
  end

  local n_cmd = 'F' . l:char . 'h'
  call Normal(l:n_cmd)
end

-- slctd str __ ( edit )

function v.Slctd_str__ynk() -- range

  call Slct_re()
  call Normal('"zd')
  call Cursor__ins_ynk()
end

function v.Slctd_str__clp() -- range

  call Ynk__clp()
  call Slctd_str__ynk()
end

-- slctd str __ rpl

function v.Slctd_str__rpl(srch, rpl) -- range

  call Slctd_box__rpl(srch, rpl)
end

-- slctd str __ ( rpl )

function v.Slctd_str__(str) -- range -- todo dev

end

-- slctd str __ rpl, srch nxt slctd

function v.Slctd__rpl_7_srch_nxt() -- dir forward only

  call Slct_re()
  call Normal('"zd"aPlgn')
end

-- slctd str __ del

function v.V_slctd__del() -- dev doing, can

  call Slct_re()

  call Normal('"ad')
  let @+ = @a
end

function v.Slctd__del() -- range

  call Slct_re()

  local rgstr = 'z'

  local cmd = '"' . l:rgstr . 'dgv'
  call Normal(l:cmd)
end

-- slctd str __ pad

function v.Slctd__pad(char) -- range

  local char = char

  if l:char == '|' then
    local char = "\\<bar>"
  end

  call Slct_re()

  call Normal('r' . l:char)

  call Slct_re()
end

function v.Slctd__pad_space() -- range

  call Slctd__pad(' ')
end

function v.Slctd__pad_bar() -- range

  call Slctd__pad('|')
end

function v.Slctd_str_space__underscore() -- range

  call Slctd_str__rpl(' ', '_')
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

  if Slctd_str() =~ '\\n' then
    return true
  else
    return false
  end
end

-- slctd str edge

function v.Slctd_str_edge_l_col()

  call Cursor__mv_slctd_edge_l()
  
  local col = Cursor_col_num()
  return col
end

function v.Slctd_str_edge_r_col()

  call Slctd_cursor__mv_slctd_edge_r()
  
  local col = Cursor_col_num()
  return col
end

function v.Slctd_str_edge_l_pos()

  call Cursor__mv_slctd_edge_l()
  local pos = Cursor_pos()
  return pos
end

function v.Slctd_str_edge_r_pos()

  call Slctd_cursor__mv_slctd_edge_r()
  local pos = Cursor_pos()
  return pos
end

function v.Slctd_str_edge_l_char()

  call Cursor__mv_slctd_edge_l()

  local c_char = Cursor_c_char()
  return c_char
end

function v.Slctd_str_edge_r_char()

  call Slctd_cursor__mv_slctd_edge_r()

  local c_char = Cursor_c_char()
  return c_char
end

function v.Slctd_str_edge_l_out_char()

  call Cursor__mv_slctd_edge_l()

  local l_char = Cursor_l_char()
  return l_char
end

function v.Slctd_str_edge_r_out_char()

  call Slctd_cursor__mv_slctd_edge_r()

  local r_char = Cursor_r_char()
  return r_char
end

function v.Slctd_str_edge_l_out_str()

  call Cursor__mv_slctd_edge_l()

  local str = Cursor_line_str_side_l()
  return str
end

function v.Slctd_str_edge_r_out_str()

  call Slctd_cursor__mv_slctd_edge_r()

  local str = Cursor_line_str_side_r()
  return str
end

-- slctd str edge __ ( edit )

function v.Slctd_str_edge_out__ins(c) -- range

  call Slct_re()

  if firstline != lastline then
    call Slctd__cancel()
    return
  end

  local c_l = c

  local c_r = c
  if     c == '(' then
    local c_r = ')'
  elseif c == '{' then
    local c_r = '}'
  elseif c == '[' then
    local c_r = ']'
  elseif c == '<' then
    local c_r = '>'
  end

  call Normal('"zx')
  call Cursor__ins(l:c_l . l:c_r)

  local str_len = Str_len(l:c_l)
  call Normal(l:str_len . 'h')

  call Normal('"zP')
  call Normal('gv')

  local cnt = 0
  while l:cnt < l:str_len
    call Slctd_box__mv('r')

    local cnt += 1
  endwhile
end

function v.Slctd_str_edge_out__ins_markdown_strikethrough()

  call Slct_re()

  if firstline != lastline then
    call Slctd__cancel()
    return
  end

  call Slctd_str_edge_out__ins('~~')
end

function v.Slctd_str_edge_out__ins_markdown_bold()

  call Slctd_str_edge_out__ins('**')
end

function v.Slctd_str_edge_out_char__tgl() -- range

  call Slctd_str_edge_out_char__tgl_swtch()
end

function v.Slctd_str_edge_out_char__tgl_swtch() -- range

  -- char chk
  local c_l = Slctd_str_edge_l_out_char()
  local c_r = Slctd_str_edge_r_out_char()
  -- echo l:c_l l:c_r

  if     l:c_l == "'" && l:c_l == l:c_r then
    call Slctd_str_edge_out_quote__tgl()
  elseif l:c_l == '"' && l:c_l == l:c_r then
    call Slctd_str_edge_out_quote__tgl()
  elseif l:c_l == '`' && l:c_l == l:c_r then
    call Slctd_str_edge_out_quote__tgl()

  elseif l:c_l == '(' && l:c_r == ')' then
    call Slctd_str_edge_out_bracket__tgl()
  elseif l:c_l == '{' && l:c_r == '}' then
    call Slctd_str_edge_out_bracket__tgl()
  elseif l:c_l == '[' && l:c_r == ']' then
    call Slctd_str_edge_out_bracket__tgl()
  elseif l:c_l == '<' && l:c_r == '>' then
    call Slctd_str_edge_out_bracket__tgl()

  else
    call Slctd_str_edge_out_quote__tgl()
  end
end

function v.Slctd_str_edge_out_quote__tgl() -- range

  call Slct_re()

  if firstline != lastline then
    return
  end

  if Is_cursor_col__line_end() then
    return
  end

  -- char chk
  local c_l = Slctd_str_edge_l_out_char()
  local c_r = Slctd_str_edge_r_out_char()
  -- echo l:c_l l:c_r

  if     l:c_l == "'" && l:c_l == l:c_r then

    call Slctd_str_edge_out_char__del()
    local c = '"'
    call Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '"' && l:c_l == l:c_r then

    call Slctd_str_edge_out_char__del()
    local c = '`'
    call Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '`' && l:c_l == l:c_r then

    call Slctd_str_edge_out_char__del()
  else
    local c = "'"
    call Slctd_str_edge_out__ins(l:c)
  end
end

function v.Slctd_str_edge_out_bracket__tgl() -- range

  call Slct_re()

  if firstline != lastline then
    return
  end

  if Is_cursor_col__line_end() then
    return
  end

  -- char chk
  local c_l = Slctd_str_edge_l_out_char()
  local c_r = Slctd_str_edge_r_out_char()
  -- echo l:c_l l:c_r

  if     l:c_l == '(' && l:c_r == ')' then

    call Slctd_str_edge_out_char__del()
    local c = '{'
    call Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '{' && l:c_r == '}' then

    call Slctd_str_edge_out_char__del()
    local c = '['
    call Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '[' && l:c_r == ']' then

    call Slctd_str_edge_out_char__del()
    local c = '<'
    call Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '<' && l:c_r == '>' then

    call Slctd_str_edge_out_char__del()
  else
    local c = '('
    call Slctd_str_edge_out__ins(l:c)
  end
end

function v.Slctd_str_edge_out__tgl_shft() -- range

  call Slct_re()

  if firstline != lastline then
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
    call Slctd_str_edge_out_char__del()
    call Slctd_str_edge_out_bracket__tgl()

  elseif Is_char_pair__bracket(l:c_l, l:c_r) then
    call Slctd_str_edge_out_char__del()
    call Slctd_str_edge_out_quote__tgl()

  else
    call Slctd_str_edge_out_bracket__tgl()
  end
end

function v.Slctd_str_edge_out_char__del() -- range

  call Slct_re()

  if Is_slctd_str_edge_l_col__line_top() then
    return
  end

  call Normal('"zx')
  call Normal('xhx')
  call Normal('"zP')
  call Normal('gv')
  call Slctd_box__mv('l')
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

  call Slct_re()

  call Cursor__mv_slctd_edge_tgl()
  local cursor_l_pos = Cursor_pos()
  -- echo l:cursor_l_pos

  call Cursor__mv_slctd_edge_tgl()

  if l:cursor_l_pos[2] == 1 then -- col
    local ret = true
  end

  return ret
end

-- slctd line

function v.Slctd_line_7_opn_app() -- range

  for line_num in range(firstline, lastline)

    call Opn_app_by_line_path(l:line_num)
  endfor
end

-- slctd line __ ( edit )

function v.Slctd_line__del() -- use not, todo dev

  call Normal('gvj')
  --call Normal('"ad')

  call Clp__ynk()
end

-- todo refactoring, fnc name mod, v > slctd

-- slctd line __ rpl

function v.Slctd_line__rpl(srch, rpl) -- range

  local cmd = g_v_rng . 's/' . srch . '/' . rpl . '/g'
  --echo l:cmd
  call Exe(l:cmd)
end

function v.Slctd_line__rpl_by_line1_line2() -- range

  local srch = getline(1)
  local rpl  = getline(2)

  --local rng = '3,$'
  local rng = g_v_rng
  local cmd = l:rng . 's/' . l:srch . '/' . l:rpl . '/g'
  --echo l:cmd
  call Exe(l:cmd)
end

function v.Slctd_line__rpl_sys_cmd(sys_cmd) -- range -- read

  local cmd = "'<,'>" . " ! " . sys_cmd
  call Exe(l:cmd)
end

function v.Slctd_line_srch_str__rpl_cr() -- range

  local srch = @/

  local cmd = g_v_rng . 's/\\(' . l:srch . '\\)/\\1\\r/g'
  call Exe(l:cmd)
end

function v.Slctd_line__markdown_strikethrough() -- range -- todo dev

end

function v.Slctd__sys_cmd(sys_cmd) -- range

  local cmd = g_v_rng . '! ' . sys_cmd
  call Exe(l:cmd)
end

function v.Slctd_line_top_space__del() -- refactoring ?

  local rpl_cmd = 's/' . s:line_top_space_ptn . '//g'
  call Exe(l:rpl_cmd)
end

function v.Slctd_line_end_space__del() -- range

  for line_num in range(firstline, lastline)

    call Line_end_space__del(l:line_num)
  endfor
end

function v.Slctd_line_end__pad_space() -- range -- use not

  -- use recommend "aygvr gv

  call Slct_re()
  call Normal('o')

  local fil_end_col = Cursor_col_num() - 1

  for line_num in range(firstline, lastline)

    call Line_end__pad_space(l:line_num, l:fil_end_col)
  endfor
end

function v.Slctd_line__join_per_line(per_line_num) -- range

  local n_cmd = per_line_num . 'Jj'

  local line_num = lastline - firstline + 1

  local exe_num = l:line_num / per_line_num
  --echo l:exe_num

  for idx in range(1, l:exe_num)

    call Normal(l:n_cmd)
  endfor
end

function v.Slctd_line_indnt__space(indnt_col) -- range

  if Is_env__('win64') then
    '<,'>:call Slctd_line_tab__rpl_space(indnt_col)

  else
    local sys_cmd = '  expand   -t ' . indnt_col
    '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
  end
end

function v.Slctd_line_indnt__tab(indnt_col) -- range

  if Is_env__('win64') then
    call Nothing()
  else
    local sys_cmd = 'unexpand   -t ' . indnt_col
    '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
  end
end

-- slctd line tab

function v.Slctd_line_tab__rpl_space(space_col) -- range

  local space_str = Str_space(space_col)
  local cmd = g_v_rng . 's/\\t/' . l:space_str . '/g'
  call Exe(l:cmd)
end

-- slctd line indnt __ shft

function v.Slctd_indnt__shft_l() -- todo

end

function v.Slctd_indnt__shft_r() -- todo

end

-- slctd line __ crct tbl

function v.Slctd_line__crct_tbl() -- range

  if     Is_env__('linux') then
    local sys_cmd = '/usr/bin/column -t'
  elseif Is_env__('mac') then
    local sys_cmd = 'column -t'
  else
    local sys_cmd = 'column -t'
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

  call Slct_re()

  local n_cmd = Char_lr_2_normal_cmd(lr)
  call Normal('o' . l:n_cmd)
  call Normal('o' . l:n_cmd)
end

function v.Slctd_box_width__1() -- range

  call Slct_re()

  if ! Is_slctd_mode__box() then
    return
  end

  call Normal('o')
  local col_num = Cursor_col_num()

  call Normal('o')
  call Cursor__mv_by_col_num(l:col_num)
end

function v.Slctd_box_str__mv(lr) -- range

  local n_cmd = Char_lr_2_normal_cmd(lr)

  call Slct_re()
  call Normal('"zx')
  call Normal(l:n_cmd)
  call Normal('"zP')

  call Slct_re()
  call Slctd_box__mv(lr)
end

-- slctd box __ ( edit )

function v.Slctd_box_edge_l__ynk_line_1() -- range

  if @a =~ '\\n' then
    echo 'yank is include cr'
    return
  end

  call Slct_re()

  if Is_cursor_col__line_end() then
    call Slctd__pad_space()

    call Slctd__del()
    -- call Normal('"zdgv') -- see
  end

  call Cursor__mv_slctd_edge_l()
  call Esc()
  -- call Normal("\\<esc>")

  -- local col_num = Cursor_col_num()

  for line_num in range(firstline, lastline)

    local col_num = Cursor_col_num()

    call Cursor__ins_ynk()

    call Cursor__mv_by_line_col(l:line_num, l:col_num)
    call Cursor__mv_d()
    -- if l:line_num != lastline then
    --   call Normal('j')
    -- end
  endfor
end

-- slctd box __ rpl

function v.Slctd_box__rpl(srch, rpl) -- range

  local srch = srch
  local rpl  = rpl

  local cmd = g_v_rng . 's/' . '\\%V' . l:srch . '/' . l:rpl . '/g'
  call Exe(l:cmd)
end

-- slctd box space __ del

function v.Slctd_box_space__del() -- range

  local srch = ' '
  local rpl  = ''

  '<,'>:call Slctd_str__rpl(srch, rpl)
end

-- slctd box char __ shft

function v.Slctd_box_edge_r_char__shft_in() -- range

  local cmd = g_v_rng . 's/' . '\\%V\\([ ]\\+\\)\\([^ ]\\)' . '/' . '\\2\\1' . '/g'
  call Exe(l:cmd)

  call Slct_re()
end

function v.Slctd_box_cursor_r_space__crct() -- range

  call Slct_re()
  local col = Cursor_col_num()
  -- echo l:col
  call Slctd__cancel()

  -- echo firstline . ' ' . lastline
  call Cursor__mv_by_line_col(firstline, l:col)

  for line_num in range(firstline, lastline)
    -- echo l:line_num . ' ' . l:col
    -- call Cursor__mv_by_line_col(l:line_num, l:col)

    call Cursor_f_space__del()
    -- call Normal('j')
    call Cursor__mv_d()
  endfor
end

function v.Is_slctd_mode__box() -- range

  -- call Slct_re()

  local ret = false

  if mode() == "\\<c-v>" then
    -- echo "c-v"
    local ret = true
  end
  return ret
end

function v.Is_slctd_mode__line() -- range

  -- call Slct_re()

  local ret = false

  if mode() == "v" then
    -- echo "v"
    local ret = true
  end
  return ret
end

-- slctd etc

function v.Slctd_srch__swtch() -- srch, set or run

  if Is_slctd_str__line_mlt() then

    call Slctd_str__expnd_srch()
  else
    call Srch_str__slctd_str()
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

  call Normal('"ayy')
  --l:line_str = Cursor_line_str()
  --let @a = l:line_str

  call Clp__ynk()
end

function v.Ynk__line_all()

  local cmd = '%y' -- todo rgstr a direct
  call Exe(l:cmd)

  let @a = @0
  call Clp__ynk()
end

function v.Ynk__buf_file_path()
  
  local path = Buf_file_path()

  let @a = l:path
  call Clp__ynk()
end

function v.Ynk__clp()

  let @a = @+
end

function v.Ynk__slctd()

  let @e = @d
  let @d = @c
  let @c = @b
  let @b = @a

  call Normal('gv"ay')
  call Clp__ynk()
end

function v.Ynk__add_slctd()

  call Normal('gv"Ay')
  call Clp__ynk()
end

function v.Ynk__by_rgstr_info(rgstr_info)
  
  local rgstr = Rgstr_info_rgstr(rgstr_info)
  local scrpt = 'let @a = @' . l:rgstr
  execute(l:scrpt)
end

-- clp

function v.Clp__ynk()

  if Is_env__('linux') then

    --call C9clp__ynk() -- off

  else
    let @+ = @a
  end
end

-- 
-- srch
-- 

-- srch exe, ref: cursor __ mv srch ptn

function v.Srch_or(...)

  local str = '\\(' . join(000, '\\|') . '\\)'
  --echo l:str

  let @/ = l:str
  call Cursor__mv_srch('f')
end

function v.Srch_str()

  local str = @/
  return str
end

function v.Srch_str_flt()

  local str = @/

  if Is_srch__word1() then
    local str = strcharpart(l:str, 2, strchars(l:str) - 4)
  end
  -- echo l:str

  return str
end

function v.Srch_str_word1(str)

  if str == v:null then
    local str = Srch_str_flt()
  else
    local str = str
  end

  local str = '\\<' . l:str . '\\>'
  return str
end

-- srch str __

function v.Srch_str__(str, op_word1)

  local exe_str = str

  local exe_str = escape(l:exe_str, '.*~[]\\^$')

  local exe_str = substitute(l:exe_str, '\\n', '\\\\n', 'g')
  -- echo l:exe_str

  if op_word1 == true then
    local exe_str = Srch_str_word1(l:exe_str)
  end

  if "@/" == "l:exe_str" then -- same ltst 01
    return
  end

  let @/ = l:exe_str -- highlight
  call Normal('/' . l:exe_str) -- srch hstry add
end

function v.Srch_str__cursor_word()

  local str = Cursor_word()
  call Srch_str__(l:str, false)
end

function v.Srch_str__word1_tgl()

  local str = Srch_str_flt()

  if Is_srch__word1() then

    call Srch_str__(l:str, false)
  else
    call Srch_str__(l:str, true)
  end
end

function v.Srch_str_ltst(idx)

  local str = histget('/', - idx)
  return str
end

function v.Srch_str__prv_tgl()

  if @/ == Srch_str_ltst(1) then

    if            Srch_str_ltst(1)        == '\\<' . Srch_str_ltst(2) . '\\>' then
      local srch_str = Srch_str_ltst(3)

    elseif '\\<' . Srch_str_ltst(1) . '\\>' ==        Srch_str_ltst(2) then

      local srch_str = Srch_str_ltst(3)
    else
      local srch_str = Srch_str_ltst(2)
    end
  else
    local srch_str = Srch_str_ltst(1)
  end

  let @/ = l:srch_str
end

function v.Srch_str__slctd_str() -- range

  if Is_slctd_str__srch_str() then
    call Slctd__cancel()
    return
  end

  call Slct_re()

  local str = Slctd_str()
  call Srch_str__(l:str, false)
  call Slctd__cancel()
end

function v.Srch_slct(drct)

  if     drct == 'f' then
    call Normal('gn')

  elseif drct == 'b' then
    call Normal('gN')
  end
end

-- dev anchor refactoring fnc name re ?
function v.Slctd_srch_7_slctd__srch_nxt(drct) -- srch rpl skip

  if     drct == 'f' then
    call Normal('`>lgn')

  elseif drct == 'b' then
    call Normal('`<hgN')
  end
end

function v.Srch_7_cursor__mv_srch_str_end_o()

  local drct = 'f'
  call Srch_slct(l:drct)
  call Esc()
  -- call Normal("\\<esc>")
  call Esc()
  call Cursor__mv_char_f()
end

function v.Srch_char(drct, char)

  let @/ = '[' . char . ']'
  call Cursor__mv_srch(drct)
end

function v.Srch_char_bracket(drct)

  local char_bracket = "'" . '")}\\]'
  call Srch_char(drct, l:char_bracket)
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

  if l:str_l == '\\<' && l:str_r == '\\>' then
    local ret = true
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

  local ptn   = ( a:0 >= 1 ) ? a:1 : ''
  -- local ptn   = ( a:0 >= 1 ) ? a:1 : g_rg_some_line_ptn
  
  local ext   = ( a:0 >= 2 ) ? a:2 : v:null
  local word1 = ( a:0 >= 3 ) ? a:3 : false

  call Fzf_rg_with_grep(l:ptn, l:ext, l:word1)
end

function v.Fzf_rg_with_grep(...)

  if ! ( Is_env__('mac') || Is_env__('linux') || Is_env__('win64') ) then
    return
  end

  local ptn   = ( a:0 >= 1 ) ? a:1 : ''
  -- local ptn   = ( a:0 >= 1 ) ? a:1 : g_rg_some_line_ptn

  local ext   = ( a:0 >= 2 ) ? a:2 : v:null
  local word1 = ( a:0 >= 3 ) ? a:3 : false

  local rg_cmd = Rg_cmd(l:ptn, l:ext, l:word1, v:null)
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
  call Fzf_rg(v:null, l:ext)
end

-- rg word1
function v.Fzf_rg_word1(ptn)

  call Fzf_rg(ptn, v:null, true)
end

-- fzf rg by run

let g_fzf_line_cnt_max = 30000

function v.Fzf_rg_with_run(...)

  local ptn = ( a:0 >= 1 ) ? a:1 : v:null

  if l:ptn == v:null then

    local rg_rslt_cnt = Rg_all_cnt()

    if l:rg_rslt_cnt > g_fzf_line_cnt_max then
      echo "l:rg_rslt_cnt, end"
      return
    end

    local fzf_src_ar = Rg_all_rslt_ar()

  else
    local rg_rslt_cnt = Rg_ptn_cnt(l:ptn, v:null)

    if l:rg_rslt_cnt > g_fzf_line_cnt_max then
      echo "l:rg_rslt_cnt, end"
      return
    end

    local fzf_src_ar = Rg_ptn_rslt_ar(l:ptn, v:null)
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

  local src_txt  = ( a:0 >= 1 ) ? a:1 : v:null
  local fnc_name = ( a:0 >= 2 ) ? a:2 : v:null

  local src_ar = Txt_to_ar(l:src_txt)

  call Fzf_by_ar(l:src_ar, fnc_name)
end

function v.Fzf_by_ar(...)

  local src_ar   = ( a:0 >= 1 ) ? a:1 : v:null
  local fnc_name = ( a:0 >= 2 ) ? a:2 : v:null

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

  local file_path = ( a:0 >= 1 ) ? a:1 : 'doc/memo.md'

  local fzf_src_txt = File_txt(l:file_path)
  local fnc_name    = 'Tag_jmp_by_str'
  call Fzf_by_txt(fzf_src_txt, fnc_name)
end

-- fzf buf

function v.N_fzf_buf()
  
  exe 'FzfBufCrnt '
end

function v.V_fzf_buf()

  call Srch_str__slctd_str()
  exe 'FzfBufCrnt ' . escape(@z, '.*~')
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
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
end

-- fzf dir

function v.Fzf_dir()

  local sys_cmd = 'fd --type d'
  local fzf_src_txt  = Sys_cmd(l:sys_cmd)

  local fnc_name = 'Dir__'
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
end

function v.Fzf_dir_jmp()

  local sys_cmd = 'dir_jmp_lst_with_z'
  -- local sys_cmd = 'dir_jmp_lst_with_zoxide'

  local fzf_src_txt  = Sys_cmd(l:sys_cmd)

  local fnc_name = 'Dir__'
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
end

function v.Fzf_doc_memo_opn()

  local dir = '~'

  local memo_file_list = [
    l:dir . '/wrk/prj-pri/dotfiles/doc/memo.md',
    l:dir . '/wrk/prj-pri/doc-tech-ds/doc/memo.md',
    l:dir . '/wrk/prj-pri/life/doc/memo.md',
    l:dir . '/wrk/prj-pri/wall-paper/doc/memo.md'
  ]

  local fzf_src_ar = l:memo_file_list
  local fnc_name    = 'Opn'
  call Fzf_by_ar(l:fzf_src_ar, l:fnc_name)
end

function v.Fzf_vim_fnc_call()

  local rg_ptn = '^function v.[\\w]+\\(.*\\)'

  local sys_cmd_rg = "rg " . "-No '" . l:rg_ptn . "' " . g_vimrc_file_path

  local sys_cmd_sed = 'sed "s/function v.//g"'

  local sys_cmd = l:sys_cmd_rg . ' | ' . l:sys_cmd_sed
  local fzf_src_txt  = Sys_cmd(l:sys_cmd)

  local fnc_name = 'Cmdline__'

  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
end

let g_doc_tech_dir_rel = 'wrk/prj-pri/doc-tech-ds/docs/md'

function v.Fzf_doc_tech()

  local ptn = g_rg_emp_line_ptn
  local opt  = ' -v'
  local opt .= ' --no-heading'
  -- local opt .= ' --line-number'
  local sys_cmd_rg = "rg" . l:opt . " '" . l:ptn . "' ~/" . g_doc_tech_dir_rel
  -- echo l:sys_cmd

  local sys_cmd_sed = 'sed "s|^.*' . g_doc_tech_dir_rel . '/||g"'

  local sys_cmd = l:sys_cmd_rg . ' | ' . l:sys_cmd_sed

  local fzf_src_txt = Sys_cmd(l:sys_cmd)

  local fnc_name = 'Doc_tech_tag_jmp'
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
end

function v.Doc_tech_tag_jmp(str)

  local str = $HOME . '/' . g_doc_tech_dir_rel . '/' . str
  -- echo l:str
  call Tag_jmp_by_str(l:str)
end

-- rg

function v.Rg_rslt_line_parse(line)

  local dlm = ':'
  local ret = split(line, l:dlm)
  --echo l:ret

  local idx = 0
  while l:idx < len(l:ret)

    local ret[l:idx] = trim(l:ret[l:idx])

    local idx = l:idx + 1
  endwhile

  if ( len(l:ret) > 1 ) && ( ! Is_char__num(l:ret[1]) ) then
    local ret[1] = '1'
  end

  return ret
end

let g_fzf_rg_opt = ''
     . ' --color=always'
     . ' --line-number'
     . ' --smart-case'
     . ' --no-multiline'
     . ' --no-heading'
     . ' --hidden'

function v.Rg_cmd(ptn, ext, word1, opt)

  if ptn == v:null then
    local ptn = ''
  else
    local ptn = ptn
  end

  if ext == v:null then
    local fzf_rg_opt_ext = ''
  else
    local fzf_rg_opt_ext = ' -g "*.' . ext . '"'
  end

  if word1 == true then
    local fzf_rg_opt_word1 = ' -w'
  else
    local fzf_rg_opt_word1 = ''
  end

  if opt == v:null then
    local opt = ''
  else
    local opt = ' ' . opt
  end

  local rg_cmd = 'rg '
       . g_fzf_rg_opt
       . l:fzf_rg_opt_ext
       . l:fzf_rg_opt_word1
       . l:opt
       . ' -- ' . '"' . escape(l:ptn, '().$') . '"'

  return rg_cmd
end

let g_rg_emp_line_ptn  = '^[ \\t]*$'
let g_rg_some_line_ptn = '^[^ \\t]+$'
-- let g_rg_some_line_ptn = '[^ \\t]'

function v.Rg_ptn_cnt(ptn, opt)

  if opt == v:null then
    local opt = ''
  else
    local opt = opt
  end

  local rg_cmd = "rg " . l:opt . " -e '" . ptn . "' | count"
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
  
  local rg_cmd = Rg_cmd(ptn, v:null, v:null, opt) -- todo dev
  local r_rslt_txt = Sys_cmd(l:rg_cmd)
  return r_rslt_txt
end

function v.Cursor__ins_rgstr_by_rgstr_info(rgstr_info)
  
  local rgstr = Rgstr_info_rgstr(rgstr_info)
  call Normal('"' . l:rgstr . l:rgstr . 'P')
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

    local _buf_num_key = l:buf_num_key_prefix . l:_jmplst_tmp['bufnr']

    if ! has_key(l:jmplst, l:_buf_num_key) then
      local jmplst[l:_buf_num_key] = []
    end

    call add(l:jmplst[l:_buf_num_key], l:_jmplst_tmp)
  endfor

  for _buf_num_key in keys(l:jmplst)

    call sort(l:jmplst[l:_buf_num_key], 'Jmplst_cmp')
  endfor

  local buf_num_key = l:buf_num_key_prefix . Buf_num()
  local r_jmplst    = get(l:jmplst, buf_num_key, [])
  --echo l:r_jmplst

  return r_jmplst
end

function v.Jmplst_line_info()

  local jmplst = Jmplst()

  local jmplst_line_info = []
  for _jmplst in l:jmplst

    local line_num  = l:_jmplst['lnum']
    local line_info = l:line_num . ' ' . getline(l:line_num)
    call add(l:jmplst_line_info, l:line_info)
  endfor
  --echo l:jmplst_line_info

  return jmplst_line_info
end

function v.Jmplst_cmp(jmplst1, jmplst2)

  if     jmplst1['lnum'] >  jmplst2['lnum'] then
    local ret =  1
  elseif jmplst1['lnum'] == jmplst2['lnum'] then
    local ret =  0
  else
    local ret = -1
  end

  return ret
end

-- mark

let g_mark_alph_def = [
  'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
  'o','p','q','r','s','t','u','v','w','x','y','z'
]

function v.Mark_show_tgl()
  
  if exists('g_mark_show_flg') == 0 then
    
    let g_mark_show_flg = false
  end
  
  if ! g_mark_show_flg then
    
    exe 'DoShowMarks'
    let g_mark_show_flg = true
  else
    exe 'NoShowMarks'
    let g_mark_show_flg = false
  end
end

function v.Mark_lst()
  
  local mark = []
  for _mark in bufname()->getmarklist()
    
    local _alph = l:_mark['mark'][1]
    
    if count(g_mark_alph_def, l:_alph) == 0 then
      continue
    end
    
    local mark = add(l:mark, l:_mark['mark'][1])
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
  --echo 'Mark_tgl ' . l:alph
  
  --if l:alph == '' then
  if Is_str__emp(l:alph) then
    call Mark_add()
  else
    call Mark_del(l:alph)
  end
  
  call Exe('DoShowMarks')
end
  
function v.Mark_add()
  
  local alph = Mark_alph_useabl()
  call Exe('mark ' . l:alph)
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
  
  call Exe('delmark ' . alph)
end

function v.Mark_del_all()
  
  call Exe('delmark!')
  call Exe('DoShowMarks')
end

-- trns

function v.Slctd_trns() -- range

  local str = Slctd_str()

  local str = substitute(l:str, "\\n", ' ', 'g')

  if l:str =~ '[^\\x01-\\x7E]' then -- mlt byte
    local lang = '{ja=en}'
  else
    local lang = '{en=ja}'
    --local lang = ''
  end

  local str = escape(l:str, "'")
  local sys_cmd = 'trans -no-ansi ' . l:lang . " '" . l:str . "'"
  local rslt = Sys_cmd(l:sys_cmd)
  echo l:rslt
end

-- math

function v.Slctd_math() -- range

  local str = Slctd_str()
  local sys_cmd = 'echo ' . "'" . l:str . "'" . ' | math'
  local rslt = Sys_cmd(l:sys_cmd)
  echo l:rslt
  let @a = l:rslt
end

-- url encdoe

function v.Slctd_url_encode() -- range

  local str = Slctd_str()
  local sys_cmd = 'url_encode "' . l:str . '"'
  local rslt = Sys_cmd(l:sys_cmd)
  --echo l:rslt
  call Cursor__ins(l:rslt)
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

  if env != 'mac' then
    -- echo env . ' : ' . l:ret
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
      local vim_plug_dir_mac_nvim  = $HOME . '/.local/share/nvim/site'

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

      -- local vim_plug_dir_mac_nvim = $HOME . '/.local/share/nvim/site'
      local vim_plug_dir_mac_vim  = $HOME . '/.vim'

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

  local vim_plug_path = l:vim_plug_dir . '/autoload/plug.vim'
  return vim_plug_path
end

function v.Is_vim_plug__installed()

  local vim_plug_path = Vim_plug_path()
  -- echo l:vim_plug_path

  local ret = ! empty(glob(l:vim_plug_path))
  -- echo 'vim_plug installed : ' . l:ret

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
call Ynk__clp()

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

let g_fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g_fzf_action = {
 'ctrl-o': 'tab drop',
}

--  'ctrl-o': 'enter',
--  'ctrl-i': 'item slct mtl',
--  'ctrl-s': 'backward-char',

let g_fzf_colors = {
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
--let g_fzf_buffers_jump = 1
--fzf#vim#complete#buffer_line([spec])

-- fzf var def ( in plugin ) end

if Is_env__('mac') || Is_env__('linux') || Is_env__('win64') then

  if Is_env__('win64') then
    let g_fzf_rg_opt .= ' -g "!.git/"'
  else
    let g_fzf_rg_opt .= ' -g "!.git/"'
  end
end

-- srch init
function v.Srch_init() -- use not

  local cmd = '/<cr>N'
  call Normal(l:cmd)
end
--call Srch_init()

-- init end


-- 
-- fnc repeat tmp
-- 

function v.Repeat_tmp()

  call Cursor__mv_srch('f')
  call Cursor__mv_d()
  call Cursor__ins_ynk()
end


