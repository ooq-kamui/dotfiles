
" pwsh

let &shell = Is_env__('win32') ? 'powershell' : 'pwsh'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=


" let g:fzf_rg_opt .= ' -g "\!amplify/#current-cloud-backend/"'
" let g:fzf_rg_opt .= ' -g "\!amplify/backend/node_modules/"'
" let g:fzf_rg_opt .= ' -g "\!amplify/backend/awscloudformation/build"'

" docusaurus

" let g:fzf_rg_opt .= ' -g "\!node_modules/"'



