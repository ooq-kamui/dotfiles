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

func! Str_srch_idx(...) abort " alias

  let l:str =                a:1
  let l:ptn =                a:2
  let l:idx = ( a:0 >= 3 ) ? a:3 : v:null

  return v:lua.v.Str_srch_idx(l:str, l:ptn, l:idx)
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

  return v:lua.v.Idx__icl(a:idx, a:ar_len)

  " let l:r_idx = a:idx + 1
  " 
  " if r_idx >= a:ar_len
  "   let l:r_idx = 0
  " endif
  " 
  " return l:r_idx
endfunc

func! Idx__dcl(idx, ar_len) abort

  return v:lua.v.Idx__dcl(a:idx, a:ar_len)

  " let l:r_idx = a:idx - 1
  " 
  " if r_idx < 0
  "   let l:r_idx = a:ar_len - 1
  " endif
  " 
  " return l:r_idx
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

  return v:lua.v.Cmd(a:cmd)
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

  let l:ret = v:lua.v.Sys_cmd(a:sys_cmd)
  return l:ret
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

  return v:lua.v.Tag_jmp_by_str(a:rg_rslt_line)
endfunc

func! Tag_jmp_by_cursor_line() abort

  return v:lua.v.Tag_jmp_by_cursor_line()
endfunc

func! Tag_jmp_by_slctd_line() range abort

  return v:lua.v.Tag_jmp_by_slctd_line()
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

  return v:lua.v.Buf__fltr()
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

  return v:lua.v.Win_splt__quit()
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

  return v:lua.v.Cursor__mv_word_f()
endfunc

func! Cursor__mv_word_b() abort

  return v:lua.v.Cursor__mv_word_b()
endfunc

func! Cursor__mv_word_dlm_f() abort

  return v:lua.v.Cursor__mv_word_dlm_f()
endfunc

func! Cursor__mv_word_b_pre() abort " use not

  return v:lua.v.Cursor__mv_word_b_pre()
endfunc

func! Cursor__mv_fnc_name() abort

  return v:lua.v.Cursor__mv_fnc_name()
endfunc

func! Cursor__mv_u() abort " alias

  return v:lua.v.Cursor__mv_u()
endfunc

func! Cursor__mv_d() abort " alias

  return v:lua.v.Cursor__mv_d()
endfunc

func! Cursor__mv_v(drct) abort

  return v:lua.v.Cursor__mv_v(a:drct)
endfunc

let g:cursor_mv_line_step_dflt = 10

func! Cursor__mv_mlt_u() abort " alias

  return v:lua.v.Cursor__mv_mlt_u()
endfunc

func! Cursor__mv_mlt_d() abort " alias

  return v:lua.v.Cursor__mv_mlt_d()
endfunc

func! Cursor__mv_u_line_end() abort

  return v:lua.v.Cursor__mv_u_line_end()
endfunc

func! Cursor__mv_line_top_or_new_line() abort

  return v:lua.v.Cursor__mv_line_top_or_new_line()
endfunc

func! Cursor__mv_slctd_edge_tgl() range abort

  return v:lua.v.Cursor__mv_slctd_edge_tgl()
endfunc

func! Cursor__mv_slctd_edge_l() range abort

  return v:lua.v.Cursor__mv_slctd_edge_l()
endfunc

func! Cursor__mv_file_edge(n_cmd) abort

  return v:lua.v.Cursor__mv_file_edge(a:n_cmd)
endfunc

func! Cursor__mv_file_edge_bgn() abort " alias

  return v:lua.v.Cursor__mv_file_edge_bgn()
endfunc

func! Cursor__mv_file_edge_end() abort " alias

  return v:lua.v.Cursor__mv_file_edge_end()
endfunc

func! Cursor__mv_v_jmp_char(drct, is_space_through) abort

  return v:lua.v.Cursor__mv_v_jmp_char(a:drct, a:is_space_through)
endfunc

func! Cursor__mv_v_jmp_md_h(drct) abort " todo dev

  return v:lua.v.Cursor__mv_v_jmp_md_h(a:drct)
endfunc

func! Cursor__mv_v_jmp_space(drct) abort

  return v:lua.v.Cursor__mv_v_jmp_space(a:drct)
endfunc

func! Cursor__mv_v_jmp(drct) abort

  return v:lua.v.Cursor__mv_v_jmp(a:drct)
endfunc

func! Cursor__mv_srch_ptn(ptn, dir) range abort

  return v:lua.v.Cursor__mv_srch_ptn(a:ptn, a:dir)
endfunc

func! Cursor__mv_srch(drct) abort

  return v:lua.v.Cursor__mv_srch(a:drct)
endfunc

" cursor __ ins

func! Cursor__ins(str) abort

  return v:lua.v.Cursor__ins(a:str)
