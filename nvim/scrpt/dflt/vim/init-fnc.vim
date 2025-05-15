" 
" fnc
" 

" 
" primitive
" 

" char

func! Char_lr_2_normal_cmd(lr) abort

  return v:lua.v.Char_lr_2_normal_cmd(a:lr)
endfunc

" char cnd

func! Is_char__num(char) abort

  return v:lua.v.Is_char__num(a:char)
endfunc

func! Is_char__alpha(char) abort

  return v:lua.v.Is_char__alpha(a:char)
endfunc

func! Is_char__symbol(char) abort

  return v:lua.v.Is_char__symbol(a:char)
endfunc

" char cnd  -  char pair __

func! Is_char_pair__(ptn, c1, c2) abort

  return v:lua.v.Is_char_pair__(a:ptn, a:c1, a:c2)
endfunc

func! Is_char_pair__quote(c1, c2) abort

  return v:lua.v.Is_char_pair__quote(a:c1, a:c2)
endfunc

func! Is_char_pair__bracket(c1, c2) abort

  return v:lua.v.Is_char_pair__bracket(a:c1, a:c2)
endfunc

" char cnd tgl

func! Is_char__tgl_symbol(c) abort

  return v:lua.v.Is_char__tgl_symbol(a:c)
endfunc

func! Is_char__tgl_bracket_trn(c) abort

  return v:lua.v.Is_char__tgl_bracket_trn(a:c)
endfunc

func! Is_char__tgl_alpha_trn(c) abort " use not

  return v:lua.v.Is_char__tgl_alpha_trn(a:c)
endfunc

" str

func! Str_len(str) abort " alias

  return v:lua.v.Str_len(a:str)
endfunc

func! Str_l_char(str) abort

  return v:lua.v.Str_l_char(a:str)
endfunc

func! Str_r_char(str) abort

  return v:lua.v.Str_r_char(a:str)
endfunc

func! Str_sub(str, idx, len) abort " dev doing

  return v:lua.v.Str_sub(a:str, a:idx, a:len)
endfunc

func! Str_space(len) abort

  return v:lua.v.Str_space(a:len)
endfunc

func! Str_srch(...) abort " alias

  let l:str =                a:1
  let l:ptn =                a:2
  let l:idx = ( a:0 >= 3 ) ? a:3 : v:null

  return v:lua.v.Str_srch(l:str, l:ptn, l:idx)
endfunc

func! Str_srch_end(str, ptn) abort " alias

  return v:lua.v.Str_srch_end(a:str, a:ptn)
endfunc

" str __ rpl

func! Str__rpl(str, srch, rpl) abort " alias

  return v:lua.v.Str__rpl(a:str, a:srch, a:rpl)
endfunc

func! Str_path_unix__cnv_win(path) abort

  return v:lua.v.Str_path_unix__cnv_win(a:path)
endfunc

func! Str_path_win__cnv_unix(path) abort

  return v:lua.v.Str_path_win__cnv_unix(a:path)
endfunc

func! Str_cmnt_1() abort

  return v:lua.v.Str_cmnt_1()
endfunc

" str cnd

func! Is_str__emp(str) abort

  let l:ret = v:false

  if a:str == ''
    let l:ret = v:true
  endif
  return l:ret
endfunc

func! Is_str__ptn(str, ptn) abort

  return v:lua.v.Is_str__ptn(a:str, a:ptn)
endfunc

func! Is_str__space(str) abort

  return v:lua.v.Is_str__space(a:str)
endfunc

func! Is_str__num(str) abort

  return v:lua.v.Is_str__num(a:str)
endfunc

" num ( idx )

func! Idx__icl(idx, ar_len) abort

  " return v:lua.v.Idx__icl(a:idx, a:ar_len)

  let l:r_idx = a:idx + 1
  
  if r_idx >= a:ar_len
    let l:r_idx = 0
  endif
  
  return l:r_idx
endfunc

func! Idx__dcl(idx, ar_len) abort

  " return v:lua.v.Idx__dcl(a:idx, a:ar_len)

  let l:r_idx = a:idx - 1

  if r_idx < 0
    let l:r_idx = a:ar_len - 1
  endif

  return l:r_idx
endfunc

func! Int_2_str(num) abort

  return v:lua.v.Int_2_str(a:num)
endfunc

" ar ( list )

" txt

func! Txt_to_ar(txt) abort

  return v:lua.v.Txt_to_ar(a:txt)
endfunc

" vim

" vim basic

func! Nothing() abort " use by tst

  return v:lua.v.Nothing()
endfunc

func! Echo(str) abort " alias

  return v:lua.v.Echo(a:str)
endfunc

func! Exe(cmd) abort " alias

  return v:lua.v.Exe(a:cmd)
endfunc

func! Normal(cmd) abort " alias

  return v:lua.v.Normal(a:cmd)
endfunc

func! Esc() abort " alias

  return v:lua.v.Esc()
endfunc

func! Cmdline__(str) abort

  return v:lua.v.Cmdline__(a:str)
endfunc

" undo clr, file ( crnt buf ? )

func! Undo__clr() abort

  return v:lua.v.Undo__clr()
endfunc

func! Sys_cmd(sys_cmd) abort

  return v:lua.v.Sys_cmd(a:sys_cmd)
endfunc

" syntax color

func! Hl_grp() abort

  return v:lua.v.Hl_grp()
endfunc
" and
" :hi [grp name]

func! Color_name_lst() abort

  return v:lua.v.Color_name_lst()
endfunc

" dir

func! Pth() abort

  return v:lua.v.Pth()
endfunc

" dir __ ch

func! Dir__(dir) abort

  return v:lua.v.Dir__(a:dir)
endfunc

" dir __ ch slf

func! Buf_file_dir() abort

  return v:lua.v.Buf_file_dir()
endfunc

func! Dir__buf_file_dir() abort

  return v:lua.v.Dir__buf_file_dir()
endfunc

" dir __ ch parent

func! Dir__parent(lvl) abort

  return v:lua.v.Dir__parent(a:lvl)
endfunc

" file ( buf file )

func! Save() abort

  return v:lua.v.Save()
endfunc

func! Buf_file__dpl() abort

  return v:lua.v.Buf_file__dpl()
endfunc

func! Buf_file__mv(file_name_aft) abort

  return v:lua.v.Buf_file__mv(a:file_name_aft)
endfunc

func! Buf_file_path() abort

  return v:lua.v.Buf_file_path()
endfunc

func! Rgstr__clr() abort

  return v:lua.v.Rgstr__clr()
endfunc

func! File_txt(file_path) abort

  return v:lua.v.File_txt(a:file_path)
endfunc

func! File_line_ar(file_path) abort

  return v:lua.v.File_line_ar(a:file_path)
endfunc

" load re

func! Load_re() abort

  return v:lua.v.Load_re()
endfunc

" load re  -  encode sjis

func! Load_re__sjis() abort

  return v:lua.v.Load_re__sjis()
endfunc

" encode

func! Buf_file_encode() abort

  return v:lua.v.Buf_file_encode()
endfunc

func! Buf_file_bom() abort

  return v:lua.v.Buf_file_bom()
endfunc

" file tmp

func! File_tmp__cre() abort " alias

  return v:lua.v.File_tmp__cre()
endfunc

" file cnd

func! Is_file_type__(type) abort

  return v:lua.v.Is_file_type__(a:type)
endfunc

" opn

" opn file

func! Opn(filename) abort

  call Exe('tab drop ' . a:filename)
endfunc

func! Opn_tmp_file() abort

  return v:lua.v.Opn_tmp_file()
endfunc

let g:init_vim_file_path         = g:init_vim_dir     . '/dflt/init.vim'
let g:init_vim_fnc_file_path     = g:init_vim_etc_dir . '/init-fnc.vim'

let g:init_lua_file_path         = g:init_vim_dir . '/dflt/lua/init.lua'
let g:init_lua_opt_file_path     = g:init_vim_dir . '/dflt/lua/init-opt.lua'
let g:init_lua_cmd_file_path     = g:init_vim_dir . '/dflt/lua/init-cmd-usr.lua'
let g:init_lua_hl_file_path      = g:init_vim_dir . '/dflt/lua/init-hl.lua'
let g:init_lua_key_map_file_path = g:init_vim_dir . '/dflt/lua/init-key-map.lua'
let g:init_lua_fnc_file_path     = g:init_vim_dir . '/dflt/lua/init-fnc.lua'

func! Opn_init_vim() abort

  return v:lua.v.Opn_init_vim()
endfunc

func! Opn_init_vim_l() abort

  return v:lua.v.Opn_init_vim_l()
endfunc

func! Opn_fish_cnf() abort

  return v:lua.v.Opn_fish_cnf()
endfunc

func! Opn_man(cmd) abort

  return v:lua.v.Opn_man(a:cmd)
endfunc

let g:memo_path = 'doc/memo.md'

func! Opn_memo() abort

  return v:lua.v.Opn_memo()
endfunc

func! Opn_grep_wk() abort

  return v:lua.v.Opn_grep_wk()
endfunc

" opn app

func! Opn_app(path) abort

  return v:lua.v.Opn_app(a:path)
endfunc

func! Opn_app_by_cursor_path() abort
  
  return v:lua.v.Opn_app_by_cursor_path()
endfunc

func! Opn_app_by_line_path(line_num) abort

  return v:lua.v.Opn_app_by_line_path(a:line_num)
endfunc

func! Opn_app_by_slctd_str() abort

  return v:lua.v.Opn_app_by_slctd_str()
endfunc

func! Opn_app_buf_file() abort

  return v:lua.v.Opn_app_buf_file()
endfunc

func! Opn_buf_file_dir() abort

  return v:lua.v.Opn_buf_file_dir()
endfunc

func! Opn_brwsr()

  return v:lua.v.Opn_brwsr()
endfunc

func! Opn_ggl_srch(word) abort

  return v:lua.v.Opn_ggl_srch(a:word)
endfunc

func! Opn_yt(yt_video_id)

  return v:lua.v.Opn_yt(a:yt_video_id)
endfunc

" tag jmp

" tag jmp by str

func! Tag_jmp_by_str(rg_rslt_line) abort

  let l:rg_rslt_line = trim(a:rg_rslt_line)

  if Is_str__emp(l:rg_rslt_line)
    echo 'empty'
    return
  endif

  let l:rg_rslt_line = matchstr(l:rg_rslt_line, '\S\+')
  " echo l:rg_rslt_line

  let l:rg_rslt_line_ar = Rg_rslt_line_parse(l:rg_rslt_line)
  " echo l:rg_rslt_line_ar

  let l:filename = l:rg_rslt_line_ar[0]
  let l:line_num = get(l:rg_rslt_line_ar, 1, 1)
  " echo l:line_num
  " return

  if ! filereadable(l:filename)
    echo 'file does not exist'
    return
  endif

  call Exe('tab drop ' . l:filename)
  call Normal(l:line_num . 'G')
endfunc

func! Tag_jmp_by_cursor_line() abort

  let l:base_buf_num = Buf_num()

  let l:str = Cursor_line_str()
  call Tag_jmp_by_str(l:str)

  call Exe('sbuffer ' . l:base_buf_num)
  " call Normal('j')
  call Cursor__mv_d()
endfunc

func! Tag_jmp_by_slctd_line() range abort

  let l:base_buf_num = Buf_num()

  for line_num in range(a:firstline, a:lastline)

    let l:line = getline(l:line_num)
    call Tag_jmp_by_str(l:line)
    call Exe('sbuffer ' . l:base_buf_num)
  endfor
endfunc

" buf

func! Buf_num() abort

  return v:lua.v.Buf_num()
endfunc

func! Buf__quit() abort

  return v:lua.v.Buf__quit()
endfunc

func! Buf__quit_swtch() abort

  return v:lua.v.Buf__quit_swtch()
endfunc

func! Buf__fltr() abort " use not

endfunc

" win splt

func! Win__splt_h() abort

  return v:lua.v.Win__splt_h()
endfunc

func! Win__splt_v() abort

  return v:lua.v.Win__splt_v()
endfunc

func! Win_splt_cursor__mv_nxt() abort

  return v:lua.v.Win_splt_cursor__mv_nxt()
endfunc

func! Win_splt__quit() abort

  let l:n_cmd = "\<c-w>c"
  call Normal(l:n_cmd)
