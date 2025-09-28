
-- print('init.lua')

vf = vim.fn
v = {}
g = {}
bool = {
  t = true,
  f = false,
}
bl = bool -- alias

require('fnc/fnc-prmtv')
require('fnc/fnc-basic')
require('fnc/fnc-plg-fzf') -- todo refactoring
require('plg-mng' )

require('opt'     )
require('cmd-usr' )
require('hl'      )
require('key-map' )

-- init

v.Env.__init()
v.Srch.__init()

-- ynk init
v.Rgstr.ynk__clp()