endfunc

func! Cursor__ins_with_cursor_fix(str) abort " todo dev

  return v:lua.v.Cursor__ins_with_cursor_fix(a:str)
endfunc

" cursor __ ins ynk ( paste )

func! Cursor__ins_ynk() abort

  return v:lua.v.Cursor__ins_ynk()
endfunc

func! Cursor__ins_clp() abort

  return v:lua.v.Cursor__ins_clp()
endfunc

func! Cursor__ins_mlt(str, num) abort

  return v:lua.v.Cursor__ins_mlt(a:str, a:num)
endfunc

func! Cursor__ins_cr() abort

  return v:lua.v.Cursor__ins_cr()
endfunc

func! Cursor__ins_space(is_cursor_mv) abort

  return v:lua.v.Cursor__ins_space(a:is_cursor_mv)
endfunc

func! Cursor__ins_hyphen() abort

  return v:lua.v.Cursor__ins_hyphen()
endfunc

func! Cursor__ins_tilde() abort

  return v:lua.v.Cursor__ins_tilde()
endfunc

func! Cursor__ins_slash() abort

  return v:lua.v.Cursor__ins_slash()
endfunc

func! Cursor__ins_slashback() abort

  return v:lua.v.Cursor__ins_slashback()
endfunc

func! Cursor__ins_quote() abort

  return v:lua.v.Cursor__ins_quote()
endfunc

func! Cursor__ins_da() abort

  return v:lua.v.Cursor__ins_da()
endfunc

func! Cursor__ins_tm() abort

  return v:lua.v.Cursor__ins_tm()
endfunc

func! Cursor__ins_dt() abort

  return v:lua.v.Cursor__ins_dt()
endfunc

func! Cursor__ins_ts() abort

  return v:lua.v.Cursor__ins_ts()
endfunc