endfunc

" 
" line
" 

func! Line_num_file_edge_bgn() abort

  return v:lua.v.Line_num_file_edge_bgn()
endfunc

func! Line_num_file_edge_end() abort " alias

  return v:lua.v.Line_num_file_edge_end()
endfunc

" line xx __ ins

let s:line_top_space_ptn = '^[ \t]*'

let s:line_end_space_ptn = '[ \t]*$'

func! Line_end_space__del(line_num) abort

  return v:lua.v.Line_end_space__del(a:line_num)
endfunc

func! Line_end__pad_space(line_num, fil_end_col) abort

  return v:lua.v.Line_end__pad_space(a:line_num, a:fil_end_col)
endfunc

let g:dots_str = ' .. '
let g:dots_put_col = 50

func! Line__del_by_line_num(line_num) abort

  return v:lua.v.Line__del_by_line_num(a:line_num)
endfunc

" line num

" dev anchor : cmnt del doing
func! Line_num_by_Line_info(line_info) abort

  return v:lua.v.Line_num_by_Line_info(a:line_info)

  " let l:line_info = trim(a:line_info, ' ', 1)
  " let l:line_num  = split(l:line_info, '\s\+')[0]
  " return l:line_num
endfunc

" line cnd


" 
" cursor
" 

" cursor pos

func! Cursor_pos() abort " alias

  return v:lua.v.Cursor_pos()
endfunc

" cursor col

func! Cursor_col_num() abort

  return v:lua.v.Cursor_col_num()
endfunc

func! Cursor_col_idx() abort

  return v:lua.v.Cursor_col_idx()
endfunc

" cursor col cnd

func! Is_cursor_col__line_end() abort

  return v:lua.v.Is_cursor_col__line_end()
endfunc

func! Is_cursor_col__line_end_ovr() range abort

  return v:lua.v.Is_cursor_col__line_end_ovr()
endfunc

func! Is_cursor_col__line_end_inr() abort

  return v:lua.v.Is_cursor_col__line_end_inr()
endfunc

func! Is_cursor_col__line_top0() abort

  return v:lua.v.Is_cursor_col__line_top0()
endfunc

func! Is_cursor_col__line_top1() abort

  return v:lua.v.Is_cursor_col__line_top1()
endfunc

" cursor __ mv

func! Cursor__mv_by_col_num(col_num) abort

  return v:lua.v.Cursor__mv_by_col_num(a:col_num)
endfunc

func! Cursor__mv_by_line_num(line_num) abort

  return v:lua.v.Cursor__mv_by_line_num(a:line_num)
endfunc

func! Cursor__mv_by_line_col(line_num, col) abort

  return v:lua.v.Cursor__mv_by_line_col(a:line_num, a:col)
endfunc

func! Cursor__mv_by_line_info(line_info) abort
  
  let l:line_num = Line_num_by_Line_info(a:line_info)
  call Cursor__mv_by_line_num(l:line_num)
endfunc

func! Cursor__mv_by_pos(pos) abort

  return v:lua.v.Cursor__mv_by_pos(a:pos)
endfunc

func! Cursor__mv_line_top0() abort

  return v:lua.v.Cursor__mv_line_top0()
endfunc

func! Cursor__mv_line_top1() abort

  return v:lua.v.Cursor__mv_line_top1()
endfunc

func! Cursor__mv_line_end() abort

  return v:lua.v.Cursor__mv_line_end()
endfunc

func! Cursor__mv_char_f() abort

  return v:lua.v.Cursor__mv_char_f()
endfunc

func! Cursor__mv_char_b() abort

  return v:lua.v.Cursor__mv_char_b()
endfunc

func! Cursor__mv_word_f() abort

  if     Is_cursor_col__line_end() || Is_cursor_col__line_end_inr()

    call Cursor__mv_char_f()
    return

  elseif Is_cursor_line_str_side_r__space()

    call Cursor__mv_line_end()
    return
  endif

  let l:c_char = Cursor_c_char()
  let l:r_char = Cursor_r_char()

  if l:c_char =~ ' ' && l:r_char =~ ' '
    call Normal('w')
  else
    call Normal('el')
  endif
endfunc

func! Cursor__mv_word_b() abort
  
  let l:l_char = Cursor_l_char()

  if     Is_cursor_col__line_top0()
    call Cursor__mv_u_line_end()
    
  elseif Is_cursor_line_str_side_l__space()
    call Cursor__mv_line_top0()
    
  elseif Is_cursor_col__line_top1()
    call Cursor__mv_line_top0()
    
  elseif Is_char__symbol(l:l_char)
    call Cursor__mv_char_b()
    
  else
    call Normal('b')
  endif
endfunc

func! Cursor__mv_word_dlm_f() abort

  return v:lua.v.Cursor__mv_word_dlm_f()

  " let l:ptn = '[_ABCDEFGHIJKLMNOPQRSTUVWXYZ]'
  " " let l:ptn = '[_\u]'
  " 
  " let l:line_num = Cursor_line_num()
  " 
  " call search(l:ptn, 'zW', l:line_num)
endfunc

func! Cursor__mv_word_b_pre() abort " use not

  return v:lua.v.Cursor__mv_word_b_pre()

  " let l:c_char = Cursor_c_char()
  " let l:l_char = Cursor_r_char()
  " 
  " if l:c_char =~ ' ' && l:l_char !~ ' '
  "   call Normal('gegel')
  " else
  "   call Normal('gel')
  " endif
endfunc

func! Cursor__mv_fnc_name() abort

  call Cursor__mv_srch_ptn('(', 'f')
  call Cursor__mv_word_b()
endfunc

func! Cursor__mv_u() abort " alias

  return v:lua.v.Cursor__mv_u()

  " call Normal('k')
endfunc

func! Cursor__mv_d() abort " alias

  return v:lua.v.Cursor__mv_d()

  " call Normal('j')
endfunc

func! Cursor__mv_v(drct) abort

  return v:lua.v.Cursor__mv_v(a:drct)

  " if     a:drct == 'u'
  "   call Cursor__mv_u()
  " 
  " elseif a:drct == 'd'
  "   call Cursor__mv_d()
  " 
  " else
  "   call Cursor__mv_u()
  " endif
endfunc

let g:cursor_mv_line_step_dflt = 10

func! Cursor__mv_mlt_u() abort " alias

  let g:cursor_mv_line_step = g:cursor_mv_line_step_dflt

  let l:n_cmd = g:cursor_mv_line_step . "\<c-y>"
  call Normal(l:n_cmd)
endfunc

func! Cursor__mv_mlt_d() abort " alias

  let g:cursor_mv_line_step = g:cursor_mv_line_step_dflt

  let l:n_cmd = g:cursor_mv_line_step . "\<c-e>"
  call Normal(l:n_cmd)
endfunc

func! Cursor__mv_u_line_end() abort

  return v:lua.v.Cursor__mv_u_line_end()

  " call Cursor__mv_u()
  " call Cursor__mv_line_end()
endfunc

func! Cursor__mv_line_top_or_new_line() abort

  return v:lua.v.Cursor__mv_line_top_or_new_line()

  " if     Is_cursor_col__line_top0()
  " 
  "   call Cursor__ins_line_emp()
  " 
  " elseif Is_cursor_col__line_top1()
  " 
  "   call Cursor__mv_line_top0()
  " else
  "   call Cursor__mv_line_top1()
  " endif
endfunc

func! Cursor__mv_slctd_edge_tgl() range abort

  call Slct_re()
  call Normal('o')
endfunc

func! Cursor__mv_slctd_edge_l() range abort

  call Slct_re()

  if ! Is_slctd_cursor_pos__r()
    return
  endif

  call Cursor__mv_slctd_edge_tgl()

  " let l:n_cmd = '`<'
  " call Normal(l:n_cmd)
endfunc

func! Cursor__mv_file_edge(n_cmd) abort

  if Is_cursor_line_num__file_edge()
    call Normal(a:n_cmd)
  endif

  let l:cnt = 1
  let l:cnt_max = 10000

  while ( !Is_cursor_line_num__file_edge() && l:cnt < l:cnt_max )

    call Normal(a:n_cmd)
    let l:cnt = l:cnt + 1
  endwhile
endfunc

func! Cursor__mv_file_edge_bgn() abort " alias

  call Cursor__mv_file_edge('k')
endfunc

func! Cursor__mv_file_edge_end() abort " alias

  call Cursor__mv_file_edge('j')
endfunc

func! Cursor__mv_v_jmp_char(drct, is_space_through) abort

  "let l:is_space_stop = a:is_space_stop
  let l:is_space_through = a:is_space_through

  if a:drct == 'k' || a:drct == 'j'

    let l:n_cmd = a:drct
  else
    return
  endif

  call Normal(l:n_cmd)
  let l:cnt = 1
  let l:cnt_max = 10000

  while ( !Is_cursor_line_num__file_edge() && l:cnt < l:cnt_max )

    if ! ( Is_cursor_c_char__space() || Is_cursor_col__line_end() )
      break
    endif

    "if ( l:is_space_stop == 't' && Is_cursor_c_char__space() )
    if ( l:is_space_through == 'f' && Is_cursor_c_char__space() )
      break
    endif

    call Normal(l:n_cmd)
    let l:cnt = l:cnt + 1
  endwhile
endfunc

func! Cursor__mv_v_jmp_md_h(drct) abort " todo dev

  if a:drct == 'k' || a:drct == 'j'

    let l:n_cmd = a:drct
  else
    return
  endif

  " logic write ..

endfunc

func! Cursor__mv_v_jmp_space(drct) abort

  if a:drct == 'k' || a:drct == 'j'

    let l:n_cmd = a:drct
  else
    return
  endif

  call Normal(l:n_cmd)

  let l:cnt = 1
  let l:cnt_max = 10000

  while ( !Is_cursor_line_num__file_edge() && l:cnt < l:cnt_max )

    if Is_cursor_c_char__space() || Is_cursor_col__line_end()
      break
    endif

    call Normal(l:n_cmd)
    let l:cnt = l:cnt + 1
  endwhile
endfunc

func! Cursor__mv_v_jmp(drct) abort

  if a:drct == 'k' || a:drct == 'j'

    let l:n_cmd = a:drct
  else
    return
  endif

  call Normal(l:n_cmd)

  if Is_cursor_c_char__space() || Is_cursor_col__line_end()

    call Cursor__mv_v_jmp_char(l:n_cmd, 't')
  else
    call Cursor__mv_v_jmp_space(l:n_cmd)
  endif
endfunc

func! Cursor__mv_srch_ptn(ptn, dir) range abort

  return v:lua.v.Cursor__mv_srch_ptn(a:ptn, a:dir)

  " let l:ptn = a:ptn
  " 
  " if a:dir == 'b'
  "   let l:opt_dir = 'b'
  " else
  "   let l:opt_dir = ''
  " endif
  " let l:opt = 'W' . l:opt_dir
  " " let l:opt = 'zW' . l:opt_dir
  " 
  " let l:line_num = Cursor_line_num()
  " 
  " call search(l:ptn, l:opt, l:line_num)
endfunc

func! Cursor__mv_srch(drct) abort

  return v:lua.v.Cursor__mv_srch(a:drct)
endfunc

" cursor __ ins

func! Cursor__ins(str) abort

  return v:lua.v.Cursor__ins(a:str)
endfunc

func! Cursor__ins_with_cursor_fix(str) abort " todo dev

endfunc

" cursor __ ins ynk ( paste )

func! Cursor__ins_ynk() abort

  return v:lua.v.Cursor__ins_ynk()
endfunc

func! Cursor__ins_clp() abort

  call Ynk__clp()
  call Cursor__ins_ynk()
endfunc

func! Cursor__ins_mlt(str, num) abort

  return v:lua.v.Cursor__ins_mlt(a:str, a:num)

  " if a:num == 0
  "   return
  " endif
  " 
  " let l:cmd = a:num.'i'.a:str
  " call Normal(l:cmd)
endfunc

func! Cursor__ins_cr() abort

  let l:t_line_num = line('.')

  call Normal("i\<cr> ")
  call Normal('x')

  call Line_end_space__del(l:t_line_num)
  call Cursor__mv_d()
endfunc

func! Cursor__ins_space(is_cursor_mv) abort

  if a:is_cursor_mv
    call Cursor__ins(' ')

  else
    call Normal('i ')
    ""call Normal('l')
  endif
