
v.Env = {}

v.Env.c = {}
v.Env.c.name  = nil

g.nvim_lua_env_dir = v.Dir.c.nvim_lua_dir  .. '/env'

function v.Env.name()

  if not v.Str.is__emp(v.Env.c.name) then
    return v.Env.c.name
  end

  local env_name

  if     v.Env.is__('mac')       then -- mac
    env_name = 'mac'

  elseif v.Env.is__('linux')     then -- linux
    env_name = 'linux'

  elseif v.Env.is__('win64')     then -- pwsh
    env_name = 'pwsh'

  elseif v.Env.is__('win32unix') then -- gitbash
    env_name = 'gitbash'
  end

  return env_name
end

function v.Env.name__()

  v.Env.c.name = v.Env.name()
end

function v.Env.__init()

  v.Env.name__()
  v.Log.val("env : " .. v.Env.c.name)

  v.Env.shell__()

  if v.Env.is__('win64') then
    require('env/env-pwsh')
  end
end

function v.Env.shell__()

  if     v.Env.is__('mac')       then
    vim.opt.shell = 'fish'

  elseif v.Env.is__('linux')     then
    vim.opt.shell = 'fish'

  elseif v.Env.is__('win64')     then
    vim.opt.shell = 'pwsh'

  elseif v.Env.is__('win32unix') then
    vim.opt.shell = 'bash'
  end
end

-- env cnd

function v.Env.is__(env) -- alias

  local ret = ( vf.has(env) == 1 ) -- refactoring, rpl can ?
  return ret
end

function v.Env.is__in(env_tbl)

  for idx, env in pairs(env_tbl) do
    if v.Env.is__(env) then
      return bl.t
    end
  end
  return bl.f
end

function v.Env.is__nvim()

  return v.Env.is__('nvim')

  -- local ret = ( vf.has('nvim') == 1 )
  -- v.Log.val('nvim : ', ret)
  -- return ret
end

