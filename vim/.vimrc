" 
" Configuration file for vim
" 
" load re
" :source ~/.vimrc     " alias :v

set modelines=0  " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible  " Use Vim defaults instead of 100% vi compatibility
set backspace=2   " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup

" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

filetype on

hi LineNr      ctermfg=141                         cterm=none
augroup InsertHook
  au!
  au InsertLeave * hi LineNr ctermfg=141
  au InsertEnter * hi LineNr ctermfg=lightgreen
augroup END

hi CursorLineNr ctermfg=magenta

hi Visual                           ctermbg=magenta  cterm=none
hi VisualNOS                        ctermbg=magenta  cterm=none
hi Search      ctermfg=yellow       ctermbg=cyan     cterm=none
hi IncSearch   ctermfg=yellow       ctermbg=cyan     cterm=none
" bracket
"hi MatchParen  ctermfg=magenta      ctermbg=none
hi MatchParen  ctermfg=lightmagenta ctermbg=none

hi TabLineSel                       ctermbg=magenta  cterm=none
hi TabLine     ctermfg=lightblue    ctermbg=none     cterm=none
hi TabLineFill                      ctermbg=none     cterm=none

hi StatusLine  ctermfg=lightblue    ctermbg=none     cterm=none
hi EndOfBuffer ctermfg=cyan                          cterm=none

hi Pmenu       ctermfg=lightgreen   ctermbg=blue
hi PmenuSel    ctermfg=cyan         ctermbg=magenta  cterm=bold

hi ErrorMsg    ctermfg=magenta      ctermbg=none     cterm=none
hi WarningMsg  ctermfg=magenta      ctermbg=none     cterm=none

hi NonText     ctermfg=25           ctermbg=none     cterm=none
hi SpecialKey  ctermfg=25           ctermbg=none     cterm=none

hi Comment     ctermfg=14           ctermbg=none     cterm=none

hi FullWidthSpace                   ctermbg=white
match FullWidthSpace /　/

" vimdiff
hi DiffAdd     ctermfg=10           ctermbg=22       cterm=none
hi DiffDelete  ctermfg=52           ctermbg=52       cterm=none
hi DiffChange  ctermfg=10           ctermbg=17       cterm=none
hi DiffText    ctermfg=10           ctermbg=21       cterm=none


au BufNewFile,BufRead *.script     set filetype=lua
au BufNewFile,BufRead *.gui_script set filetype=lua
au BufNewFile,BufRead *.fish       set filetype=fish

syntax on

set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
set incsearch
set hlsearch
set ignorecase smartcase
set number
set list
set cursorline
set splitbelow
set switchbuf=usetab,newtab
set showcmd

set encoding=utf-8
set fileencodings=utf-8,sjis

"set mouse=n
"map <LeftMouse> <Nop>

set autoindent
set shiftwidth=2 " 4
set tabstop=2    " 4
set expandtab " tab > space

filetype indent on
autocmd FileType lua      setlocal sw=2 sts=2 ts=2 noet " tab
autocmd FileType text     setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType json     setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType vim      setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType fish     setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType sh       setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType markdown setlocal sw=2 sts=2 ts=2   et " space
autocmd FileType python   setlocal sw=4 sts=4 ts=4   et " space

" file opn, cursor mv last
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal! g`\"" | endif
augroup END

autocmd BufWinEnter * normal! zz

set nowrap
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore " cursor mv cr
set virtualedit+=block  " box slct
"set virtualedit=all
set scrolloff=5
set sidescrolloff=4
set wildmode=list:longest
"set tabpagemax=30
set tabpagemax=50
set nf=""
set showtabline=2
set wildmenu " ?
"set showmatch
"set visualbell
"set ambiwidth=double
set autoread


"set clipboard+=unnamedplus " ???

set statusline=%m\                 " 変更あり表示
set statusline+=%F                 " file name 表示
set statusline+=%=                 " 以降を右寄せ
"set statusline+=%{&fileencoding}\  " file encoding
set statusline+=%y\                " file type
set statusline+=%c\                " column num
set statusline+=%p%%\              " line num %
set statusline+=%l/%L              " line num / line num all
set laststatus=2                   " 0:off  1:on when 2 win  2:on
set completeopt=menuone,noinsert
set foldmethod=manual
set shortmess+=I
"set nrformats+=unsigned " 2022-05-09

set noswapfile

" term

command! -nargs=* Term split | wincmd j | resize 15 | term <args>
"autocmd TermOpen * startinsert

" 
" leader
" 
let mapleader = "\<esc>"


" 
" mode normal
" 

" quit buffer
nnoremap w :bd<cr>

" quit buffer force
nnoremap :q :q!

" quit vim
nnoremap W     :q<cr>

" quit tab other
"nnoremap xx :tabo<cr>

" background job
"nnoremap <c-z> <c-z>

" call
"nnoremap xx :call 

" save
"nnoremap a :w<cr>
nnoremap a :call Save()<cr>

" load re slf
"nnoremap xx :call Load_re()

" load re vimrc
nnoremap :v :source ~/wrk/cnf/vim/.vimrc

" 
" opn
" 

" opn tab file
nnoremap :o :Opn 

" opn latest
"nnoremap xx `0

" opn file srch  ( fzf )
nnoremap <leader>l :Files <cr>
nnoremap <leader>L :Files ../memo/
"nnoremap <leader>xx :FzfRunFd <cr>

" opn file hstry ( fzf )
nnoremap <leader>h :FileHstry<cr>

" 
" opn etc
" 

" opn fish cnf
"nnoremap gf :call Opn_fish_cnf()<cr>

" opn .vimrc
nnoremap gh :call Opn_vimrc()<cr>

" opn tmp
nnoremap gt :call Opn_tmp()<cr>

" opn grep work
"nnoremap xx :call Opn_grep_wk()<cr>

" opn vim key note
"nnoremap xx :call Opn_vim_key()<cr>

" opn memo
nnoremap gm :call Opn_memo()<cr>

" opn man
"nnoremap xx :OpnMan 

" opn app
nnoremap go :call Opn_app_by_cursor_path()<cr>

" opn app slf
"nnoremap xx :call Opn_app_slf()<cr>

" opn dir slf
nnoremap gd :call Opn_dir_slf()<cr>

" opn brwsr
"nnoremap xx :call Opn_brwsr()<cr>

" opn ggl srch
nnoremap ggl :call Opn_ggl_srch('')<cr>

" 
" cursor mv
" 

" cursor mv drct
nnoremap <Right> l
nnoremap <Left>  h
nnoremap <Up>    k
nnoremap <Down>  j

" cursor mv line
nnoremap <c-k> 10<c-y>
nnoremap <c-j> 10<c-e>

" cursor mv line start | ins line
nnoremap y :call Cursor__mv_line_top_or_new_line()<cr>

" cursor mv line start
nnoremap <c-a> 0

" cursor mv line end
"nnoremap <c-y> xx
nnoremap <expr> <c-y>
\ Is_cursor_line_end() ? ':call Ins_markdown_cr()<cr>'     :
\                        ':call Cursor__mv_line_end()<cr>'
"\ Is_cursor_line_end() ? ':call Ins_space()<cr>'     :
"\                        ':call Cursor__mv_line_end()<cr>'

nnoremap <c-e> :call Cursor__mv_line_end()<cr>

" cursor mv char - forward
nnoremap l l

" cursor mv char - back
nnoremap <c-o> h
nnoremap <c-s> h

" cursor mv word - forward
nnoremap f :call Cursor__mv_word_f()<cr>

" cursor mv word - back
nnoremap o :call Cursor__mv_word_b()<cr>

" cursor mv word - back pre
"nnoremap xx :call Cursor__mv_word_b_pre()<cr>

" cursor mv word dlm _ forward
nnoremap _ f_l
"nnoremap <c-_> f_l

" cursor mv word dlm _ back
nnoremap <c-_> hT_
"nnoremap _ hT_

" cursor mv word dlm camel - forward
nnoremap F /\u<cr>
"nnoremap F :call Cursor__mv_word_dlm_camel_f()<cr>  " dev doing

" cursor mv bracket pair
nnoremap <c-l> %

" cursor mv bracket out back
"nnoremap <c-w> [{

" cursor mv bracket fnc back
"nnoremap xx [m

" cursor mv edited ( jmp list )
"nnoremap xx <c-o>
"nnoremap xx <c-i>

" cursor mv file edge back    ( file bgn )
nnoremap gk :call Cursor__mv_file_edge('k')<cr>

" cursor mv file edge forward ( file end   )
nnoremap gj :call Cursor__mv_file_edge('j')<cr>

" cursor mv edit latest
"nnoremap xx `.

" scroll

nnoremap K      <c-y>
nnoremap J      <c-e>
nnoremap <up>   <c-y>
nnoremap <down> <c-e>

" cursor mv jmp
nnoremap rk        :call Cursor__mv_jmp_v('k')<cr>
nnoremap rj        :call Cursor__mv_jmp_v('j')<cr>
nnoremap r<space>k :call Cursor__mv_jmp_char('k', 'f')<cr>
nnoremap r<space>j :call Cursor__mv_jmp_char('j', 'f')<cr>

"nnoremap RK :call Cursor__mv_jmp_char('k', 'f')<cr>
"nnoremap RJ :call Cursor__mv_jmp_char('j', 'f')<cr>
"nnoremap rK :call Cursor__mv_jmp_char('k', 'f')<cr>
"nnoremap rJ :call Cursor__mv_jmp_char('j', 'f')<cr>

"nnoremap xx :call Cursor__mv_jmp_char('k', 't')<cr>
"nnoremap xx :call Cursor__mv_jmp_char('j', 't')<cr>
"nnoremap xx :call Cursor__mv_jmp_space('k')<cr>
"nnoremap xx :call Cursor__mv_jmp_space('j')<cr>

" scroll cursor line upper
"nnoremap xx zt

" scroll cursor line middle
"nnoremap xx zz

" win mv r
" nnoremap xx <c-w>l

" win mv l
" nnoremap xx <c-w>h

" win nxt
nnoremap <c-w> <c-w>w

" 
" slct / ynk / paste
" 

" slct
nnoremap I v

" slct word
nnoremap i :call Slct_word()<cr>

" slct char current - word end
"nnoremap xx ve

" slct visual box
nnoremap v <c-v>

" slct all
nnoremap A :call Ynk__line_all()<cr>

" slct re
nnoremap rr :call Slct_re()<cr>
nnoremap r  :call Slct_re()<cr>

" ynk clr
         
nnoremap <c-c> :call Ynk__clr()<cr>

" ynk line
nnoremap c :call Ynk__line()<cr>

" ynk char
"nnoremap xx "ayl

" ynk slf path
nnoremap gs :call Ynk__slf_path()<cr>
"nnoremap gp :call Ynk__slf_path()<cr>

" paste
nnoremap p :call Paste()<cr>

" paste clipboard
nnoremap P :call Paste__clipboard()<cr>

" paste rgstr history ( fzf )
nnoremap <leader>r :RgstrHstry<cr>
"nnoremap <leader>c :RgstrHstry<cr>

" 
" undo, redo
" 
nnoremap h     u
nnoremap <c-h> <c-r>

" undo clr
"nnoremap xx :call Undo_clr()<cr>

" repeat
"nnoremap xx .

" 
" edit
" 

" mode ins
nnoremap <space> i

" ins line
" ref nnoremap y

" ins cr
nnoremap m :call Ins_cr()<cr>

" ins comment 1
"nnoremap ! xx
nnoremap <expr> !
\ Is_file_type('markdown') ? ':call Ins_markdown_h()<cr>' :
\                            ':call Ins_cmnt_1("^")<cr>'
"nnoremap 1 xx
nnoremap <expr> 1
\ Is_file_type('markdown') ? ':call Ins_markdown_h()<cr>' :
\                            ':call Ins_cmnt_1("^")<cr>'

" ins comment mlt
nnoremap $ :call Ins_cmnt_mlt()<cr>

" ins comma
nnoremap , i, <esc>l

" ins comma $, nxt line
nnoremap < A,<esc>j

" ins period
nnoremap . i.<esc>

" ins hyphen
nnoremap = :call Ins_hyphen()<esc>
nnoremap 0 :call Ins_hyphen()<esc>

" ins space
nnoremap L :call Ins_space(v:false)<cr>
nnoremap Y :call Ins_space(v:true )<cr>

" ins date
nnoremap * :call Ins_da()<cr>

" ins date time
nnoremap \     :call Ins_dt()<cr>
nnoremap <bar> :call Ins_dt()<cr>

" ins day of week
"nnoremap xx :call Ins_week()<cr>

" ins slf path
"nnoremap xx :call Ins_line_slf_path()<cr>

