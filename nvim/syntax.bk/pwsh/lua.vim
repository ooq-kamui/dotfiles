
hi luaFunction     ctermfg=130

hi luaCond         ctermfg=130

hi luaElse         ctermfg=130

hi luaRepeat       ctermfg=130

hi luaIn           ctermfg=130

hi luaOperator     ctermfg=130

hi luaStatement    ctermfg=130

hi luaConstant     ctermfg=13

hi luaComment      ctermfg=green

hi luaString       ctermfg=171

hi luaNumber       ctermfg=magenta

" pairs
hi luaFunc         ctermfg=130

hi luaTable        ctermfg=39

hi luaError        ctermfg=yellow ctermbg=magenta
hi luaParenError   ctermfg=none   ctermbg=magenta

syn match luaFunctionName "\(\<function\>\)\@<=\s\+\S\+\s*(\@="
hi luaFunctionName ctermfg=41

syn match luaFunctionCall "\v\.\zs\w+\ze\("
hi luaFunctionCall ctermfg=cyan

syn match luaMethodCall "\v\:\zs\w+\ze\("
hi luaMethodCall   ctermfg=cyan

syn match luaOpe "<"
syn match luaOpe ">"
syn match luaOpe "<="
syn match luaOpe ">="
syn match luaOpe "=="
syn match luaOpe "\v\~\="
syn match luaOpe "="

hi luaOpe          ctermfg=121

syn keyword luaSelf _s
hi luaSelf         ctermfg=33


