" 
" etc ( legacy ? )
" 

" if &term =~ '^screen'
"   " tmux will send xterm-style keys when its xterm-keys option is on
"   exe "set <xUp>=\e[1;*A"
"   exe "set <xDown>=\e[1;*B"
"   exe "set <xRight>=\e[1;*C"
"   exe "set <xLeft>=\e[1;*D"
" endif

" quickfix

"packadd Cfilter

" autocmd QuickFixCmdPost grep,vimgrep tab cw


