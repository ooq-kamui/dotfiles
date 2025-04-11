
" c9

" paste clp
"inoremap <c-v> <c-r>a

" set shell=bash
set shell=fish

let g:fzf_rg_opt .= ' -g "!amplify/#current-cloud-backend/"'
let g:fzf_rg_opt .= ' -g "!amplify/backend/node_modules/"'
let g:fzf_rg_opt .= ' -g "!amplify/backend/awscloudformation/build"'

"nnoremap P :Pth <cr>

" 
" plg
" 

" osc52

if ! has('nvim')

  source ~/wrk/prj-pri/dotfiles/nvim/plg/vim/osc52.vim

  nnoremap C :call C9clp__ynk()<cr>

  func! C9clp__ynk() abort

    call SendViaOSC52( @a )
  endfunc

  func! Ynk__clp() abort

    if Is_env__('linux')
      let @a = @+
    else
      let @a = @+
    endif
  endfunc
endif


