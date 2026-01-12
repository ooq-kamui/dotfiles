
-- vim.api.nvim_set_hl(target, hl_grp_name, params)
--   target
--     0: all    ( default )
--     1: window
--     2: buffer
--   hl_group_name
--   params
--
-- ex
--   vim.api.nvim_set_hl(0, 'LineNr', { fg = '#777777', bg = 'none', bold = bl.f })

local hl__ = vim.api.nvim_set_hl
local match_id

vim.opt.termguicolors = true -- true: ctermfg > fg
-- vim.opt.winblend = 0
-- vim.opt.pumblend = 0

hl__(0, 'Normal'  , {bg = 'none'})
hl__(0, 'NormalNC', {bg = 'none'})
hl__(0, 'NormalSB', {bg = 'none'})

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
-- hl__(0, 'Cursor'        , {fg      = 'none'   , bg = 'gray'       , reverse = bl.t})

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

hl__(0, 'SpaceMb'       , {fg = 'magenta'     , bg = 'lightyellow'})
match_id = vf.matchadd('SpaceMb', '\\%u3000', 10) -- /　/
-- vf.matchdelete(match_id)

hl__(0, 'Title'         , {fg = 'cyan'        , bg = 'none'       })

-- markdown

-- vim.g.markdown_recommended_style = 0

vim.api.nvim_create_autocmd({'FileType'}, { pattern  = {'markdown'},
  callback = function ()
    hl__(0, 'MdCr'      , {fg = 'none'        , bg = 'darkblue'   })
    match_id = vf.matchadd('MdCr', '  $', 10)
  end,
})

-- vimdiff
hl__(0, 'DiffAdd'       , {fg = '#00ff00'     , bg = '#005f00'    })
hl__(0, 'DiffDelete'    , {fg = '#5f0000'     , bg = '#5f0000'    })
hl__(0, 'DiffChange'    , {fg = '#00ff00'     , bg = '#00005f'    })
hl__(0, 'DiffText'      , {fg = '#00ff00'     , bg = '#0000ff'    })

-- wildmenu
hl__(0, 'wildMenu'      , {fg = 'cyan'                            })

-- hi dflt
hl__(0, 'Comment'       , {fg = '#00ffff'     , bg = 'none'       })

-- win ( buf ) splt
hl__(0, 'StatusLineNC'  , {link = 'Comment'})
hl__(0, 'VertSplit'     , {link = 'Comment'})


-- lua

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    -- hl__(0, "@variable.builtin", { fg = "#7aa2f7" })
    -- hl__(0, "@function.call"   , { fg = "yellow"  })
  end,
})


v.Color = {}

function v.Color.hl_grp() --

  -- v.Log.val( vf.synIDattr(vf.synID(vf.line('.'), vf.col('.'), 1), 'name') )
  local cmd = "echo synIDattr(synID(line('.'), col('.'), 1), 'name')"
  v.Cmd.cmd(cmd)
  -- v.Log.val(  )
end
-- and
-- :hi [grp name]

function v.Color.name_lst()

  local cmd = "so $VIMRUNTIME/syntax/colortest.vim"
  v.Cmd.cmd(cmd)
end