" ins markdown code
nnoremap <c-u> :call Ins_markdown_code()<cr>
nnoremap `     :call Ins_markdown_code()<cr>

" ins markdown itm
"nnoremap O xx
nnoremap <expr> O
\ Is_file_type('markdown') ? ':call Ins_markdown_itm()<cr>' :
\                            ':call Indnt__shft_r()<cr>'

" ins dots ( or crnt )
nnoremap > :call Line_end__dots_adjst()<cr>

" ins indnt space
nnoremap V :call Ins_line__indnt_space()<cr>

" tgl markdown chk
"nnoremap xx :call Char_markdown_chk__tgl()<cr>

" del char
nnoremap s "zx

" line del
nnoremap d :call Line__del()<cr>

" line forward del
nnoremap <c-d> D

" word back    del
"nnoremap xx hvbd

" word forward del
"nnoremap <expr> xx Is_cursor_line_end() ? '<esc>' : '"zdw'
"nnoremap <expr> xx Is_cursor_line_end() ? '<esc>' : '"zde'

" del cr ( line join )
nnoremap <c-m> J

" line mv up
"nnoremap xx "addk"aP

" line dpl
nnoremap D "zyy"zP
nnoremap S "zyy"zP
"nnoremap R "zyy"zP

" repeat memory
"nnoremap xx qy
"nnoremap xx @y

" char tgl
nnoremap u :call N_char__tgl()<cr>

" char tgl type ch
nnoremap U :call N_char__tgl_shift()<cr>

" num icl
"nnoremap xx :call Cursor_str__icl()<cr>

" num dcl
"nnoremap xx :call Cursor_str__dcl()<cr>

" indnt shft
nnoremap " :call Indnt__shft_l()<cr>
nnoremap # :call Indnt__shft_r()<cr>
nnoremap 2 :call Indnt__shft_l()<cr>
nnoremap 3 :call Indnt__shft_r()<cr>

" indnt add
"nnoremap xx :call Indnt__add(2)<cr>

" indnt crct
nnoremap ; :call Indnt__crct()<cr>

" cursor f space __ crct
"nnoremap xx :call Cursor_f_space__crct()<cr>

" 
" srch
" 

" srch hl init
nnoremap / /<cr>N
"nnoremap b /<cr>N
"nnoremap b :call Srch_init()<cr>

" srch char in line - forward
"nnoremap xx f

" srch char in line repeat
"nnoremap xx ;

" srch by cmd
nnoremap <leader>k /

" srch by cmd word

nnoremap <leader>K /\<\><left><left>

" srch word or
"nnoremap xx Xxx

" srch forward
nnoremap n     :call Srch('f')<cr>

" srch back
nnoremap <c-n> :call Srch('b')<cr>

" srch, cursor mv nxt char
"nnoremap @ :call Srch_7_cursor__mv_nxt('f')<cr>

" srch str set
nnoremap e :call N_srch_str__flt()<cr>

" srch str set ( word 1 )
nnoremap E :call N_srch_str__word1_tgl()<cr>

" srch char bracket forward
"nnoremap xx :call Srch_char_bracket('f')<cr>

" srch str history ( fzf )
nnoremap <leader>f :SrchHstry<cr>
nnoremap <leader>n :SrchHstry<cr>

" srch str set prv ( tgl )
nnoremap N :call Srch_str__prv_tgl()<cr>

" srch rpl one > ynk nxt ( only srch )
nnoremap <c-p> :call Srch_slct('f')<cr>

" srch ?=ts
"nnoremap xx /?ts=<cr>

" rpl ( cmd )
"nnoremap :s :Rpl 
nnoremap :s :%s///g

" grep ( fzf )
nnoremap <leader>o :Rg <cr>

nnoremap <leader>O :RgExt js

" grep ( fzf )  -  myrun
" nnoremap <leader>O :FzfByRgMyrun <cr>

" grep buf ( fzf )
nnoremap <leader>i :call N_grep_buf()<cr>

" jmplst ( fzf )
nnoremap <leader>e :FzfByJmplst<cr>

" memo ( fzf )
"nnoremap <leader>xx :FzfByMemo <cr>

" grep [rg] ( read )
"nnoremap xx :GrepStr <c-r>/
"nnoremap xx :GrepWrd <c-r>/

" tag jmp tab new
nnoremap t :call N_tag_jmp()<cr>

" 
" cmd
" 

" cmd history ( fzf )
nnoremap <leader>: :CmdHstry<cr>
nnoremap <leader>y :CmdHstry<cr>

" sys cmd
nnoremap :! :! 

" ins sys cmd ( read )
nnoremap :r :InsSysCmd 

" pth
nnoremap :p :Pth <cr>

" cd slf
nnoremap :h :CdSlf
nnoremap :d :CdSlf

" cd parent
nnoremap :k :K
" nnoremap :a :Cdu

" 
" tab
" 

" tab mv
nnoremap <tab>   gt
nnoremap <s-tab> gT

" tab order
nnoremap <s-left>  :tabm-1<cr>
nnoremap <s-right> :tabm+1<cr>

" 
" term
" 

nnoremap xx :Term 

" 
" mark
" 

" mark lst ( fzf )
"nnoremap <leader>rl :Mark<cr>

" mark show tgl
"nnoremap <leader>rf :call Mark_show_tgl()<cr>

" mark add / del tgl
"nnoremap <leader>ro :call Mark_tgl()<cr>

" mark del all
"nnoremap <leader>rd :call Mark_del_all()<cr>

" mark, cursor mv mark forward
"nnoremap <leader>rj ]`

" mark, cursor mv mark back
"nnoremap <leader>rk [`

" 
" etc
" 

" buffer list
"nnoremap :xx :buffers

" inf char
"nnoremap xx ga

" wrap tgl
nnoremap :w :set wrap!

" line num view tgl
nnoremap :n :set number!

" tst
"nnoremap xx :call Tst()<cr>

" numpad shift
nnoremap <kInsert>   0
nnoremap <kEnd>      1
nnoremap <kDown>     2
nnoremap <kPageDown> 3
nnoremap <kLeft>     4
nnoremap <kOrigin>   5
nnoremap <kRight>    6
nnoremap <kHome>     7
nnoremap <kUp>       8
nnoremap <kPageUp>   9

" 
" esc
" 
nnoremap <esc>   <esc>
"nnoremap <space> <esc>
nnoremap <s-space> <esc>
"nnoremap <cr>    <esc>
nnoremap <bs>    <esc>

"nnoremap = <esc>
nnoremap @ <esc>
"nnoremap ; <esc>
"nnoremap , <esc>
"nnoremap . <esc>
"nnoremap * <esc>
"nnoremap _ <esc>
nnoremap ~ <esc>
nnoremap ^ <esc>
"nnoremap / <esc>
"nnoremap \ <esc>
"nnoremap | <esc> " replace key : <bar>
"nnoremap <bar> <esc>
nnoremap ? <esc>

"nnoremap ! <esc>
"nnoremap " <esc>
"nnoremap ` <esc>
"nnoremap # <esc>
"nnoremap $ <esc>
"nnoremap % <esc> " ?
nnoremap & <esc>
nnoremap ( <esc>
"nnoremap < <esc>
"nnoremap > <esc>

"nnoremap 0 <esc>
"nnoremap a <esc>
nnoremap b <esc>
"nnoremap c <esc>
"nnoremap d <esc>
"nnoremap e <esc>
"nnoremap f <esc>
"nnoremap g <esc>
"nnoremap h <esc>
"nnoremap i <esc>
"nnoremap l <esc>
"nnoremap m <esc>
"nnoremap n <esc>
"nnoremap o <esc>
nnoremap q <esc>
"nnoremap r <esc>
"nnoremap s <esc>
"nnoremap t <esc>
"nnoremap u <esc>
"nnoremap w <esc>
nnoremap x <esc>
"nnoremap y <esc>
nnoremap z <esc>

"nnoremap A <esc>
nnoremap B <esc>
nnoremap C <esc>
"nnoremap D <esc>
"nnoremap E <esc>
"nnoremap F <esc>
nnoremap G <esc>
nnoremap H <esc>
"nnoremap I <esc>
"nnoremap J  <esc>
"nnoremap K  <esc>
"nnoremap L <esc>
nnoremap M <esc>
"nnoremap N <esc>
"nnoremap O <esc>
nnoremap Q <esc>
"nnoremap P <esc>
nnoremap R <esc>
"nnoremap S <esc>
nnoremap T <esc>
"nnoremap U <esc>
"nnoremap W <esc>
"nnoremap V <esc>
nnoremap X <esc>
"nnoremap Y <esc>

nnoremap <c-tab> <nop>
nnoremap <c-space> <esc>
nnoremap <c-@> <esc>
"nnoremap <c-^> <esc>
"nnoremap <c--> <esc> " non ?
"nnoremap <c-*> <esc> " non ?
"nnoremap <c-:> <esc> " non
"nnoremap <c-;> <esc> " non
"nnoremap <c-,> <esc> " non ?
"nnoremap <c-.> <esc> " non ?
"nnoremap <c-/> <esc> " non ?
"nnoremap <c-_> <esc>
"nnoremap <c-[> <esc>
nnoremap <c-]> <esc>

"nnoremap <c-a> <esc>
nnoremap <c-b> <esc>
"nnoremap <c-c> <esc>
"nnoremap <c-d> <esc>
"nnoremap <c-e> <esc>
nnoremap <c-f> <esc>
nnoremap <c-g> <esc>
"nnoremap <c-h> <esc>
"nnoremap <c-i> <esc> " tab
"nnoremap <c-l> <esc>
"nnoremap <c-m> <esc>
"nnoremap <c-n> <esc>
"nnoremap <c-o> <esc>
"nnoremap <c-p> <esc>
nnoremap <c-q> <esc>
nnoremap <c-r> <esc>
"nnoremap <c-s> <esc>
nnoremap <c-t> <esc>
"nnoremap <c-u> <esc>
nnoremap <c-v> <esc>
"nnoremap <c-w> <esc>
nnoremap <c-x> <esc>
"nnoremap <c-y> <esc>
nnoremap <c-z> <esc>

"nnoremap ga <esc>
nnoremap gb <esc>
"nnoremap gd <esc>
"nnoremap ge <esc>
nnoremap gf <esc>
nnoremap gg <esc>
"nnoremap gh <esc>
nnoremap gi <esc>
"nnoremap gj <esc>
"nnoremap gk <esc>
nnoremap gl <esc>
"nnoremap gm <esc>
nnoremap gn <esc>
"nnoremap go <esc>
nnoremap gp <esc>
"nnoremap gs <esc>
"nnoremap gt <esc>
"nnoremap gu <esc>
nnoremap gv <esc>
nnoremap gw <esc>
nnoremap gy <esc>

nnoremap :a :a
nnoremap :b :b
nnoremap :c :c
"nnoremap :d :d
nnoremap :e :e
"nnoremap :f :f
nnoremap :g :g
"nnoremap :h :h
"          :
"nnoremap :k :k
"          :
"nnoremap :p :p
"nnoremap :q :q
"nnoremap :r :r
"nnoremap :s :s
"          :
"nnoremap :u :u
"          :
nnoremap :z :z

" mode normal end


" 
" mode visual
" 

" mode ch line
vnoremap i V

" mode ch visual box
vnoremap v <c-v>

" file srch ( fzf )
"vnoremap <leader>l "zy:Files <c-r>z


" 
" cursor mv
" 

" cursor mv slctd edge tgl
vnoremap y o

" cursor mv char forward
vnoremap l l

" cursor mv char back
vnoremap <c-o> h

" cursor mv word - forward
vnoremap f :call Slctd__expnd_word_f()<cr>

" cursor mv word - back
"vnoremap xx b
"vnoremap xx bh
"vnoremap xx Bh

" cursor mv line end
vnoremap <c-y> :call V_cursor__mv_line_end()<cr>

" cursor mv slctd reduce dlm _ l
vnoremap _     of_lo

" cursor mv slctd reduce dlm _ r
vnoremap <c-_> F_h

" cursor mv space - forward ( word pre )
"vnoremap xx wh

" cursor mv line
vnoremap <c-j> 10j
vnoremap <c-k> 10k

" cursor mv jmp
vnoremap rk :call V_cursor__mv_jmp_v('k')<cr>
vnoremap rj :call V_cursor__mv_jmp_v('j')<cr>

" cursor mv bracket pair
vnoremap <c-l> %

" cursor mv bracket out back
"vnoremap xx [{

" cursor mv bracket fnc back
"vnoremap xx [m

" cursor mv file edge back    ( file bgn )
vnoremap gk :call V_cursor__mv_file_edge('k')<cr>

" cursor mv file edge forward ( file end   )
vnoremap gj :call V_cursor__mv_file_edge('j')<cr>

" 
" slct / ynk / paste
" 

" slctd expnd
vnoremap <c-i> :call Slctd__expnd()<cr>

" slctd expnd bracket forward
vnoremap I     :call Slctd__expnd_bracket_f()<cr>

" slct all
vnoremap a :call Slct_all()<cr>

" ynk slctd
vnoremap o :call V_ynk()<cr>
vnoremap c :call V_ynk()<cr>

" ynk slctd add
vnoremap O :call V_ynk__add_slctd()<cr>

" clipboard slctd
"vnoremap xx "+y

" paste
"vnoremap p xx
vnoremap <expr> p
\ mode() == '<c-v>' ? ':call V_box_paste()<cr>' :
\ mode() == 'v'     ? '"zd"aP'                  :
\                     ':call V_paste()<cr>'

" paste clipboard
vnoremap P :call V_paste__clipboard()<cr>

" paste visual box
"vnoremap xx I<c-r>0<esc>

" undo
"vnoremap h <esc>u

" 
" edit
" 

" ins | cut & ins
"vnoremap <space> xx
vnoremap <expr> <space>
\ mode() == '<c-v>' ? 'I' :
\                     'c'

" cut & ins
"vnoremap <leader><space> "zc

" ins $
"vnoremap Y xx
vnoremap <expr> Y
\ mode() == '<c-v>' ? '$A'      :
\                     '<c-v>$A'

" ins space
"vnoremap L xx
vnoremap <expr> L
\ mode() == '<c-v>' ? 'I <esc>gv' :
\ mode() == 'v'     ? '>gv'       :
\                     ''

" ins comment 1
vnoremap ! :call V_ins_cmnt_1()<cr>
vnoremap 1 :call V_ins_cmnt_1()<cr>

" ins comment mlt
vnoremap & :call V_ins_cmnt_mlt()<cr>
"vnoremap $ :call V_ins_cmnt_mlt()<cr>