let g:week_def = [ 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' ]

func! Cursor__ins_week() abort

  return v:lua.v.Cursor__ins_week()
endfunc

" cmnt

func! Cursor__ins_cmnt_1(cmd_cursor__mv_line_top) abort

  return v:lua.v.Cursor__ins_cmnt_1(a:cmd_cursor__mv_line_top)
endfunc

func! V_ins_cmnt_1() range abort

  return v:lua.v.V_ins_cmnt_1()
endfunc

func! Cursor__ins_cmnt_mlt_by_pos(pos) abort

  return v:lua.v.Cursor__ins_cmnt_mlt_by_pos(a:pos)
endfunc

func! Cursor__ins_cmnt_mlt() abort

  return v:lua.v.Cursor__ins_cmnt_mlt()
endfunc

func! V_ins_cmnt_mlt() range abort

  return v:lua.v.V_ins_cmnt_mlt()
endfunc

" markdown

func! Cursor__ins_markdown_h() abort

  return v:lua.v.Cursor__ins_markdown_h()
endfunc

func! Cursor__ins_markdown_cr() abort

  return v:lua.v.Cursor__ins_markdown_cr()
endfunc

func! Cursor__ins_markdown_itm() abort

  return v:lua.v.Cursor__ins_markdown_itm()
endfunc

func! Cursor__ins_markdown_code() abort

  return v:lua.v.Cursor__ins_markdown_code()
endfunc

func! Char_markdown_chk__tgl() abort

  return v:lua.v.Char_markdown_chk__tgl()
endfunc

" cursor char

func! Cursor_c_char() abort

  return v:lua.v.Cursor_c_char()
endfunc

func! Cursor_l_char() abort

  return v:lua.v.Cursor_l_char()
endfunc

func! Cursor_r_char() abort

  return v:lua.v.Cursor_r_char()
endfunc

func! Cursor_u_char() abort

  return v:lua.v.Cursor_u_char()
endfunc

func! Cursor_d_char() abort

  return v:lua.v.Cursor_d_char()
endfunc

" cursor char __

func! Cursor_char__rpl(rpl) abort

  return v:lua.v.Cursor_char__rpl(a:rpl)
endfunc

func! Cursor_char__rpl_underscore() abort " alias

  return v:lua.v.Cursor_char__rpl_underscore()
endfunc

func! N_char__tgl_swtch01() abort " todo fnc name mod

  return v:lua.v.N_char__tgl_swtch01()
endfunc

func! N_char__tgl_swtch02() abort

  return v:lua.v.N_char__tgl_swtch02()
endfunc

func! Cursor_char__tgl_type_shift(c) abort

  return v:lua.v.Cursor_char__tgl_type_shift(a:c)
endfunc

func! Cursor_c_char__del() abort

  return v:lua.v.Cursor_c_char__del()
endfunc

func! Cursor_c_char__del_ynk() abort

  return v:lua.v.Cursor_c_char__del_ynk()
endfunc

" cursor char cnd

func! Is_cursor_c_char__ptn(ptn) abort

  return v:lua.v.Is_cursor_c_char__ptn(a:ptn)
endfunc

func! Is_cursor_c_char__space() abort

  return v:lua.v.Is_cursor_c_char__space()
endfunc

func! Is_cursor_c_char__alph() abort

  return v:lua.v.Is_cursor_c_char__alph()
endfunc

" cursor str

" cursor str __

func! Cursor_str__icl() abort

  return v:lua.v.Cursor_str__icl()
endfunc

func! Cursor_str__dcl() abort

  return v:lua.v.Cursor_str__dcl()
endfunc

func! Cursor_str_week__icl() abort

  return v:lua.v.Cursor_str_week__icl()
endfunc

func! Cursor_str_week__dcl() abort

  return v:lua.v.Cursor_str_week__dcl()
endfunc

" cursor etc

func! Cursor_word() abort

  return v:lua.v.Cursor_word()
endfunc

func! Cursor_filepath() abort

  return v:lua.v.Cursor_filepath()
endfunc

" cursor __ ins line

func! Cursor__ins_line(str) abort

  return v:lua.v.Cursor__ins_line(a:str)
endfunc

func! Cursor__ins_line_emp() abort

  return v:lua.v.Cursor__ins_line_emp()
endfunc

func! Cursor__ins_line_buf_file_path() abort

  return v:lua.v.Cursor__ins_line_buf_file_path()
endfunc

func! Cursor__ins_line_anchor() abort

  return v:lua.v.Cursor__ins_line_anchor()
endfunc

func! Cursor_d__ins_line(str) abort

  return v:lua.v.Cursor_d__ins_line(a:str)
endfunc

func! Cursor_d__ins_line_space() range abort

  return v:lua.v.Cursor_d__ins_line_space()
endfunc

" cursor line  -  todo refactoring

func! Cursor_line_num() abort " alias

  return v:lua.v.Cursor_line_num()
endfunc

func! Cursor_line_end_col() abort " alias

  return v:lua.v.Cursor_line_end_col()
endfunc

" cursor line str

func! Cursor_line_str() abort

  return v:lua.v.Cursor_line_str()
endfunc

func! Cursor_line_str_len() abort

  return v:lua.v.Cursor_line_str_len()
endfunc

func! Cursor_line_str_side_l() abort

  return v:lua.v.Cursor_line_str_side_l()
endfunc

func! Cursor_line_str_side_r() abort

  return v:lua.v.Cursor_line_str_side_r()
endfunc

func! Cursor_line_str_side_r_with_c() abort

  return v:lua.v.Cursor_line_str_side_r_with_c()
endfunc

" cursor line str end

" cursor line str __

func! Cursor_line_top0__ins(str) abort

  call Cursor__mv_line_top0()
  call Cursor__ins(a:str)
endfunc

func! Cursor_line_top1__ins(str) abort

  return v:lua.v.Cursor_line_top1__ins(a:str)
endfunc

func! Cursor_line_end__dots_adjst() abort " todo dev, mb_str

  return v:lua.v.Cursor_line_end__dots_adjst()
endfunc

func! Cursor_line_end_dots__crct() abort

  return v:lua.v.Cursor_line_end_dots__crct()
endfunc

func! Cursor_line_end__ins_dots() abort

  return v:lua.v.Cursor_line_end__ins_dots()
endfunc

func! Curosr_line_end__ins(str) abort

  return v:lua.v.Curosr_line_end__ins(a:str)
endfunc

" cursor f

func! Cursor_f_space__del() abort

  return v:lua.v.Cursor_f_space__del()
endfunc

" cursor __ ins line

func! Cursor_line__del() abort

  return v:lua.v.Cursor_line__del()
endfunc

func! Cursor_f_str__crct_by_line_u() abort

  return v:lua.v.Cursor_f_str__crct_by_line_u()
endfunc

func! Cursor_f_str__crct_by_line_d() abort

  return v:lua.v.Cursor_f_str__crct_by_line_d()
endfunc

func! Cursor_f_str__crct_by_line(target_line_drct) abort

  return v:lua.v.Cursor_f_str__crct_by_line(a:target_line_drct)
endfunc

func! Cursor__ins_sys_cmd(sys_cmd) abort " read

  return v:lua.v.Cursor__ins_sys_cmd(a:sys_cmd)
endfunc

" cursor line str __ end

" cursor line cnd

func! Is_cursor_line_num__(line_num) abort

  return v:lua.v.Is_cursor_line_num__(a:line_num)
endfunc

func! Is_cursor_line_num__file_edge_bgn() abort

  return v:lua.v.Is_cursor_line_num__file_edge_bgn()
endfunc

func! Is_cursor_line_num__file_edge_end() abort

  return v:lua.v.Is_cursor_line_num__file_edge_end()
endfunc

func! Is_cursor_line_num__file_edge() abort

  return v:lua.v.Is_cursor_line_num__file_edge()
endfunc

func! Is_cursor_line_str__emp() abort

  return v:lua.v.Is_cursor_line_str__emp()
endfunc

func! Is_cursor_line_str__space() abort

  return v:lua.v.Is_cursor_line_str__space()
endfunc

func! Is_cursor_line_str_side_l__space() abort

  return v:lua.v.Is_cursor_line_str_side_l__space()
endfunc

func! Is_cursor_line_str_side_r__space() abort

  return v:lua.v.Is_cursor_line_str_side_r__space()
endfunc

func! Is_cursor_line_str__ptn(ptn) abort " todo dev

  return v:lua.v.Is_cursor_line_str__ptn(a:ptn)
endfunc

" indnt

func! Cursor_line_indnt_col_with_c() abort

  return v:lua.v.Cursor_line_indnt_col_with_c()
endfunc

func! Cursor_line_indnt__add(col) abort

  return v:lua.v.Cursor_line_indnt__add(a:col)
endfunc

func! Cursor_line_indnt__del() abort " alias

  return v:lua.v.Cursor_line_indnt__del()
endfunc

func! Cursor_line_indnt__shft_l() abort

  return v:lua.v.Cursor_line_indnt__shft_l()
endfunc

func! Cursor_line_indnt__shft_r() abort

  return v:lua.v.Cursor_line_indnt__shft_r()
endfunc

func! Cursor_line_indnt__crct() abort

  return v:lua.v.Cursor_line_indnt__crct()
endfunc

func! Cursor_line_indnt__crct_with_c() abort

  return v:lua.v.Cursor_line_indnt__crct_with_c()
endfunc

let g:v_rng = "'<,'>"

" 
" slctd
" 

" slctd __ ( slct )

func! Slctd__cancel() range abort " alias

  return v:lua.v.Slctd__cancel()
endfunc

" refactoring slct > slctd __ xxx

func! Slct_re() range abort

  return v:lua.v.Slct_re()
endfunc

func! Slctd_str__all() abort

  return v:lua.v.Slctd_str__all()
endfunc

func! Slctd_str__word() abort

  return v:lua.v.Slctd_str__word()
endfunc

func! Slctd__word_by_under_score() abort

  return v:lua.v.Slctd__word_by_under_score()
endfunc

func! Slctd_str__cursor_f_space() abort

  return v:lua.v.Slctd_str__cursor_f_space()
endfunc

func! Slctd_str__by_col_len(s_col, len) abort

  return v:lua.v.Slctd_str__by_col_len(a:s_col, a:len)
endfunc

" refactoring slct > slctd __ xxx

func! Slct_by_pos(s_pos, e_pos) abort " use not

  return v:lua.v.Slct_by_pos(a:s_pos, a:e_pos)
endfunc

" refactoring slct > slctd __ xxx

func! Slct_by_line_col(s_line, s_col, e_line, e_col) abort

  return v:lua.v.Slct_by_line_col(a:s_line, a:s_col, a:e_line, a:e_col)
endfunc

" refactoring slct > slctd __ xxx

func! Slct_by_line_rng(line_num_fr, line_num_to) abort

  return v:lua.v.Slct_by_line_rng(a:line_num_fr, a:line_num_to)
endfunc

" slctd cursor __ mv

func! Slctd_cursor__mv_slctd_edge_r() range abort

  return v:lua.v.Slctd_cursor__mv_slctd_edge_r()
endfunc

func! Slctd_cursor__mv_file_edge(n_cmd) abort

  return v:lua.v.Slctd_cursor__mv_file_edge(a:n_cmd)
endfunc

func! Slctd_cursor__mv_v_jmp(drct) range abort

  return v:lua.v.Slctd_cursor__mv_v_jmp(a:drct)
endfunc

func! Slctd_cursor__mv_line_end() range abort

  return v:lua.v.Slctd_cursor__mv_line_end()
endfunc

" slctd cursor cnd

func! Is_slctd_cursor_pos__r() range abort

  return v:lua.v.Is_slctd_cursor_pos__r()
endfunc

" slctd str

func! Slctd_str() range abort

  return v:lua.v.Slctd_str()
endfunc

func! Slctd_str_len() range abort

  return v:lua.v.Slctd_str_len()
endfunc

func! Slctd_str_7_opn_ggl_srch() abort

  return v:lua.v.Slctd_str_7_opn_ggl_srch()
endfunc

func! Slctd_str_7_opn_yt() abort

  return v:lua.v.Slctd_str_7_opn_yt()
endfunc

" slctd str __ ( expnd )

func! Slctd_str__expnd() abort " expnd lr, cre re

  return v:lua.v.Slctd_str__expnd()
endfunc

func! Slctd_str__expnd_srch() range abort

  return v:lua.v.Slctd_str__expnd_srch()
endfunc

func! Slctd_str__expnd_word_f() range abort

  return v:lua.v.Slctd_str__expnd_word_f()
endfunc

" slctd __ expnd quote

let g:quote_ptn = '[' . "'" . '"' . '`' . ']'

func! Slctd_str__expnd_quote_on_f() range abort

  return v:lua.v.Slctd_str__expnd_quote_on_f()
endfunc

func! Slctd_str__expnd_quote_on_b() range abort

  return v:lua.v.Slctd_str__expnd_quote_on_b()
endfunc

func! Slctd_str__expnd_quote_on_swtch() range abort

  return v:lua.v.Slctd_str__expnd_quote_on_swtch()
endfunc

func! Slctd_str__expnd_quote_on() range abort

  return v:lua.v.Slctd_str__expnd_quote_on()
endfunc

func! Slctd_str__expnd_quote_in_f() range abort

  return v:lua.v.Slctd_str__expnd_quote_in_f()
endfunc

func! Slctd_str__expnd_quote_in_b() range abort

  return v:lua.v.Slctd_str__expnd_quote_in_b()
endfunc

func! Slctd_str__expnd_quote_in_swtch() range abort

  return v:lua.v.Slctd_str__expnd_quote_in_swtch()
endfunc

func! Slctd_str__expnd_quote_swtch() range abort

  return v:lua.v.Slctd_str__expnd_quote_swtch()
endfunc

func! Slctd_str__expnd_bracket_f() range abort " todo dev

  return v:lua.v.Slctd_str__expnd_bracket_f()
endfunc

func! Slctd_str__reduce_dlm_l(char) range abort

  return v:lua.v.Slctd_str__reduce_dlm_l(a:char)
endfunc

" slctd str __ ( edit )

func! Slctd_str__ynk() range abort

  return v:lua.v.Slctd_str__ynk()
endfunc

func! Slctd_str__clp() range abort

  return v:lua.v.Slctd_str__clp()
endfunc

" slctd str __ rpl

func! Slctd_str__rpl(srch, rpl) range abort

  return v:lua.v.Slctd_str__rpl(a:srch, a:rpl)
endfunc

" slctd str __ ( rpl )

func! Slctd_str__(str) range abort " todo dev

  return v:lua.v.Slctd_str__(a:str)
endfunc

" slctd str __ rpl, srch nxt slctd

func! Slctd__rpl_7_srch_nxt() abort " dir forward only

  return v:lua.v.Slctd__rpl_7_srch_nxt()
endfunc

" slctd str __ del

func! V_slctd__del() abort " dev doing, can

  return v:lua.v.V_slctd__del()
endfunc

func! Slctd__del() range abort

  return v:lua.v.Slctd__del()
endfunc

" slctd str __ pad

func! Slctd__pad(char) range abort

  return v:lua.v.Slctd__pad(a:char)
endfunc

func! Slctd__pad_space() range abort

  return v:lua.v.Slctd__pad_space()
endfunc

func! Slctd__pad_bar() range abort

  return v:lua.v.Slctd__pad_bar()
endfunc

func! Slctd_str_space__underscore() range abort

  return v:lua.v.Slctd_str_space__underscore()
endfunc

" slctd str cnd

func! Is_slctd_str__srch_str() abort

  return v:lua.v.Is_slctd_str__srch_str()
endfunc

func! Is_slctd_str__line_mlt() abort

  return v:lua.v.Is_slctd_str__line_mlt()
endfunc

" slctd str edge

func! Slctd_str_edge_l_col() abort

  return v:lua.v.Slctd_str_edge_l_col()
endfunc

func! Slctd_str_edge_r_col() abort

  return v:lua.v.Slctd_str_edge_r_col()
endfunc

func! Slctd_str_edge_l_pos() abort

  return v:lua.v.Slctd_str_edge_l_pos()
endfunc

func! Slctd_str_edge_r_pos() abort

  return v:lua.v.Slctd_str_edge_r_pos()
endfunc

func! Slctd_str_edge_l_char() abort

  return v:lua.v.Slctd_str_edge_l_char()
endfunc

func! Slctd_str_edge_r_char() abort

  return v:lua.v.Slctd_str_edge_r_char()
endfunc

func! Slctd_str_edge_l_out_char() abort

  return v:lua.v.Slctd_str_edge_l_out_char()
endfunc

func! Slctd_str_edge_r_out_char() abort

  return v:lua.v.Slctd_str_edge_r_out_char()
endfunc

func! Slctd_str_edge_l_out_str() abort

  return v:lua.v.Slctd_str_edge_l_out_str()
endfunc

func! Slctd_str_edge_r_out_str() abort

  return v:lua.v.Slctd_str_edge_r_out_str()
endfunc

" slctd str edge __ ( edit )

func! Slctd_str_edge_out__ins(c) range abort

  return v:lua.v.Slctd_str_edge_out__ins(a:c)
endfunc

func! Slctd_str_edge_out__ins_markdown_strikethrough()

  return v:lua.v.Slctd_str_edge_out__ins_markdown_strikethrough()
endfunc

func! Slctd_str_edge_out__ins_markdown_bold()

  return v:lua.v.Slctd_str_edge_out__ins_markdown_bold()
endfunc

func! Slctd_str_edge_out_char__tgl() range abort

  return v:lua.v.Slctd_str_edge_out_char__tgl()
endfunc

func! Slctd_str_edge_out_char__tgl_swtch() range abort

  return v:lua.v.Slctd_str_edge_out_char__tgl_swtch()
endfunc

func! Slctd_str_edge_out_quote__tgl() range abort

  return v:lua.v.Slctd_str_edge_out_quote__tgl()
endfunc

func! Slctd_str_edge_out_bracket__tgl() range abort

  return v:lua.v.Slctd_str_edge_out_bracket__tgl()
endfunc

func! Slctd_str_edge_out__tgl_shft() range abort

  return v:lua.v.Slctd_str_edge_out__tgl_shft()
endfunc

func! Slctd_str_edge_out_char__del() range abort

  return v:lua.v.Slctd_str_edge_out_char__del()
endfunc

" slctd str edge cnd

func! Is_slctd_str_edge_char__(ptn)

  return v:lua.v.Is_slctd_str_edge_char__(a:ptn)
endfunc

func! Is_slctd_str_edge_char__quote() abort

  return v:lua.v.Is_slctd_str_edge_char__quote()
endfunc

func! Is_slctd_str_edge_out_char__(ptn)

  return v:lua.v.Is_slctd_str_edge_out_char__(a:ptn)
endfunc

func! Is_slctd_str_edge_out_char__quote() abort

  return v:lua.v.Is_slctd_str_edge_out_char__quote()
endfunc

func! Is_slctd_str_edge_l_col__line_top() range abort

  return v:lua.v.Is_slctd_str_edge_l_col__line_top()
endfunc

" slctd line

func! Slctd_line_7_opn_app() range abort

  return v:lua.v.Slctd_line_7_opn_app()
endfunc

" slctd line __ ( edit )

func! Slctd_line__del() abort " use not, todo dev

  return v:lua.v.Slctd_line__del()
endfunc

" todo refactoring, fnc name mod, v > slctd

" slctd line __ rpl

func! Slctd_line__rpl(srch, rpl) range abort

  return v:lua.v.Slctd_line__rpl(a:srch, a:rpl)
endfunc

func! Slctd_line__rpl_by_line1_line2() range abort

  return v:lua.v.Slctd_line__rpl_by_line1_line2()
endfunc

func! Slctd_line__rpl_sys_cmd(sys_cmd) range abort " read

  return v:lua.v.Slctd_line__rpl_sys_cmd(a:sys_cmd)
endfunc

func! Slctd_line_srch_str__rpl_cr() range abort

  return v:lua.v.Slctd_line_srch_str__rpl_cr()
endfunc

func! Slctd_line__markdown_strikethrough() range abort " todo dev

  return v:lua.v.Slctd_line__markdown_strikethrough()
endfunc

func! Slctd__sys_cmd(sys_cmd) range abort

  return v:lua.v.Slctd__sys_cmd(a:sys_cmd)
endfunc

func! Slctd_line_top_space__del() abort

  return v:lua.v.Slctd_line_top_space__del()
endfunc

func! Slctd_line_end_space__del() range abort

  return v:lua.v.Slctd_line_end_space__del()
endfunc

func! Slctd_line_end__pad_space() range abort " use not

  return v:lua.v.Slctd_line_end__pad_space()
endfunc

func! Slctd_line__join_per_line(per_line_num) range abort

  return v:lua.v.Slctd_line__join_per_line(per_line_num)
endfunc

func! Slctd_line_indnt__space(indnt_col) range abort

  return v:lua.v.Slctd_line_indnt__space(a:indnt_col)
endfunc

func! Slctd_line_indnt__tab(indnt_col) range abort

  return v:lua.v.Slctd_line_indnt__tab(a:indnt_col)
endfunc

" slctd line tab

func! Slctd_line_tab__rpl_space(space_col) range abort

  return v:lua.v.Slctd_line_tab__rpl_space(a:space_col)
endfunc

" slctd line indnt __ shft

func! Slctd_indnt__shft_l() abort " todo

  return v:lua.v.Slctd_indnt__shft_l()
endfunc

func! Slctd_indnt__shft_r() abort " todo

  return v:lua.v.Slctd_indnt__shft_r()
endfunc

" slctd line __ crct tbl

func! Slctd_line__crct_tbl() range abort

  return v:lua.v.Slctd_line__crct_tbl()
endfunc

" markdown tbl header

func! Slctd_line__cnv_markdown_tbl_header() range abort " ??

  return v:lua.v.Slctd_line__cnv_markdown_tbl_header()
endfunc

" slctd line mb

func! Slctd_line_mb__cnv() range abort

  return v:lua.v.Slctd_line_mb__cnv()
endfunc

" slctd box __ mv

func! Slctd_box__mv(lr) range abort

  return v:lua.v.Slctd_box__mv(a:lr)
endfunc

func! Slctd_box_width__1() range abort

  return v:lua.v.Slctd_box_width__1()
endfunc

func! Slctd_box_str__mv(lr) range abort

  return v:lua.v.Slctd_box_str__mv(lr)
endfunc

" slctd box __ ( edit )

func! Slctd_box_edge_l__ynk_line_1() range abort

  return v:lua.v.Slctd_box_edge_l__ynk_line_1()
endfunc

" slctd box __ rpl

func! Slctd_box__rpl(srch, rpl) range abort

  return v:lua.v.Slctd_box__rpl(a:srch, a:rpl)
endfunc

" slctd box space __ del

func! Slctd_box_space__del() range abort

  return v:lua.v.Slctd_box_space__del()
endfunc

" slctd box char __ shft

func! Slctd_box_edge_r_char__shft_in() range abort

  return v:lua.v.Slctd_box_edge_r_char__shft_in()
endfunc

func! Slctd_box_cursor_r_space__crct() range abort

  return v:lua.v.Slctd_box_cursor_r_space__crct()
endfunc

func! Is_slctd_mode__box() range abort

  return v:lua.v.Is_slctd_mode__box()
endfunc

func! Is_slctd_mode__line() range abort

  return v:lua.v.Is_slctd_mode__line()
endfunc

" slctd etc

func! Slctd_srch__swtch() abort " srch, set or run

  return v:lua.v.Slctd_srch__swtch()
endfunc

" 
" ynk
" 

func! Ynk__clr() abort

  return v:lua.v.Ynk__clr()
endfunc

func! Ynk__(str) abort

  return v:lua.v.Ynk__(a:str)
endfunc

func! Ynk__line() abort

  return v:lua.v.Ynk__line()
endfunc

func! Ynk__line_all() abort

  return v:lua.v.Ynk__line_all()
endfunc

func! Ynk__buf_file_path() abort

  return v:lua.v.Ynk__buf_file_path()
endfunc

func! Ynk__clp() abort

  return v:lua.v.Ynk__clp()
endfunc

func! Ynk__slctd() abort

  return v:lua.v.Ynk__slctd()
endfunc

func! Ynk__add_slctd() abort

  return v:lua.v.Ynk__add_slctd()
endfunc

func! Ynk__by_rgstr_info(rgstr_info) abort

  return v:lua.v.Ynk__by_rgstr_info(a:rgstr_info)
endfunc

" clp

func! Clp__ynk() abort

  return v:lua.v.Clp__ynk()
endfunc

" 
" srch
" 

" srch exe, ref: cursor __ mv srch ptn

func! Srch_or(...) abort

  " use not
  " return v:lua.v.Srch_or( a:000 ??? )
endfunc

func! Srch_str() abort

  return v:lua.v.Srch_str()
endfunc

func! Srch_str_flt() abort

  return v:lua.v.Srch_str_flt()
endfunc

func! Srch_str_word1(str) abort

  return v:lua.v.Srch_str_word1(a:str)
endfunc

" srch str __

func! Srch_str__(str, op_word1) abort

  return v:lua.v.Srch_str__(a:str, a:op_word1)
endfunc

func! Srch_str__cursor_word() abort

  return v:lua.v.Srch_str__cursor_word()
endfunc

func! Srch_str__word1_tgl() abort

  return v:lua.v.Srch_str__word1_tgl()
endfunc

func! Srch_str_ltst(idx) abort

  return v:lua.v.Srch_str_ltst(a:idx)
endfunc

func! Srch_str__prv_tgl() abort

  return v:lua.v.Srch_str__prv_tgl()
endfunc

func! Srch_str__slctd_str() range abort

  return v:lua.v.Srch_str__slctd_str()
endfunc

func! Srch_slct(drct) abort

  return v:lua.v.Srch_slct(a:drct)
endfunc

" dev anchor refactoring fnc name re ?
func! Slctd_srch_7_slctd__srch_nxt(drct) abort " srch rpl skip

  return v:lua.v.Slctd_srch_7_slctd__srch_nxt(a:drct)
endfunc

func! Srch_7_cursor__mv_srch_str_end_o() abort

  return v:lua.v.Srch_7_cursor__mv_srch_str_end_o()
endfunc

func! Srch_char(drct, char) abort

  return v:lua.v.Srch_char(a:drct, a:char)
endfunc

func! Srch_char_bracket(drct) abort

  return v:lua.v.Srch_char_bracket(a:drct)
endfunc

func! Srch_str__h_swtch() abort

  return v:lua.v.Srch_str__h_swtch()
endfunc

func! Srch_str__markdown_h() abort

  return v:lua.v.Srch_str__markdown_h()
endfunc

func! Srch_str__fnc() abort

  return v:lua.v.Srch_str__fnc()
endfunc

" srch cnd

func! Is_srch__word1() abort

  return v:lua.v.Is_srch__word1()
endfunc

" markdown cnd

func! Is_line_markdown_itm() abort

  return v:lua.v.Is_line_markdown_itm()
endfunc

" complete  -  mode insert ins lst

func! I_symbol01() abort

  return v:lua.v.I_symbol01()
endfunc

func! I_symbol02() abort

  return v:lua.v.I_symbol02()
endfunc

func! I_symbol03() abort

  return v:lua.v.I_symbol03()
endfunc

func! I_bracket() abort

  return v:lua.v.I_bracket()
endfunc

func! I_quote() abort

  return v:lua.v.I_quote()
endfunc

func! I_markdown_lnk() abort

  return v:lua.v.I_markdown_lnk()
endfunc

func! I_week() abort

  return v:lua.v.I_week()
endfunc

func! I_num() abort

  return v:lua.v.I_num()
endfunc

func! I_reg() abort

  return v:lua.v.I_reg()
endfunc

func! I_todo_status() abort

  return v:lua.v.I_todo_status()
endfunc

func! I_reserved_lua() abort

  return v:lua.v.I_reserved_lua()
endfunc

func! Cursor__ins_rgstr_by_rgstr_info(rgstr_info) abort

  return v:lua.v.Cursor__ins_rgstr_by_rgstr_info(a:rgstr_info)
endfunc

func! Rgstr_info_rgstr(rgstr_info) abort

  return v:lua.v.Rgstr_info_rgstr(a:rgstr_info)
endfunc

" 
" rg
" 

func! Rg_rslt_line_parse(line) abort

  return v:lua.v.Rg_rslt_line_parse(a:line)
endfunc

let g:fzf_rg_opt = ''
\     . ' --color=always'
\     . ' --line-number'
\     . ' --smart-case'
\     . ' --no-multiline'
\     . ' --no-heading'
\     . ' --hidden'

func! Rg_cmd(ptn, ext, word1, opt) abort

  return v:lua.v.Rg_cmd(a:ptn, a:ext, a:word1, a:opt)
endfunc

let g:rg_emp_line_ptn  = '^[ \t]*$'
let g:rg_some_line_ptn = '^[^ \t]+$'
" let g:rg_some_line_ptn = '[^ \t]'

func! Rg_ptn_cnt(ptn, opt) abort

  " return v:lua.v.Rg_ptn_cnt(a:ptn, a:opt)

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

  return v:lua.v.Mark_show_tgl()
endfunc

func! Mark_lst() abort

  return v:lua.v.Mark_lst()
endfunc

func! Mark_alph_line() abort

  return v:lua.v.Mark_alph_line()
endfunc

func! Mark_tgl() abort

  return v:lua.v.Mark_tgl()
endfunc
  
func! Mark_add() abort

  return v:lua.v.Mark_add()
endfunc

func! Mark_alph_useabl() abort

  return v:lua.v.Mark_alph_useabl()
endfunc

func! Mark_del(alph) abort

  return v:lua.v.Mark_del(a:alph)
endfunc

func! Mark_del_all() abort

  return v:lua.v.Mark_del_all()
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

  return v:lua.v.Slctd_math()
endfunc

" url encdoe

func! Slctd_url_encode() range abort

  return v:lua.v.Slctd_url_encode()
endfunc

func! Defold_err_cnv() abort

  exe '%s/^ERROR:SCRIPT:/ERROR:SCRIPT:\r/g'
  exe '%s/\/assets\///g'
  exe '%s/^ *//g'
endfunc

" env

func! Is_env__(env) abort " alias

  return v:lua.v.Is_env__(a:env)
endfunc

func! Is_nvim() abort " alias

  return v:lua.v.Is_nvim()
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


