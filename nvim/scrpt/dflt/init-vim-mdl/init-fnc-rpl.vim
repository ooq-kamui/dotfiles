" 
" fnc vim rpl
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