" ins selected edge
vnoremap b :<c-u>SlctdEdgeIns `

" ins date time
"vnoremap xx x:call Ins_da()<cr>

" ins day of week
"vnoremap xx x:call Ins_week()<cr>

" ins time
"vnoremap xx c<c-r>=strftime("%H:%M")<cr><esc>
"vnoremap xx c<c-r>=strftime('%H:%M')<cr><esc>

" del str > ynk
"vnoremap d xx
vnoremap <expr> d
\ mode() == '<c-v>' ? '"ad:let @+ = @a<cr>gv' :
\                     '"ad:let @+ = @a<cr>'
"vnoremap xx :call V_slctd__del()<cr> " dev doing

" del str > ynk not
"vnoremap s xx
vnoremap <expr> s
\ mode() == '<c-v>' ? '"zdgv' :
\                     '"zx'
"vnoremap s "zx

" del str pad space
vnoremap S "aygvr gv
" vnoremap S :call V_slctd__space()<cr> " use not

" line __ join per line
vnoremap J :call V_line__join_per_line(3)

" del line top space
"vnoremap xx :call V_line_top_space__del()<cr>

" del line end space
vnoremap m :call V_line_end_space__del()<cr>

" del cursor f space
vnoremap K :call V_cursor_f_space__del()<cr>

" del v box space
vnoremap D :call V_box_space__del()<cr>

" slct box mv back
vnoremap <c-w> :call Slctd_box__mv('l')<cr>

" slct box mv forward
vnoremap <c-e> :call Slctd_box__mv('r')<cr>

" slctd str mv back
vnoremap <c-s> :call Slctd_box_str__mv('l')<cr>

" slctd str mv forward
vnoremap <c-f> :call Slctd_box_str__mv('r')<cr>

" num icl
vnoremap + <c-a>gv

" num dcl
vnoremap - <c-x>gv

" num seq
vnoremap * g<c-a>
vnoremap = g<c-a>

" indnt shft
vnoremap # >gv
vnoremap " <gv
vnoremap 3 >gv
vnoremap 2 <gv

" indnt crct
vnoremap ; =gv

" indnt tab   > space
vnoremap :e :call V_line_indnt__space(2)

" indnt space > tab
"vnoremap xx :call V_line_indnt__tab(2)<cr>

" tab > space
vnoremap :t :call V_line_tab__rpl_space(12)

" line end ovr, pad __ space
"vnoremap xx :call V_line_end__pad_space()

" upper / lower tgl
vnoremap u ~gv

" upper all
vnoremap U Ugv

" lower all
vnoremap <c-u> ugv

" str mb
vnoremap M :MbCnv <cr>

" 
" srch
" 

" srch cmd
vnoremap <leader>k "zy/<c-r>z
"vnoremap <leader>i "zy/<c-r>z

" srch forward ( srch rpl skip )
vnoremap <c-n> :call V_srch_slct('f')<cr>

" srch back
"vnoremap xx    :call V_srch_slct('b')<cr>

" srch str set
"vnoremap n 
vnoremap <expr> n
\ mode() == '<c-v>' ? '<esc>' :
\                     ':call V_srch_str__slctd_str()<cr>'
"vnoremap e 
vnoremap <expr> e
\ mode() == '<c-v>' ? '<esc>' :
\                     ':call V_srch_str__slctd_str()<cr>'

" srch rpl one > ynk, nxt
vnoremap <c-p> :call Slctd_rpl_srch_nxt()<cr>

" rpl ( cmd )
"vnoremap :s 
vnoremap <expr> :s
\ mode() == '<c-v>' ? ':RplBox ' :
\                     ':sort'
"\                     ':s///g'
"\                     ':Rpl '

" rpl cr ( add cr )
vnoremap <c-m> :call V_line_srch_str__rpl_cr()<cr>

" v box edge char shft in
"vnoremap <c-s> 
"vnoremap <c-h> 
vnoremap <expr> <c-h>
\ mode() == '<c-v>' ? ':call V_box_edge_r_char__shft_in()<cr>' :
\                     ''

" cnv markdown tbl header
vnoremap :m :call V_2_markdown_tbl_header()

" 
" grep
" 

" grep buf ( fzf )
vnoremap <leader>i :call V_grep_buf()<cr>
"vnoremap <leader>k :call V_grep_buf()<cr>

" grep ( fzf )
vnoremap <leader>o "zy:Rg <c-r>z<cr>
"vnoremap <leader>o "zy:Rg <c-r>z

" grep [rg]   ( read )
"vnoremap xx "zy:GrepStr <c-r>z
"vnoremap xx "zy:GrepWrd <c-r>z

" tag jmp
vnoremap t :call V_tag_jmp()<cr>

" opn app
vnoremap go :call V_opn_app()<cr>

" opn brwsr
"vnoremap gx <plug>(openbrowser-smart-search)

" opn ggl srch
vnoremap ggl :call V_opn_ggl_srch()<cr>

" opn youtube video_id
vnoremap gy :call V_opn_yt()<cr>

" trns
vnoremap r :call V_trns()<cr>

" tst
"vnoremap xx :call Tst()<cr>

" 
" nop
" 
"vnoremap <space> <nop>

" 
" esc
" 
vnoremap @ <esc>
"vnoremap * <esc>
vnoremap / <esc>
vnoremap \ <esc>
"vnoremap ! <esc>
"vnoremap " <esc>
"vnoremap # <esc>
vnoremap $ <esc>
"vnoremap % <esc> " ?
"vnoremap & <esc>
"vnoremap _ <esc>
vnoremap ? <esc>
vnoremap ( <esc>
"vnoremap ; <esc>
vnoremap < <esc>
vnoremap > <esc>
"vnoremap = <esc>
"vnoremap + <esc>
vnoremap , <esc>
vnoremap . <esc>
vnoremap <bar> <esc>

"vnoremap a <esc>
"vnoremap b <esc>
"vnoremap c <esc>
"vnoremap d <esc>
"vnoremap e <esc>
"vnoremap f <esc>
vnoremap g <esc>
vnoremap h <esc>
"vnoremap i <esc>
"vnoremap l <esc>
"vnoremap m <esc>
"vnoremap n <esc>
"vnoremap o <esc>
"vnoremap p <esc>
vnoremap q <esc>
"vnoremap r <esc>
"vnoremap s <esc>
"vnoremap t <esc>
"vnoremap u <esc>
"vnoremap v <esc>
vnoremap w <esc>
vnoremap x <esc>
"vnoremap y <esc>

vnoremap A <esc>
vnoremap B <esc>
vnoremap C <esc>
"vnoremap D <esc>
"vnoremap E <esc>
vnoremap F <esc>
vnoremap H <esc>
"vnoremap I <esc>
"vnoremap J <esc>
"vnoremap K <esc>
"vnoremap L <esc>
"vnoremap M <esc>
"vnoremap N <esc>
"vnoremap O <esc>
"vnoremap P <esc>
vnoremap Q <esc>
vnoremap R <esc>
"vnoremap S <esc>
"vnoremap T <esc>
"vnoremap U <esc>
vnoremap V <esc>
vnoremap W <esc>
vnoremap X <esc>
"vnoremap Y <esc>

"vnoremap <c-_> <esc>

vnoremap <c-a> <esc>
"vnoremap <c-b> <esc>
vnoremap <c-c> <esc>
vnoremap <c-d> <esc>
"vnoremap <c-e> <esc>
"vnoremap <c-f> <esc>
"vnoremap <c-h> <esc>
"vnoremap <c-i> <esc>
"vnoremap <c-l> <esc>
"vnoremap <c-m> <esc>
"vnoremap <c-n> <esc>
"vnoremap <c-o> <esc>
"vnoremap <c-p> <esc>
vnoremap <c-q> <esc>
vnoremap <c-r> <esc>
"vnoremap <c-s> <esc>
"vnoremap <c-u> <esc>
vnoremap <c-v> <esc>
"vnoremap <c-w> <esc>
vnoremap <c-x> <esc>
"vnoremap <c-y> <esc>

vnoremap gb <esc>
vnoremap gg <esc>
vnoremap gh <esc>
vnoremap gi <esc>
"vnoremap gj <esc>
"vnoremap gk <esc>
"vnoremap go <esc>
vnoremap gp <esc>
vnoremap gs <esc>
vnoremap gt <esc>
"vnoremap gy <esc>

"vnoremap :a <esc>
vnoremap :f <esc>
" :
"vnoremap :t <esc>
" :
"vnoremap :z <esc>


" 
" mode insert
" 

" quit, esc
"inoremap <esc> xx
inoremap <expr> <esc>
\ pumvisible()          ? '<c-e>'  :
\ Is_cursor_line_top0() ? '<esc>'  :
\                         '<esc>l'

" inoremap <c-c> <esc>
inoremap <expr> <c-c>
\ pumvisible()          ? '<c-e>'  :
\ Is_cursor_line_top0() ? '<esc>'  :
\                         '<esc>l'

" cursor mv line in
inoremap <c-a> <c-o>^
"inoremap <c-a> <c-o>0
inoremap <c-e> <c-o>$

" cursor mv char forward
inoremap <c-l> <c-o>l

" cursor mv char back
inoremap <c-s> <c-o>h
"inoremap <c-o> xx
inoremap <expr> <c-o>
\ pumvisible() ? '<c-y>'  :
\                '<c-o>h'

" cursor mv word forward
"inoremap xx <c-o>e<c-o>l

" cursor mv word back
"inoremap xx <c-o>b
"inoremap <expr> <c-o>
"\ pumvisible() ? '<c-y>'  :
"\                '<c-o>b'

" cursor mv d
inoremap <c-n> <c-o>j

" cursor mv u
inoremap <c-p> <c-o>k

" ins cr
inoremap <c-m> <cr>

" ins tab
inoremap <tab> <c-v><tab>

" ins markdown cr
"inoremap xx <space><space>

" ins complete default
inoremap <c-q> <c-p>
inoremap <c-g> <c-p>

"inoremap <expr> <c-y>
"\ pumvisible() ? '<c-e>' :
"\                '<c-n>'

" ins bracket
"inoremap <c-j> xx
inoremap <expr> <c-j>
\ pumvisible() ? '<c-n>'                 :
\                '<c-r>=I_bracket()<cr>'

" ins num
inoremap <c-y> <c-r>=I_num()<cr>

" ins symbol
inoremap <c-r> <c-r>=I_symbol01()<cr>
inoremap <c-f> <c-r>=I_symbol02()<cr>

" ins markdown
inoremap <c-u> <c-r>=I_markdown()<cr>

" ins week
"inoremap xx <c-r>=I_week()<cr>

" ins register
"inoremap xx <c-r>=I_reg()<cr>

" ins reserved word lua
"inoremap xx <c-r>=I_reserved_lua()<cr>

" ins ooq ( lua )
"inoremap xx <c-r>=I_ooq()<cr>

" ins bracket
"inoremap < <><c-o>h
"inoremap ( ()<c-o>h
"inoremap { {}<c-o>h
"inoremap [ []<c-o>h
"inoremap " ""<c-o>h
"inoremap ' ''<c-o>h

" del char forward
inoremap <c-d> <c-o>x

" del char back
inoremap <c-h> <c-h>

" del word back
inoremap <c-w> <c-w>

" del word forword
"inoremap <c-k> xx
inoremap <expr> <c-k>
\ pumvisible()           ? '<c-p>'   :
\ ! Is_cursor_line_end() ? '<c-o>dw' :
\                          ''

" del line
" non

" paste
"inoremap xx <c-r>0

" paste clipboard
inoremap <c-v> <c-r><c-o>+

" clr
"inoremap <expr> <esc> pumvisible() ? '<c-e>'  : ''
"inoremap <expr> <c-w> pumvisible() ? '<c-e>'  : '<c-w>'

" numpad shift
inoremap <kInsert>   0
inoremap <kEnd>      1
inoremap <kDown>     2
inoremap <kPageDown> 3
inoremap <kLeft>     4
inoremap <kOrigin>   5
inoremap <kRight>    6
inoremap <kHome>     7
inoremap <kUp>       8
inoremap <kPageUp>   9

" 
" nop
" 

"inoremap <tab> <nop>
inoremap <s-tab> <nop>

inoremap <c-_> <nop>
inoremap <c-^> <nop>
inoremap <c-\> <nop>
inoremap <c--> <nop>
"inoremap <c-@> <nop> " non
"inoremap <c-,> <nop> " non
"inoremap <c-.> <nop> " non
"inoremap <c-:> <nop> " non
"inoremap <c-;> <nop> " non

"inoremap <c-a> <nop>
inoremap <c-b> <nop>
"inoremap <c-f> <nop>
"inoremap <c-g> <nop>
"inoremap <c-k> <nop>
"inoremap <c-n> <nop>
"inoremap <c-o> <nop>
"inoremap <c-p> <nop>
"inoremap <c-q> <nop>
"inoremap <c-r> <nop>
"inoremap <c-s> <nop>
"inoremap <c-t> <nop>
"inoremap <c-u> <nop>
"inoremap <c-y> <nop>

" 
" mode cmd
" 

" quit
cnoremap <c-q> <c-c>

" cursor mv line in
cnoremap <c-a> <c-b>
cnoremap <c-e> <c-e>
"cnoremap <c-a> <home>
"cnoremap <c-e> <end>

" cursor mv char
cnoremap <c-s> <Left>
cnoremap <c-l> <Right>

" cursor mv word
cnoremap <c-o> <s-left>
cnoremap <c-f> <s-right>

" del char
cnoremap <c-h> <bs>
cnoremap <c-d> <del>

" del word forward
"cnoremap ?? non ? idea <s-right><c-w>
cnoremap <c-k> <del>

" del word back
cnoremap <c-w> <c-w>

" del in line back
cnoremap <c-u> <c-u>

" paste
"cnoremap <c-v> <c-r>0
cnoremap <c-v> <c-r>a

" history
"cnoremap <c-p> <Up>
"cnoremap <c-n> <Down>

" cmdline win
cnoremap <c-_> <c-f>

" numpad shift
cnoremap <kInsert>   0
cnoremap <kEnd>      1
cnoremap <kDown>     2
cnoremap <kPageDown> 3
cnoremap <kLeft>     4
cnoremap <kOrigin>   5
cnoremap <kRight>    6
cnoremap <kHome>     7
cnoremap <kUp>       8
cnoremap <kPageUp>   9

" 
" mode term
" 

" term > normal
tnoremap <c-_> <c-\><c-n>

" 
" leader esc
" 

"nnoremap <leader>: <esc>

nnoremap <leader>c <esc>
nnoremap <leader>d <esc>
"nnoremap <leader>e <esc>
"nnoremap <leader>f <esc>
"nnoremap <leader>h <esc>
nnoremap <leader>j <esc>
"nnoremap <leader>l <esc>
nnoremap <leader>m <esc>
"nnoremap <leader>n <esc>
"nnoremap <leader>o <esc>
nnoremap <leader>p <esc>
"nnoremap <leader>r <esc>
nnoremap <leader>s <esc>
nnoremap <leader>u <esc>
"nnoremap <leader>y <esc>

"vnoremap <leader>l <esc>
vnoremap <leader>u <esc>
vnoremap <leader>y <esc>

"nnoremap <leader>O <esc>


" 
" etc
" 

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  exe "set <xUp>=\e[1;*A"
  exe "set <xDown>=\e[1;*B"
  exe "set <xRight>=\e[1;*C"
  exe "set <xLeft>=\e[1;*D"
endif

" 
" quickfix
" 

"packadd Cfilter

autocmd QuickFixCmdPost grep,vimgrep tab cw

" env fnc

func! Is_env(env) abort " alias

  " a:env : 'mac', 'win64', 'win32', 'wsl', 'linux'

  let l:ret = has(a:env)

  if a:env != 'mac'
    "echo a:env . ' : ' . l:ret
  endif

  return l:ret
endfunc

" 
" plugin  #bgn#
" 

func! Vim_plug_path() abort

  if     Is_env('mac')
    let l:vim_plug_dir = '~/.vim'
  elseif Is_env('win64')
    let l:vim_plug_dir = '~/appdata/local/nvim-data/site'
  elseif Is_env('linux')
    let l:vim_plug_dir = '~/.vim'
  elseif Is_env('win32unix')
    let l:vim_plug_dir = '~/.vim'
  else
    let l:vim_plug_dir = '~/.vim'
  endif

  let l:vim_plug_path = l:vim_plug_dir . '/autoload/plug.vim'
  return l:vim_plug_path
endfunc

func! Is_vim_plug_installed() abort

  let l:vim_plug_path = Vim_plug_path()

  let l:ret = ! empty(glob(l:vim_plug_path))
  "echo 'vim_plug installed : ' . l:ret

  return l:ret
endfunc

if Is_vim_plug_installed()
  "echo 'plug#begin'

  call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/vim-molder'
  "Plug 'mattn/vim-molder-operations'
  "Plug 'jacquesbh/vim-showmarks'
  "Plug 'tyru/open-browser.vim'
  "Plug 'iamcco/markdown-preview.vim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  "Plug 'ctrlpvim/ctrlp.vim'
  call plug#end()
endif
" do :PlugInstall
" or :PlugUpdate
" or :PlugClean

" fzf #bgn#

" preview window
let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_action = {
\  'ctrl-o': 'tab drop',
\  'ctrl-s': 'backward-char',
\ }
"\  'ctrl-o': 'enter',

let g:fzf_colors = {
\   'hl'     : ['fg', 'Statement'  ],
\   'hl+'    : ['fg', 'Statement'  ],
\ }

"\   'bg+'    : ['bg', 'CursorLine' ],
"\   'bg+'    : ['bg', 'Normal'     ],

"\   'info'   : ['fg', 'Comment'    ],
"\   'border' : ['fg', 'Ignore'     ],
"\   'prompt' : ['fg', 'Function'   ],
"\   'pointer': ['fg', 'Statement'  ],
"\   'marker' : ['fg', 'Conditional'],

"\   'info'   : ['Comment'],
"\   'border' : ['Comment'],
"\   'prompt' : ['Comment'],
"\   'pointer': ['Comment'],
"\   'marker' : ['Comment'],

"let g:fzf_buffers_jump = 1
"fzf#vim#complete#buffer_line([spec])

" grep ( rg )

" fzf#vim#grep(
"   command,
"   [has_column bool],
"   [spec dict],
"   [fullscreen bool]
" )

let g:fzf_rg_opt = ''
\       . ' --color=always'
\       . ' --line-number'
\       . ' --smart-case'
\       . ' --no-multiline'
\       . ' --no-heading'
\       . ' --hidden'

if Is_env('mac') || Is_env('linux') || Is_env('win64')

  let g:fzf_rg_opt .= ' -g "!.git"'
endif

"if Is_env('linux') || Is_env('win64')
"
"  let g:fzf_rg_opt .= ' -g "!#current-cloud-backend"'
"endif

if Is_env('mac') || Is_env('linux') || Is_env('win64')

  command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg ' . g:fzf_rg_opt
  \   . ' -- '.shellescape(escape(<q-args>, '().$')),
  \   0,
  \   fzf#vim#with_preview(
  \     {'options': '--exact --delimiter : --nth 3..'},
  \     'up:70%:hidden',
  \     'ctrl-u'
  \   ),
  \   <bang>1
  \ )

  " dev doing dev doing
  command! -bang -nargs=* RgExt call Rg_ext(<f-args>)
endif

func! Rg_ext(...) abort

  let l:ext = a:1
  let l:str = exists('a:2') ? a:2 : ''

  let g:fzf_rg_opt .= ' -g "!.' . l:ext . '"'

  echo shellescape(escape(l:str, '().$'))


  " command! -bang -nargs=* RgExt
  " \ call fzf#vim#grep(
  " \   'rg ' . g:fzf_rg_opt
  " \   . ' -- '.shellescape(escape(l:str, '().$')),
  " \   0,
  " \   fzf#vim#with_preview(
  " \     {'options': '--exact --delimiter : --nth 3..'},
  " \     'up:70%:hidden',
  " \     'ctrl-u'
  " \   ),
  " \   <bang>1
  " \ )
endfunc


" grep buf
func! N_grep_buf() abort
  
  exe 'BLines '
endfunc

func! V_grep_buf() abort

  call V_srch_str__slctd_str()
  exe 'BLines ' . escape(@z, '.*~')
endfunc

command! -bang -nargs=? BLines
\ call fzf#vim#buffer_lines(
\   <q-args>,
\   {'options': ['--no-sort', '--exact']},
\   <bang>1
\ )

" files
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, <bang>1)

" file history
command! -bang -nargs=* FileHstry
\ call fzf#vim#history(fzf#vim#with_preview(), <bang>1)

" cmd history
command! -bang -nargs=* CmdHstry
\ call fzf#vim#command_history(fzf#vim#with_preview(), <bang>1)

" srch history
command! -bang -nargs=* SrchHstry
\ call fzf#vim#search_history(fzf#vim#with_preview(), <bang>1)

" rgstr history
command! -bang -nargs=* RgstrHstry
\ call Rgstr_fzf()

func! Rgstr_fzf() abort
  
  let l:rgstr_info = execute(':reg')->split("\n")
  call remove(l:rgstr_info, 0)
  
  call fzf#run(
  \   {
  \     'source': l:rgstr_info,
  \     'sink'  : funcref('Ynk__by_rgstr_info'),
  \     'window': '-tabnew'
  \   }
  \ )
  " \     'sink'  : funcref('Ins_rgstr_by_rgstr_info'),
endfunc

func! Ynk__by_rgstr_info(rgstr_info) abort
  
  let l:rgstr = Rgstr_info_rgstr(a:rgstr_info)
  let l:scrpt = 'let @a = @' . l:rgstr
  execute(l:scrpt)
endfunc

func! Ins_rgstr_by_rgstr_info(rgstr_info) abort
  
  let l:rgstr = Rgstr_info_rgstr(a:rgstr_info)
  call Normal('"' . l:rgstr . l:rgstr . 'P')
endfunc

func! Rgstr_info_rgstr(rgstr_info) abort

  let l:rgstr = strcharpart(a:rgstr_info, 6, 1)
  return l:rgstr
endfunc

" jmp lst

command! -bang -nargs=* FzfByJmplst call Fzf_by_jmplst()

func! Fzf_by_jmplst() abort
  
  call fzf#run(
  \   {
  \     'source' : Jmplst_line_info(),
  \     'sink'   : funcref('Cursor__mv_by_line_info'),
  \     'window' : '-tabnew',
  \     'options': ['--reverse'],
  \   }
  \ )
  "\     'options': ['--no-sort'],
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

" mark
command! -bang -nargs=* Mark
\ call fzf#vim#marks(fzf#vim#with_preview(), <bang>1)

" fzf #end#

" plugin  #end#


"
" final
"

" comment auto off
au FileType * set fo-=c fo-=r fo-=o


" 
" vim script fnc
" 

" primitive

func! Exe(cmd) abort

  exe a:cmd
endfunc

func! Normal(cmd) abort

  call Exe('normal! ' . a:cmd)
endfunc

func! Sys_cmd(sys_cmd) abort

  return system(a:sys_cmd)

  "let l:cmd = '! ' . a:sys_cmd
  "call Exe(l:cmd)
endfunc

func! V_sys_cmd(sys_cmd) range abort

  let l:cmd = g:v_rng . '! ' . a:sys_cmd
  call Exe(l:cmd)
endfunc

func! Save() abort
  
  call Exe('w')
endfunc

command! -nargs=0 Dpl call Slf__dpl()

func! Slf__dpl() abort
  
  let l:sys_cmd = 'dpl ' . Slf_path()
  call Sys_cmd(l:sys_cmd)
endfunc

command! -nargs=1 Mv call Slf__mv(<q-args>)

func! Slf__mv(file_name_aft) abort
  
  let l:file_path_bfr = Slf_path()

  let l:sys_cmd = 'str_mv_f ' . l:file_path_bfr . ' ' . a:file_name_aft
  let l:file_path_aft = Sys_cmd(l:sys_cmd)

  let l:sys_cmd = 'mv ' . l:file_path_bfr . ' ' . l:file_path_aft
  call Sys_cmd(l:sys_cmd)

  let l:cmd = 'file ' . l:file_path_aft " save file_path ch
  call Exe(l:cmd)
endfunc

func! Slf_path() abort
  
  let l:path = expand('%:p')
  return l:path
endfunc

func! Slf_dir() abort

  let l:dir = expand('%:p:h')
  return l:dir
endfunc

func! Rgstr__clr() abort

  let @0 = ''
endfunc

func! Int_2_str(num) abort

  let l:num_str = printf('%o', a:num)
  return l:num_str
endfunc

" file type cnd

func! Is_file_type(type) abort

  if &filetype == a:type
    return v:true
  else
    return v:false
  endif
endfunc

" char

func! Char__rpl(rpl) abort

  call Normal('r' . a:rpl)
endfunc

func! N_char__tgl() abort

  let l:c = Cursor_c_char()

  if     Is_char_num(l:c)

    call Cursor_str__icl()
    return

  elseif Is_char_alpha(l:c)

    call Normal('v~') " upper / lower
    return
  endif

  let l:rpl = Is_char_tgl_bracket_trn(l:c)
  if ! Is_str_emp(l:rpl)
    call Char__rpl(l:rpl)
    return
  endif

  let l:rpl = Is_char_tgl_symbol(l:c)
  if ! Is_str_emp(l:rpl)

    call Char__rpl(l:rpl)
    return
  endif
endfunc

func! N_char__tgl_shift() abort

  let l:c = Cursor_c_char()

  if     Is_char_num(l:c)

    call Cursor_str__dcl()
    return
  endif

  call Char__tgl_type_ch(l:c)
endfunc

func! Is_char_tgl_symbol(c) abort

  let l:rpl = ''

  if     a:c == '/'
    " let l:rpl = '-'
    let l:rpl = '\'
  " elseif a:c == '-'
    " let l:rpl = '\'
  elseif a:c == '\'
    let l:rpl = '|'
  elseif a:c == '|'
    let l:rpl = '/'

  elseif a:c == '"'
    let l:rpl = "'"
  elseif a:c == "'"
    let l:rpl = '"'
    "let l:rpl = '`'
  elseif a:c == "`"
    let l:rpl = '"'

  elseif a:c == '-'
    let l:rpl = '+'
  elseif a:c == '+'
    let l:rpl = '='
  elseif a:c == '='
    let l:rpl = '*'
  elseif a:c == '*'
    let l:rpl = '-'

  elseif a:c == ','
    let l:rpl = '.'
  elseif a:c == '.'
    let l:rpl = ','

  elseif a:c == ';'
    let l:rpl = ':'
  elseif a:c == ':'
    let l:rpl = ';'

  elseif a:c == '?'
    let l:rpl = '!'
  elseif a:c == '!'
    let l:rpl = '?'
  endif

  return l:rpl
