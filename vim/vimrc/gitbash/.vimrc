
" bell flash off

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif


" grep ( fzf  -  gitbash )

"nnoremap <leader>o :FzfRunRg <cr>
nnoremap <leader>o :FzfRgByRun <cr>

vnoremap <leader>o "zy:FzfRgByRun <c-r>z<cr>



