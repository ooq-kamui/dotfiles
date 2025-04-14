-- 
-- key map
-- 

-- ojroques/nvim-osc52
vim.keymap.set('v', 'C', require('osc52').copy_visual)


-- 
-- migration
--   fr vim script
-- ex
--   vim.keymap.set('n', 'T', '<cmd>call Tst_fnc_call_fr_lua()<cr>')
--   vim.keymap.set('n', 'T', vim.fn.Tst_fnc_call_fr_lua')


-- 
-- mode normal
-- 

-- " quit buffer
vim.keymap.set('n', 'w',  vim.fn.Buf__quit_swtch)

-- " quit buffer force
-- nnoremap :q :q!
-- vim.keymap.set('n', ':q', '<cmd>q!') -- add <cr>, ## on hold

-- " quit vim
vim.keymap.set('n', 'W', '<cmd>q<cr>')

-- " quit tab other
-- "nnoremap xx :tabo<cr>

-- " background job
-- "nnoremap <c-z> <c-z>

-- " save
-- nnoremap a :call Save()<cr>

-- " load re slf
-- "nnoremap xx :call Load_re()

-- " load re vimrc
-- nnoremap :v :source ~/wrk/prj-pri/dotfiles/nvim/scrpt/dflt/init.vim

-- " 
-- " opn
-- " 

-- " opn tab file
-- nnoremap :o :Opn 

-- " opn latest
-- "nnoremap xx `0

-- " opn file srch  ( fzf )
-- nnoremap <leader>l :call Fzf_file()<cr>
-- "nnoremap <leader>l :FzfFile <cr>

-- " opn file hstry ( fzf )
-- nnoremap <leader>h :FzfFileHstry<cr>

-- " 
-- " opn etc
-- " 

-- " opn fish cnf
-- "nnoremap gf :call Opn_fish_cnf()<cr>

-- " opn vimrc
-- nnoremap gh :call Opn_vimrc()<cr>

-- " opn tmp file
-- "nnoremap xx :call Opn_tmp_file()<cr>

-- " opn grep work
-- "nnoremap xx :call Opn_grep_wk()<cr>

-- " opn memo
-- "nnoremap xx :call Opn_memo()<cr>

-- " opn man
-- "nnoremap xx :OpnMan 

-- " opn app
-- nnoremap go :call Opn_app_by_cursor_path()<cr>

-- " opn app slf
-- "nnoremap xx :call Opn_app_buf_file()<cr>

-- " opn dir slf
-- nnoremap gd :call Opn_buf_file_dir()<cr>

-- " opn brwsr
-- "nnoremap xx :call Opn_brwsr()<cr>

-- " opn ggl srch
-- nnoremap ggl :call Opn_ggl_srch('')<cr>

-- " 
-- " cursor mv
-- " 

-- " cursor mv drct
-- nnoremap <Right> l
-- nnoremap <Left>  h
-- nnoremap <Up>    k
-- nnoremap <Down>  j

-- " cursor mv line
-- "nnoremap k k
-- "nnoremap j j
-- nnoremap k :call Cursor__mv_u()<cr>
-- nnoremap j :call Cursor__mv_d()<cr>

-- " cursor mv line mlt
-- "nnoremap <c-k> 10<c-y>
-- "nnoremap <c-j> 10<c-e>
-- nnoremap <c-k> :call Cursor__mv_mlt_u()<cr>
-- nnoremap <c-j> :call Cursor__mv_mlt_d()<cr>

-- " cursor mv line top | ins line
-- nnoremap y :call Cursor__mv_line_top_or_new_line()<cr>

-- " cursor mv line top
-- nnoremap <c-a> 0

-- " cursor mv line end
-- "nnoremap <c-y> xx
-- nnoremap <expr> <c-y>
-- \ Is_cursor_col__line_end() ? ':call Cursor__ins_markdown_cr()<cr>'     :
-- \                             ':call Cursor__mv_line_end()<cr>'

-- " cursor mv char - forward
-- nnoremap l l

-- " cursor mv char - back
-- nnoremap <c-o> h
-- "nnoremap <c-s> h

-- " cursor mv word - forward
-- nnoremap f :call Cursor__mv_word_f()<cr>

-- " cursor mv word - back
-- nnoremap o :call Cursor__mv_word_b()<cr>

-- " cursor mv word - back pre
-- "nnoremap xx :call Cursor__mv_word_b_pre()<cr>

-- " cursor mv word dlm _ forward
-- nnoremap _ f_l
-- "nnoremap \ f_l

-- " cursor mv word dlm _ back
-- nnoremap <c-_> hT_
-- nnoremap \     T_h
-- nnoremap <bar> T_h
-- "nnoremap <c-\> T_h

-- " cursor mv word dlm ( camel or _ )  -  forward
-- nnoremap F     :call Cursor__mv_word_dlm_f()<cr>
-- "nnoremap <c-m> :call Cursor__mv_word_dlm_f()<cr>

-- " cursor mv fnc name
-- nnoremap <c-f> :call Cursor__mv_fnc_name()<cr>

-- " cursor mv bracket pair
-- nnoremap <c-l> %

-- " cursor mv bracket out back
-- "nnoremap xx [{

-- " cursor mv bracket fnc back
-- "nnoremap xx [m

-- " cursor mv edited ( jmp list )
-- "nnoremap xx <c-o>
-- "nnoremap xx <c-i>

-- " cursor mv indnt auto
-- "nnoremap xx :call Cursor__mv_indnt_auto()<cr> " todo dev
-- "nnoremap xx ll

-- " cursor mv file edge bgn
-- nnoremap gk :call Cursor__mv_file_edge_bgn()<cr>
-- "nnoremap gk :call Cursor__mv_file_edge('k')<cr>

-- " cursor mv file edge end
-- nnoremap gj :call Cursor__mv_file_edge_end()<cr>
-- "nnoremap gj :call Cursor__mv_file_edge('j')<cr>

-- " cursor mv edit latest
-- "nnoremap xx `.

-- " cursor mv jmp
-- nnoremap rk        :call Cursor__mv_v_jmp('k')<cr>
-- nnoremap rj        :call Cursor__mv_v_jmp('j')<cr>
-- nnoremap r<space>k :call Cursor__mv_v_jmp_char('k', 'f')<cr>
-- nnoremap r<space>j :call Cursor__mv_v_jmp_char('j', 'f')<cr>

-- " cursor mv jmp md h
-- "nnoremap xx :call Cursor__mv_v_jmp_md_h('k')<cr>
-- "nnoremap xx :call Cursor__mv_v_jmp_md_h('j')<cr>

-- " scroll

-- nnoremap K      <c-y>
-- nnoremap J      <c-e>
-- nnoremap <up>   <c-y>
-- nnoremap <down> <c-e>

-- " scroll cursor line upper
-- "nnoremap xx zt

-- " scroll cursor line middle
-- "nnoremap xx zz

-- " 
-- " slct / slctd / ynk / paste
-- " 

-- " slct
-- "nnoremap I v

-- " slctd __ word
-- nnoremap i :call Slctd_str__word()<cr>

-- " slctd __ word by under score

-- " todo dev
-- "nnoremap <c-_> :call Slctd__word_by_under_score()<cr>
-- " nnoremap <c-_> f_l
-- " hT_

-- " slctd __ char current - word end
-- nnoremap I ve

-- " slct visual box
-- nnoremap v <c-v>

-- " slct all
-- "nnoremap xx :call Ynk__line_all()<cr>

-- " slct re
-- nnoremap rr :call Slct_re()<cr>

-- " ynk clr
-- nnoremap <c-c> :call Ynk__clr()<cr>

-- " ynk line
-- nnoremap c :call Ynk__line()<cr>

-- " ynk char
-- "nnoremap xx "ayl

-- " ynk slf path
-- nnoremap gs :call Ynk__buf_file_path()<cr>

-- " paste
-- nnoremap p :call Cursor__ins_ynk()<cr>

-- " paste clp
-- nnoremap P :call Cursor__ins_clp()<cr>

-- " paste rgstr history ( fzf )
-- nnoremap <leader>r :FzfRgstr<cr>
-- "nnoremap R         :FzfRgstr<cr>

-- " undo
-- nnoremap h     u

-- " redo
-- nnoremap <c-h> <c-r>

-- " undo history clr
-- nnoremap :h :call Undo__clr()
-- "nnoremap H :call Undo__clr()<cr>

-- " repeat
-- "nnoremap xx .

-- " 
-- " edit
-- " 

-- " mode ch ins
-- nnoremap <space> i

-- " mode ch ins rpl
-- "nnoremap xx R

-- " ins cr
-- nnoremap m :call Cursor__ins_cr()<cr>

-- " ins space
-- nnoremap L :call Cursor__ins_space(v:false)<cr>

-- " ins equal
-- nnoremap 2 i=<esc>

-- " ins period
-- nnoremap . i.<esc>

-- " ins comma
-- nnoremap , i, <esc>l

-- " ins comma $, nxt line
-- "nnoremap xx A,<esc>j

-- " ins hyphen
-- nnoremap 0 :call Cursor__ins_hyphen()<cr>

-- " ins bracket
-- nnoremap <c-s> :call Cursor__ins_bracket()<cr>

-- " ins date
-- nnoremap * :call Cursor__ins_da()<cr>

-- " ins date time
-- nnoremap ; :call Cursor__ins_dt()<cr>

-- " ins day of week
-- "nnoremap xx :call Cursor__ins_week()<cr>

-- " ins slf path
-- "nnoremap xx :call Cursor__ins_line_buf_file_path()<cr>

-- " ins anchor
-- nnoremap A :call Cursor__ins_line_anchor()<cr>

-- " ins markdown code
-- nnoremap <c-u> :call Cursor__ins_markdown_code()<cr>

-- " ins markdown itm
-- "nnoremap O xx
-- nnoremap <expr> O
-- \ Is_file_type__('markdown') ? ':call Cursor__ins_markdown_itm()<cr>' :
-- \                              ':call Cursor_line_indnt__shft_r()<cr>'

-- " ins dots ( or crnt )
-- nnoremap ru :call Cursor_line_end__dots_adjst()<cr>

-- " ins line emp
-- " ref nnoremap y

-- " ins comment mlt
-- nnoremap $ :call Cursor__ins_cmnt_mlt()<cr>

-- " ins comment 1
-- "nnoremap ! xx
-- nnoremap <expr> !
-- \ Is_file_type__('markdown') ? ':call Cursor__ins_markdown_h()<cr>' :
-- \                              ':call Cursor__ins_cmnt_1("^")<cr>'
-- "nnoremap 1 xx
-- nnoremap <expr> 1
-- \ Is_file_type__('markdown') ? ':call Cursor__ins_markdown_h()<cr>' :
-- \                              ':call Cursor__ins_cmnt_1("^")<cr>'

-- " ins __ line indnt space
-- nnoremap V :call Cursor_d__ins_line_space()<cr>

-- " cahr rpl, under score
-- "nnoremap <bar> :call Cursor_char__rpl_underscore()<cr>

-- " tgl markdown chk
-- "nnoremap xx :call Char_markdown_chk__tgl()<cr>

-- " del char
-- nnoremap s :call Cursor_c_char__del()<cr>

-- " del char ynk
-- "nnoremap xx :call Cursor_c_char__del_ynk()<cr>

-- " line del
-- nnoremap d :call Cursor_line__del()<cr>

-- " line forward del
-- nnoremap <c-d> D

-- " word back    del
-- "nnoremap xx hvbd

-- " word forward del
-- "nnoremap <expr> xx Is_cursor_col__line_end() ? '<esc>' : '"zdw'
-- "nnoremap <expr> xx Is_cursor_col__line_end() ? '<esc>' : '"zde'

-- " del cr ( line join )
-- nnoremap <c-m> J
-- "nnoremap M     J

-- " line mv up
-- "nnoremap xx "addk"aP

-- " line dpl
-- nnoremap D "zyy"zP

-- " repeat memory
-- "nnoremap xx qy
-- "nnoremap xx @y

-- " char tgl 01 ( ?? / num icl  )
-- nnoremap u :call N_char__tgl_swtch01()<cr>

-- " char tgl 02 ( type ch / num dcl )
-- nnoremap U :call N_char__tgl_swtch02()<cr>

-- " indnt shft
-- nnoremap ri :call Cursor_line_indnt__shft_l()<cr>
-- nnoremap ro :call Cursor_line_indnt__shft_r()<cr>
-- nnoremap < :call Cursor_line_indnt__shft_l()<cr>
-- nnoremap > :call Cursor_line_indnt__shft_r()<cr>

-- " indnt add
-- "nnoremap xx :call Cursor_line_indnt__add(2)<cr>

-- " indnt crct
-- nnoremap re :call Cursor_line_indnt__crct()<cr>

-- " cursor l char col __ crct
-- nnoremap q :call Cursor_f_str__crct_by_line_u()<cr>
-- nnoremap Q :call Cursor_f_str__crct_by_line_d()<cr>

-- " 
-- " srch
-- " 

-- " srch hl init
-- nnoremap S /<cr>N
-- "nnoremap / /<cr>N
-- "nnoremap xx :call Srch_init()<cr>

-- " srch char in line - forward
-- "nnoremap xx f

-- " srch char in line repeat
-- "nnoremap xx ;

-- " srch by cmd
-- nnoremap <leader>k /

-- " srch by cmd word

-- nnoremap <leader>K /\<\><left><left>

-- " srch word or
-- "nnoremap xx Xxx

-- " srch forward
-- nnoremap n     :call Cursor__mv_srch('f')<cr>

-- " srch back
-- nnoremap <c-n> :call Cursor__mv_srch('b')<cr>

-- " srch, cursor mv nxt char
-- "nnoremap @ :call Srch_7_cursor__mv_nxt('f')<cr>

-- " srch str set
-- nnoremap e :call Srch_str__cursor_word()<cr>

-- " srch str set ( word 1 )
-- nnoremap E :call Srch_str__word1_tgl()<cr>

-- " srch char bracket forward
-- "nnoremap xx :call Srch_char_bracket('f')<cr>

-- " srch markdown h
-- nnoremap H :call Srch_str__markdown_h()<cr>

-- " srch str history ( fzf )
-- nnoremap <leader>f :FzfSrchHstry<cr>
-- "nnoremap <leader>n :FzfSrchHstry<cr>

-- " srch str set prv ( tgl )
-- nnoremap N :call Srch_str__prv_tgl()<cr>

-- " srch rpl one > ynk nxt ( only srch )
-- nnoremap <c-p> :call Srch_slct('f')<cr>

-- " srch ?=ts
-- "nnoremap xx /?ts=<cr>

-- " rpl ( cmd )
-- "nnoremap :s :Rpl 
-- nnoremap :s :%s///g

-- " fzf rg
-- " nnoremap <leader>o :call Fzf_rg('')<cr>
-- nnoremap <leader>o :call Fzf_rg(v:null)<cr>

-- " fzf rg fltr ext
-- nnoremap <leader>O :FzfRgExt js

-- " fzf rg with run
-- " nnoremap <leader>O :FzfRgWithRun <cr>

-- " fzf buf
-- nnoremap <leader>i :call N_fzf_buf()<cr>

-- " fzf jmplst
-- nnoremap <leader>e :FzfJmplst<cr>
-- nnoremap <leader>a :FzfJmplst<cr>

-- " fzf pth lst
-- "nnoremap <leader>xx :FzfTagjmpByFile <cr>

-- " tag jmp tab new
-- nnoremap t :call Tag_jmp_by_cursor_line()<cr>

-- " 
-- " cmd
-- " 

-- " cmd history ( fzf )
-- nnoremap <leader>j :FzfCmdHstry<cr>

-- " sys cmd
-- nnoremap :! :! 
-- nnoremap :1 :! 

-- " ins sys cmd ( read )
-- nnoremap :r :InsSysCmd 

-- " pth
-- nnoremap :p :Pth <cr>

-- " cd slf
-- "nnoremap :d :call Dir__buf_file_dir()

-- " cd parent
-- nnoremap :k :K

-- " fzf cd
-- nnoremap <leader>y :call Fzf_dir()<cr>

-- " fzf cd ( dir jmp )
-- nnoremap <leader>d :call Fzf_dir_jmp()<cr>

-- " fzf doc memo
-- nnoremap <leader>m :call Fzf_doc_memo_opn()<cr>
-- "nnoremap <leader>M :FzfFile ../memo/

-- " fzf vim fnc call
-- nnoremap <leader>c :call Fzf_vim_fnc_call()<cr>

-- " fzf doc tech
-- nnoremap <leader>t :call Fzf_doc_tech()<cr>

-- " 
-- " tab
-- " 

-- " tab mv
-- nnoremap <tab>   gt
-- nnoremap <s-tab> gT

-- " tab order
-- nnoremap <s-left>  :tabm-1<cr>
-- nnoremap <s-right> :tabm+1<cr>

-- " 
-- " buf
-- " 

-- " buf list
-- "nnoremap :xx :buffers

-- " buf fltr
-- nnoremap :f :%! jq
-- "nnoremap :xx :call Buf__fltr()<cr> " use not

-- " 
-- " win ( buf )
-- " 

-- " win ( buf ) splt quit
-- "nnoremap rq :call Win_splt__quit()<cr>

-- " win ( buf ) splt h
-- nnoremap rh :call Win__splt_h()<cr>

-- " win ( buf ) splt v
-- nnoremap rn :call Win__splt_v()<cr>
-- "nnoremap rv :call Win__splt_v()<cr>

-- " win ( buf ) nxt
-- nnoremap <c-w> :call Win_splt_cursor__mv_nxt()<cr>

-- " win ( buf ) mv r
-- "nnoremap xx <c-w>l

-- " win ( buf ) mv l
-- "nnoremap xx <c-w>h

-- " 
-- " term
-- " 

-- "nnoremap xx :Term 

-- " 
-- " mark
-- " 

-- " mark lst ( fzf )
-- "nnoremap <leader>xx :FzfMark<cr>

-- " mark show tgl
-- "nnoremap <leader>xx :call Mark_show_tgl()<cr>

-- " mark add / del tgl
-- "nnoremap <leader>xx :call Mark_tgl()<cr>

-- " mark del all
-- "nnoremap <leader>xx :call Mark_del_all()<cr>

-- " mark, cursor mv mark forward
-- "nnoremap <leader>xx ]`

-- " mark, cursor mv mark back
-- "nnoremap <leader>xx [`

-- " setting

-- " setting  -  line view wrap tgl
-- nnoremap :w :set wrap!

-- " setting  -  line num view tgl
-- nnoremap :N :set number!

-- " setting  -  line num rel tgl
-- nnoremap :n :set relativenumber!

-- " inf

-- " inf char
-- "nnoremap xx ga

-- " numpad shift
-- nnoremap <kInsert>   0
-- nnoremap <kEnd>      1
-- nnoremap <kDown>     2
-- nnoremap <kPageDown> 3
-- nnoremap <kLeft>     4
-- nnoremap <kOrigin>   5
-- nnoremap <kRight>    6
-- nnoremap <kHome>     7
-- nnoremap <kUp>       8
-- nnoremap <kPageUp>   9

-- " 
-- " esc
-- " 
-- nnoremap <esc>   <esc>
-- "nnoremap <space> <esc>
-- nnoremap <s-space> <esc>
-- "nnoremap <cr>    <esc>
-- nnoremap <bs>    <esc>

-- nnoremap - <esc>
-- nnoremap + <esc>
-- nnoremap = <esc>
-- nnoremap @ <esc>
-- "nnoremap ; <esc>
-- "nnoremap , <esc>
-- "nnoremap . <esc>
-- "nnoremap * <esc>
-- "nnoremap _ <esc>
-- nnoremap ~ <esc>
-- nnoremap ^ <esc>
-- nnoremap / <esc>
-- "nnoremap \ <esc>
-- "nnoremap | <esc> " ref vvv
-- "nnoremap <bar> <esc>
-- nnoremap ? <esc>

-- "nnoremap ! <esc>
-- nnoremap " <esc>
-- nnoremap ` <esc>
-- nnoremap # <esc>
-- "nnoremap $ <esc>
-- "nnoremap % <esc> " ?
-- nnoremap & <esc>
-- nnoremap ( <esc>
-- "nnoremap < <esc>
-- "nnoremap > <esc>
-- "nnoremap << <esc>
-- "nnoremap >> <esc>

-- "nnoremap [ <esc>
-- "nnoremap ] <esc>

-- "nnoremap 0 <esc>
-- "nnoremap a <esc>
-- nnoremap b <esc>
-- "nnoremap c <esc>
-- "nnoremap d <esc>
-- "nnoremap e <esc>
-- "nnoremap f <esc>
-- "nnoremap g <esc>
-- "nnoremap h <esc>
-- "nnoremap i <esc>
-- "nnoremap j <esc>
-- "nnoremap k <esc>
-- "nnoremap l <esc>
-- "nnoremap m <esc>
-- "nnoremap n <esc>
-- "nnoremap o <esc>
-- "nnoremap q <esc>
-- nnoremap r <esc>
-- "nnoremap s <esc>
-- "nnoremap t <esc>
-- "nnoremap u <esc>
-- "nnoremap w <esc>
-- nnoremap x <esc>
-- "nnoremap y <esc>
-- nnoremap z <esc>

-- "nnoremap A <esc>
-- nnoremap B <esc>
-- nnoremap C <esc>
-- "nnoremap D <esc>
-- "nnoremap E <esc>
-- "nnoremap F <esc>
-- nnoremap G <esc>
-- "nnoremap H <esc>
-- "nnoremap I <esc>
-- "nnoremap J  <esc>
-- "nnoremap K  <esc>
-- "nnoremap L <esc>
-- nnoremap M <esc>
-- "nnoremap N <esc>
-- "nnoremap O <esc>
-- "nnoremap Q <esc>
-- "nnoremap P <esc>
-- nnoremap R <esc>
-- "nnoremap S <esc>
-- nnoremap T <esc>
-- "nnoremap U <esc>
-- "nnoremap W <esc>
-- "nnoremap V <esc>
-- nnoremap X <esc>
-- nnoremap Y <esc>

-- nnoremap <c-tab> <nop>
-- nnoremap <c-space> <esc>

-- nnoremap <c-@> <esc>
-- "nnoremap <c-^> <esc>
-- "nnoremap <c--> <esc> " non
-- "nnoremap <c-*> <esc> " non ?
-- "nnoremap <c-:> <esc> " non
-- "nnoremap <c-;> <esc> " non
-- "nnoremap <c-,> <esc> " non ?
-- "nnoremap <c-.> <esc> " non ?
-- "nnoremap <c-/> <esc> " non ?
-- nnoremap <c-\> <esc>
-- "nnoremap <c-_> <esc>
-- "nnoremap <c-[> <esc>
-- nnoremap <c-]> <esc>

-- "nnoremap <c-a> <esc>
-- nnoremap <c-b> <esc>
-- "nnoremap <c-c> <esc>
-- "nnoremap <c-d> <esc>
-- nnoremap <c-e> <esc>
-- "nnoremap <c-f> <esc>
-- nnoremap <c-g> <esc>
-- "nnoremap <c-h> <esc>
-- "nnoremap <c-i> <esc> " tab
-- "nnoremap <c-l> <esc>
-- "nnoremap <c-m> <esc>
-- "nnoremap <c-n> <esc>
-- "nnoremap <c-o> <esc>
-- "nnoremap <c-p> <esc>
-- nnoremap <c-q> <esc>
-- nnoremap <c-r> <esc>
-- "nnoremap <c-s> <esc>
-- nnoremap <c-t> <esc>
-- "nnoremap <c-u> <esc>
-- nnoremap <c-v> <esc>
-- "nnoremap <c-w> <esc>
-- nnoremap <c-x> <esc>
-- "nnoremap <c-y> <esc>
-- nnoremap <c-z> <esc>

-- "nnoremap ga <esc>
-- nnoremap gb <esc>
-- "nnoremap gd <esc>
-- "nnoremap ge <esc>
-- nnoremap gf <esc>
-- nnoremap gg <esc>
-- "nnoremap gh <esc>
-- nnoremap gi <esc>
-- "nnoremap gj <esc>
-- "nnoremap gk <esc>
-- nnoremap gl <esc>
-- nnoremap gm <esc>
-- nnoremap gn <esc>
-- "nnoremap go <esc>
-- nnoremap gp <esc>
-- "nnoremap gs <esc>
-- nnoremap gt <esc>
-- nnoremap gu <esc>
-- nnoremap gv <esc>
-- nnoremap gw <esc>
-- nnoremap gy <esc>

-- nnoremap ra <esc>
-- "        :
-- "nnoremap re <esc>
-- "nnoremap rf <esc>
-- "        :
-- "nnoremap rh <esc>
-- "nnoremap ri <esc>
-- "nnoremap rj <esc>
-- "nnoremap rk <esc>
-- "        :
-- "nnoremap rn <esc>
-- "nnoremap ro <esc>
-- nnoremap rp <esc>
-- nnoremap rq <esc>
-- "nnoremap rr <esc>
-- "        :
-- "nnoremap ru <esc>
-- nnoremap rv <esc>
-- "        :
-- nnoremap rz <esc>

-- nnoremap Rj <esc>
-- nnoremap Rk <esc>

-- nnoremap xx <esc>

-- nnoremap :a :a
-- nnoremap :b :b
-- nnoremap :c :c
-- nnoremap :d :d
-- nnoremap :e :e
-- "nnoremap :f :f
-- nnoremap :g :g
-- "nnoremap :h :h
-- "          :
-- "nnoremap :k :k
-- "          :
-- "nnoremap :p :p
-- "nnoremap :q :q
-- "nnoremap :r :r
-- "nnoremap :s :s
-- "          :
-- "nnoremap :u :u
-- "          :
-- nnoremap :z :z

-- " mode normal end

-- " leader esc

-- nnoremap <leader>: <esc>

-- "nnoremap <leader>a <esc>
-- nnoremap <leader>b <esc>
-- "nnoremap <leader>c <esc>
-- "nnoremap <leader>d <esc>
-- "nnoremap <leader>e <esc>
-- "nnoremap <leader>f <esc>
-- nnoremap <leader>g <esc>
-- "nnoremap <leader>h <esc>
-- "nnoremap <leader>j <esc>
-- "nnoremap <leader>l <esc>
-- "nnoremap <leader>m <esc>
-- "nnoremap <leader>n <esc>
-- "nnoremap <leader>o <esc>
-- nnoremap <leader>p <esc>
-- "nnoremap <leader>r <esc>
-- nnoremap <leader>s <esc>
-- "nnoremap <leader>t <esc>
-- nnoremap <leader>u <esc>
-- nnoremap <leader>v <esc>
-- nnoremap <leader>w <esc>
-- "nnoremap <leader>y <esc>

-- "nnoremap <leader>L <esc>
-- nnoremap <leader>M <esc>
-- "nnoremap <leader>O <esc>


-- " 
-- " mode visual
-- " 

-- " mode ch line
-- vnoremap i V

-- " mode ch visual box
-- "vnoremap v <c-v>
-- vnoremap <expr> v
-- \ mode() == '<c-v>' ? ':call Slctd_box_width__1()<cr>' :
-- \                     '<c-v>'

-- " file srch ( fzf )
-- "vnoremap <leader>xx "zy:FzfFile <c-r>z

-- " 
-- " cursor mv
-- " 

-- " cursor mv slctd edge tgl
-- vnoremap y :call Cursor__mv_slctd_edge_tgl()<cr>

-- " cursor mv slctd edge tgl, v box line same
-- vnoremap O O

-- " cursor mv char forward
-- vnoremap l l

-- " cursor mv char back
-- vnoremap <c-o> h

-- " cursor mv word - back
-- "vnoremap xx b
-- "vnoremap xx bh
-- "vnoremap xx Bh

-- " cursor mv line end
-- vnoremap <c-y> :call Slctd_cursor__mv_line_end()<cr>

-- " slctd __ reduce dlm _ r
-- vnoremap _ of_lo
-- "vnoremap h of_lo

-- " slctd __ reduce dlm _ l
-- "vnoremap h     F_h
-- vnoremap h     :call Slctd_str__reduce_dlm_l('_')<cr>
-- "vnoremap H     F_h
-- "vnoremap <c-_> F_h

-- " cursor mv space - forward ( word pre )
-- "vnoremap xx wh

-- " cursor mv line
-- vnoremap <c-j> 10j
-- vnoremap <c-k> 10k

-- " cursor mv jmp
-- vnoremap rk :call Slctd_cursor__mv_v_jmp('k')<cr>
-- vnoremap rj :call Slctd_cursor__mv_v_jmp('j')<cr>

-- " cursor mv bracket pair
-- vnoremap <c-l> %

-- " cursor mv bracket out back
-- "vnoremap xx [{

-- " cursor mv bracket fnc back
-- "vnoremap xx [m

-- " cursor mv file edge back    ( file bgn )
-- vnoremap gk :call Slctd_cursor__mv_file_edge('k')<cr>

-- " cursor mv file edge forward ( file end   )
-- vnoremap gj :call Slctd_cursor__mv_file_edge('j')<cr>

-- " 
-- " slct / ynk / paste
-- " 

-- " slctd expnd
-- "vnoremap xx :call Slctd_str__expnd()

-- " slctd expnd srch
-- vnoremap N :call Slctd_str__expnd_srch()<cr>

-- " slctd expnd word forward
-- vnoremap f :call Slctd_str__expnd_word_f()<cr>

-- " slctd expnd quote
-- vnoremap <c-i> :call Slctd_str__expnd_quote_swtch()<cr>

-- " slctd expnd quote on
-- "vnoremap xx :call Slctd_str__expnd_quote_on_swtch()<cr>

-- " slctd expnd quote in
-- "vnoremap xx :call Slctd_str__expnd_quote_in_swtch()<cr>

-- " slctd expnd bracket forward
-- " vnoremap xx :call Slctd_str__expnd_bracket_f()<cr>

-- " slct all
-- vnoremap a :call Slctd_str__all()<cr>

-- " ynk slctd
-- vnoremap o :call Ynk__slctd()<cr>

-- " ynk slctd add
-- "vnoremap xx :call Ynk__add_slctd()<cr>

-- " clp slctd
-- "vnoremap xx "+y

-- " paste
-- " todo refactoring
-- "vnoremap p xx
-- vnoremap <expr> p
-- \ mode() == '<c-v>' ? ':call Slctd_box_edge_l__ynk_line_1()<cr>' :
-- \ mode() == 'v'     ? ':call Slctd_str__ynk()<cr>'     :
-- \                     ':call Slctd_str__ynk()<cr>'
-- " \ mode() == 'v'     ? '"zd"aP'                  :

-- " paste clp
-- "vnoremap xx :call Slctd_str__clp()<cr>

-- " paste visual box
-- "vnoremap xx I<c-r>0<esc>

-- " 
-- " edit
-- " 

-- " ins | cut & ins
-- "vnoremap <space> xx
-- vnoremap <expr> <space>
-- \ mode() == '<c-v>' ? 'I' :
-- \                     'c'

-- " cut & ins
-- "vnoremap <leader><space> "zc

-- " ins $
-- "vnoremap Y xx
-- vnoremap <expr> Y
-- \ mode() == '<c-v>' ? '$A'      :
-- \                     '<c-v>$A'

-- " ins space
-- "vnoremap L xx
-- vnoremap <expr> L
-- \ mode() == '<c-v>' ? 'I <esc>gv' :
-- \ mode() == 'v'     ? '>gv'       :
-- \                     ''

-- " line __ ins comment 1
-- vnoremap ! :call V_ins_cmnt_1()<cr>
-- vnoremap 1 :call V_ins_cmnt_1()<cr>

-- " line mlt __ ins comment
-- vnoremap & :call V_ins_cmnt_mlt()<cr>
-- "vnoremap $ :call V_ins_cmnt_mlt()<cr>

-- " line end __ ins comma
-- vnoremap , :call Curosr_line_end__ins(',')<cr>

-- " pad space
-- vnoremap S :call Slctd__pad_space()<cr>
-- "vnoremap <c-s> :call Slctd__pad_space()<cr>

-- " pad -
-- vnoremap - :call Slctd__pad('-')<cr>

-- " pad |
-- vnoremap <bar> :call Slctd__pad_bar()<cr>

-- " slctd str space __ under score
-- vnoremap q :call Slctd_str_space__underscore()<cr>

-- " line __ join per line
-- vnoremap J :call Slctd_line__join_per_line(3)

-- " del str > ynk
-- "vnoremap d xx
-- vnoremap <expr> d
-- \ mode() == '<c-v>' ? '"ad:let @+ = @a<cr>gv' :
-- \                     '"ad:let @+ = @a<cr>'
-- "vnoremap xx :call V_slctd__del()<cr> " dev doing

-- " del str > ynk not
-- "vnoremap s xx
-- vnoremap <expr> s
-- \ mode() == '<c-v>' ? ':call Slctd__del()<cr>' :
-- \                     '"zx'

-- " line mlt forward del
-- vnoremap <c-d> D

-- " slctd line __ del line top space
-- "vnoremap xx :call Slctd_line_top_space__del()<cr>

-- " slctd line __ del end space
-- vnoremap m :call Slctd_line_end_space__del()<cr>

-- " slctd box __ del cursor f space
-- vnoremap K :call Slctd_box_cursor_r_space__crct()<cr>

-- " slctd str edge out quote __ tgl
-- "vnoremap w     :call Slctd_str_edge_out_quote__tgl()<cr>
-- vnoremap <expr> w
-- \ mode() == '<c-v>' ? ':call Slctd_box_width__1()<cr>'    :
-- \                     ':call Slctd_str_edge_out_char__tgl()<cr>'
-- " \                     ':call Slctd_str_edge_out_quote__tgl()<cr>'

-- " slctd str edge bracket __ tgl
-- " vnoremap W :call Slctd_str_edge_out_bracket__tgl()<cr>

-- " slctd str edge out __ tgl shft
-- vnoremap W :call Slctd_str_edge_out__tgl_shft()<cr>

-- " slctd str edge out __ ins space
-- vnoremap <c-s> :call Slctd_str_edge_out__ins(' ')<cr>
-- "vnoremap S :call Slctd_str_edge_out__ins(' ')<cr>

-- " slctd str edge out __ ins markdown strikethrough
-- vnoremap ~ :call Slctd_str_edge_out__ins_markdown_strikethrough()<cr>

-- " slctd str edge out __ ins markdown strikethrough
-- vnoremap b :call Slctd_str_edge_out__ins_markdown_bold()<cr>

-- " slctd box str mv back
-- "vnoremap xx :call Slctd_box_str__mv('l')<cr>

-- " slctd box str mv forward
-- "vnoremap xx :call Slctd_box_str__mv('r')<cr>

-- " slctd box space __ del
-- vnoremap D :call Slctd_box_space__del()<cr>

-- " slctd box mv back
-- vnoremap <c-w> :call Slctd_box__mv('l')<cr>

-- " slctd box mv forward
-- vnoremap <c-e> :call Slctd_box__mv('r')<cr>

-- " num icl
-- vnoremap + <c-a>gv

-- " num dcl
-- "vnoremap - <c-x>gv

-- " num seq
-- vnoremap * r0gvg<c-a>gv
-- "          ^^^^^^^^^^^^> r0 gv g<c-a> gv
-- "vnoremap * g<c-a>
-- "vnoremap = g<c-a>

-- " indnt shft
-- " slctd indnt __ shft l, r  -  todo dev,
-- "vnoremap ri :call Slctd_indnt__shft_l()<cr>
-- "vnoremap ro :call Slctd_indnt__shft_r()<cr>
-- vnoremap ri <gv
-- vnoremap ro >gv
-- "vnoremap " <gv
-- "vnoremap # >gv
-- "vnoremap 2 <gv
-- "vnoremap 3 >gv

-- " indnt crct
-- vnoremap ; =gv

-- " indnt tab   > space
-- vnoremap :e :call Slctd_line_indnt__space(2)

-- " indnt space > tab
-- "vnoremap xx :call Slctd_line_indnt__tab(2)<cr>

-- " tidy tbl
-- vnoremap :t :call Slctd_line__crct_tbl()

-- " line end ovr, pad __ space
-- "vnoremap xx :call Slctd_line_end__pad_space()

-- " upper / lower tgl
-- vnoremap u ~gv

-- " upper force
-- vnoremap U Ugv

-- " lower force
-- "vnoremap xx ugv

-- " str mb
-- vnoremap :m :call Slctd_line_mb__cnv()
-- "vnoremap M :call Slctd_line_mb__cnv()

-- " 
-- " srch
-- " 

-- " srch cmd
-- vnoremap <leader>k "zy/<c-r>z
-- "vnoremap <leader>i "zy/<c-r>z

-- " srch forward ( srch rpl skip )
-- vnoremap <c-n> :call Slctd_srch_7_slctd__srch_nxt('f')<cr>

-- " srch back
-- "vnoremap xx    :call Slctd_srch_7_slctd__srch_nxt('b')<cr>

-- " srch str set
-- vnoremap n :call Slctd_srch__swtch()<cr>
-- "vnoremap e 
-- vnoremap <expr> e
-- \ mode() == '<c-v>' ? '<esc>' :
-- \                     ':call Srch_str__slctd_str()<cr>'

-- " srch rpl one > ynk, nxt
-- vnoremap <c-p> :call Slctd__rpl_7_srch_nxt()<cr>

-- " rpl ( cmd )
-- "vnoremap :s 
-- vnoremap <expr> :s
-- \ mode() == '<c-v>' ? ':VBoxRpl ' :
-- \                     ':s///g'
-- "\                     ':sort'
-- "\                     ':Rpl '

-- " rpl cr ( add cr )
-- vnoremap <c-m> :call Slctd_line_srch_str__rpl_cr()<cr>

-- " v box edge char shft in
-- "vnoremap <c-h> 
-- vnoremap <expr> <c-h>
-- \ mode() == '<c-v>' ? ':call Slctd_box_edge_r_char__shft_in()<cr>' :
-- \                     ''

-- " fzf buf
-- vnoremap <leader>i :call V_fzf_buf()<cr>

-- " fzf rg
-- vnoremap <leader>o "zy:call Fzf_rg('<c-r>z')<cr>

-- " fzf rg word1
-- vnoremap <leader>O "zy:call Fzf_rg_word1('<c-r>z')<cr>

-- " tag jmp
-- "vnoremap t :call Tag_jmp_by_slctd_line()<cr>

-- " opn app
-- vnoremap go :call Slctd_line_7_opn_app()<cr>

-- " opn brwsr
-- "vnoremap gx <plug>(openbrowser-smart-search)

-- " opn ggl srch
-- vnoremap ggl :call Slctd_str_7_opn_ggl_srch()<cr>

-- " opn youtube video_id
-- vnoremap gy :call Slctd_str_7_opn_yt()<cr>

-- " trns
-- vnoremap r :call Slctd_trns()<cr>

-- " 
-- " cmd
-- " 

-- " cmd history ( fzf )
-- "vnoremap <leader>xx :FzfCmdHstry<cr>

-- " 
-- " nop
-- " 
-- "vnoremap <space> <nop>

-- " 
-- " esc
-- " 
-- vnoremap @ <esc>
-- "vnoremap * <esc>
-- vnoremap / <esc>
-- vnoremap \ <esc>
-- "vnoremap | <esc> " ref vvv
-- "vnoremap <bar> <esc>
-- "vnoremap ! <esc>
-- vnoremap " <esc>
-- vnoremap # <esc>
-- vnoremap $ <esc>
-- "vnoremap % <esc> " ?
-- "vnoremap & <esc>
-- "vnoremap _ <esc>
-- vnoremap ? <esc>
-- vnoremap ( <esc>
-- "vnoremap ; <esc>
-- vnoremap < <esc>
-- vnoremap > <esc>
-- vnoremap = <esc>
-- "vnoremap - <esc>
-- "vnoremap + <esc>
-- "vnoremap , <esc>
-- vnoremap . <esc>
-- "vnoremap ~ <esc>

-- "vnoremap a <esc>
-- "vnoremap b <esc>
-- vnoremap c <esc>
-- "vnoremap d <esc>
-- "vnoremap e <esc>
-- "vnoremap f <esc>
-- vnoremap g <esc>
-- "vnoremap h <esc>
-- "vnoremap i <esc>
-- "vnoremap l <esc>
-- "vnoremap m <esc>
-- "vnoremap n <esc>
-- "vnoremap o <esc>
-- "vnoremap p <esc>
-- "vnoremap q <esc>
-- "vnoremap r <esc>
-- "vnoremap s <esc>
-- vnoremap t <esc>
-- "vnoremap u <esc>
-- "vnoremap v <esc>
-- "vnoremap w <esc>
-- vnoremap x <esc>
-- "vnoremap y <esc>

-- vnoremap A <esc>
-- vnoremap B <esc>
-- vnoremap C <esc>
-- "vnoremap D <esc>
-- "vnoremap E <esc>
-- vnoremap F <esc>
-- vnoremap H <esc>
-- vnoremap I <esc>
-- "vnoremap J <esc>
-- "vnoremap K <esc>
-- "vnoremap L <esc>
-- vnoremap M <esc>
-- "vnoremap N <esc>
-- "vnoremap O <esc>
-- vnoremap P <esc>
-- vnoremap Q <esc>
-- vnoremap R <esc>
-- "vnoremap S <esc>
-- vnoremap T <esc>
-- "vnoremap U <esc>
-- vnoremap V <esc>
-- "vnoremap W <esc>
-- vnoremap X <esc>
-- "vnoremap Y <esc>

-- vnoremap <c-_> <esc>
-- vnoremap <c-\> <esc>

-- vnoremap <c-a> <esc>
-- "vnoremap <c-b> <esc>
-- vnoremap <c-c> <esc>
-- "vnoremap <c-d> <esc>
-- "vnoremap <c-e> <esc>
-- "vnoremap <c-f> <esc>
-- "vnoremap <c-h> <esc>
-- "vnoremap <c-i> <esc>
-- "vnoremap <c-l> <esc>
-- "vnoremap <c-m> <esc>
-- "vnoremap <c-n> <esc>
-- "vnoremap <c-o> <esc>
-- "vnoremap <c-p> <esc>
-- vnoremap <c-q> <esc>
-- vnoremap <c-r> <esc>
-- "vnoremap <c-s> <esc>
-- vnoremap <c-u> <esc>
-- " v disable ??
-- vnoremap <c-v> <esc>
-- "vnoremap <c-w> <esc>
-- vnoremap <c-x> <esc>
-- "vnoremap <c-y> <esc>

-- vnoremap gb <esc>
-- vnoremap gg <esc>
-- vnoremap gh <esc>
-- vnoremap gi <esc>
-- "vnoremap gj <esc>
-- "vnoremap gk <esc>
-- "vnoremap go <esc>
-- vnoremap gp <esc>
-- vnoremap gs <esc>
-- vnoremap gt <esc>
-- "vnoremap gy <esc>

-- "vnoremap :a <esc>
-- vnoremap :f <esc>
-- " :
-- "vnoremap :m <esc>
-- " :
-- "vnoremap :t <esc>
-- " :
-- "vnoremap :z <esc>

-- " leader esc

-- vnoremap <leader>: <esc>

-- "vnoremap <leader>l <esc>
-- vnoremap <leader>u <esc>
-- "vnoremap <leader>y <esc>


-- " 
-- " mode insert
-- " 

-- " quit, esc
-- "inoremap <esc> xx
-- inoremap <expr> <esc>
-- \ pumvisible()               ? '<c-e>'  :
-- \ Is_cursor_col__line_top0() ? '<esc>'  :
-- \                              '<esc>l'

-- " inoremap <c-c> <esc>
-- inoremap <expr> <c-c>
-- \ pumvisible()               ? '<c-e>'  :
-- \ Is_cursor_col__line_top0() ? '<esc>'  :
-- \                              '<esc>l'

-- " cursor mv in line top
-- "inoremap <c-a> <c-o>^
-- "inoremap <c-a> <c-o>0

-- " cursor mv in line end
-- inoremap <c-e> <c-o>$

-- " cursor mv char forward
-- inoremap <c-l> <c-o>l

-- " cursor mv char back
-- inoremap <c-s> <c-o>h
-- "inoremap <c-o> xx
-- inoremap <expr> <c-o>
-- \ pumvisible() ? '<c-y>'  :
-- \                '<c-o>h'

-- " cursor mv word forward
-- "inoremap xx <c-o>e<c-o>l

-- " cursor mv word back
-- "inoremap xx <c-o>b
-- "inoremap <expr> <c-o>
-- "\ pumvisible() ? '<c-y>'  :
-- "\                '<c-o>b'

-- " cursor mv d
-- "inoremap <c-n> <c-o>j

-- " cursor mv u
-- "inoremap <c-p> <c-o>k

-- " ins cr
-- inoremap <c-m> <cr>

-- " ins tab
-- inoremap <tab> <c-v><tab>

-- " ins markdown cr
-- "inoremap xx <space><space>

-- " ins cmp default
-- inoremap <leader>f <c-p>
-- inoremap <c-r>     <c-p>
-- inoremap <c-q>     <c-p>

-- "inoremap <expr> <c-y>
-- "\ pumvisible() ? '<c-e>' :
-- "\                '<c-n>'

-- " ins bracket
-- "inoremap <c-u> <c-r>=I_quote()<cr>
-- inoremap <expr> <c-u>
-- \ pumvisible() ? '<c-n>'               :
-- \                '<c-r>=I_quote()<cr>'
-- "inoremap <c-u> <c-r>=I_bracket()<cr>

-- " ins quote
-- "inoremap <c-j> xx
-- inoremap <expr> <c-j>
-- \ pumvisible() ? '<c-n>'                 :
-- \                '<c-r>=I_bracket()<cr>'
-- " \                '<c-r>=I_quote()<cr>'

-- " ins num
-- inoremap <c-y>     <c-r>=I_num()<cr>
-- "inoremap <leader>k <c-r>=I_num()<cr>

-- " ins symbol
-- inoremap <c-n> <c-r>=I_symbol01()<cr>
-- inoremap <c-f> <c-r>=I_symbol02()<cr>
-- inoremap <c-p> <c-r>=I_symbol03()<cr>

-- " ins markdown
-- "inoremap <c-u> <c-r>=I_markdown_lnk()<cr>

-- " ins todo status
-- "inoremap xx <c-r>=I_todo_status()<cr>

-- " ins week
-- "inoremap xx <c-r>=I_week()<cr>

-- " ins register
-- "inoremap xx <c-r>=I_reg()<cr>

-- " ins reserved word lua
-- "inoremap xx <c-r>=I_reserved_lua()<cr>

-- " ins ooq ( lua )
-- "inoremap xx <c-r>=I_ooq()<cr>

-- " ins bracket
-- "inoremap < <><c-o>h
-- "inoremap ( ()<c-o>h
-- "inoremap { {}<c-o>h
-- "inoremap [ []<c-o>h
-- "inoremap " ""<c-o>h
-- "inoremap ' ''<c-o>h

-- " del char forward
-- inoremap <c-d> <c-o>x

-- " del char back
-- inoremap <c-h> <c-h>

-- " del word back
-- inoremap <c-w> <c-w>

-- " del word forword
-- "inoremap <c-k> xx
-- inoremap <expr> <c-k>
-- \ pumvisible()                ? '<c-p>'   :
-- \ ! Is_cursor_col__line_end() ? '<c-o>dw' :
-- \                               ''

-- " del line
-- " non

-- " paste
-- "inoremap xx <c-r>0

-- " paste clp
-- inoremap <c-v> <c-r><c-o>+

-- " clr
-- "inoremap <expr> <esc> pumvisible() ? '<c-e>'  : ''
-- "inoremap <expr> <c-w> pumvisible() ? '<c-e>'  : '<c-w>'

-- " numpad shift
-- inoremap <kInsert>   0
-- inoremap <kEnd>      1
-- inoremap <kDown>     2
-- inoremap <kPageDown> 3
-- inoremap <kLeft>     4
-- inoremap <kOrigin>   5
-- inoremap <kRight>    6
-- inoremap <kHome>     7
-- inoremap <kUp>       8
-- inoremap <kPageUp>   9

-- " 
-- " nop
-- " 

-- inoremap <leader>   <esc>
-- inoremap <esc>      <esc>
-- "inoremap <esc><esc> <esc>

-- "inoremap <tab> <nop>
-- inoremap <s-tab> <nop>
-- inoremap <c-tab> <nop>
-- "inoremap <c-space> <nop>
-- "inoremap <c-space> <tab> " ?? todo research
-- inoremap <c-space> <tab>

-- "inoremap <c-_> <nop> " non ?
-- inoremap <c-_> <nop>
-- inoremap <c-^> <nop>
-- inoremap <c-\> <nop>
-- inoremap <c--> <nop>
-- "inoremap <c-@> <nop> " non
-- "inoremap <c-,> <nop> " non
-- "inoremap <c-.> <nop> " non
-- "inoremap <c-:> <nop> " non
-- "inoremap <c-;> <nop> " non

-- inoremap <c-a> <nop>
-- inoremap <c-b> <nop>
-- "inoremap <c-f> <nop>
-- inoremap <c-g> <nop>
-- "inoremap <c-i> <nop>
-- "inoremap <c-k> <nop>
-- "inoremap <c-n> <nop>
-- "inoremap <c-o> <nop>
-- "inoremap <c-p> <nop>
-- "inoremap <c-q> <nop>
-- "inoremap <c-r> <nop>
-- "inoremap <c-s> <nop>
-- "inoremap <c-t> <nop>
-- "inoremap <c-u> <nop>
-- "inoremap <c-y> <nop>

-- "inoremap <leader>f <nop>
-- inoremap <leader>i <nop>


-- " 
-- " mode cmd
-- " 

-- " quit
-- cnoremap <c-q> <c-c>

-- " cursor mv line in
-- cnoremap <c-a> <c-b>
-- cnoremap <c-e> <c-e>
-- "cnoremap <c-a> <home>
-- "cnoremap <c-e> <end>

-- " cursor mv char
-- cnoremap <c-s> <Left>
-- cnoremap <c-l> <Right>

-- " cursor mv word
-- cnoremap <c-o> <s-left>
-- cnoremap <c-f> <s-right>

-- " del char
-- cnoremap <c-h> <bs>
-- cnoremap <c-d> <del>

-- " del word forward
-- "cnoremap ?? non ? idea <s-right><c-w>
-- cnoremap <c-k> <del>

-- " del word back
-- cnoremap <c-w> <c-w>

-- " del in line back
-- cnoremap <c-u> <c-u>

-- " paste
-- "cnoremap <c-v> <c-r>0
-- cnoremap <c-v> <c-r>a

-- " history
-- "cnoremap <c-p> <Up>
-- "cnoremap <c-n> <Down>

-- " cmdline win
-- cnoremap <c-_> <c-f>

-- " numpad shift
-- cnoremap <kInsert>   0
-- cnoremap <kEnd>      1
-- cnoremap <kDown>     2
-- cnoremap <kPageDown> 3
-- cnoremap <kLeft>     4
-- cnoremap <kOrigin>   5
-- cnoremap <kRight>    6
-- cnoremap <kHome>     7
-- cnoremap <kUp>       8
-- cnoremap <kPageUp>   9


-- " 
-- " mode term
-- " 

-- " term > normal
-- tnoremap <c-_> <c-\><c-n>

-- " key map end