endfunc

func! Is_char_tgl_bracket_trn(c) abort

  let l:rpl = ''

  if     a:c == '<'
    let l:rpl = '>'
  elseif a:c == '>'
    let l:rpl = '<'

  elseif a:c == '{'
    let l:rpl = '}'
  elseif a:c == '}'
    let l:rpl = '{'

  elseif a:c == '['
    let l:rpl = ']'
  elseif a:c == ']'
    let l:rpl = '['

  elseif a:c == '('
    let l:rpl = ')'
  elseif a:c == ')'
    let l:rpl = '('
  endif

  return l:rpl
endfunc

func! Is_char_tgl_alpha_trn(c) abort " use not
  
  let l:rpl = ''

  if     a:c ==# 'T'
    let l:rpl = 'f'
  elseif a:c ==# 'F'
    let l:rpl = 't'
  endif

  return l:rpl
endfunc

func! Char__tgl_type_ch(c) abort

  let l:rpl = ''

  if     a:c == '"'
    let l:rpl = '`'
  elseif a:c == "'"
    let l:rpl = '`'
  endif

  if ! Is_str_emp(l:rpl)

    call Char__rpl(l:rpl)
    return
  endif
endfunc

" char cnd

func! Is_char_num(char) abort

  let l:ret = v:false

  if a:char =~ '\d'
    let l:ret = v:true
  endif

  return l:ret
endfunc

func! Is_char_alpha(char) abort

  let l:ret = v:false

  if a:char =~ '\a'
    let l:ret = v:true
  endif

  return l:ret
endfunc

func! Is_char_symbol(char) abort

  let l:ret = v:false

  if a:char !~ '\s' && a:char !~ '\w'
    let l:ret = v:true
  endif

  return l:ret
endfunc

" str

func! Str_l_char(str) abort
  
  let l:l_idx = 0
  let l:str_l = a:str[l:l_idx]
  "echo l:str_l
  return l:str_l
endfunc

func! Str_r_char(str) abort
  
  let l:r_idx = Str_len(a:str) - 1
  let l:str_r = a:str[l:r_idx]
  "echo l:str_r
  return l:str_r
endfunc

func! Str_len(str) abort " alias

  return strchars(a:str)
endfunc

func! Str_sub(str, idx, len) abort " dev doing

  let l:str = a:str
  return l:str
endfunc

func! Str_space(col) abort

  let l:space_str = ''

  let l:idx = 0
  while l:idx < a:col

    let l:space_str .= ' '

    let l:idx += 1
  endwhile
  return l:space_str
endfunc

func! Str_srch(...) abort " alias

  let l:str =                a:1
  let l:ptn =                a:2
  let l:idx = ( a:0 >= 3 ) ? a:3 : v:null

  let l:r_idx = match(l:str, l:ptn, l:idx)
  return l:r_idx " -1 : match not
endfunc

func! Str_srch_end(str, ptn) abort " alias

  let l:idx = matchend(a:str, a:ptn)
  return l:idx
endfunc

" str rpl

func! Str__rpl(str, srch, rpl) abort " alias

  let l:r_str = substitute(a:str, a:srch, a:rpl, 'g')
  return l:r_str
endfunc

