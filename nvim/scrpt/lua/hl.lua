-- 
-- hl ( hi )
-- 

-- ex
-- 
-- vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = '#777777', ctermbg = 'NONE', bold = false })
-- arg[0] : hl group
--   0: all    ( default )
--   1: window
--   2: buffer


local hl__ = vim.api.nvim_set_hl

hl__(0, 'LineNr', {ctermfg = 'magenta'})

local grp_ins = vim.api.nvim_create_augroup('InsertHook', {})
vim.api.nvim_clear_autocmds({group = grp_ins})
vim.api.nvim_create_autocmd('InsertEnter', {
  pattern  = {'*'},
  group    = grp_ins,
  callback = function()
    hl__(0, 'LineNr', {ctermfg = 'lightgreen'})
  end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern  = {'*'},
  group    = grp_ins,
  callback = function()
    hl__(0, 'LineNr', {ctermfg = 'magenta'})
  end,
})

hl__(0, 'Cursor'        , {                          ctermbg = 'gray'       })
hl__(0, 'CursorLineNr'  , {ctermfg = 'magenta'                              })
hl__(0, 'CursorLine'    , {underline = true})

hl__(0, 'Visual'        , {ctermfg = 'none'        , ctermbg = 'darkmagenta'})
hl__(0, 'VisualNOS'     , {                          ctermbg = 'darkmagenta'})

hl__(0, 'Search'        , {ctermfg = 'lightyellow' , ctermbg = 36           })
hl__(0, 'CurSearch'     , {ctermfg = 'lightyellow' , ctermbg = 36           })
hl__(0, 'IncSearch'     , {ctermfg = 'lightyellow' , ctermbg = 34           })

-- bracket
hl__(0, 'MatchParen'    , {ctermfg = 'lightmagenta', ctermbg = 'none'       })

hl__(0, 'TabLineSel'    , {                          ctermbg = 'magenta'    })
hl__(0, 'TabLine'       , {ctermfg = 'lightblue'   , ctermbg = 'none'       })
hl__(0, 'TabLineFill'   , {                          ctermbg = 'none'       })

hl__(0, 'StatusLine'    , {ctermfg = 'lightblue'   , ctermbg = 'none'       })
hl__(0, 'EndOfBuffer'   , {ctermfg = 'cyan'                                 })

hl__(0, 'Pmenu'         , {ctermfg = 'lightgreen'  , ctermbg = 'darkblue'   })
hl__(0, 'PmenuSel'      , {ctermfg = 'cyan'        , ctermbg = 'magenta'    , bold = true })

hl__(0, 'ErrorMsg'      , {ctermfg = 'magenta'     , ctermbg = 'none'       })
hl__(0, 'WarningMsg'    , {ctermfg = 'magenta'     , ctermbg = 'none'       })

hl__(0, 'NonText'       , {ctermfg = 25            , ctermbg = 'none'       })
hl__(0, 'SpecialKey'    , {ctermfg = 25            , ctermbg = 'none'       })

hl__(0, 'FullWidthSpace', {                          ctermbg = 'white'      })
-- match FullWidthSpace /　/
--   ???

-- vimdiff
hl__(0, 'DiffAdd'       , {ctermfg = 10            , ctermbg = 22           })
hl__(0, 'DiffDelete'    , {ctermfg = 52            , ctermbg = 52           })
hl__(0, 'DiffChange'    , {ctermfg = 10            , ctermbg = 17           })
hl__(0, 'DiffText'      , {ctermfg = 10            , ctermbg = 21           })

-- wildmenu
hl__(0, 'wildMenu'      , {ctermfg = 'cyan'                                 })

-- hi dflt
hl__(0, 'Comment'       , {ctermfg = 14            , ctermbg = 'none'       })

-- win ( buf ) splt
vim.api.nvim_set_hl(0, 'StatusLineNC', {link = 'Comment'})
vim.api.nvim_set_hl(0, 'VertSplit'   , {link = 'Comment'})


