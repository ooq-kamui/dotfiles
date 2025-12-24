
vf = vim.fn

v = {}
v.Cnst = {}

g = {}

bool = {
  t = true,
  f = false,
}
bl = bool -- alias


require('fnc/prmtv')
require('fnc/basic')
require('fnc/plg-fzf')
require('plg-mng' )

require('opt'     )
require('cmd-usr' )
require('hl'      )
require('key-map' )

-- init

v.Env.__init()
v.Srch.__init()

-- ynk init
if not v.Env.is__('linux') then -- dev tidy
  v.Rgstr.ynk__clp()
end