func! Str_path_unix__cnv_win(path) abort

  let l:path = a:path
  let l:path = Str__rpl(l:path, '/c/', 'C:/')
  let l:path = Str__rpl(l:path, '/', '\')
  return l:path
endfunc

func! Str_path_win__cnv_unix(path) abort

  let l:path = a:path
  let l:path = Str__rpl(l:path, 'C:', '/c')
  let l:path = Str__rpl(l:path, '\', '/')
  return l:path
endfunc

func! Cursor_str__icl() abort

  let l:n_cmd = "\<c-a>"
  call Normal(l:n_cmd)
endfunc

func! Cursor_str__dcl() abort

  let l:n_cmd = "\<c-x>"
  call Normal(l:n_cmd)
endfunc

func! Cursor_str_week__icl() abort

  let l:week_str = Cursor_word()
  let l:week_idx = index(g:week_def, l:week_str)

  if l:week_idx == -1
    return
  endif

  let l:week_nxt_idx = Idx__icl(week_idx, len(g:week_def))
  let l:week_nxt_str = g:week_def[l:week_nxt_idx]

  call Slct_word()
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

  call Slct_word()
  call Normal('"zd')
  call Normal('i' . l:week_nxt_str)
endfunc

func! Idx__icl(idx, ar_len) abort

  let l:r_idx = a:idx + 1

  if r_idx >= a:ar_len
    let l:r_idx = 0
  endif

  return l:r_idx
endfunc

func! Idx__dcl(idx, ar_len) abort

  let l:r_idx = a:idx - 1

  if r_idx < 0
    let l:r_idx = a:ar_len - 1
  endif

  return l:r_idx
endfunc

" str cnd

func! Is_str_emp(str) abort

  let l:ret = v:false

  if a:str == ''
    let l:ret = v:true
  endif
  return l:ret
endfunc

func! Is_str_eq_ptn(str, ptn) abort

  let l:ret = v:false

  if a:str =~ a:ptn
    let l:ret = v:true
  endif
  return l:ret
endfunc

func! Is_str_space(str) abort

  let l:ptn = '^\s\+$'
  let l:ret = Is_str_eq_ptn(a:str, l:ptn)
  return l:ret
endfunc

func! Is_str_num(num_str) abort

  let l:ptn = '^\d\+$'
  let l:ret = Is_str_eq_ptn(a:num_str, l:ptn)
  return l:ret
endfunc

" str mb

command! -range=% -nargs=0 MbCnv <line1>,<line2>call V_line_mb__cnv()

func! V_line_mb__cnv() range abort

  let l:sys_cmd = 'mb__cnv'
  '<,'>:call V_line__rpl_sys_cmd(l:sys_cmd)
endfunc

" cursor

" cursor mv

func! Cursor__mv_by_line_num(line_num) abort

  if ! Is_str_num(a:line_num)
    return
  endif

  call Normal(a:line_num . 'G')
endfunc

func! Cursor__mv_by_line_info(line_info) abort
  
  let l:line_num = Line_info_line_num(a:line_info)
  call Cursor__mv_by_line_num(l:line_num)
endfunc

func! Cursor__mv_by_line_col(line_num, col) abort

  let l:line_num = (a:line_num == v:null) ? Cursor_line_num() : a:line_num
  
  call cursor(l:line_num, a:col)
endfunc

func! Cursor__mv_by_pos(pos) abort " use not
  
  call setpos('.', a:pos)
endfunc

func! Cursor__mv_line_top0() abort
  
  if Is_cursor_line_emp()
    return
  endif

  call Normal('0')
endfunc

func! Cursor__mv_line_top1() abort

  if     Is_cursor_line_space()
    call Cursor__mv_line_end()

  elseif Is_line_markdown_itm()
    call Normal('^2l')
  else
    call Normal('^')
  endif
endfunc

func! Cursor__mv_line_end() abort

  if ! Is_cursor_line_emp()
    call Normal('$l')
  endif
endfunc

func! V_cursor__mv_line_end() range abort

  call Slct_re()

  if     mode() == "\<c-v>"

    if Is_cursor_line_end_ovr()
      return
    endif

    call Normal('$h')
    "call Normal('g_')

  elseif mode() == "v"

    if Is_cursor_line_emp()
      return
    endif

    call Normal('$h')
    "call Normal('g_')
  else
    echo "v mode else"
  endif
endfunc

func! Cursor__mv_char_f() abort

  call Normal('l')
endfunc

func! Cursor__mv_char_b() abort

  call Normal('h')
endfunc

func! Cursor__mv_word_f() abort

  if     Is_cursor_line_end() || Is_cursor_line_end_inr()

    call Cursor__mv_char_f()
    return

  elseif Is_cursor_line_str_side_r_space()

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

  if     Is_cursor_line_top0()
    call Cursor__mv_up_line_end()
    
  elseif Is_cursor_line_str_side_l_space()
    call Cursor__mv_line_top0()
    
  elseif Is_cursor_line_top1()
    call Cursor__mv_line_top0()
    
  elseif Is_char_symbol(l:l_char)
    call Cursor__mv_char_b()
    
  else
    call Normal('b')
  endif
endfunc

func! Cursor__mv_word_dlm_camel_f() abort " dev doing

endfunc

func! Cursor__mv_word_b_pre() abort " use not

  let l:c_char = Cursor_c_char()
  let l:l_char = Cursor_r_char()

  if l:c_char =~ ' ' && l:l_char !~ ' '
    call Normal('gegel')
  else
    call Normal('gel')
  endif
endfunc

func! Cursor__mv_up_line_end() abort

  call Normal('k')
  call Cursor__mv_line_end()
endfunc

func! Cursor__mv_line_top_or_new_line() abort

  if     Is_cursor_line_top0()

    call Ins_line_emp()

  elseif Is_cursor_line_top1()

    call Cursor__mv_line_top0()
  else
    call Cursor__mv_line_top1()
  endif
endfunc

func! Cursor__mv_slctd_l() abort
  
  call Normal('`<')
endfunc

func! Cursor__mv_slctd_r() abort
  
  call Normal('`>')
endfunc

func! Cursor__mv_file_edge(n_cmd) abort

  if Is_cursor_line_file_edge()
    call Normal(a:n_cmd)
  endif

  let l:cnt = 1
  let l:cnt_max = 10000

  while ( !Is_cursor_line_file_edge() && l:cnt < l:cnt_max )

    call Normal(a:n_cmd)
    let l:cnt = l:cnt + 1
  endwhile
endfunc

func! V_cursor__mv_file_edge(n_cmd) abort

  call Slct_re()

  call Cursor__mv_file_edge(a:n_cmd)
endfunc

"func! Cursor__mv_jmp_space_not(drct, is_space_stop) abort
"func! Cursor__mv_jmp_space_not(drct, is_space_through) abort
func! Cursor__mv_jmp_char(drct, is_space_through) abort

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

  while ( !Is_cursor_line_file_edge() && l:cnt < l:cnt_max )

    if ! ( Is_cursor_c_char_space() || Is_cursor_line_end() )
      break
    endif

    "if ( l:is_space_stop == 't' && Is_cursor_c_char_space() )
    if ( l:is_space_through == 'f' && Is_cursor_c_char_space() )
      break
    endif

    call Normal(l:n_cmd)
    let l:cnt = l:cnt + 1
  endwhile
endfunc

func! Cursor__mv_jmp_space(drct) abort

  if a:drct == 'k' || a:drct == 'j'

    let l:n_cmd = a:drct
  else
    return
  endif

  call Normal(l:n_cmd)

  let l:cnt = 1
  let l:cnt_max = 10000
  "let l:cnt_max = 10

  while ( !Is_cursor_line_file_edge() && l:cnt < l:cnt_max )

    if Is_cursor_c_char_space() || Is_cursor_line_end()
      break
    endif

    call Normal(l:n_cmd)
    let l:cnt = l:cnt + 1
  endwhile
endfunc

func! Cursor__mv_jmp_v(drct) abort

  if a:drct == 'k' || a:drct == 'j'

    let l:n_cmd = a:drct
  else
    return
  endif

  call Normal(l:n_cmd)

  if Is_cursor_c_char_space() || Is_cursor_line_end()

    call Cursor__mv_jmp_char(l:n_cmd, 't')

  else
    call Cursor__mv_jmp_space(l:n_cmd)
  endif
endfunc

func! V_cursor__mv_jmp_v(drct) range abort

  call Slct_re()
  call Cursor__mv_jmp_v(a:drct)
endfunc

" cursor pos

func! Pos() abort " alias

  let l:pos = getpos('.')
  return l:pos
endfunc

" cursor col

func! Cursor_col_num() abort

  return col('.')
endfunc

func! Cursor_col_idx() abort

  let l:idx = col('.') - 1
  return l:idx
endfunc

func! Cursor_c_char() abort

  let l:idx = Cursor_col_idx()
  let l:c = getline('.')[l:idx]
  return l:c
endfunc

func! Cursor_l_char() abort

  let l:idx = Cursor_col_idx() - 1
  let l:c = getline('.')[l:idx]
  return l:c
endfunc

func! Cursor_r_char() abort

  let l:idx = Cursor_col_idx() + 1
  let l:c = getline('.')[l:idx]
  return l:c
endfunc

func! Cursor_u_char() abort " dev doing

  if Is_cursor_line_file_top()
    return ''
  endif

  let l:idx = Cursor_col_idx()
  let l:line_num = Cursor_line_num() - 1
  let l:c = getline(l:line_num)[l:idx]
  return l:c
endfunc

func! Cursor_d_char() abort " dev doing

  if Is_cursor_line_file_end()
    return ''
  endif

  let l:idx = Cursor_col_idx()
  let l:line_num = Cursor_line_num() + 1
  let l:c = getline(l:line_num)[l:idx]
  return l:c
endfunc

" cursor col cnd

func! Is_cursor_line_end() abort " todo refactoring rename add col

  if Cursor_col_num() == Cursor_line_end_col()

    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_line_end_ovr() range abort " todo refactoring rename add col

  if Cursor_col_num() >= Cursor_line_end_col() " why ?
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_line_end_inr() abort " todo refactoring rename add col

  if Cursor_col_num() == Cursor_line_end_col() - 1

    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_line_top0() abort " todo refactoring rename add col
  
  "if col('.') == 1
  if Cursor_col_num() == 1

    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_line_top1() abort " todo refactoring rename add col
  
  let l:pos_c = Pos()

  let l:col_c = Cursor_col_num()
  
  call Cursor__mv_line_top1()
  let l:col_s1 = Cursor_col_num()
  
  call setpos('.', l:pos_c)
  
  if l:col_c == l:col_s1
    return v:true
  else
    return v:false
  endif
endfunc

" cursor char cnd

func! Is_cursor_c_char_regex(regex) abort

  let l:c = Cursor_c_char()

  if l:c =~ a:regex
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_c_char_space() abort

  let l:c = Cursor_c_char()

  if l:c =~ '\s'
    return v:true
  else
    return v:false
  endif

  " let l:regex = '\s'
  " let l:ret = Is_cursor_c_char_regex(l:regex)
  " return l:ret
endfunc

func! Is_cursor_c_char_alph() abort

  let l:regex = '\a'
  let l:ret = Is_cursor_c_char_regex(l:regex)
  return l:ret
endfunc

" cursor etc

func! Cursor_word() abort

  let l:word = expand('<cword>')
  return l:word
endfunc

func! Cursor_filepath() abort

  if     Is_env('mac')

    let l:str = expand('<cfile>')

  elseif Is_env('win64')

    let l:str = Cursor_line_str()

  elseif Is_env('win32unix')

    let l:str = Cursor_line_str()

  else
    let l:str = Cursor_line_str()
  endif
  
  let l:str = trim(l:str)
  
  return l:str
endfunc

" cursor line  -  todo refactoring

func! Cursor_line_num() abort " alias

  return line('.')
endfunc

func! Cursor_line_num_file_end() abort " alias

  return line('$')
endfunc

func! Cursor_line_end_col() abort " alias

  let l:col = col('$')
  return l:col
endfunc

" cursor line str

func! Cursor_line_str() abort

  return getline('.')
endfunc

func! Cursor_line_str_len() abort

  let l:len = Cursor_line_end_col() - 1
  return l:len
endfunc

func! Line_str_cursor_out_l() abort
  
  let l:line_l = getline('.')[:col('.')-2]
  return l:line_l
endfunc

func! Line_str_cursor_out_r() abort
  
  let l:line_r = getline('.')[col('.'):]
  return l:line_r
endfunc

func! Line_str_slctd_out_l() abort

  call Cursor__mv_slctd_l()

  let l:str = Line_str_cursor_out_l()
  return l:str
endfunc

func! Line_str_slctd_out_r() abort

  call Cursor__mv_slctd_r()

  let l:str = Line_str_cursor_out_r()
  return l:str
endfunc

" cursor line __ ins

func! Line_top0__ins(str) abort

  call Cursor__mv_line_top0()
  call Ins(a:str)
endfunc

func! Line_top1__ins(str) abort

  call Cursor__mv_line_top1()
  call Ins(a:str)
endfunc

" cursor line cnd

func! Is_cursor_line_num(line_num) abort

  let l:ret = v:false

  let l:line_num = Cursor_line_num()

  if l:line_num == a:line_num

    let l:ret = v:true
  endif
  return l:ret
endfunc

func! Is_cursor_line_file_top() abort

  let l:line_num = 1
  let l:ret = Is_cursor_line_num(l:line_num)
  return l:ret
endfunc

func! Is_cursor_line_file_end() abort

  let l:line_num = Cursor_line_num_file_end()
  let l:ret = Is_cursor_line_num(l:line_num)
  return l:ret
endfunc

func! Is_cursor_line_file_edge() abort

  let l:ret = v:false

  if Is_cursor_line_file_top() || Is_cursor_line_file_end()

    let l:ret = v:true
  endif
  "echo l:ret
  return l:ret
endfunc

func! Is_cursor_line_emp() abort
  
  if Cursor_line_end_col() == 1
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_cursor_line_space() abort
  
  let l:str = Cursor_line_str()
  let l:ret = Is_str_space(l:str)
  return l:ret
endfunc

func! Is_cursor_line_str_side_l_space() abort

  let l:str = Line_str_cursor_out_l()
  let l:ret = Is_str_space(l:str)
  return l:ret
endfunc

func! Is_cursor_line_str_side_r_space() abort

  let l:str = Line_str_cursor_out_r()
  let l:ret = Is_str_space(l:str)
  return l:ret
endfunc

" ins

func! Ins(str) abort

  let l:cmd = 'i' . a:str
  call Normal(l:cmd)
  call Cursor__mv_char_f()
  "call Normal('l')
endfunc

func! V_ins(str) range abort " todo cre

endfunc

func! Ins_mlt(str, num) abort

  if a:num == 0
    return
  endif

  let l:cmd = a:num.'i'.a:str
  call Normal(l:cmd)
endfunc

func! Ins_cr() abort

  let l:t_line_num = line('.')
  
  call Normal("i\<cr> ")
  call Normal('x')
  
  call Line_end_space__del(l:t_line_num)
  call Normal('j')
endfunc

func! Ins_space(is_cursor_mv) abort

  if a:is_cursor_mv
    call Ins(' ')

  else
    call Normal('i ')
    ""call Normal('l')
  endif
endfunc

func! Ins_hyphen() abort

  call Normal('i-')
  "call Ins('-')
endfunc

func! Ins_da() abort

  let l:da = strftime('%Y-%m-%d')
  call Ins(l:da)
endfunc

func! Ins_tm() abort

  let l:tm = strftime('%H:%M')
  call Ins(l:tm)
endfunc

func! Ins_dt() abort

  let l:dt = strftime('%Y-%m-%d.%H:%M')
  call Ins(l:dt)
endfunc

func! Ins_ts() abort

  let l:ts = strftime('%Y-%m-%d.%H:%M:%S')
  call Ins(l:ts)
endfunc

let g:week_def = [ 'sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat' ]

func! Ins_week() abort

  let l:week_num = strftime('%w')
  let l:week     = g:week_def[l:week_num]
  call Ins(l:week)
  "call Ins(' ' . l:week)
endfunc

command! -nargs=* InsSysCmd call Ins_sys_cmd(<q-args>)

func! Ins_sys_cmd(sys_cmd) abort " read

  let l:is_line_num_eq_1 = Is_cursor_line_file_top()

  if l:is_line_num_eq_1
    call Normal('O')
  else
    call Normal('k')
  endif

  let l:cmd = 'read ! ' . a:sys_cmd
  call Exe(l:cmd)

  if l:is_line_num_eq_1
    call Line__del_by_line_num(1)
  endif
endfunc

" line

let s:line_top_space_ptn = '^[ \t]*'

func! V_line_top_space__del() abort " refactoring ?

  let l:rpl_cmd = 's/' . s:line_top_space_ptn . '//g'
  call Exe(l:rpl_cmd)
endfunc

let s:line_end_space_ptn = '[ \t]*$'

func! Line_end_space__del(line_num) abort
  
  let l:rpl_cmd = a:line_num . 's/' . s:line_end_space_ptn . '//g'
  call Exe(l:rpl_cmd)
endfunc

func! V_line_end_space__del() range abort

  for line_num in range(a:firstline, a:lastline)

    call Line_end_space__del(l:line_num)
  endfor
endfunc

func! Line_end__pad_space(line_num, fil_end_col) abort

  let l:line_str     = getline(a:line_num)
  let l:line_str_len = Str_len(l:line_str)
  let l:space_len    = a:fil_end_col - l:line_str_len

  if l:space_len <= 0
    return
  endif

  let l:space_str = Str_space(l:space_len)
  let l:line_str .= l:space_str
  call setline(a:line_num, l:line_str)
endfunc

func! V_line_end__pad_space() range abort " use not

  " use recommend "aygvr gv

  call Slct_re()
  call Normal('o')

  let l:fil_end_col = Cursor_col_num() - 1

  for line_num in range(a:firstline, a:lastline)

    call Line_end__pad_space(l:line_num, l:fil_end_col)
  endfor
endfunc

func! V_line__join_per_line(per_line_num) range abort

  let l:n_cmd = a:per_line_num . 'Jj'

  let l:line_num = a:lastline - a:firstline + 1

  let l:exe_num = l:line_num / a:per_line_num
  "echo l:exe_num

  for idx in range(1, l:exe_num)

    call Normal(l:n_cmd)
  endfor
endfunc

let g:dots_str = ' .. '
let g:dots_put_col = 50

func! Line_end__dots_adjst() abort " todo dev doing, mv_str

  let l:line_str = Cursor_line_str()
  let l:idx = Str_srch(l:line_str, escape(g:dots_str, '.'))

  if l:idx >= 0
    call Line_end__dots_crct()
  else
    call Line_end__add_dots()
  endif
endfunc

func! Line_end__dots_crct() abort
  "echo 'Line_end__dots_crct()'

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

func! Line_end__add_dots() abort " todo refactoring

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

func! V_line__rpl_sys_cmd(sys_cmd) range abort " read

  let l:cmd = "'<,'>" . " ! " . a:sys_cmd
  call Exe(l:cmd)
endfunc

" tbl

command! -range=% -nargs=0 Tbl <line1>,<line2>call V_tbl()

func! V_tbl() range abort

  let l:sys_cmd = 'tbl'
  '<,'>:call V_line__rpl_sys_cmd(l:sys_cmd)
endfunc

" cursor f

func! Cursor_f_space__del() abort

  let l:c = Cursor_c_char()
  if l:c =~ '\s'
    "echo "del"
    call Slct_cursor_f_space()
    call Normal('"zd')
  else
    " nothing
    "echo "nothing"
  endif
endfunc

func! V_cursor_f_space__del() range abort

  call Slct_re()

  let l:col = Cursor_col_num()

  for line_num in range(a:firstline, a:lastline)
    "echo l:line_num . ' ' . l:col
    call Cursor__mv_by_line_col(l:line_num, l:col)
    call Cursor_f_space__del()
  endfor
endfunc

func! Cursor_f_space__crct() abort " dev doing

  call Normal('k')

  let l:c = Cursor_c_char()
  if l:c !~ '\s'
    call Normal('j')
    return
  endif

  call Slct_cursor_f_space()
  call Normal('"zy')

  call Normal('j')

  call Slct_cursor_f_space()
  call Normal('"yx')
  call Normal('"zP')
endfunc

" line ins

func! Ins_line(str) abort
  
  let l:line_num = Cursor_line_num() - 1
  call append(l:line_num, a:str)
  call Normal('k')
endfunc

func! Ins_line_d(str) abort
  
  let l:line_num = Cursor_line_num()
  call append(l:line_num, a:str)
endfunc

func! Ins_line_emp() abort
  
  let l:str = ''
  call Ins_line(l:str)
endfunc

func! Ins_line_slf_path() abort
  
  let l:path = Slf_path()
  call Ins_line(l:path)
endfunc

func! Ins_line__indnt_space() range abort

  let l:space_len = Cursor_col_num() - 1
  let l:space_str = Str_space(l:space_len)
  call Ins_line_d(l:space_str)
endfunc

func! Line__del() abort

  if Is_cursor_line_emp() || Is_cursor_line_space()
    call Normal('"_dd') " rgstr del
  else
    call Normal('"add')
    call Clipboard__ynk()
  endif
endfunc

func! V_line_del() abort " use not, todo dev
  
  call Normal('gvj')
  "call Normal('"ad')
  
  call Clipboard__ynk()
endfunc

func! Line__del_by_line_num(line_num) abort

  call deletebufline('%', a:line_num)
endfunc

" line cnd

" line info

func! Line_info_line_num(line_info) abort

  let l:line_info = trim(a:line_info, ' ', 1)
  let l:line_num  = split(l:line_info, '\s\+')[0]
  return l:line_num
endfunc

" indnt

func! Indnt_col_by_c() abort

  let l:col = cindent(Cursor_line_num())
  return l:col
endfunc

func! Indnt__add(col) abort

  if a:col == 0
    return
  endif

  call Normal('0')

  if &expandtab " 1:'expandtab', 0:'noexpandtab'
    let l:char = ' '
    let l:col = a:col
  else
    let l:char = "\t"
    let l:col = a:col / 2
  endif
  call Ins_mlt(l:char, l:col)

  call Cursor__mv_line_top1()
endfunc

func! Indnt__del() abort " alias

  call Exe('left')
endfunc

func! Indnt__shft_l() abort

  call Normal('<<')
  call Cursor__mv_line_top1()
endfunc

func! Indnt__shft_r() abort

  let l:col = 2

  call Indnt__add(l:col)
endfunc

func! Indnt__crct() abort " nnoremap ; ==^

  let l:col = Indnt__crct_by_c()
  return l:col
endfunc

func! Indnt__crct_by_c() abort

  call Indnt__del()

  let l:col = Indnt_col_by_c()
  "echo l:col

  call Indnt__add(l:col)
  return l:col
endfunc

let g:v_rng = "'<,'>"

func! V_line_indnt__space(indnt_col) range abort

  if Is_env('win64')
    '<,'>:call V_line_tab__rpl_space(a:indnt_col)

  else
    let l:sys_cmd = '  expand   -t ' . a:indnt_col
    '<,'>:call V_line__rpl_sys_cmd(l:sys_cmd)
  endif
endfunc

func! V_line_indnt__tab(indnt_col) range abort

  if Is_env('win64')
    " nothing
  else
    let l:sys_cmd = 'unexpand   -t ' . a:indnt_col
    '<,'>:call V_line__rpl_sys_cmd(l:sys_cmd)
  endif
endfunc

" tab

func! V_line_tab__rpl_space(space_col) range abort

  let l:space_str = Str_space(a:space_col)
  let l:cmd = g:v_rng . 's/\t/' . l:space_str . '/g'
  call Exe(l:cmd)
endfunc

" markdown tbl header

func! V_2_markdown_tbl_header() range abort

  '<,'>:call V_line__rpl('[^|]', '-')
  '<,'>:call V_line__rpl( '|.',  '| ')
  '<,'>:call V_line__rpl('.|' , ' |' )
endfunc

" slct

func! Slct_word() abort

  let l:c = Cursor_c_char()

  if     l:c =~ '\w'
    call Normal('viw')

  elseif l:c =~ '\s'
    call Slct_cursor_f_space()
  else
    call Normal('v')
  endif
endfunc

func! Slct_cursor_f_space() abort

  let l:c = Cursor_c_char()
  if l:c !~ '\s'
    return
  endif
  "echo l:c

  if Is_cursor_line_str_side_r_space()

    call Normal('v')
    call Normal('$h')
    "call Cursor__mv_word_f()
    "call Normal('h')

  else
    call Normal('vwh')
  endif
endfunc

func! Slct_by_col(s_col, len) abort

  let l:e_col = a:len - 1

  call Slct_by_line_col(v:null, a:s_col, v:null, e_col)
endfunc

func! Slct_by_pos(s_pos, e_pos) abort " use not

  call Cursor__mv_by_pos(a:s_pos)
  call Normal('v')
  call Cursor__mv_by_pos(a:e_pos)
endfunc

func! Slct_by_line_col(s_line, s_col, e_line, e_col) abort

  let l:s_line = (a:s_line == v:null) ? Cursor_line_num() : a:s_line
  let l:e_line = (a:e_line == v:null) ? Cursor_line_num() : a:e_line

  call Cursor__mv_by_line_col(l:s_line, a:s_col)
  call Normal('v')
  call Cursor__mv_by_line_col(l:e_line, a:e_col)
endfunc

func! Slct_by_line_rng(line_num_fr, line_num_to) abort
  
  call Cursor__mv_by_line_num(a:line_num_fr)
  call Normal('V')
  call Cursor__mv_by_line_num(a:line_num_to)
endfunc

func! Slct_re() range abort
  
  call Normal('gv')
endfunc

func! Slct_all() abort

  call Normal('ggVG')
endfunc

" slctd

func! Slctd_str() abort

  call Normal('gv"zy')
  return @z
endfunc

func! Slctd_str_len() abort

  let l:slctd_str = Slctd_str()
  let l:len       = Str_len(l:slctd_str)
  return l:len
endfunc

func! Slctd_l_col() abort

  call Cursor__mv_slctd_l()
  
  let l:col = Cursor_col_num()
  return l:col
endfunc

func! Slctd_r_col() abort

  call Cursor__mv_slctd_r()
  
  let l:col = Cursor_col_num()
  return l:col
endfunc

func! Slctd_l_pos() abort

  call Cursor__mv_slctd_l()
  
  let l:pos = Pos()
  return l:pos
endfunc

func! Slctd_r_pos() abort

  call Cursor__mv_slctd_r()
  
  let l:pos = Pos()
  return l:pos
endfunc

func! Slctd_l_out_char() abort

  call Cursor__mv_slctd_l()

  let l:l_char = Cursor_l_char()
  return l:l_char
endfunc

func! Slctd_r_out_char() abort

  call Cursor__mv_slctd_r()

  let l:r_char = Cursor_r_char()
  return l:r_char
endfunc

func! Slctd__expnd() abort " expnd lr

  let l:ptn = '[' . "'" . '")\]' . ']'

  call Cursor__mv_slctd_r()
  
  let l:line_r = Line_str_cursor_out_r()
  let l:r_idx  = Str_srch(l:line_r, l:ptn)
  
  if l:r_idx == -1
    return
  endif
  
  let l:c = l:line_r[l:r_idx]
  
  if l:c == '"' || l:c == "'"
    
    let l:line_l = Line_str_cursor_out_l()
    let l:l_idx = strridx(l:line_l, l:c)
    
    if l:l_idx == -1
      return
    endif
    
    let l:word_col_l =                    l:l_idx + 2
    let l:word_col_r = Cursor_col_num() + l:r_idx
    
    if l:r_idx == 0
      let l:word_col_l -= 1
      let l:word_col_r += 1
    endif
    
    call Slct_by_line_col(v:null, l:word_col_l, v:null, l:word_col_r)
    
  elseif l:c == ')'
    call Normal('vi(')
    
  elseif l:c == ']'
    call Normal('vi[')
  endif

  call Normal('gv')
endfunc

func! Slctd__expnd_bracket_f() abort

  let l:bracket_ptn = '[' . "'" . '")}\]' . ']'
  
  let l:s_col = Slctd_l_col()
  
  let l:line_str_r = Line_str_slctd_out_r()
  let l:srch_idx = Str_srch(l:line_str_r, l:bracket_ptn, 1)

  if l:srch_idx == -1

    call Normal('gv')
    return
  endif

  let l:len = l:s_col + Slctd_str_len() + l:srch_idx
  call Slct_by_col(l:s_col, l:len)
endfunc

func! Slctd__expnd_word_f() abort

  let l:slctd_str = Slctd_str()
  let l:slctd_r_out_char = Slctd_r_out_char()

  call Slct_re()

  if     Is_cursor_line_str_side_r_space()

    call Normal('$h')

  elseif l:slctd_str =~ '\s' && l:slctd_r_out_char =~ '\s'

    call Normal('wh')
  else
    call Normal('e')
  endif
endfunc

func! Slctd_box__mv(lr) range abort

  call Slct_re()

  let l:n_cmd = Lr_2_n_cmd(a:lr)
  call Normal('o' . l:n_cmd)
  call Normal('o' . l:n_cmd)
endfunc

func! Slctd_box_str__mv(lr) range abort

  let l:n_cmd = Lr_2_n_cmd(a:lr)

  call Slct_re()
  call Normal('"zx')
  call Normal(l:n_cmd)
  call Normal('"zP')

  call Slct_re()
  call Slctd_box__mv(a:lr)
endfunc

func! Lr_2_n_cmd(lr) abort

  if     a:lr == 'l'
    let l:n_cmd = 'h'

  elseif a:lr == 'r'
    let l:n_cmd = 'l'
  endif

  return l:n_cmd
endfunc

" slctd del

func! V_slctd__del() abort " dev doing, can

  call Slct_re()

  call Normal('"ad')
  let @+ = @a
endfunc

func! V_slctd__space() range abort " do not intended

  call Normal('gv')
  call Normal('r ')
  call Normal('gv')
endfunc

" slctd ins

func! Slctd_l__ins(c) abort

  call Normal('`<')
  call Ins(a:c)
endfunc

func! Slctd_r__ins(c) abort

  call Normal('`>l')
  call Ins(a:c)
endfunc

command! -nargs=? SlctdEdgeIns call Slctd_edge__ins(<q-args>)

func! Slctd_edge__ins(c) abort " todo dev
  
  if     a:c   == '('
    let  l:c_l =  '('
    let  l:c_r =  ')'
  elseif a:c   == '['
    let  l:c_l =  '['
    let  l:c_r =  ']'
  elseif a:c   == '{'
    let  l:c_l =  '{'
    let  l:c_r =  '}'
  elseif a:c   == '<'
    let  l:c_l =  '<'
    let  l:c_r =  '>'
  else
    let  l:c_l = a:c
    let  l:c_r = a:c
  endif
  
  call Slctd_r__ins(l:c_r)
  call Slctd_l__ins(l:c_l)
endfunc

" slctd rpl, srch nxt slctd

func! Slctd_rpl_srch_nxt() abort " dir forward only
  
  call Slct_re()
  call Normal('"zd"aPlgn')
endfunc

" slctd cnd

func! Is_slctd_str_eq_srch_str() abort

  if Slctd_str() == @/
    return v:true
  else
    return v:false
  endif
endfunc

func! Is_slctd_mode_v() abort " use not

  if mode() == 'v'
    return v:true
  else
    return v:false
  endif
endfunc

" ynk

func! Ynk__clr() abort

  let @a = ''
endfunc

func! Ynk__line() abort

  call Normal('"ayy')
  "l:line_str = Cursor_line_str()
  "let @a = l:line_str

  call Clipboard__ynk()
endfunc

func! Ynk__line_all() abort

  let l:cmd = '%y' " todo rgstr a direct
  call Exe(l:cmd)

  let @a = @0
  call Clipboard__ynk()
endfunc

func! Ynk__slf_path() abort
  
  let l:path = Slf_path()

  let @a = l:path
  call Clipboard__ynk()
endfunc

func! Ynk__clipboard() abort

  let @a = @+
endfunc

func! V_ynk() abort

  call Normal('gv"ay')
  call Clipboard__ynk()
endfunc

func! V_ynk__add_slctd() abort

  call Normal('gv"Ay')
  call Clipboard__ynk()
endfunc

" paste

func! Paste() abort

  call Normal('"aP')
endfunc

func! V_paste() abort

  call Slct_re()
  call Normal('"zd')
  call Paste()
endfunc

func! V_box_paste() range abort

  if @a =~ '\n'
    echo 'yank is include cr'
    return
  endif

  call Slct_re()

  call Normal('"zd')

  let l:col = Cursor_col_num()

  for line_num in range(a:firstline, a:lastline)

    call Cursor__mv_by_line_col(l:line_num, l:col)
    call Paste()
  endfor
endfunc

func! Paste__clipboard() abort

  call Ynk__clipboard()
  call Paste()
endfunc

func! V_paste__clipboard() range abort

  call Ynk__clipboard()
  call V_paste()
endfunc

" clipboard

func! Clipboard__ynk() abort

  if Is_env('linux')

    "call C9clp__ynk() " off

  else
    let @+ = @a
  endif
endfunc

" srch

func! Srch(dir) abort

  if     a:dir == 'f'
    let l:op = ''
  elseif a:dir == 'b'
    let l:op = 'b'
  endif

  let l:str = @/
  call search(l:str, l:op)
endfunc

func! V_srch(dir) abort " use not

  if Is_slctd_str_eq_srch_str()
    return
  endif

  call V_srch_str__slctd_str()
endfunc

command! -nargs=* SrchOr call Srch_or(<f-args>)

func! Srch_or(...) abort

  let l:str = '\(' . join(a:000, '\|') . '\)'
  "echo l:str

  let @/ = l:str
  call Srch('f')
endfunc

func! Srch_str() abort

  let l:str = @/
  return l:str
endfunc

func! Srch_str_flt() abort

  let l:str = @/

  if Is_srch_word1()
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

func! Is_srch_word1() abort

  let l:str = @/
  let l:ret = v:false

  let l:str_l = strcharpart(l:str, 0, 2)
  let l:str_r = strcharpart(l:str, strchars(l:str) - 2)

  if l:str_l == '\<' && l:str_r == '\>'
    let l:ret = v:true
  endif

  return l:ret
endfunc

func! Srch_str__(str, op_word1) abort

  let l:exe_str = a:str

  let l:exe_str = escape(l:exe_str, '.*~[]\^$')

  if a:op_word1 == v:true
    let l:exe_str = Srch_str_word1(l:exe_str)
  endif

  if "@/" == "l:exe_str" " same ltst 01
    return
  endif

  let @/ = l:exe_str " highlight
  call Normal('/' . l:exe_str) " srch hstry add
endfunc

func! N_srch_str__flt() abort

  let l:str = Cursor_word()
  call Srch_str__(l:str, v:false)
endfunc

func! N_srch_str__word1_tgl() abort

  let l:str = Srch_str_flt()

  if Is_srch_word1()

    call Srch_str__(l:str, v:false)
  else
    call Srch_str__(l:str, v:true)
  endif
endfunc

func! Srch_str_ltst_01() abort

  let l:str = histget('/', -1)
  return l:str
endfunc

func! Srch_str_ltst_02() abort

  let l:str = histget('/', -2)
  return l:str
endfunc

func! Srch_str__prv_tgl() abort

  if @/ == Srch_str_ltst_01()

    let l:srch_str = Srch_str_ltst_02()
  else
    let l:srch_str = Srch_str_ltst_01()
  endif

  let @/ = l:srch_str
endfunc

func! V_srch_str__slctd_str() abort

  let l:str = Slctd_str()
  call Srch_str__(l:str, v:false)
endfunc

func! Srch_slct(dir) abort

  if     a:dir == 'f'
    call Normal('gn')

  elseif a:dir == 'b'
    call Normal('gN')
  endif
endfunc

func! V_srch_slct(dir) abort " srch rpl skip

  if     a:dir == 'f'
    call Normal('`>lgn')

  elseif a:dir == 'b'
    call Normal('`<hgN')
  endif
endfunc

func! Srch_7_cursor__mv_nxt(dir) abort

  call Srch_slct(a:dir)
  call Normal("\<esc>")
  call Cursor__mv_char_f()
  "call Normal('l')
endfunc

func! Srch_char(dir, char) abort

  let @/ = '[' . a:char . ']'
  call Srch(a:dir)
endfunc

func! Srch_char_bracket(dir) abort

  let l:char_bracket = "'" . '")}\]'
  call Srch_char(a:dir, l:char_bracket)
endfunc

" v line __ rpl

command! -range=% -nargs=* Rpl <line1>,<line2>call V_line__rpl(<f-args>)

func! V_line__rpl(srch, rpl) range abort

  let l:cmd = g:v_rng . 's/' . a:srch . '/' . a:rpl . '/g'
  "echo l:cmd
  call Exe(l:cmd)
endfunc

" v line srch str __ rpl cr ( add cr )

func! V_line_srch_str__rpl_cr() range abort

  let l:srch = @/

  let l:cmd = g:v_rng . 's/\(' . l:srch . '\)/\1\r/g'
  call Exe(l:cmd)
endfunc

" v line __ rpl by line1 line2

func! V_line__rpl_by_line1_line2() range abort

  let l:srch = getline(1)
  let l:rpl  = getline(2)

  "let l:rng = '3,$'
  let l:rng = g:v_rng
  let l:cmd = l:rng . 's/' . l:srch . '/' . l:rpl . '/g'
  "echo l:cmd
  call Exe(l:cmd)
endfunc

" v box __ rpl

command! -range=% -nargs=* RplBox <line1>,<line2>call V_box__rpl(<f-args>)

func! V_box__rpl(srch, rpl) range abort

  let l:srch = a:srch
  let l:rpl  = a:rpl

  let l:cmd = g:v_rng . 's/' . '\%V' . l:srch . '/' . l:rpl . '/g'
  call Exe(l:cmd)
endfunc

" v box space __ del

func! V_box_space__del() range abort

  let l:srch = ' '
  let l:rpl  = ''

  '<,'>:call V_box__rpl(srch, rpl)
endfunc

func! V_box_edge_r_char__shft_in() range abort

  let l:cmd = g:v_rng . 's/' . '\%V\([ ]\+\)\([^ ]\)' . '/' . '\2\1' . '/g'
  call Exe(l:cmd)

  call Slct_re()
endfunc

" cmnt

func! Ins_cmnt_1(cmd_cursor__mv_line_top) abort

  let l:cmnt_1_def = {
  \ 'lua'       : '-- ',
  \ 'text'      : '# ' ,
  \ 'vim'       : '" '  ,
  \ 'fish'      : '# '  ,
  \ 'sh'        : '# '  ,
  \ 'css'       : '/* ',
  \ 'javascript': '// ',
  \ 'java'      : '// ',
  \ 'dflt'      : '# '
  \ }
  let l:str = get(l:cmnt_1_def, &filetype, l:cmnt_1_def['dflt'])

  if a:cmd_cursor__mv_line_top != v:null
    call Normal(a:cmd_cursor__mv_line_top)
  endif

  call Normal('i' . l:str)
  
  call Normal('^') " or '0'
endfunc

func! V_ins_cmnt_1() range abort

  call Normal(a:firstline . 'G')
  call Normal('^')
  let l:col = Cursor_col_num()

  for line_num in range(a:firstline, a:lastline)

    call Line_end__pad_space(l:line_num, l:col - 1)

    call Cursor__mv_by_line_col(l:line_num, l:col)

    call Ins_cmnt_1(v:null)
  endfor
endfunc

func! Ins_cmnt_mlt_by_pos(pos) abort

  let l:cmnt_mlt_def = #{
  \  lua       : ['--[[' , '--]]'],
  \  html      : ['<!--' ,  '-->'],
  \  css       : ['/*'   ,  ' */'],
  \  javascript: ['/*'   ,  ' */'],
  \  java      : ['/*'   ,  ' */'],
  \  dflt      : ['/*'   ,  ' */']
  \ }

  let l:str = get(l:cmnt_mlt_def, &filetype, l:cmnt_mlt_def['dflt'])

  "if has_key(l:cmnt_mlt_def, &filetype)
  "  let l:filetype = &filetype
  "else
  "  let l:filetype = 'dflt'
  "endif
  "let l:str = l:cmnt_mlt_def[l:filetype]

  if     a:pos == 'bgn'
    call Normal('O')
    call Normal('i' . l:str[0])

  elseif a:pos == 'end'
    call Normal('o')
    call Normal('i' . l:str[1])
  endif
endfunc

func! Ins_cmnt_mlt() abort

  call Ins_cmnt_mlt_by_pos('bgn')
  call Ins_cmnt_mlt_by_pos('end')
endfunc

func! V_ins_cmnt_mlt() range abort

  call Normal(a:lastline  . 'G')
  call Ins_cmnt_mlt_by_pos('end')

  call Normal(a:firstline . 'G')
  call Ins_cmnt_mlt_by_pos('bgn')
endfunc

" markdown

func! Ins_markdown_h() abort

  call Cursor__mv_line_top0()
  let l:top0_char = Cursor_c_char()

  let l:str = '#'

  if l:top0_char != l:str
    let l:str .= ' '
  endif

  call Ins(l:str)

  let l:ptn = '^#* '
  let l:idx = Str_srch_end(Cursor_line_str(), l:ptn) + 1
  call Cursor__mv_by_line_col(v:null, l:idx)
endfunc

func! Ins_markdown_cr() abort

  call Ins('  ')
endfunc

func! Ins_markdown_itm() abort

  if Is_line_markdown_itm()
    call Indnt__shft_r()
    return
  endif

  let l:col = Indnt__crct()

  let l:str = '- '
  "echo l:str
  call Line_top1__ins(l:str)
endfunc

func! Ins_markdown_code() abort

  let l:str = '```'
  call Ins_line(l:str)
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
  
  call Char__rpl(l:rpl_char)
endfunc

" markdown cnd

func! Is_line_markdown_itm() abort

  let l:ptn = '^\s*- '
  let l:str = Cursor_line_str()
  let l:idx = Str_srch(l:str, l:ptn)

  if l:idx == -1
    return v:false
  else
    return v:true
  endif
endfunc

" tag jmp

func! Tag_jmp(rg_rslt_line) abort
  
  let l:rg_rslt_line = trim(a:rg_rslt_line)

  if Is_str_emp(l:rg_rslt_line)
    echo 'empty'
    return
  endif
  
  "let l:rg_rslt_line = matchstr(l:rg_rslt_line, '\S\+')
  "echo l:rg_rslt_line
  
  let l:rg_rslt_line_ar = Rg_rslt_line_parse(l:rg_rslt_line)
  "echo l:rg_rslt_line_ar

  let l:filename = l:rg_rslt_line_ar[0]
  let l:line_num = get(l:rg_rslt_line_ar, 1, 1)

  if ! filereadable(l:filename)
    echo 'file does not exist'
    return
  endif

  call Exe('tab drop ' . l:filename)
  call Normal(l:line_num . 'G')
endfunc

func! N_tag_jmp() abort

  let l:base_buf_num = Buf_num()

  let l:str = Cursor_line_str()
  call Tag_jmp(l:str)

  call Exe('sbuffer ' . l:base_buf_num)
  call Normal('j')
endfunc

func! V_tag_jmp() range abort

  let l:base_buf_num = Buf_num()

  for line_num in range(a:firstline, a:lastline)

    let l:line = getline(l:line_num)
    call Tag_jmp(l:line)
    call Exe('sbuffer ' . l:base_buf_num)
  endfor
endfunc

func! Rg_rslt_line_parse(line) abort

  let l:dlm = ':'
  let l:ret = split(a:line, l:dlm)
  "echo l:ret

  let l:idx = 0
  while l:idx < len(l:ret)

    let l:ret[l:idx] = trim(l:ret[l:idx])

    let l:idx = l:idx + 1
  endwhile
  "echo l:ret

  return l:ret
endfunc

" tmp file

func! Tmp_cre() abort " alias

  let l:tmp_path = Tmp_cre_sys()
  return l:tmp_path
endfunc

func! Tmp_cre_sys() abort

  let l:tmp_path = system('mktemp ')
  return l:tmp_path
endfunc

" opn file

command! -nargs=* -complete=file Opn call Opn(<q-args>)

func! Opn(filename) abort

  call Exe('tab drop ' . a:filename)
endfunc

func! Opn_tmp() abort

  let l:path = Tmp_cre()
  echo l:path
  call Opn(l:path)
endfunc

func! Opn_vimrc() abort

  let l:path = '~/wrk/cnf/vim/.vimrc'

  call Opn(l:path)
endfunc

func! Opn_fish_cnf() abort

  let l:path = '~/.config/fish/config.fish'
  call Opn(l:path)
endfunc

command! -nargs=* OpnMan call Opn_man(<q-args>)

func! Opn_man(cmd) abort

  call Exe('tab new')
  call Exe('Man ' . a:cmd)
  call Exe('only')
endfunc

func! Opn_vim_key() abort

  let l:path = '~/doc/tech/vim/m.key.default.md'
  call Opn(l:path)
endfunc

let g:opn_memo_path = '../memo.md'

func! Opn_memo() abort

  call Opn(g:opn_memo_path)
endfunc

func! Opn_grep_wk() abort

  "let g:grep_wk_path = 'doc/grep.lua'
  let g:grep_wk_path = '~/wrk/tmp/rg.md'

  let l:file_type = getftype(g:grep_wk_path)

  if Is_str_emp(l:file_type)

    call Opn(g:grep_wk_path)
  else
    call Opn_tmp()
  endif
endfunc

" opn app

"command! -nargs=* OpnApp call Opn_app(<f-args>)

func! Opn_app(path) abort
  
  let l:path = a:path
  
  if     Is_env('mac')

    let l:cmd_sys = 'open'

  elseif Is_env('win64')

    let l:cmd_sys = 'start'

  elseif Is_env('win32unix')

    let l:cmd_sys = 'start'

  else
    return
  endif

  if Is_env('win64')

    let l:path = Str_path_unix__cnv_win(l:path)
  endif

  let l:res = system(l:cmd_sys . " '" . l:path . "'")
endfunc

func! V_opn_app() range abort

  for line_num in range(a:firstline, a:lastline)

    call Opn_app_by_line_path(l:line_num)
  endfor
endfunc

func! Opn_app_by_cursor_path() abort
  
  let l:path = Cursor_filepath()
  call Opn_app(l:path)
endfunc

func! Opn_app_by_line_path(line_num) abort

  "let l:path = Line_str_by_line_num(a:line_num)
  let l:path = getline(a:line_num)

  let l:path = trim(l:path)
  call Opn_app(l:path)
endfunc

func! Opn_app_by_slctd_str() abort
  
  let l:path = Slctd_str()
  let l:path = trim(l:path)
  call Opn_app(l:path)
endfunc

func! Opn_app_slf() abort

  let l:path = Slf_path()
  echo l:path

  call Opn_app(l:path)
endfunc

func! Opn_dir_slf() abort

  let l:dir = Slf_dir()
  "echo l:path

  call Opn_app(l:dir)
endfunc

func! Opn_brwsr()

  let l:url = 'https://www.google.com/'
  call Opn_app(l:url)
endfunc

func! Opn_ggl_srch(word) abort

  let l:url = 'https://www.google.com/search?q=' . a:word
  call Opn_app(l:url)
endfunc

func! V_opn_ggl_srch() abort

  let l:word = Slctd_str()
  let l:word = trim(l:word)
  call Opn_ggl_srch(l:word)
endfunc

func! Opn_yt(yt_video_id)

  let l:url = 'https://www.youtube.com/watch?v=' . a:yt_video_id
  call Opn_app(l:url)
endfunc

func! V_opn_yt() abort
  
  let l:yt_video_id = Slctd_str()
  let l:yt_video_id = trim(l:yt_video_id)
  call Opn_yt(l:yt_video_id)
endfunc

" etc

func! Buf_num() abort

  return bufnr('%')
endfunc

" mode insert ins lst

func! I_symbol01() abort

  let l:lst = [ '|', '&', '%', '#', '$', '=', '+', '\' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_symbol02() abort

  let l:lst = [ ';', '-', '!', '?', '@', '^', '~', '/' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_bracket() abort

  let l:lst = [ '()', '``', '[]', '{}', '<>', '""', "''" ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_markdown() abort

  "let l:lst = [ '[]()', '![]()', '`>` ', '```', '---' ]
  let l:lst = [ '[]()', '![]()', '```', '---' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_week() abort

  call complete(col('.'), g:week_def)
  return ''
endfunc

func! I_num() abort

  let l:lst = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ]
  call complete(col('.'), l:lst)
  return ''
endfunc

func! I_reg() abort
  call complete(col('.'), [@0, @1, @2, @3])
  return ''
endfunc

func! I_reserved_lua() abort
  call complete(col('.'), [
  \   'end',
  \   'local',
  \   'return',
  \   'if elseif else end',
  \   'for key, val in pairs() do end',
  \   'function'
  \ ])
  return ''
endfunc

func! I_ooq() abort
  call complete(col('.'), [
  \   '_s:',
  \   '_s._',
  \   'log._("", )',
  \   'log.pp("", )',
  \   '-- dbg',
  \   '--',
  \   '_.f',
  \   '_.t'
  \ ])
  return ''
"  \   'function',
"  \   'local',
"  \   'return',
"  \   'if _.t then return end',
"  \   'if  then',
"  \   'elseif  then',
"  \   'else',
"  \   'then',
"  \   'then return end',
"  \   'for key, val in pairs() do end',
"  \   'not',
"  \   'or',
"  \   'and',
"  \   'end',
"  \   'nil',
"  \   'alias',
endfunc

" dir slf

command! -nargs=0 Pth call Pth()

func! Pth() abort

  call Exe('pwd')
endfunc

" dir ch slf

command! -nargs=0 CdSlf call Dir__slf()

func! Dir__slf() abort

  let l:dir = Slf_dir()
  call Exe('cd ' . l:dir)
  call Pth()
endfunc

" dir ch parent

command! -nargs=0 Cdu   call Dir__parent(1)
command! -nargs=0 Cduu  call Dir__parent(2)
command! -nargs=0 Cduuu call Dir__parent(3)
command! -nargs=0 K     call Dir__parent(1)
command! -nargs=0 Kk    call Dir__parent(2)
command! -nargs=0 Kkk   call Dir__parent(3)

func! Dir__parent(lvl) abort

  let l:cnt = 1
  while l:cnt <= a:lvl

    call Exe('cd ..')

    let l:cnt += 1
  endwhile

  call Pth()
endfunc

" undo clr

func! Undo_clr() abort

  let l:undolevels_old = &undolevels
  setlocal undolevels=-1
  exe "normal! a \<BS>\<Esc>"
  let &l:undolevels = l:undolevels_old
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
  if Is_str_emp(l:alph)
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

" load re

func! Load_re() abort

  call Exe('e ')
  "nnoremap xx :e!
endfunc

" encode confirm

func! Encode_confirm() abort

  call Exe('set enc?')
endfunc

" encode sjis  -  load re

func! Load_re__sjis() abort

  call Exe('e ++enc=sjis')
endfunc

" trns

func! V_trns() range abort

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

func! V_math() range abort

  let l:str = Slctd_str()
  let l:sys_cmd = 'echo ' . "'" . l:str . "'" . ' | math'
  let l:rslt = Sys_cmd(l:sys_cmd)
  echo l:rslt
  let @a = l:rslt

  "let l:sys_cmd = 'cat | math'
  "'<,'>:call V_sys_cmd(l:sys_cmd)
endfunc

" url encdoe

command! -nargs=? UrlEncode <line1>,<line2>call V_url_encode(<f-args>)

func! V_url_encode() range abort

  let l:str = Slctd_str()
  let l:sys_cmd = 'url_encode "' . l:str . '"'
  let l:rslt = Sys_cmd(l:sys_cmd)
  "echo l:rslt
  call Ins(l:rslt)
endfunc

" syntax color

func! Hl_grp() abort

  echo synIDattr(synID(line('.'), col('.'), 1), 'name')
endfunc
" and
" :highlight [grp name]

func! Color_name_lst() abort

  let l:cmd = "so $VIMRUNTIME/syntax/colortest.vim"
  call Exe(l:cmd)
endfunc

func! Defold_err_cnv() abort

  exe '%s/^ERROR:SCRIPT:/ERROR:SCRIPT:\r/g'
  exe '%s/\/assets\///g'
  exe '%s/^ *//g'
endfunc

" tst

func! Tst_slctd() range abort

  call Slct_re()

  if     mode() == "\<c-v>"
    echo "c-v"
  elseif mode() == "v"
    echo "v"
  elseif mode() == "V" " < non
    echo "V"
  else
    echo "else"
  endif
endfunc


" 
" init
" 

" ynk init
call Ynk__clipboard()

" srch init
func! Srch_init() abort " use not

  let l:cmd = '/<cr>N'
  call Normal(l:cmd)
endfunc
"call Srch_init()


" 
" fzf my
" 

" fzf by rg ( my run )

command! -nargs=0 FzfByRgMyrun call Fzf_by_rg_myrun()

func! Fzf_by_rg_myrun() abort

  let l:ptn = '^[ \t]*$'
  let l:rg_cmd = "rg -v -e '" . l:ptn . "' | count"
  let l:rg_cnt = Sys_cmd(l:rg_cmd)

  if l:rg_cnt > 10000
    echo "l:rg_cnt, end"
    return
  endif

  call fzf#run(
  \   {
  \     'source' : Rg_all_rslt_ar(),
  \     'sink'   : funcref('Tag_jmp'),
  \     'window' : '-tabnew',
  \   }
  \ )
  "\     'options': ['--reverse'],
  "\     'options': ['--no-sort'],
endfunc

func! Rg_all_rslt_ar() abort

  let l:opt = '-v'
  let l:ptn = '^[ \t]*$'

  let l:rslt_ar = Sys_cmd_rg_rslt_ar(l:opt, l:ptn)
  return l:rslt_ar
endfunc

func! Sys_cmd_rg_rslt_ar(opt, ptn) abort

  let l:rg_rslt_txt = Sys_cmd_rg_rslt_txt(a:opt, a:ptn)
  let l:rg_rslt_ar  = split(l:rg_rslt_txt, "\n")
  return l:rg_rslt_ar
endfunc

func! Sys_cmd_rg_rslt_txt(opt, ptn) abort
  
  let l:rg_cmd_str = Rg_cmd_str(a:opt, a:ptn)

  let l:r_rslt_txt = Sys_cmd(l:rg_cmd_str)
  return l:r_rslt_txt
endfunc

func! Rg_cmd_str(opt, ptn) abort

  let l:rg_cmd_str = 'rg '
  \            . ' --line-number'
  \            . ' --smart-case'
  \            . ' --hidden'
  \            . ' --color always'
  \            . ' -g "!.git"'
  "\            . ' --no-ignore'
  "\            . ' -ns'

  if a:opt == v:null
    let l:opt = ''
  else
    let l:opt = a:opt
  endif

  let l:ptn = trim(a:ptn)
  let l:ptn = escape(l:ptn, '\({')
  
  let l:rg_cmd_str = l:rg_cmd_str . ' ' . l:opt . " -e '" . l:ptn . "'"
  return l:rg_cmd_str
endfunc

" fzf by memo

command! -nargs=0 FzfByMemo call Fzf_by_memo()

let g:fzf_run_memo_path = 'doc/memo.md'

func! Fzf_by_memo() abort

  let l:memo_file_path = g:fzf_run_memo_path

  call Fzf_by_pth_lst(l:memo_file_path)

"  call fzf#run(
"  \   {
"  \     'source' : Memo_ar(),
"  \     'sink'   : funcref('Tag_jmp'),
"  \     'window' : '-tabnew',
"  \   }
"  \ )
"  "\     'options': ['--reverse'],
"  "\     'options': ['--no-sort'],
endfunc

" fzf by pth lst

func! Fzf_by_pth_lst(pth_lst_file_path) abort

  call fzf#run(
  \   {
  \     'source' : Pth_lst_ar(a:pth_lst_file_path),
  \     'sink'   : funcref('Tag_jmp'),
  \     'window' : '-tabnew',
  \   }
  \ )
  "\     'options': ['--reverse'],
  "\     'options': ['--no-sort'],
endfunc

func! Pth_lst_ar(pth_lst_file_path) abort

  let l:rslt_txt = Pth_lst_txt(a:pth_lst_file_path)
  let l:rslt_ar  = split(l:rslt_txt, "\n")
  return l:rslt_ar
endfunc

func! Pth_lst_txt(pth_lst_file_path) abort

  if ! filereadable(a:pth_lst_file_path)
    return
  endif

  "let l:cmd = 'cat_ee ' . a:pth_lst_file_path
  let l:cmd = 'cat ' . a:pth_lst_file_path

  let l:pth_lst_txt = Sys_cmd(l:cmd)
  return l:pth_lst_txt
endfunc


" shell & .vimrc_env

set shell=fish         " default

if     Is_env('mac')   " mac

  set shell=fish

elseif Is_env('linux') " c9

  "set shell=bash
  set shell=fish

  source ~/wrk/cnf/vim/.vimrc_c9

elseif Is_env('win64') " pwsh ( for fzf )

  let &shell = Is_env('win32') ? 'powershell' : 'pwsh'
  let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=

elseif Is_env('win32unix') " gitbash ( for fzf )
  "echo "gitbash"
  set shell=bash

  source ~/wrk/cnf/vim/.vimrc_gitbash

else
  echo "is env else"
endif

" 
" ref ptn regex
" url : xxx

" \n : 改行
" \t : tab

" \s : space, tab
" 
" \w : [0-9A-Za-z_]  word
" \h : [A-Za-z_]     単語の先頭文字, \w から数字を除いたもの
" \a : [A-Za-z]      alph
" \l : [a-z]         小文字
" \u : [A-Z]         大文字
" 
" \d : [0-9]         10進数
" \x : [0-9A-Fa-f]   16進数
" \o : [0-7]          8進数
"
" \S : \s 以外
" \D : \d 以外
" \X : \x 以外
" \O : \o 以外
" \W : \w 以外
" \H : \h 以外
" \A : \a 以外
" \L : \l 以外
" \U : \u 以外

" \_<上記(の\の後ろ)> : 改行を含む上記
" ex
"   \_s : 改行, space, tab のいずれか

