
" function
hi luaFunction     ctermfg=130

" if elseif else then end
" hi luaCond         ctermfg=130
hi luaCond         ctermfg=cyan

" else
hi luaElse         ctermfg=130

" for
hi luaRepeat       ctermfg=130

" in
hi luaIn           ctermfg=130

" and or
hi luaOperator     ctermfg=130

" local return
hi luaStatement    ctermfg=130

" constant
hi luaConstant     ctermfg=13

" comment
" hi luaComment      ctermfg=29
hi luaComment      ctermfg=green

" string 201 133
hi luaString       ctermfg=171
"hi luaString       ctermfg=135

" num
hi luaNumber       ctermfg=magenta

" pairs
hi luaFunc         ctermfg=130

" table
hi luaTable        ctermfg=39
" hi luaTable        ctermfg=cyan
" hi luaTable        ctermfg=121

" err
hi luaError        ctermfg=yellow ctermbg=magenta
hi luaParenError   ctermfg=none   ctermbg=magenta

syn match luaFunctionName "\(\<function\>\)\@<=\s\+\S\+\s*(\@="
hi luaFunctionName ctermfg=41
"hi luaFunctionName ctermfg=lightgreen

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
"hi luaOpe          ctermfg=130

syn keyword luaSelf _s
hi luaSelf         ctermfg=33


