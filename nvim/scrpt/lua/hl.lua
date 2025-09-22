-- 
-- hl ( hi )
-- 

-- ex
-- 
-- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#777777', bg = 'NONE', bold = bl.f })
-- arg[0] : hl group
--   0: all    ( default )
--   1: window
--   2: buffer

local hl__ = vim.api.nvim_set_hl

-- vim.opt.termguicolors = true
-- vim.opt.winblend = 0
-- vim.opt.pumblend = 0

hl__(0, 'Normal'  , {bg = 'none'})
-- hl__(0, 'NormalNC', {bg = 'none'})
-- hl__(0, 'NormalSB', {bg = 'none'})


hl__(0, 'LineNr', {fg = 'magenta'})

local grp_ins = vim.api.nvim_create_augroup('InsertHook', {})
vim.api.nvim_clear_autocmds({group = grp_ins})
vim.api.nvim_create_autocmd('InsertEnter', {
  pattern  = {'*'},
  group    = grp_ins,
  callback = function()
    hl__(0, 'LineNr', {fg = 'lightgreen'})
  end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern  = {'*'},
  group    = grp_ins,
  callback = function()
    hl__(0, 'LineNr', {fg = 'magenta'})
  end,
})

vim.opt.guicursor = "n-v-i-c:block" -- mac
-- vim.opt.guicursor = "n-v-i-c:ver45" -- win
-- vim.opt.guicursor = "n-v-i-c:hor45"
-- vim.opt.guicursor = "n-v-i-c:hor20-blinkwait700-blinkon400"

hl__(0, 'Cursor'        , {fg      = 'none'   , bg = 'none'       , reverse = bl.t})

hl__(0, 'CursorLine'    , {underline = bl.t})
hl__(0, 'CursorLineNr'  , {fg = 'magenta'                         })

hl__(0, 'Visual'        , {fg = 'none'        , bg = 'darkmagenta'})
hl__(0, 'VisualNOS'     , {                     bg = 'darkmagenta'})

hl__(0, 'Search'        , {fg = 'lightyellow' , bg = '#00af87'    })
hl__(0, 'CurSearch'     , {fg = 'lightyellow' , bg = '#00af87'    })
hl__(0, 'IncSearch'     , {fg = 'lightyellow' , bg = '#00af00'    })

-- bracket
hl__(0, 'MatchParen'    , {fg = 'lightmagenta', bg = 'none'       })

hl__(0, 'TabLineSel'    , {                     bg = 'magenta'    })
hl__(0, 'TabLine'       , {fg = 'lightblue'   , bg = 'none'       })
hl__(0, 'TabLineFill'   , {                     bg = 'none'       })

hl__(0, 'StatusLine'    , {fg = 'lightblue'   , bg = 'none'       })
hl__(0, 'EndOfBuffer'   , {fg = 'cyan'                            })

hl__(0, 'Pmenu'         , {fg = 'lightgreen'  , bg = 'darkblue'   })
hl__(0, 'PmenuSel'      , {fg = 'cyan'        , bg = 'magenta'    , bold = bl.t })

hl__(0, 'ErrorMsg'      , {fg = 'magenta'     , bg = 'none'       })
hl__(0, 'WarningMsg'    , {fg = 'magenta'     , bg = 'none'       })

hl__(0, 'NonText'       , {fg = '#005faf'     , bg = 'none'       })
hl__(0, 'SpecialKey'    , {fg = '#005faf'     , bg = 'none'       })

hl__(0, 'SpaceMb'       , {fg = '#005faf'     , bg = 'white'      })
vim.cmd([[syntax match SpaceMb /　/]]) -- todo dev

-- vimdiff
hl__(0, 'DiffAdd'       , {fg = '#00ff00'     , bg = '#005f00'    })
hl__(0, 'DiffDelete'    , {fg = '#5f0000'     , bg = '#5f0000'    })
hl__(0, 'DiffChange'    , {fg = '#00ff00'     , bg = '#00005f'    })
hl__(0, 'DiffText'      , {fg = '#00ff00'     , bg = '#0000ff'    })

-- wildmenu
hl__(0, 'wildMenu'      , {fg = 'cyan'                            })

-- hi dflt
hl__(0, 'Comment'       , {fg = '#00ffff'     , bg = 'None'       })

-- win ( buf ) splt
hl__(0, 'StatusLineNC'  , {link = 'Comment'})
hl__(0, 'VertSplit'     , {link = 'Comment'})

