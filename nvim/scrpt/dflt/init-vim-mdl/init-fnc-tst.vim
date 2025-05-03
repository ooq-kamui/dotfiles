" 
" fnc tst
" 

" tst escape

"nnoremap T :call Tst_esacpe()<cr>

func! Tst_esacpe() abort

  let l:str = '().$a'
  echo l:str

  let l:str = escape(l:str, l:str)
  echo l:str
endfunc

" tst escape shell

"nnoremap T :call Tst_esacpe_shell() <cr>

func! Tst_esacpe_shell() abort

  let l:str = '().$a \ / | & b c '
  echo l:str

  let l:str = shellescape(l:str)
  echo l:str
endfunc

" tst arg f

"nnoremap T :TstArgF 
"nnoremap T :TstArgF aa().a \/|&bbb 'aa().a \/|&bbb'

command! -bang -nargs=* TstArgF call Tst_arg_f(<f-args>)

func! Tst_arg_f(arg01, arg02, arg03, arg04) range abort

  echo a:arg01
  echo a:arg02
  echo a:arg03
  echo a:arg04
endfunc

" tst arg q

"nnoremap T :TstArgQ aa "bbb ccc" '().\a bbb""' "().\a bbb''"

command! -bang -nargs=* TstArgQ call Tst_arg_q(<q-args>)

func! Tst_arg_q(arg01) range abort

  echo a:arg01
  " echo a:arg01 . 'end'
endfunc

" tst is_directory ~

"nnoremap T :call Tst_is_directory()<cr>

func! Tst_is_directory() range abort

  " let l:path = "~/wrk"        " ng
  let l:path = $HOME . "/wrk" " ok
  if isdirectory(l:path)
    echo "true"
  else
    echo "false"
  endif
endfunc

" tst slctd mode

func! Tst_slctd_mode() range abort

  let l:val = Is_slctd_mode__box()
  echo l:val
endfunc

" tst slctd __ rpl sys cmd mb

"vnoremap T :TstSlctdRplSysCmdMb <cr>

command! -range=% -nargs=* TstSlctdRplSysCmdMb <line1>,<line2>call Tst_slctd_rpl_sys_cmd_mb()

" dev ? anchor
func! Tst_slctd_rpl_sys_cmd_mb() range abort

  let l:pth = '~/wrk/prj-pri/dotfiles/doc/tst/tst-in.md'
  " let l:sys_cmd = 'cat ' . l:pth . ' | column -t | cat'
  let l:sys_cmd = 'cat ' . l:pth . ' | column -t'
  " let l:sys_cmd = 'cat ' . l:pth

  '<,'>:call Slctd_line__rpl_sys_cmd(l:sys_cmd)
endfunc

" tst fnc call fr lua

func! Tst_fnc_call_fr_lua() range abort

  echo 'abcde'
endfunc

" tst regex

func! Tst_regex() range abort

  let l:str = '[]'

  " if l:str =~ '\w'
  if match(l:str, '\w') != -1

    echo 'true'
  else
    echo 'false'
  endif
endfunc

" fnc tst end


