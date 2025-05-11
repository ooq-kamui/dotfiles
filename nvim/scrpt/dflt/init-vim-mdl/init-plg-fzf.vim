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


