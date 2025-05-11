" 
" fzf
" 

" init

let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_action = {
\  'ctrl-o': 'tab drop',
\ }

"\  'ctrl-o': 'enter',
"\  'ctrl-i': 'item slct mtl',
"\  'ctrl-s': 'backward-char',

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

" use ??
"let g:fzf_buffers_jump = 1
"fzf#vim#complete#buffer_line([spec])

" fzf var def ( in plugin ) end

if Is_env__('mac') || Is_env__('linux') || Is_env__('win64')

  if Is_env__('win64')
    let g:fzf_rg_opt .= ' -g "!.git/"'
  else
    let g:fzf_rg_opt .= ' -g "!.git/"'
  endif
endif


" 
" fnc
" 

func! Fzf_rg(...) abort " alias

  let l:ptn   = ( a:0 >= 1 ) ? a:1 : ''
  " let l:ptn   = ( a:0 >= 1 ) ? a:1 : g:rg_some_line_ptn
  
  let l:ext   = ( a:0 >= 2 ) ? a:2 : v:null
  let l:word1 = ( a:0 >= 3 ) ? a:3 : v:false

  call Fzf_rg_with_grep(l:ptn, l:ext, l:word1)
endfunc

func! Fzf_rg_with_grep(...) abort

  if ! ( Is_env__('mac') || Is_env__('linux') || Is_env__('win64') )
    return
  endif

  let l:ptn   = ( a:0 >= 1 ) ? a:1 : ''
  " let l:ptn   = ( a:0 >= 1 ) ? a:1 : g:rg_some_line_ptn

  let l:ext   = ( a:0 >= 2 ) ? a:2 : v:null
  let l:word1 = ( a:0 >= 3 ) ? a:3 : v:false

  let l:rg_cmd = Rg_cmd(l:ptn, l:ext, l:word1, v:null)
  " echo l:rg_cmd

  call fzf#vim#grep(
  \      l:rg_cmd,
  \      0,
  \      fzf#vim#with_preview(
  \        {'options': '--exact --delimiter : --nth 3..'},
  \        'up:70%:hidden',
  \        'ctrl-u'
  \      ),
  \      1
  \    )

  " ref
  " fzf#vim#grep(
  "   command,
  "   [has_column bool],
  "   [spec dict],
  "   [fullscreen bool]
  " )
endfunc

" fzf rg ext

func! Fzf_rg_ext(ext) abort

  let l:ext = a:ext
  call Fzf_rg(v:null, l:ext)
endfunc

" rg word1
func! Fzf_rg_word1(ptn) abort

  call Fzf_rg(a:ptn, v:null, v:true)
endfunc

" fzf rg by run

let g:fzf_line_cnt_max = 30000

func! Fzf_rg_with_run(...) abort

  let l:ptn = ( a:0 >= 1 ) ? a:1 : v:null

  if l:ptn == v:null

    let l:rg_rslt_cnt = Rg_all_cnt()

    if l:rg_rslt_cnt > g:fzf_line_cnt_max
      echo "l:rg_rslt_cnt, end"
      return
    endif

    let l:fzf_src_ar = Rg_all_rslt_ar()

  else
    let l:rg_rslt_cnt = Rg_ptn_cnt(l:ptn, v:null)

    if l:rg_rslt_cnt > g:fzf_line_cnt_max
      echo "l:rg_rslt_cnt, end"
      return
    endif

    let l:fzf_src_ar = Rg_ptn_rslt_ar(l:ptn, v:null)
  endif

  call fzf#run(
  \      {
  \        'source' : l:fzf_src_ar,
  \        'sink'   : funcref('Tag_jmp_by_str'),
  \        'window' : '-tabnew',
  \      }
  \    )
  "\     'options': ['--reverse'],
  "\     'options': ['--no-sort'],
endfunc

func! Fzf_by_txt(...) abort

  let l:src_txt  = ( a:0 >= 1 ) ? a:1 : v:null
  let l:fnc_name = ( a:0 >= 2 ) ? a:2 : v:null

  let l:src_ar = Txt_to_ar(l:src_txt)

  call Fzf_by_ar(l:src_ar, fnc_name)
endfunc

func! Fzf_by_ar(...) abort

  let l:src_ar   = ( a:0 >= 1 ) ? a:1 : v:null
  let l:fnc_name = ( a:0 >= 2 ) ? a:2 : v:null

  if len(l:src_ar) > g:fzf_line_cnt_max
    echo "l:fzf src_ar, end"
    return
  endif

  call fzf#run(
  \      {
  \        'source' : l:src_ar,
  \        'sink'   : funcref(l:fnc_name),
  \        'window' : '-tabnew',
  \      }
  \    )
  "\     'options': ['--reverse'],
  "\     'options': ['--no-sort'],
endfunc

" fzf tag jmp by file

func! Fzf_tag_jmp_by_file(...) abort

  let l:file_path = ( a:0 >= 1 ) ? a:1 : 'doc/memo.md'

  let l:fzf_src_txt = File_txt(l:file_path)
  let l:fnc_name    = 'Tag_jmp_by_str'
  call Fzf_by_txt(fzf_src_txt, fnc_name)
