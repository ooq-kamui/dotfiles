-- 
-- hi
-- 

-- ex
-- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#777777', bg = 'NONE', bold = false })
-- arg[0] : hl group
--   0: all    ( default )
--   1: window
--   2: buffer


-- hi LineNr                           ctermfg=141                              
vim.api.nvim_set_hl(0, 'LineNr'        , {fg = 141                               })
-- augroup InsertHook
--   au!
--   au InsertLeave * hi LineNr ctermfg=141
--   au InsertEnter * hi LineNr ctermfg=lightgreen
-- augroup END


vim.api.nvim_set_hl(0, 'Cursor'        , {                     bg = 'gray'       })
vim.api.nvim_set_hl(0, 'CursorLineNr'  , {fg = 'magenta'                         })

vim.api.nvim_set_hl(0, 'VisualLineNr'  , {fg = 'none'        , bg = 'darkmagenta'})
vim.api.nvim_set_hl(0, 'VisualNOS'     , {                     bg = 'darkmagenta'})

vim.api.nvim_set_hl(0, 'Search'        , {fg = 'lightyellow' , bg = 36           })
vim.api.nvim_set_hl(0, 'CurSearch'     , {fg = 'lightyellow' , bg = 36           })
vim.api.nvim_set_hl(0, 'IncSearch'     , {fg = 'lightyellow' , bg = 34           })

-- bracket
vim.api.nvim_set_hl(0, 'MatchParen'    , {fg = 'lightmagenta', bg = 'none'       })

vim.api.nvim_set_hl(0, 'TabLineSel'    , {                     bg = 'magenta'    })
vim.api.nvim_set_hl(0, 'TabLine'       , {fg = 'lightblue'   , bg = 'none'       })
vim.api.nvim_set_hl(0, 'TabLineFill'   , {                     bg = 'none'       })

vim.api.nvim_set_hl(0, 'StatusLine'    , {fg = 'lightblue'   , bg = 'none'       })
vim.api.nvim_set_hl(0, 'EndOfBuffer'   , {fg = 'cyan'                            })

vim.api.nvim_set_hl(0, 'Pmenu'         , {fg = 'lightgreen'  , bg = 'darkblue'   })
vim.api.nvim_set_hl(0, 'PmenuSel'      , {fg = 'cyan'        , bg = 'magenta'    , bold = true })

vim.api.nvim_set_hl(0, 'ErrorMsg'      , {fg = 'magenta'     , bg = 'none'       })
vim.api.nvim_set_hl(0, 'WarningMsg'    , {fg = 'magenta'     , bg = 'none'       })

vim.api.nvim_set_hl(0, 'NonText'       , {fg = 25            , bg = 'none'       })
vim.api.nvim_set_hl(0, 'SpecialKey'    , {fg = 25            , bg = 'none'       })

vim.api.nvim_set_hl(0, 'FullWidthSpace', {                     bg = 'white'      })
-- match FullWidthSpace /　/
--   ???

-- vimdiff
vim.api.nvim_set_hl(0, 'DiffAdd'       , {fg = 10            , bg = 22           })
vim.api.nvim_set_hl(0, 'DiffDelete'    , {fg = 52            , bg = 52           })
vim.api.nvim_set_hl(0, 'DiffChange'    , {fg = 10            , bg = 17           })
vim.api.nvim_set_hl(0, 'DiffText'      , {fg = 10            , bg = 21           })

-- wildmenu
vim.api.nvim_set_hl(0, 'wildMenu'      , {fg = 'cyan'                            })

-- hi dflt
vim.api.nvim_set_hl(0, 'Comment'       , {fg = 14            , bg = 'none'       })