endfunc

func! Cursor__ins_hyphen() abort

  return v:lua.v.Cursor__ins_hyphen()

  " call Normal('i-')
  " "call Cursor__ins('-')
endfunc

func! Cursor__ins_tilde() abort

  return v:lua.v.Cursor__ins_tilde()

  " call Normal('i~')
  " "call Cursor__ins('~')
endfunc

func! Cursor__ins_slash() abort

  return v:lua.v.Cursor__ins_slash()

  " call Normal('i/')
  " "call Cursor__ins('/')
endfunc

func! Cursor__ins_slashback() abort

  return v:lua.v.Cursor__ins_slashback()

  " call Normal('i\')
  " "call Cursor__ins('\')
endfunc

func! Cursor__ins_quote() abort

  return v:lua.v.Cursor__ins_quote()

  " call Normal("i' '")
  " call Normal('h')
endfunc

func! Cursor__ins_da() abort

  return v:lua.v.Cursor__ins_da()

  " let l:da = strftime('%Y-%m-%d')
  " call Cursor__ins(l:da)
endfunc

func! Cursor__ins_tm() abort

  return v:lua.v.Cursor__ins_tm()

  " let l:tm = strftime('%H:%M')
  " call Cursor__ins(l:tm)
endfunc

func! Cursor__ins_dt() abort

  return v:lua.v.Cursor__ins_dt()

  " let l:dt = strftime('%Y-%m-%d.%H:%M')
  " call Cursor__ins(l:dt)
endfunc

func! Cursor__ins_ts() abort

  return v:lua.v.Cursor__ins_ts()

  " let l:ts = strftime('%Y-%m-%d.%H:%M:%S')
  " call Cursor__ins(l:ts)
endfunc

let g:week_def = [ 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' ]

func! Cursor__ins_week() abort

  return v:lua.v.Cursor__ins_week()

  " let l:week_num = strftime('%w')
  " let l:week     = g:week_def[l:week_num]
  " call Cursor__ins(l:week)
  " "call Cursor__ins(' ' . l:week)
endfunc

" cmnt

func! Cursor__ins_cmnt_1(cmd_cursor__mv_line_top) abort

  return v:lua.v.Cursor__ins_cmnt_1(a:cmd_cursor__mv_line_top)
endfunc

func! V_ins_cmnt_1() range abort

  call Normal(a:firstline . 'G')
  call Normal('^')
  let l:col = Cursor_col_num()

  for line_num in range(a:firstline, a:lastline)

    call Line_end__pad_space(l:line_num, l:col - 1)

    call Cursor__mv_by_line_col(l:line_num, l:col)

    call Cursor__ins_cmnt_1(v:null)
  endfor
endfunc

func! Cursor__ins_cmnt_mlt_by_pos(pos) abort

  return v:lua.v.Cursor__ins_cmnt_mlt_by_pos(a:pos)

  " let l:cmnt_mlt_def = #{
  " \  lua       : ['--[[' , '--]]'],
  " \  html      : ['<!--' ,  '-->'],
  " \  css       : ['/*'   ,  ' */'],
  " \  javascript: ['/*'   ,  ' */'],
  " \  java      : ['/*'   ,  ' */'],
  " \  dflt      : ['/*'   ,  ' */']
  " \ }
  " 
  " let l:str = get(l:cmnt_mlt_def, &filetype, l:cmnt_mlt_def['dflt'])
  " 
  " if     a:pos == 'bgn'
  "   call Normal('O')
  "   call Normal('i' . l:str[0])
  " 
  " elseif a:pos == 'end'
  "   call Normal('o')
  "   call Normal('i' . l:str[1])
  " endif
endfunc

func! Cursor__ins_cmnt_mlt() abort

  return v:lua.v.Cursor__ins_cmnt_mlt()

  " call Cursor__ins_cmnt_mlt_by_pos('bgn')
  " call Cursor__ins_cmnt_mlt_by_pos('end')
endfunc

func! V_ins_cmnt_mlt() range abort

  call Normal(a:lastline  . 'G')
  call Cursor__ins_cmnt_mlt_by_pos('end')

  call Normal(a:firstline . 'G')
  call Cursor__ins_cmnt_mlt_by_pos('bgn')
endfunc

" markdown

func! Cursor__ins_markdown_h() abort

  call Cursor__mv_line_top0()
  let l:top0_char = Cursor_c_char()

  let l:str = '#'

  if l:top0_char != l:str
    let l:str .= ' '
  endif

  call Cursor__ins(l:str)

  let l:ptn = '^#* '
  let l:col = Str_srch_end(Cursor_line_str(), l:ptn) + 1
  call Cursor__mv_by_line_col(v:null, l:col)
endfunc

func! Cursor__ins_markdown_cr() abort

  return v:lua.v.Cursor__ins_markdown_cr()

  " call Cursor__ins('  ')
endfunc

func! Cursor__ins_markdown_itm() abort

  if Is_line_markdown_itm()
    call Cursor_line_indnt__shft_r()
    return
  endif

  let l:col = Cursor_line_indnt__crct()

  let l:str = '- '
  "echo l:str
  call Cursor_line_top1__ins(l:str)
endfunc

func! Cursor__ins_markdown_code() abort

  let l:str = '```'
  call Cursor__ins_line(l:str)
endfunc

func! Char_markdown_chk__tgl() abort
  
  if Cursor_l_char() != '[' || Cursor_r_char() != ']'
    return
  endif
  
  let l:cursor_char = Cursor_c_char()
  
  if l:cursor_char == ' '
    let l:rpl_char = 'x'
  else
    let l:rpl_char = ' '
  endif
  
  call Cursor_char__rpl(l:rpl_char)
endfunc

" cursor char

func! Cursor_c_char() abort

  return v:lua.v.Cursor_c_char()

  " let l:idx = Cursor_col_idx()
  " let l:c = getline('.')[l:idx]
  " return l:c
endfunc

func! Cursor_l_char() abort

  return v:lua.v.Cursor_l_char()

  " let l:idx = Cursor_col_idx() - 1
  " let l:c = getline('.')[l:idx]
  " return l:c
endfunc

func! Cursor_r_char() abort

  return v:lua.v.Cursor_r_char()

  " let l:idx = Cursor_col_idx() + 1
  " let l:c = getline('.')[l:idx]
  " return l:c
endfunc

func! Cursor_u_char() abort

  return v:lua.v.Cursor_u_char()

  " if Is_cursor_line_num__file_edge_bgn()
  "   return ''
  " endif
  " 
  " let l:idx = Cursor_col_idx()
  " let l:line_num = Cursor_line_num() - 1
  " let l:c = getline(l:line_num)[l:idx]
  " return l:c
endfunc

func! Cursor_d_char() abort

  return v:lua.v.Cursor_d_char()

  " if Is_cursor_line_num__file_edge_end()
  "   return ''
  " endif
  " 
  " let l:idx = Cursor_col_idx()
  " let l:line_num = Cursor_line_num() + 1
  " let l:c = getline(l:line_num)[l:idx]
  " return l:c
endfunc

" cursor char __

func! Cursor_char__rpl(rpl) abort

  return v:lua.v.Cursor_char__rpl(a:rpl)

  " call Normal('r' . a:rpl)
endfunc

func! Cursor_char__rpl_underscore() abort " alias

  return v:lua.v.Cursor_char__rpl_underscore()

  " " todo, case: line end
  " 
  " call Cursor_char__rpl('_')
  " call Normal('l')
  " " call Cursor__mv_char_forward() " todo, fnc cre
endfunc

func! N_char__tgl_swtch01() abort " todo fnc name mod

  let l:c = Cursor_c_char()

  if     Is_char__num(l:c)

    call Cursor_str__icl()
    return

  elseif Is_char__alpha(l:c)

    call Normal('v~') " upper / lower
    return
  endif

  let l:rpl = Is_char__tgl_bracket_trn(l:c)
  if ! Is_str__emp(l:rpl)
    call Cursor_char__rpl(l:rpl)
    return
  endif

  let l:rpl = Is_char__tgl_symbol(l:c)
  if ! Is_str__emp(l:rpl)

    call Cursor_char__rpl(l:rpl)
    return
  endif
endfunc

func! N_char__tgl_swtch02() abort

  return v:lua.v.N_char__tgl_swtch02()

  " let l:c = Cursor_c_char()
  " 
  " if Is_char__num(l:c)
  " 
  "   call Cursor_str__dcl()
  "   return
  " endif
  " 
  " call Cursor_char__tgl_type_shift(l:c)
endfunc

func! Cursor_char__tgl_type_shift(c) abort

  return v:lua.v.Cursor_char__tgl_type_shift(a:c)

  " let l:rpl = ''
  " 
  " if     a:c == "'"
  "   let l:rpl = '"'
  " elseif a:c == '"'
  "   let l:rpl = '`'
  " elseif a:c == '`'
  "   let l:rpl = "'"
  " 
  " elseif a:c == "("
  "   let l:rpl = '['
  " elseif a:c == "["
  "   let l:rpl = '{'
  " elseif a:c == "{"
  "   let l:rpl = '<'
  " elseif a:c == "<"
  "   let l:rpl = '('
  " 
  " elseif a:c == ")"
  "   let l:rpl = ']'
  " elseif a:c == "]"
  "   let l:rpl = '}'
  " elseif a:c == "}"
  "   let l:rpl = '>'
  " elseif a:c == ">"
  "   let l:rpl = ')'
  " endif
  " 
  " if ! Is_str__emp(l:rpl)
  " 
  "   call Cursor_char__rpl(l:rpl)
  "   return
  " endif
endfunc

func! Cursor_c_char__del() abort

  return v:lua.v.Cursor_c_char__del()

  " let l:cmd = '"zx'
  " call Normal(l:cmd)
endfunc

func! Cursor_c_char__del_ynk() abort

  return v:lua.v.Cursor_c_char__del_ynk()

  " let l:cmd = '"ax'
  " call Normal(l:cmd)
endfunc

" cursor char cnd

func! Is_cursor_c_char__ptn(ptn) abort

  return v:lua.v.Is_cursor_c_char__ptn(a:ptn)

  " let l:c = Cursor_c_char()
  " 
  " if l:c =~ a:ptn
  "   return v:true
  " else
  "   return v:false
  " endif
endfunc

func! Is_cursor_c_char__space() abort

  return v:lua.v.Is_cursor_c_char__space()

  " let l:c = Cursor_c_char()
  " 
  " if l:c =~ '\s'
  "   return v:true
  " else
  "   return v:false
  " endif
  " 
  " " let l:ptn = '\s'
  " " let l:ret = Is_cursor_c_char__ptn(l:ptn)
  " " return l:ret
endfunc

func! Is_cursor_c_char__alph() abort

  return v:lua.v.Is_cursor_c_char__alph()

  " let l:ptn = '\a'
  " let l:ret = Is_cursor_c_char__ptn(l:ptn)
  " return l:ret
endfunc

" cursor str

" cursor str __

func! Cursor_str__icl() abort

  return v:lua.v.Cursor_str__icl()

  " let l:n_cmd = "\<c-a>"
  " call Normal(l:n_cmd)
endfunc

func! Cursor_str__dcl() abort

  return v:lua.v.Cursor_str__dcl()

  " let l:n_cmd = "\<c-x>"
  " call Normal(l:n_cmd)
endfunc

func! Cursor_str_week__icl() abort

  let l:week_str = Cursor_word()
  let l:week_idx = index(g:week_def, l:week_str)

  if l:week_idx == -1
    return
  endif

  let l:week_nxt_idx = Idx__icl(week_idx, len(g:week_def))
  let l:week_nxt_str = g:week_def[l:week_nxt_idx]

  call Slctd_str__word()
  call Normal('"zd')
  call Normal('i' . l:week_nxt_str)
endfunc

func! Cursor_str_week__dcl() abort

  let l:week_str = Cursor_word()
  let l:week_idx = index(g:week_def, l:week_str)

  if l:week_idx == -1
    return
  endif

  let l:week_nxt_idx = Idx__dcl(week_idx, len(g:week_def))
  let l:week_nxt_str = g:week_def[l:week_nxt_idx]

  call Slctd_str__word()
  call Normal('"zd')
  call Normal('i' . l:week_nxt_str)
endfunc

" cursor etc

func! Cursor_word() abort

  let l:word = expand('<cword>')
  return l:word
endfunc

func! Cursor_filepath() abort

  return v:lua.v.Cursor_filepath()

  " if     Is_env__('mac')
  " 
  "   let l:str = expand('<cfile>')
  " 
  " elseif Is_env__('win64')
  " 
  "   let l:str = Cursor_line_str()
  " 
  " elseif Is_env__('win32unix')
  " 
  "   let l:str = Cursor_line_str()
  " 
  " else
  "   let l:str = Cursor_line_str()
  " endif
  " 
  " let l:str = trim(l:str)
  " 
  " return l:str
endfunc

" cursor __ ins line

func! Cursor__ins_line(str) abort

  return v:lua.v.Cursor__ins_line(a:str)

  " let l:line_num = Cursor_line_num() - 1
  " call append(l:line_num, a:str)
  " call Cursor__mv_u()
endfunc

func! Cursor__ins_line_emp() abort

  return v:lua.v.Cursor__ins_line_emp()

  " let l:str = ''
  " call Cursor__ins_line(l:str)
endfunc

func! Cursor__ins_line_buf_file_path() abort

  return v:lua.v.Cursor__ins_line_buf_file_path()

  " let l:path = Buf_file_path()
  " call Cursor__ins_line(l:path)
endfunc

func! Cursor__ins_line_anchor() abort

  return v:lua.v.Cursor__ins_line_anchor()

  " let l:str  = Str_cmnt_1()
  " let l:str .= 'dev '
  " let l:str .= 'anchor'
  " call Cursor__ins_line(l:str)
  " call Cursor_line_indnt__crct()
endfunc

func! Cursor_d__ins_line(str) abort

  return v:lua.v.Cursor_d__ins_line(a:str)

  " let l:line_num = Cursor_line_num()
  " call append(l:line_num, a:str)
endfunc

func! Cursor_d__ins_line_space() range abort

  return v:lua.v.Cursor_d__ins_line_space()

  " let l:space_len = Cursor_col_num() - 1
  " let l:space_str = Str_space(l:space_len)
  " call Cursor_d__ins_line(l:space_str)
endfunc

" cursor line  -  todo refactoring

func! Cursor_line_num() abort " alias

  return v:lua.v.Cursor_line_num()

  " return line('.')
endfunc

func! Cursor_line_end_col() abort " alias

  return v:lua.v.Cursor_line_end_col()

  " let l:col = col('$')
  " return l:col
endfunc

" cursor line str

func! Cursor_line_str() abort

  return v:lua.v.Cursor_line_str()

  " return getline('.')
endfunc

func! Cursor_line_str_len() abort

  return v:lua.v.Cursor_line_str_len()

  " let l:len = Cursor_line_end_col() - 1
  " return l:len
endfunc

func! Cursor_line_str_side_l() abort

  let l:line_l = getline('.')[:col('.')-2]
  return l:line_l
endfunc

func! Cursor_line_str_side_r() abort

  let l:line_r = getline('.')[col('.'):]
  return l:line_r
endfunc

func! Cursor_line_str_side_r_with_c() abort

  let l:line_r = getline('.')[col('.') - 1:]
  return l:line_r
endfunc

" cursor line str end

" cursor line str __

func! Cursor_line_top0__ins(str) abort

  call Cursor__mv_line_top0()
  call Cursor__ins(a:str)
endfunc

func! Cursor_line_top1__ins(str) abort

  return v:lua.v.Cursor_line_top1__ins(a:str)

  " call Cursor__mv_line_top1()
  " call Cursor__ins(a:str)
endfunc

func! Cursor_line_end__dots_adjst() abort " todo dev, mb_str

  let l:line_str = Cursor_line_str()
  let l:idx = Str_srch(l:line_str, escape(g:dots_str, '.'))

  if l:idx >= 0
    call Cursor_line_end_dots__crct()
  else
    call Cursor_line_end__ins_dots()
  endif
endfunc

func! Cursor_line_end_dots__crct() abort

  let l:line_str = Cursor_line_str()
  let l:idx = Str_srch(l:line_str, escape(g:dots_str, '.'))

  if     l:idx < 0
    return
  elseif l:idx == g:dots_put_col
    return
  endif

  let l:line_str_0 = strcharpart(l:line_str,     0, l:idx)
  let l:line_str_1 = strcharpart(l:line_str, l:idx       )

  if     l:idx < g:dots_put_col

    let l:space_str = Str_space(g:dots_put_col - l:idx)
    let l:line_str = l:line_str_0 . l:space_str . l:line_str_1
  else
    let l:line_str_0 = strcharpart(l:line_str_0, 0, g:dots_put_col)
    let l:line_str = l:line_str_0 . l:line_str_1
  endif

  let l:line_num = Cursor_line_num()
  call setline(l:line_num, l:line_str)
endfunc

func! Cursor_line_end__ins_dots() abort

  let l:line_num = Cursor_line_num()

  let l:line_str = Cursor_line_str()

  let l:line_str_len = Cursor_line_str_len()

  let l:space_len = g:dots_put_col - l:line_str_len
  if l:space_len < 0
    let l:space_len = 0
  endif

  let l:space_str = Str_space(l:space_len)

  let l:line_str .= l:space_str . g:dots_str

  call setline(l:line_num, l:line_str)
endfunc

func! Curosr_line_end__ins(str) abort

  return v:lua.v.Curosr_line_end__ins(a:str)

  " let l:n_cmd = 'A' . a:str
  " call Normal(l:n_cmd)
endfunc

" cursor f

func! Cursor_f_space__del() abort

  let l:c = Cursor_c_char()

  if l:c =~ '\s'
    " echo "del"
    call Slctd_str__cursor_f_space()
    call Normal('"zd')
  else
    call Nothing()
  endif
endfunc

" cursor __ ins line

func! Cursor_line__del() abort

  if Is_cursor_line_str__emp() || Is_cursor_line_str__space()
    call Normal('"_dd') " rgstr del
  else
    call Normal('"add')
    call Clp__ynk()
  endif
endfunc

func! Cursor_f_str__crct_by_line_u() abort

  call Cursor_f_str__crct_by_line('u')
endfunc

func! Cursor_f_str__crct_by_line_d() abort

  call Cursor_f_str__crct_by_line('d')
endfunc

func! Cursor_f_str__crct_by_line(target_line_drct) abort

  let l:cursor_pos = Cursor_pos()

  let l:str = Cursor_line_str_side_r_with_c()
  let l:trim_len = Str_srch(l:str, '[^ ]')
  " echo l:trim_len
  let l:str = trim(l:str)

  let l:cursor_r_char =  Str_l_char(l:str)
  " echo l:cursor_r_char

  call Cursor__mv_v(a:target_line_drct)

  let l:target_line_str = Cursor_line_str_side_r()

  if a:target_line_drct == 'u'
    let l:turn_drct = 'd'
  else
    let l:turn_drct = 'u'
  endif
  call Cursor__mv_v(l:turn_drct)

  let l:crct_len = Str_srch(l:target_line_str, l:cursor_r_char) + 1
  " echo l:crct_len
  if l:crct_len == -1
    return
  endif

  let l:crct_len = l:crct_len - l:trim_len
  let l:space_str = Str_space(l:crct_len)
  call Cursor__ins(l:space_str)

  call Cursor__mv_by_pos(l:cursor_pos)
endfunc

func! Cursor__ins_sys_cmd(sys_cmd) abort " read

  let l:is_line_num_eq_1 = Is_cursor_line_num__file_edge_bgn()

  if l:is_line_num_eq_1
    call Normal('O')
  else
    " call Normal('k')
    call Cursor__mv_u()
  endif

  let l:cmd = 'read ! ' . a:sys_cmd
  call Exe(l:cmd)

  if l:is_line_num_eq_1
    call Line__del_by_line_num(1)
  endif
endfunc

" cursor line str __ end

" cursor line cnd

func! Is_cursor_line_num__(line_num) abort

  return v:lua.v.Is_cursor_line_num__(a:line_num)

  " let l:ret = v:false
  " 
  " let l:line_num = Cursor_line_num()
  " 
  " if l:line_num == a:line_num
  " 
  "   let l:ret = v:true
  " endif
  " return l:ret
endfunc

func! Is_cursor_line_num__file_edge_bgn() abort

  return v:lua.v.Is_cursor_line_num__file_edge_bgn()

  " let l:line_num = 1
  " let l:ret = Is_cursor_line_num__(l:line_num)
  " return l:ret
endfunc

func! Is_cursor_line_num__file_edge_end() abort

  return v:lua.v.Is_cursor_line_num__file_edge_end()

  " let l:line_num = Line_num_file_edge_end()
  " let l:ret = Is_cursor_line_num__(l:line_num)
  " return l:ret
endfunc

func! Is_cursor_line_num__file_edge() abort

  return v:lua.v.Is_cursor_line_num__file_edge()

  " let l:ret = v:false
  " 
  " if Is_cursor_line_num__file_edge_bgn() || Is_cursor_line_num__file_edge_end()
  " 
  "   let l:ret = v:true
  " endif
  " "echo l:ret
  " return l:ret
endfunc

func! Is_cursor_line_str__emp() abort

  return v:lua.v.Is_cursor_line_str__emp()

  " if Cursor_line_end_col() == 1
  "   return v:true
  " else
  "   return v:false
  " endif
endfunc

func! Is_cursor_line_str__space() abort

  return v:lua.v.Is_cursor_line_str__space()

  " let l:str = Cursor_line_str()
  " let l:ret = Is_str__space(l:str)
  " return l:ret
endfunc

func! Is_cursor_line_str_side_l__space() abort

  let l:str = Cursor_line_str_side_l()
  let l:ret = Is_str__space(l:str)
  return l:ret
endfunc

func! Is_cursor_line_str_side_r__space() abort

  let l:str = Cursor_line_str_side_r()
  let l:ret = Is_str__space(l:str)
  return l:ret
endfunc

func! Is_cursor_line_str__ptn(ptn) abort " todo dev

  let l:str = Cursor_line_str_side_r()

  let l:ret = v:false

  if Is_str__ptn(l:str, a:ptn)

    let l:ret = v:true
  endif
  return l:ret
endfunc

" indnt

func! Cursor_line_indnt_col_with_c() abort

  return v:lua.v.Cursor_line_indnt_col_with_c()

  " let l:col = cindent(Cursor_line_num())
  " return l:col
endfunc

func! Cursor_line_indnt__add(col) abort

  return v:lua.v.Cursor_line_indnt__add(a:col)

  " if a:col == 0
  "   return
  " endif
  " 
  " call Normal('0')
  " 
  " if &expandtab " 1:'expandtab', 0:'noexpandtab'
  "   let l:char = ' '
  "   let l:col = a:col
  " else
  "   let l:char = "\t"
  "   let l:col = a:col / 2
  " endif
  " call Cursor__ins_mlt(l:char, l:col)
  " 
  " call Cursor__mv_line_top1()
endfunc

func! Cursor_line_indnt__del() abort " alias

  return v:lua.v.Cursor_line_indnt__del()

  " call Exe('left')
endfunc

func! Cursor_line_indnt__shft_l() abort

  return v:lua.v.Cursor_line_indnt__shft_l()

  " call Normal('<<')
  " call Cursor__mv_line_top1()
endfunc

func! Cursor_line_indnt__shft_r() abort

  return v:lua.v.Cursor_line_indnt__shft_r()

  " let l:col = 2
  " call Cursor_line_indnt__add(l:col)
endfunc

func! Cursor_line_indnt__crct() abort

  return v:lua.v.Cursor_line_indnt__crct()

  " let l:col = Cursor_line_indnt__crct_with_c()
  " return l:col
endfunc

func! Cursor_line_indnt__crct_with_c() abort

  return v:lua.v.Cursor_line_indnt__crct_with_c()

  " call Cursor_line_indnt__del()
  " 
  " let l:col = Cursor_line_indnt_col_with_c()
  " "echo l:col
  " 
  " call Cursor_line_indnt__add(l:col)
  " return l:col
endfunc

let g:v_rng = "'<,'>"

" 
" slctd
" 

" slctd __ ( slct )

func! Slctd__cancel() range abort " alias

  return v:lua.v.Slctd__cancel()

  " call Esc()
endfunc

" refactoring slct > slctd __ xxx

func! Slct_re() range abort

  return v:lua.v.Slct_re()

  " if mode() == "\<c-v>" || mode() == "v"
  "   return
  " endif
  " 
  " call Normal('gv')
endfunc

func! Slctd_str__all() abort

  return v:lua.v.Slctd_str__all()

  " call Normal('ggVG')
endfunc

func! Slctd_str__word() abort

  let l:c = Cursor_c_char()

  if     l:c =~ '\w'
    call Normal('viw')

  elseif l:c =~ '\s'
    call Slctd_str__cursor_f_space()
  else
    call Normal('v')
  endif
endfunc

func! Slctd__word_by_under_score() abort

endfunc

func! Slctd_str__cursor_f_space() abort

  let l:c = Cursor_c_char()

  if l:c !~ '\s'
    return
  endif
  "echo l:c

  if Is_cursor_line_str_side_r__space()

    call Normal('v')
    call Normal('$h')
    "call Cursor__mv_word_f()
    "call Normal('h')

  else
    call Normal('vwh')
  endif
endfunc

func! Slctd_str__by_col_len(s_col, len) abort

  let l:e_col = a:len - 1

  call Slct_by_line_col(v:null, a:s_col, v:null, e_col)
endfunc

" refactoring slct > slctd __ xxx

func! Slct_by_pos(s_pos, e_pos) abort " use not

  return v:lua.v.Slct_by_pos(a:s_pos, a:e_pos)

  " call Cursor__mv_by_pos(a:s_pos)
  " call Normal('v')
  " call Cursor__mv_by_pos(a:e_pos)
endfunc

" refactoring slct > slctd __ xxx

func! Slct_by_line_col(s_line, s_col, e_line, e_col) abort

  let l:s_line = (a:s_line == v:null) ? Cursor_line_num() : a:s_line
  let l:e_line = (a:e_line == v:null) ? Cursor_line_num() : a:e_line

  call Cursor__mv_by_line_col(l:s_line, a:s_col)
  call Normal('v')
  call Cursor__mv_by_line_col(l:e_line, a:e_col)
endfunc

" refactoring slct > slctd __ xxx

func! Slct_by_line_rng(line_num_fr, line_num_to) abort
  
  call Cursor__mv_by_line_num(a:line_num_fr)
  call Normal('V')
  call Cursor__mv_by_line_num(a:line_num_to)
endfunc

" slctd cursor __ mv

func! Slctd_cursor__mv_slctd_edge_r() range abort
  
  call Slct_re()

  if   Is_slctd_cursor_pos__r()
    return
  endif

  call Cursor__mv_slctd_edge_tgl()

  " let l:n_cmd = '`>'
  " call Normal(l:n_cmd)
endfunc

func! Slctd_cursor_drct__mv_forward() range abort

  call Slct_re()

  if Is_slctd_cursor_pos__r()
    return
  endif

  call Cursor__mv_slctd_edge_tgl()
endfunc

func! Slctd_cursor__mv_file_edge(n_cmd) abort

  call Slct_re()

  call Cursor__mv_file_edge(a:n_cmd)
endfunc

func! Slctd_cursor__mv_v_jmp(drct) range abort

  call Slct_re()
  call Cursor__mv_v_jmp(a:drct)
endfunc

func! Slctd_cursor__mv_line_end() range abort

  call Slct_re()

  if     Is_slctd_mode__box()

    if Is_cursor_col__line_end_ovr()
      return
    endif

    call Normal('$h')
    "call Normal('g_')

  elseif Is_slctd_mode__line()

    if Is_cursor_line_str__emp()
      return
    endif

    call Normal('$h')
    "call Normal('g_')
  else
    echo "v mode else"
  endif
endfunc

" slctd cursor cnd

func! Is_slctd_cursor_pos__r() range abort

  let l:ret = v:false

  call Slct_re()

  let l:cursor_pos1 = Cursor_pos()
  " echo l:cursor_pos1

  call Cursor__mv_slctd_edge_tgl()
  let l:cursor_pos2 = Cursor_pos()
  " echo l:cursor_pos2

  call Cursor__mv_slctd_edge_tgl()


  if     l:cursor_pos1[1] >  l:cursor_pos2[1] " line
    let l:ret = v:true

  elseif l:cursor_pos1[1] == l:cursor_pos2[1] " line

    if   l:cursor_pos1[2] >= l:cursor_pos2[2] " col
      let l:ret = v:true
    endif
  endif

  " echo l:ret
  return l:ret
endfunc

" slctd str

func! Slctd_str() range abort

  " call Normal('gv"zy')

  call Slct_re()
  call Normal('"zy')

  call Slct_re()

  return @z
endfunc

func! Slctd_str_len() range abort

  call Slct_re()

  let l:slctd_str = Slctd_str()
  let l:len       = Str_len(l:slctd_str)
  return l:len
endfunc

func! Slctd_str_7_opn_ggl_srch() abort

  let l:word = Slctd_str()
  let l:word = trim(l:word)
  call Opn_ggl_srch(l:word)
endfunc

func! Slctd_str_7_opn_yt() abort
  
  let l:yt_video_id = Slctd_str()
  let l:yt_video_id = trim(l:yt_video_id)
  call Opn_yt(l:yt_video_id)
endfunc

" slctd str __ ( expnd )

func! Slctd_str__expnd() abort " expnd lr, cre re

endfunc

func! Slctd_str__expnd_srch() range abort

  return v:lua.v.Slctd_str__expnd_srch()

  " call Slct_re()
  " call Cursor__mv_srch("f")
endfunc

func! Slctd_str__expnd_word_f() range abort

  let l:slctd_str = Slctd_str()
  let l:slctd_r_out_char = Slctd_str_edge_r_out_char()

  call Slct_re()

  if     Is_cursor_line_str_side_r__space()

    call Normal('$h')

  elseif l:slctd_str =~ '\s' && l:slctd_r_out_char =~ '\s'

    call Normal('wh')
  else
    call Normal('e')
  endif
endfunc

" slctd __ expnd quote

let g:quote_ptn = '[' . "'" . '"' . '`' . ']'

func! Slctd_str__expnd_quote_on_f() range abort

  call Slct_re()
  call Cursor__mv_srch_ptn(g:quote_ptn, 'f')
endfunc

func! Slctd_str__expnd_quote_on_b() range abort

  call Slct_re()

  call Cursor__mv_slctd_edge_tgl()
  call Cursor__mv_srch_ptn(g:quote_ptn, 'b')
  " call Cursor__mv_slctd_edge_tgl ()
endfunc

func! Slctd_str__expnd_quote_on_swtch() range abort

  " Is_cursor_line_str__ptn() " todo dev ?

  call Slct_re()

  let l:c = Cursor_c_char()

  if l:c !~ g:quote_ptn
    call Slctd_str__expnd_quote_on_f()
  else
    call Slctd_str__expnd_quote_on_b()
  endif
endfunc

func! Slctd_str__expnd_quote_on() range abort

  call Slct_re()

  call Slctd_str__expnd_quote_on_f()
  call Slctd_str__expnd_quote_on_b()
endfunc

func! Slctd_str__expnd_quote_in_f() range abort

  call Slctd_str__expnd_quote_on_f()
  call Normal('h')
endfunc

func! Slctd_str__expnd_quote_in_b() range abort

  call Slctd_str__expnd_quote_on_b()
  call Normal('l')
  " call Cursor__mv_slctd_edge_tgl()
endfunc

func! Slctd_str__expnd_quote_in_swtch() range abort

  call Slct_re()

  if ! Is_cursor_line_str__ptn(g:quote_ptn)
    return
  endif

  let l:c_r = Slctd_str_edge_r_out_char()

  if l:c_r !~ g:quote_ptn

    call Slctd_str__expnd_quote_in_f()
  else
    call Slctd_str__expnd_quote_in_b()
  endif
endfunc

func! Slctd_str__expnd_quote_swtch() range abort

  call Slct_re()

  if Is_slctd_str_edge_char__quote()
    " call Esc()
    return
  endif

  if Is_slctd_str_edge_out_char__quote()

    call Slctd_str__expnd_quote_on()
  else
    call Slctd_str__expnd_quote_in_swtch()
  endif
endfunc

func! Slctd_str__expnd_bracket_f() range abort " todo dev

  let l:bracket_ptn = '[' . "'" . '"`)}\]' . ']'
  
  let l:s_col = Slctd_str_edge_l_col()
  
  let l:line_str_r = Slctd_str_edge_r_out_str()
  let l:srch_idx = Str_srch(l:line_str_r, l:bracket_ptn, 1)

  if l:srch_idx == -1

    call Normal('gv')
    return
  endif

  let l:len = l:s_col + Slctd_str_len() + l:srch_idx
  call Slctd_str__by_col_len(l:s_col, l:len)
endfunc

func! Slctd_str__reduce_dlm_l(char) range abort

  let l:char = a:char

  call Slct_re()

  let l:slctd_str = Slctd_str()
  let l:srch_idx = Str_srch(l:slctd_str, l:char)
  if l:srch_idx == -1
    call Slctd__cancel()
    return
  endif

  let l:n_cmd = 'F' . l:char . 'h'
  call Normal(l:n_cmd)
endfunc

" slctd str __ ( edit )

func! Slctd_str__ynk() range abort

  call Slct_re()
  call Normal('"zd')
  call Cursor__ins_ynk()
endfunc

func! Slctd_str__clp() range abort

  call Ynk__clp()
  call Slctd_str__ynk()
endfunc

" slctd str __ rpl

func! Slctd_str__rpl(srch, rpl) range abort

  call Slctd_box__rpl(a:srch, a:rpl)
endfunc

" slctd str __ ( rpl )

func! Slctd_str__(str) range abort " todo dev

endfunc

" slctd str __ rpl, srch nxt slctd

func! Slctd__rpl_7_srch_nxt() abort " dir forward only

  call Slct_re()
  call Normal('"zd"aPlgn')
endfunc

" slctd str __ del

func! V_slctd__del() abort " dev doing, can

  call Slct_re()

  call Normal('"ad')
  let @+ = @a
endfunc

func! Slctd__del() range abort

  call Slct_re()

  let l:rgstr = 'z'

  let l:cmd = '"' . l:rgstr . 'dgv'
  call Normal(l:cmd)
endfunc

" slctd str __ pad

func! Slctd__pad(char) range abort

  let l:char = a:char

  if l:char == '|'
    let l:char = "\<bar>"
  endif

  call Slct_re()

  call Normal('r' . l:char)

  call Slct_re()
endfunc

func! Slctd__pad_space() range abort

  call Slctd__pad(' ')
endfunc

func! Slctd__pad_bar() range abort

  call Slctd__pad('|')
endfunc

func! Slctd_str_space__underscore() range abort

  call Slctd_str__rpl(' ', '_')
endfunc

" slctd str cnd

func! Is_slctd_str__srch_str() abort

  return v:lua.v.Is_slctd_str__srch_str()

  " if Slctd_str() ==# @/
  "   return v:true
  " else
  "   return v:false
  " endif
endfunc

func! Is_slctd_str__line_mlt() abort

  " return v:lua.v.Is_slctd_str__line_mlt()

  if Slctd_str() =~ '\n'
    return v:true
  else
    return v:false
  endif
endfunc

" slctd str edge

func! Slctd_str_edge_l_col() abort

  call Cursor__mv_slctd_edge_l()
  
  let l:col = Cursor_col_num()
  return l:col
endfunc

func! Slctd_str_edge_r_col() abort

  call Slctd_cursor__mv_slctd_edge_r()
  
  let l:col = Cursor_col_num()
  return l:col
endfunc

func! Slctd_str_edge_l_pos() abort

  call Cursor__mv_slctd_edge_l()
  let l:pos = Cursor_pos()
  return l:pos
endfunc

func! Slctd_str_edge_r_pos() abort

  call Slctd_cursor__mv_slctd_edge_r()
  let l:pos = Cursor_pos()
  return l:pos
endfunc

func! Slctd_str_edge_l_char() abort

  call Cursor__mv_slctd_edge_l()

  let l:c_char = Cursor_c_char()
  return l:c_char
endfunc

func! Slctd_str_edge_r_char() abort

  call Slctd_cursor__mv_slctd_edge_r()

  let l:c_char = Cursor_c_char()
  return l:c_char
endfunc

func! Slctd_str_edge_l_out_char() abort

  call Cursor__mv_slctd_edge_l()

  let l:l_char = Cursor_l_char()
  return l:l_char
endfunc

func! Slctd_str_edge_r_out_char() abort

  call Slctd_cursor__mv_slctd_edge_r()

  let l:r_char = Cursor_r_char()
  return l:r_char
endfunc

func! Slctd_str_edge_l_out_str() abort

  call Cursor__mv_slctd_edge_l()

  let l:str = Cursor_line_str_side_l()
  return l:str
endfunc

func! Slctd_str_edge_r_out_str() abort

  call Slctd_cursor__mv_slctd_edge_r()

  let l:str = Cursor_line_str_side_r()
  return l:str
endfunc

" slctd str edge __ ( edit )

func! Slctd_str_edge_out__ins(c) range abort

  call Slct_re()

  if a:firstline != a:lastline
    call Slctd__cancel()
    return
  endif

  let l:c_l = a:c

  let l:c_r = a:c
  if     a:c == '('
    let l:c_r = ')'
  elseif a:c == '{'
    let l:c_r = '}'
  elseif a:c == '['
    let l:c_r = ']'
  elseif a:c == '<'
    let l:c_r = '>'
  endif

  call Normal('"zx')
  call Cursor__ins(l:c_l . l:c_r)

  let l:str_len = Str_len(l:c_l)
  call Normal(l:str_len . 'h')

  call Normal('"zP')
  call Normal('gv')

  let l:cnt = 0
  while l:cnt < l:str_len
    call Slctd_box__mv('r')

    let l:cnt += 1
  endwhile
endfunc

func! Slctd_str_edge_out__ins_markdown_strikethrough()

  call Slct_re()

  if a:firstline != a:lastline
    call Slctd__cancel()
    return
  endif

  call Slctd_str_edge_out__ins('~~')
endfunc

func! Slctd_str_edge_out__ins_markdown_bold()

  call Slctd_str_edge_out__ins('**')
endfunc

func! Slctd_str_edge_out_char__tgl() range abort

  call Slctd_str_edge_out_char__tgl_swtch()
endfunc

func! Slctd_str_edge_out_char__tgl_swtch() range abort

  " char chk
  let l:c_l = Slctd_str_edge_l_out_char()
  let l:c_r = Slctd_str_edge_r_out_char()
  " echo l:c_l l:c_r

  if     l:c_l == "'" && l:c_l == l:c_r
    call Slctd_str_edge_out_quote__tgl()
  elseif l:c_l == '"' && l:c_l == l:c_r
    call Slctd_str_edge_out_quote__tgl()
  elseif l:c_l == '`' && l:c_l == l:c_r
    call Slctd_str_edge_out_quote__tgl()

  elseif l:c_l == '(' && l:c_r == ')'
    call Slctd_str_edge_out_bracket__tgl()
  elseif l:c_l == '{' && l:c_r == '}'
    call Slctd_str_edge_out_bracket__tgl()
  elseif l:c_l == '[' && l:c_r == ']'
    call Slctd_str_edge_out_bracket__tgl()
  elseif l:c_l == '<' && l:c_r == '>'
    call Slctd_str_edge_out_bracket__tgl()

  else
    call Slctd_str_edge_out_quote__tgl()
  endif
endfunc

func! Slctd_str_edge_out_quote__tgl() range abort

  call Slct_re()

  if a:firstline != a:lastline
    return
  endif

  if Is_cursor_col__line_end()
    return
  endif

  " char chk
  let l:c_l = Slctd_str_edge_l_out_char()
  let l:c_r = Slctd_str_edge_r_out_char()
  " echo l:c_l l:c_r

  if     l:c_l == "'" && l:c_l == l:c_r

    call Slctd_str_edge_out_char__del()
    let l:c = '"'
    call Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '"' && l:c_l == l:c_r

    call Slctd_str_edge_out_char__del()
    let l:c = '`'
    call Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '`' && l:c_l == l:c_r

    call Slctd_str_edge_out_char__del()
  else
    let l:c = "'"
    call Slctd_str_edge_out__ins(l:c)
  endif
endfunc

func! Slctd_str_edge_out_bracket__tgl() range abort

  call Slct_re()

  if a:firstline != a:lastline
    return
  endif

  if Is_cursor_col__line_end()
    return
  endif

  " char chk
  let l:c_l = Slctd_str_edge_l_out_char()
  let l:c_r = Slctd_str_edge_r_out_char()
  " echo l:c_l l:c_r

  if     l:c_l == '(' && l:c_r == ')'

    call Slctd_str_edge_out_char__del()
    let l:c = '{'
    call Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '{' && l:c_r == '}'

    call Slctd_str_edge_out_char__del()
    let l:c = '['
    call Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '[' && l:c_r == ']'

    call Slctd_str_edge_out_char__del()
    let l:c = '<'
    call Slctd_str_edge_out__ins(l:c)

  elseif l:c_l == '<' && l:c_r == '>'

    call Slctd_str_edge_out_char__del()
  else
    let l:c = '('
    call Slctd_str_edge_out__ins(l:c)
  endif
endfunc

func! Slctd_str_edge_out__tgl_shft() range abort

  call Slct_re()

  if a:firstline != a:lastline
    return
  endif

  if Is_cursor_col__line_end()
    return
  endif

  " char chk
  let l:c_l = Slctd_str_edge_l_out_char()
  let l:c_r = Slctd_str_edge_r_out_char()
  " echo l:c_l l:c_r

  if     Is_char_pair__quote(l:c_l, l:c_r)
    call Slctd_str_edge_out_char__del()
    call Slctd_str_edge_out_bracket__tgl()

  elseif Is_char_pair__bracket(l:c_l, l:c_r)
    call Slctd_str_edge_out_char__del()
    call Slctd_str_edge_out_quote__tgl()

  else
    call Slctd_str_edge_out_bracket__tgl()
  endif
endfunc

func! Slctd_str_edge_out_char__del() range abort

  call Slct_re()

  if Is_slctd_str_edge_l_col__line_top()
    return
  endif

  call Normal('"zx')
  call Normal('xhx')
  call Normal('"zP')
  call Normal('gv')
  call Slctd_box__mv('l')
endfunc

" slctd str edge cnd

func! Is_slctd_str_edge_char__(ptn)

  let l:c1 = Slctd_str_edge_l_char()
  let l:c2 = Slctd_str_edge_r_char()

  let l:ret = Is_char_pair__(a:ptn, l:c1, l:c2)
  return l:ret
endfunc

func! Is_slctd_str_edge_char__quote() abort

  let l:ret = Is_slctd_str_edge_char__(g:quote_ptn)
  return l:ret
endfunc

func! Is_slctd_str_edge_out_char__(ptn)

  let l:c1 = Slctd_str_edge_l_out_char()
  let l:c2 = Slctd_str_edge_r_out_char()

  let l:ret = Is_char_pair__(a:ptn, l:c1, l:c2)
  return l:ret
endfunc

func! Is_slctd_str_edge_out_char__quote() abort

  let l:ret = Is_slctd_str_edge_out_char__(g:quote_ptn)
  return l:ret
endfunc

func! Is_slctd_str_edge_l_col__line_top() range abort

  let l:ret = v:false

  call Slct_re()

  call Cursor__mv_slctd_edge_tgl()
  let l:cursor_l_pos = Cursor_pos()
  " echo l:cursor_l_pos

  call Cursor__mv_slctd_edge_tgl()

  if l:cursor_l_pos[2] == 1 " col
    let l:ret = v:true
  endif

  return l:ret
endfunc

" slctd line

func! Slctd_line_7_opn_app() range abort

  for line_num in range(a:firstline, a:lastline)

    call Opn_app_by_line_path(l:line_num)
  endfor
endfunc

" slctd line __ ( edit )

func! Slctd_line__del() abort " use not, todo dev

  call Normal('gvj')
  "call Normal('"ad')

  call Clp__ynk()
endfunc

" todo refactoring, fnc name mod, v > slctd

" slctd line __ rpl

func! Slctd_line__rpl(srch, rpl) range abort

  let l:cmd = g:v_rng . 's/' . a:srch . '/' . a:rpl . '/g'
  "echo l:cmd
  call Exe(l:cmd)
endfunc

func! Slctd_line__rpl_by_line1_line2() range abort

  let l:srch = getline(1)
  let l:rpl  = getline(2)

  "let l:rng = '3,$'
  let l:rng = g:v_rng
  let l:cmd = l:rng . 's/' . l:srch . '/' . l:rpl . '/g'
  "echo l:cmd
  call Exe(l:cmd)
endfunc

func! Slctd_line__rpl_sys_cmd(sys_cmd) range abort " read

  let l:cmd = "'<,'>" . " ! " . a:sys_cmd
  call Exe(l:cmd)
endfunc

func! Slctd_line_srch_str__rpl_cr() range abort

  let l:srch = @/

  let l:cmd = g:v_rng . 's/\(' . l:srch . '\)/\1\r/g'
  call Exe(l:cmd)
endfunc

func! Slctd_line__markdown_strikethrough() range abort " todo dev

endfunc

func! Slctd__sys_cmd(sys_cmd) range abort

  let l:cmd = g:v_rng . '! ' . a:sys_cmd
  call Exe(l:cmd)
endfunc

func! Slctd_line_top_space__del() abort " refactoring ?

  let l:rpl_cmd = 's/' . s:line_top_space_ptn . '//g'
  call Exe(l:rpl_cmd)
endfunc

func! Slctd_line_end_space__del() range abort

  for line_num in range(a:firstline, a:lastline)

    call Line_end_space__del(l:line_num)
  endfor
endfunc

func! Slctd_line_end__pad_space() range abort " use not

  " use recommend "aygvr gv

  call Slct_re()
  call Normal('o')

  let l:fil_end_col = Cursor_col_num() - 1

  for line_num in range(a:firstline, a:lastline)

    call Line_end__pad_space(l:line_num, l:fil_end_col)
  endfor
endfunc

func! Slctd_line__join_per_line(per_line_num) range abort

  let l:n_cmd = a:per_line_num . 'Jj'

  let l:line_num = a:lastline - a:firstline + 1

  let l:exe_num = l:line_num / a:per_line_num
  "echo l:exe_num

  for idx in range(1, l:exe_num)

    call Normal(l:n_cmd)
  endfor
endfunc

func! Slctd_line_indnt__space(indnt_col) range abort

  if Is_env__('win64')
    '<,'>:call Slctd_line_tab__rpl_space(a:indnt_col)

  else
    let l:sys_cmd = '  expand   -t ' . a:indnt_col
    '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
  endif
endfunc

func! Slctd_line_indnt__tab(indnt_col) range abort

  if Is_env__('win64')
    call Nothing()
  else
    let l:sys_cmd = 'unexpand   -t ' . a:indnt_col
    '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
  endif
endfunc

" slctd line tab

func! Slctd_line_tab__rpl_space(space_col) range abort

  let l:space_str = Str_space(a:space_col)
  let l:cmd = g:v_rng . 's/\t/' . l:space_str . '/g'
  call Exe(l:cmd)
endfunc

" slctd line indnt __ shft

func! Slctd_indnt__shft_l() abort " todo

endfunc

func! Slctd_indnt__shft_r() abort " todo

endfunc

" slctd line __ crct tbl

func! Slctd_line__crct_tbl() range abort

  if     Is_env__('linux')
    let l:sys_cmd = '/usr/bin/column -t'
  elseif Is_env__('mac')
    let l:sys_cmd = 'column -t'
  else
    let l:sys_cmd = 'column -t'
  endif

  '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
endfunc

" markdown tbl header

func! Slctd_line__cnv_markdown_tbl_header() range abort " ??

  '<,'>:call Slctd_line__rpl('[^|]', '-')
  '<,'>:call Slctd_line__rpl( '|.',  '| ')
  '<,'>:call Slctd_line__rpl('.|' , ' |' )
endfunc

" slctd line mb

func! Slctd_line_mb__cnv() range abort

  let l:sys_cmd = 'mb__cnv'
  '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
endfunc

" slctd box __ mv

func! Slctd_box__mv(lr) range abort

  call Slct_re()

  let l:n_cmd = Char_lr_2_normal_cmd(a:lr)
  call Normal('o' . l:n_cmd)
  call Normal('o' . l:n_cmd)
endfunc

func! Slctd_box_width__1() range abort

  call Slct_re()

  if ! Is_slctd_mode__box()
    return
  endif

  call Normal('o')
  let l:col_num = Cursor_col_num()

  call Normal('o')
  call Cursor__mv_by_col_num(l:col_num)
endfunc

func! Slctd_box_str__mv(lr) range abort

  let l:n_cmd = Char_lr_2_normal_cmd(a:lr)

  call Slct_re()
  call Normal('"zx')
  call Normal(l:n_cmd)
  call Normal('"zP')

  call Slct_re()
  call Slctd_box__mv(a:lr)
endfunc

" slctd box __ ( edit )

func! Slctd_box_edge_l__ynk_line_1() range abort

  if @a =~ '\n'
    echo 'yank is include cr'
    return
  endif

  call Slct_re()

  if Is_cursor_col__line_end()
    call Slctd__pad_space()

    call Slctd__del()
    " call Normal('"zdgv') " see
  endif

  call Cursor__mv_slctd_edge_l()
  call Esc()
  " call Normal("\<esc>")

  " let l:col_num = Cursor_col_num()

  for line_num in range(a:firstline, a:lastline)

    let l:col_num = Cursor_col_num()

    call Cursor__ins_ynk()

    call Cursor__mv_by_line_col(l:line_num, l:col_num)
    call Cursor__mv_d()
    " if l:line_num != a:lastline
    "   call Normal('j')
    " endif
  endfor
endfunc

" slctd box __ rpl

func! Slctd_box__rpl(srch, rpl) range abort

  let l:srch = a:srch
  let l:rpl  = a:rpl

  let l:cmd = g:v_rng . 's/' . '\%V' . l:srch . '/' . l:rpl . '/g'
  call Exe(l:cmd)
endfunc

" slctd box space __ del

func! Slctd_box_space__del() range abort

  let l:srch = ' '
  let l:rpl  = ''

  '<,'>:call Slctd_str__rpl(srch, rpl)
endfunc

" slctd box char __ shft

func! Slctd_box_edge_r_char__shft_in() range abort

  let l:cmd = g:v_rng . 's/' . '\%V\([ ]\+\)\([^ ]\)' . '/' . '\2\1' . '/g'
  call Exe(l:cmd)

  call Slct_re()
endfunc

func! Slctd_box_cursor_r_space__crct() range abort

  call Slct_re()
  let l:col = Cursor_col_num()
  " echo l:col
  call Slctd__cancel()

  " echo a:firstline . ' ' . a:lastline
  call Cursor__mv_by_line_col(a:firstline, l:col)

  for line_num in range(a:firstline, a:lastline)
    " echo l:line_num . ' ' . l:col
    " call Cursor__mv_by_line_col(l:line_num, l:col)

    call Cursor_f_space__del()
    " call Normal('j')
    call Cursor__mv_d()
  endfor
endfunc

func! Is_slctd_mode__box() range abort

  return v:lua.v.Is_slctd_mode__box()

  " " call Slct_re()
  " 
  " let l:ret = v:false
  " 
  " if mode() == "\<c-v>"
  "   " echo "c-v"
  "   let l:ret = v:true
  " endif
  " return l:ret
endfunc

func! Is_slctd_mode__line() range abort

  return v:lua.v.Is_slctd_mode__line()

  " " call Slct_re()
  " 
  " let l:ret = v:false
  " 
  " if mode() == "v"
  "   " echo "v"
  "   let l:ret = v:true
  " endif
  " return l:ret
endfunc

" slctd etc

func! Slctd_srch__swtch() abort " srch, set or run

  " return v:lua.v.Slctd_srch__swtch()

  if Is_slctd_str__line_mlt()
  
    call Slctd_str__expnd_srch()
  else
    call Srch_str__slctd_str()
  endif
endfunc

" 
" ynk
" 

func! Ynk__clr() abort

  return v:lua.v.Ynk__clr()

  " let @a = ''
endfunc

func! Ynk__(str) abort

  return v:lua.v.Ynk__(a:str)

  " let @a = a:str
endfunc

func! Ynk__line() abort

  call Normal('"ayy')
  "l:line_str = Cursor_line_str()
  "let @a = l:line_str

  call Clp__ynk()
endfunc

func! Ynk__line_all() abort

  let l:cmd = '%y' " todo rgstr a direct
  call Exe(l:cmd)

  let @a = @0
  call Clp__ynk()
endfunc

func! Ynk__buf_file_path() abort
  
  let l:path = Buf_file_path()

  let @a = l:path
  call Clp__ynk()
endfunc

func! Ynk__clp() abort

  return v:lua.v.Ynk__clp()

  " let @a = @+
endfunc

func! Ynk__slctd() abort

  return v:lua.v.Ynk__slctd()

  " let @e = @d
  " let @d = @c
  " let @c = @b
  " let @b = @a
  " 
  " call Normal('gv"ay')
  " call Clp__ynk()
endfunc

func! Ynk__add_slctd() abort

  return v:lua.v.Ynk__add_slctd()

  " call Normal('gv"Ay')
  " call Clp__ynk()
endfunc

func! Ynk__by_rgstr_info(rgstr_info) abort
  
  let l:rgstr = Rgstr_info_rgstr(a:rgstr_info)
  let l:scrpt = 'let @a = @' . l:rgstr
  execute(l:scrpt)
endfunc

" clp

func! Clp__ynk() abort

  return v:lua.v.Clp__ynk()

  " if Is_env__('linux')
  " 
  "   "call C9clp__ynk() " off
  " 
  " else
  "   let @+ = @a
  " endif
endfunc

" 
" srch
" 

" srch exe, ref: cursor __ mv srch ptn

func! Srch_or(...) abort

  let l:str = '\(' . join(a:000, '\|') . '\)'
  "echo l:str

  let @/ = l:str
  call Cursor__mv_srch('f')
endfunc

func! Srch_str() abort

  return v:lua.v.Srch_str()

  " let l:str = @/
  " return l:str
endfunc

func! Srch_str_flt() abort

  let l:str = @/

  if Is_srch__word1()
    let l:str = strcharpart(l:str, 2, strchars(l:str) - 4)
  endif
  " echo l:str

  return l:str
endfunc

func! Srch_str_word1(str) abort

  if a:str == v:null
    let l:str = Srch_str_flt()
  else
    let l:str = a:str
  endif

  let l:str = '\<' . l:str . '\>'
  return l:str
endfunc

" srch str __

func! Srch_str__(str, op_word1) abort

  let l:exe_str = a:str

  let l:exe_str = escape(l:exe_str, '.*~[]\^$')

  let l:exe_str = substitute(l:exe_str, '\n', '\\n', 'g')
  " echo l:exe_str

  if a:op_word1 == v:true
    let l:exe_str = Srch_str_word1(l:exe_str)
  endif

  if "@/" == "l:exe_str" " same ltst 01
    return
  endif

  let @/ = l:exe_str " highlight
  call Normal('/' . l:exe_str) " srch hstry add
endfunc

func! Srch_str__cursor_word() abort

  let l:str = Cursor_word()
  call Srch_str__(l:str, v:false)
endfunc

func! Srch_str__word1_tgl() abort

  let l:str = Srch_str_flt()

  if Is_srch__word1()

    call Srch_str__(l:str, v:false)
  else
    call Srch_str__(l:str, v:true)
  endif
endfunc

func! Srch_str_ltst(idx) abort

  let l:str = histget('/', - a:idx)
  return l:str
endfunc

func! Srch_str__prv_tgl() abort

  if @/ == Srch_str_ltst(1)

    if            Srch_str_ltst(1)        == '\<' . Srch_str_ltst(2) . '\>'
      let l:srch_str = Srch_str_ltst(3)

    elseif '\<' . Srch_str_ltst(1) . '\>' ==        Srch_str_ltst(2)

      let l:srch_str = Srch_str_ltst(3)
    else
      let l:srch_str = Srch_str_ltst(2)
    endif
  else
    let l:srch_str = Srch_str_ltst(1)
  endif

  let @/ = l:srch_str
endfunc

func! Srch_str__slctd_str() range abort

  if Is_slctd_str__srch_str()
    call Slctd__cancel()
    return
  endif

  call Slct_re()

  let l:str = Slctd_str()
  call Srch_str__(l:str, v:false)
  call Slctd__cancel()
endfunc

func! Srch_slct(drct) abort

  if     a:drct == 'f'
    call Normal('gn')

  elseif a:drct == 'b'
    call Normal('gN')
  endif
endfunc

" dev anchor refactoring fnc name re ?
func! Slctd_srch_7_slctd__srch_nxt(drct) abort " srch rpl skip

  if     a:drct == 'f'
    call Normal('`>lgn')

  elseif a:drct == 'b'
    call Normal('`<hgN')
  endif
endfunc

func! Srch_7_cursor__mv_srch_str_end_o() abort

  let l:drct = 'f'
  call Srch_slct(l:drct)
  call Esc()
  " call Normal("\<esc>")
  call Esc()
  call Cursor__mv_char_f()
endfunc

func! Srch_char(drct, char) abort

  let @/ = '[' . a:char . ']'
  call Cursor__mv_srch(a:drct)
endfunc

func! Srch_char_bracket(drct) abort

  let l:char_bracket = "'" . '")}\]'
  call Srch_char(a:drct, l:char_bracket)
endfunc

func! Srch_str__h_swtch() abort

  return v:lua.v.Srch_str__h_swtch()
endfunc

func! Srch_str__markdown_h() abort

  return v:lua.v.Srch_str__markdown_h()

  " let @/ = '^#\+ '
endfunc

func! Srch_str__fnc() abort

  return v:lua.v.Srch_str__fnc()

  " let @/ = '^func'
endfunc

" srch cnd

func! Is_srch__word1() abort

  return v:lua.v.Is_srch__word1()

  " let l:str = @/
  " let l:ret = v:false
  " 
  " let l:str_l = strcharpart(l:str, 0, 2)
  " let l:str_r = strcharpart(l:str, strchars(l:str) - 2)
  " 
  " if l:str_l == '\<' && l:str_r == '\>'
  "   let l:ret = v:true
  " endif
  " 
  " return l:ret
endfunc

" markdown cnd

func! Is_line_markdown_itm() abort

  return v:lua.v.Is_line_markdown_itm()

  " let l:ptn = '^\s*- '
  " let l:str = Cursor_line_str()
  " let l:idx = Str_srch(l:str, l:ptn)
  " 
  " if l:idx == -1
  "   return v:false
  " else
  "   return v:true
  " endif
endfunc

" complete  -  mode insert ins lst

func! I_symbol01() abort

  return v:lua.v.I_symbol01()

  " let l:lst = [ '$', '@', '#', ';', '%' ]
  " call complete(col('.'), l:lst)
  " return ''
endfunc

func! I_symbol02() abort

  return v:lua.v.I_symbol02()

  " let l:lst = [ '?', '!', '~', '^', '&', '|', '\', '/' ]
  " call complete(col('.'), l:lst)
  " return ''
endfunc

func! I_symbol03() abort

  return v:lua.v.I_symbol03()

  " let l:lst = [ '=', '+', '-' ]
  " call complete(col('.'), l:lst)
  " return ''
endfunc

func! I_bracket() abort

  return v:lua.v.I_bracket()

  " let l:lst = [ '()', '{}', '[]', '<>', '[]()', '[][]', '(){}' ]
  " call complete(col('.'), l:lst)
  " return ''
endfunc

func! I_quote() abort

  return v:lua.v.I_quote()

  " let l:lst = [ "''", '""', '``' ]
  " call complete(col('.'), l:lst)
  " return ''
endfunc

func! I_markdown_lnk() abort

  return v:lua.v.I_markdown_lnk()

  " let l:lst = [ '[]()', '[][]', '![]()' ]
  " call complete(col('.'), l:lst)
  " return ''
endfunc

func! I_week() abort

  return v:lua.v.I_week()

  " call complete(col('.'), g:week_def)
  " return ''
endfunc

func! I_num() abort

  return v:lua.v.I_num()

  " let l:lst = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ]
  " call complete(col('.'), l:lst)
  " return ''
endfunc

func! I_reg() abort

  return v:lua.v.I_reg()

  " call complete(col('.'), [@0, @1, @2, @3])
  " return ''
endfunc

func! I_todo_status() abort

  return v:lua.v.I_todo_status()

  " let l:lst = [ 'done', 'doing', 'on hold' ]
  " call complete(col('.'), l:lst)
  " return ''
endfunc

func! I_reserved_lua() abort

  return v:lua.v.I_reserved_lua()

  " call complete(col('.'), [
  " \   'end',
  " \   'local',
  " \   'return',
  " \   'if elseif else end',
  " \   'for key, val in pairs() do end',
  " \   'function'
  " \ ])
  " return ''
endfunc

func! Cursor__ins_rgstr_by_rgstr_info(rgstr_info) abort

  return v:lua.v.Cursor__ins_rgstr_by_rgstr_info(a:rgstr_info)

  " let l:rgstr = Rgstr_info_rgstr(a:rgstr_info)
  " call Normal('"' . l:rgstr . l:rgstr . 'P')
endfunc

func! Rgstr_info_rgstr(rgstr_info) abort

  return v:lua.v.Rgstr_info_rgstr(a:rgstr_info)

  " let l:rgstr = strcharpart(a:rgstr_info, 6, 1)
  " return l:rgstr
endfunc

" 
" rg
" 

func! Rg_rslt_line_parse(line) abort

  let l:dlm = ':'
  let l:ret = split(a:line, l:dlm)
  "echo l:ret

  let l:idx = 0
  while l:idx < len(l:ret)

    let l:ret[l:idx] = trim(l:ret[l:idx])

    let l:idx = l:idx + 1
  endwhile

  if ( len(l:ret) > 1 ) && ( ! Is_char__num(l:ret[1]) )
    let l:ret[1] = '1'
  endif

  return l:ret
endfunc

let g:fzf_rg_opt = ''
\     . ' --color=always'
\     . ' --line-number'
\     . ' --smart-case'
\     . ' --no-multiline'
\     . ' --no-heading'
\     . ' --hidden'

func! Rg_cmd(ptn, ext, word1, opt) abort

  if a:ptn == v:null
    let l:ptn = ''
  else
    let l:ptn = a:ptn
  endif

  if a:ext == v:null
    let l:fzf_rg_opt_ext = ''
  else
    let l:fzf_rg_opt_ext = ' -g "*.' . a:ext . '"'
  endif

  if a:word1 == v:true
    let l:fzf_rg_opt_word1 = ' -w'
  else
    let l:fzf_rg_opt_word1 = ''
  endif

  if a:opt == v:null
    let l:opt = ''
  else
    let l:opt = ' ' . a:opt
  endif

  let l:rg_cmd = 'rg '
  \     . g:fzf_rg_opt
  \     . l:fzf_rg_opt_ext
  \     . l:fzf_rg_opt_word1
  \     . l:opt
  \     . ' -- ' . '"' . escape(l:ptn, '().$') . '"'

  return l:rg_cmd
endfunc

let g:rg_emp_line_ptn  = '^[ \t]*$'
let g:rg_some_line_ptn = '^[^ \t]+$'
" let g:rg_some_line_ptn = '[^ \t]'

func! Rg_ptn_cnt(ptn, opt) abort

  if a:opt == v:null
    let l:opt = ''
  else
    let l:opt = a:opt
  endif

  let l:rg_cmd = "rg " . l:opt . " -e '" . a:ptn . "' | count"
  let l:rg_rslt_cnt = Sys_cmd(l:rg_cmd)
  return l:rg_rslt_cnt
endfunc

func! Rg_all_cnt() abort

  let l:ptn = g:rg_emp_line_ptn
  let l:opt = '-v'

  let l:rg_rslt_cnt = Rg_ptn_cnt(l:ptn, l:opt)
  return l:rg_rslt_cnt
endfunc

func! Rg_all_rslt_ar() abort

  let l:ptn = g:rg_emp_line_ptn
  let l:opt = '-v'

  let l:rslt_ar = Rg_ptn_rslt_ar(l:ptn, l:opt)
  return l:rslt_ar
endfunc

func! Rg_ptn_rslt_ar(ptn, opt) abort

  let l:rg_rslt_txt = Rg_ptn_rslt_txt(a:ptn, a:opt)
  let l:rg_rslt_ar  = split(l:rg_rslt_txt, "\n")
  return l:rg_rslt_ar
endfunc

func! Rg_ptn_rslt_txt(ptn, opt) abort
  
  let l:rg_cmd = Rg_cmd(a:ptn, v:null, v:null, a:opt) " todo dev
  let l:r_rslt_txt = Sys_cmd(l:rg_cmd)
  return l:r_rslt_txt
endfunc

func! Jmplst() abort

  let l:jmplst_tmp = getjumplist()[0]
  "echo l:jmplst_tmp

  let l:buf_num_key_prefix = 'key_'
  let l:jmplst = {}
  for _jmplst_tmp in l:jmplst_tmp

    let l:_buf_num_key = l:buf_num_key_prefix . l:_jmplst_tmp['bufnr']

    if ! has_key(l:jmplst, l:_buf_num_key)
      let l:jmplst[l:_buf_num_key] = []
    endif

    call add(l:jmplst[l:_buf_num_key], l:_jmplst_tmp)
  endfor

  for _buf_num_key in keys(l:jmplst)

    call sort(l:jmplst[l:_buf_num_key], 'Jmplst_cmp')
  endfor

  let l:buf_num_key = l:buf_num_key_prefix . Buf_num()
  let l:r_jmplst    = get(l:jmplst, buf_num_key, [])
  "echo l:r_jmplst

  return l:r_jmplst
endfunc

func! Jmplst_line_info() abort

  let l:jmplst = Jmplst()

  let l:jmplst_line_info = []
  for _jmplst in l:jmplst

    let l:line_num  = l:_jmplst['lnum']
    let l:line_info = l:line_num . ' ' . getline(l:line_num)
    call add(l:jmplst_line_info, l:line_info)
  endfor
  "echo l:jmplst_line_info

  return l:jmplst_line_info
endfunc

func! Jmplst_cmp(jmplst1, jmplst2) abort

  if     a:jmplst1['lnum'] >  a:jmplst2['lnum']
    let l:ret =  1
  elseif a:jmplst1['lnum'] == a:jmplst2['lnum']
    let l:ret =  0
  else
    let l:ret = -1
  endif

  return l:ret
endfunc

" 
" doc-tech
" 

let g:doc_tech_dir_rel = 'wrk/prj-pri/doc-tech-ds/docs/md'

func! Doc_tech_tag_jmp(str) abort

  let l:str = $HOME . '/' . g:doc_tech_dir_rel . '/' . a:str
  " echo l:str
  call Tag_jmp_by_str(l:str)
endfunc

" mark

let g:mark_alph_def = [
\   'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
\   'o','p','q','r','s','t','u','v','w','x','y','z'
\ ]

func! Mark_show_tgl() abort
  
  if exists('g:mark_show_flg') == 0
    
    let g:mark_show_flg = v:false
  endif
  
  if ! g:mark_show_flg
    
    exe 'DoShowMarks'
    let g:mark_show_flg = v:true
  else
    exe 'NoShowMarks'
    let g:mark_show_flg = v:false
  endif
endfunc

func! Mark_lst() abort
  
  let l:mark = []
  for _mark in bufname()->getmarklist()
    
    let l:_alph = l:_mark['mark'][1]
    
    if count(g:mark_alph_def, l:_alph) == 0
      continue
    endif
    
    let l:mark = add(l:mark, l:_mark['mark'][1])
  endfor
  "echo l:mark
  return l:mark
endfunc

func! Mark_alph_line() abort
  
  let l:line_c = line('.')
  
  for _mark in bufname()->getmarklist()
    
    let l:_alph = l:_mark['mark'][1]
    
    if count(g:mark_alph_def, l:_alph) == 0
      continue
    endif
    
    if l:_mark['pos'][1] == l:line_c
      "echo l:_alph
      return l:_alph
    endif
  endfor
  return ''
endfunc

func! Mark_tgl() abort
  
  let l:alph = Mark_alph_line()
  "echo 'Mark_tgl ' . l:alph
  
  "if l:alph == ''
  if Is_str__emp(l:alph)
    call Mark_add()
  else
    call Mark_del(l:alph)
  endif
  
  call Exe('DoShowMarks')
endfunc
  
func! Mark_add() abort
  
  let l:alph = Mark_alph_useabl()
  call Exe('mark ' . l:alph)
endfunc

func! Mark_alph_useabl() abort
  
  let l:mark = Mark_lst()
  
  for _alph in g:mark_alph_def
    if count(l:mark, _alph) == 0
      "echo _alph
      return _alph
    endif
  endfor
  
  echo 'use alph all'
  return ''
endfunc

func! Mark_del(alph) abort
  
  call Exe('delmark ' . a:alph)
endfunc

func! Mark_del_all() abort
  
  call Exe('delmark!')
  call Exe('DoShowMarks')
endfunc

" trns

func! Slctd_trns() range abort

  let l:str = Slctd_str()

  let l:str = substitute(l:str, "\n", ' ', 'g')

  if l:str =~ '[^\x01-\x7E]' " mlt byte
    let l:lang = '{ja=en}'
  else
    let l:lang = '{en=ja}'
    "let l:lang = ''
  endif

  let l:str = escape(l:str, "'")
  let l:sys_cmd = 'trans -no-ansi ' . l:lang . " '" . l:str . "'"
  let l:rslt = Sys_cmd(l:sys_cmd)
  echo l:rslt
endfunc

" math

func! Slctd_math() range abort

  let l:str = Slctd_str()
  let l:sys_cmd = 'echo ' . "'" . l:str . "'" . ' | math'
  let l:rslt = Sys_cmd(l:sys_cmd)
  echo l:rslt
  let @a = l:rslt
endfunc

" url encdoe

func! Slctd_url_encode() range abort

  let l:str = Slctd_str()
  let l:sys_cmd = 'url_encode "' . l:str . '"'
  let l:rslt = Sys_cmd(l:sys_cmd)
  "echo l:rslt
  call Cursor__ins(l:rslt)
endfunc

func! Defold_err_cnv() abort

  exe '%s/^ERROR:SCRIPT:/ERROR:SCRIPT:\r/g'
  exe '%s/\/assets\///g'
  exe '%s/^ *//g'
endfunc

" env

func! Is_env__(env) abort " alias

  return v:lua.v.Is_env__(a:env)

  " " a:env : 'mac', 'win64', 'win32', 'wsl', 'linux'
  " 
  " let l:ret = has(a:env)
  " 
  " if a:env != 'mac'
  "   " echo a:env . ' : ' . l:ret
  "   " echo hostname()
  " endif
  " 
  " return l:ret
endfunc

func! Is_nvim() abort " alias

  return v:lua.v.Is_nvim()

  " let l:ret = has('nvim')
  " return l:ret
endfunc


" fnc repeat tmp

func! Repeat_fnc() abort

  return v:lua.v.Repeat_fnc()
endfunc


" 
" index
" 

" - primitive
"   - char
"   - str
"     - str cnd
"   - num
"
" - ar ( list )
" - txt
"
" - vim
"   - basic
"   - dir
"   - file
"   - opn
"   - tag jmp
"   - buf
"   - win
"
" - line
"
" - cursor
"   - cursor pos
"   - cursor col
"   - cursor col cnd
"   - cursor __ ( mv )
"   - cursor __ ( ins )
"     - cursor __ str
"     - cursor __ line
"     - cursor __ sys
"   - cursor char
"   - cursor str
"   -   cursor str __
"   - cursor line
"
" - slctd
"   - slctd cursor
"     - slctd cursor __ mv
"     - slctd cursor cnd
"   - slctd str
"     - slctd __ ( expnd )
"     - slctd str cnd
"     - slctd str edge
"       - slctd str edge cnd
"   - slctd line
"     - slctd line __ ( edit )
"     - slctd line indnt
"     - slctd line markdown
"     - slctd line sys
"   - slctd box
"     - slctd box __ ( mv )
"     - slctd box __ ( edit )
"     - slctd box edge
"       - slctd box edge cnd
"   - slctd mode
"     - slctd mode cnd
"   - slctd etc
"
" - ynk
"   - rgstr
" - srch
"   - srch cnd
"
" - complete
" - env
" - plugin
" - fzf
" - rg
" - jmplst
" - mark