endfunc

" fzf buf

func! N_fzf_buf() abort
  
  exe 'FzfBufCrnt '
endfunc

func! V_fzf_buf() abort

  call Srch_str__slctd_str()
  exe 'FzfBufCrnt ' . escape(@z, '.*~')
endfunc

func! Fzf_rgstr() abort
  
  let l:rgstr_info = execute(':reg')->split("\n")
  call remove(l:rgstr_info, 0)
  
  call fzf#run(
  \   {
  \     'source': l:rgstr_info,
  \     'sink'  : funcref('Ynk__by_rgstr_info'),
  \     'window': '-tabnew'
  \   }
  \ )
  " \     'sink'  : funcref('Cursor__ins_rgstr_by_rgstr_info'),
endfunc

" fzf jmplst

func! Fzf_jmplst() abort
  
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

" fzf file

func! Fzf_file() abort

  let l:sys_cmd = 'fd --type f'
  let l:fzf_src_txt  = Sys_cmd(l:sys_cmd)

  let l:fnc_name = 'Opn'
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
endfunc

" fzf dir

func! Fzf_dir() abort

  let l:sys_cmd = 'fd --type d'
  let l:fzf_src_txt  = Sys_cmd(l:sys_cmd)

  let l:fnc_name = 'Dir__'
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
endfunc

func! Fzf_dir_jmp() abort

  let l:sys_cmd = 'dir_jmp_lst_with_z'
  " let l:sys_cmd = 'dir_jmp_lst_with_zoxide'

  let l:fzf_src_txt  = Sys_cmd(l:sys_cmd)

  let l:fnc_name = 'Dir__'
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
endfunc

func! Fzf_doc_memo_opn() abort

  let l:dir = '~'

  let l:memo_file_list = [
  \   l:dir . '/wrk/prj-pri/dotfiles/doc/memo.md',
  \   l:dir . '/wrk/prj-pri/doc-tech-ds/doc/memo.md',
  \   l:dir . '/wrk/prj-pri/life/doc/memo.md',
  \   l:dir . '/wrk/prj-pri/wall-paper/doc/memo.md'
  \ ]

  let l:fzf_src_ar = l:memo_file_list
  let l:fnc_name    = 'Opn'
  call Fzf_by_ar(l:fzf_src_ar, l:fnc_name)
endfunc

func! Fzf_vim_fnc_call() abort

  let l:rg_ptn = '^func! [\w]+\(.*\)'

  let l:sys_cmd_rg = "rg " . "-No '" . l:rg_ptn . "' " . g:init_vim_file_path

  let l:sys_cmd_sed = 'sed "s/func! //g"'

  let l:sys_cmd = l:sys_cmd_rg . ' | ' . l:sys_cmd_sed
  let l:fzf_src_txt  = Sys_cmd(l:sys_cmd)

  let l:fnc_name = 'Cmdline__'

  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
endfunc

func! Fzf_doc_tech() abort

  let l:ptn = g:rg_emp_line_ptn
  let l:opt  = ' -v'
  let l:opt .= ' --no-heading'
  " let l:opt .= ' --line-number'
  let l:sys_cmd_rg = "rg" . l:opt . " '" . l:ptn . "' ~/" . g:doc_tech_dir_rel
  " echo l:sys_cmd

  let l:sys_cmd_sed = 'sed "s|^.*' . g:doc_tech_dir_rel . '/||g"'

  let l:sys_cmd = l:sys_cmd_rg . ' | ' . l:sys_cmd_sed

  let l:fzf_src_txt = Sys_cmd(l:sys_cmd)

  let l:fnc_name = 'Doc_tech_tag_jmp'
  call Fzf_by_txt(l:fzf_src_txt, l:fnc_name)
endfunc

" 
" cmd
" 

command! -bang -nargs=1 FzfRgExt call Fzf_rg_ext(<f-args>)

command! -nargs=? FzfRgWithRun call Fzf_rg_with_run(<f-args>)

command! -nargs=? FzfTagjmpByFile call Fzf_tag_jmp_by_file(<f-args>)

command! -bang -nargs=? FzfBufCrnt
\ call fzf#vim#buffer_lines(
\   <q-args>,
\   {'options': ['--no-sort', '--exact']},
\   <bang>1
\ )

" fzf file
command! -bang -nargs=? -complete=dir FzfFile call fzf#vim#files(<q-args>, <bang>1)

" fzf file history
command! -bang -nargs=* FzfFileHstry call fzf#vim#history(fzf#vim#with_preview(), <bang>1)

" fzf cmd history
command! -bang -nargs=* FzfCmdHstry call fzf#vim#command_history(fzf#vim#with_preview(), <bang>1)

" fzf srch history
command! -bang -nargs=* FzfSrchHstry call fzf#vim#search_history(fzf#vim#with_preview(), <bang>1)

" fzf rgstr
command! -bang -nargs=* FzfRgstr call Fzf_rgstr()

command! -bang -nargs=* FzfJmplst call Fzf_jmplst()

" fzf cmd def : mark
command! -bang -nargs=* FzfMark call fzf#vim#marks(fzf#vim#with_preview(), <bang>1)


