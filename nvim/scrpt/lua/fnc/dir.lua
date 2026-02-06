
v.Dir = {}

v.Dir.c = {}

v.Dir.c.home_dir         = vf.expand('$HOME')
v.Dir.c.dotfiles_dir     = v.Dir.c.home_dir      .. '/wrk/prj-pri/dotfiles'
v.Dir.c.nvim_init_dir    = v.Dir.c.dotfiles_dir  .. '/nvim/scrpt'

v.Dir.c.nvim_lua_dir     = v.Dir.c.nvim_init_dir .. '/lua'
v.Dir.c.nvim_lua_fnc_dir = v.Dir.c.nvim_lua_dir  .. '/fnc'
v.Dir.c.nvim_lua_etc_dir = v.Dir.c.nvim_lua_dir  .. ''


v.Dir.c.nvim_lua_init_file_path      = v.Dir.c.nvim_lua_dir     .. '/init.lua'
v.Dir.c.nvim_lua_opt_file_path       = v.Dir.c.nvim_lua_etc_dir .. '/opt.lua'
v.Dir.c.nvim_lua_cmd_file_path       = v.Dir.c.nvim_lua_etc_dir .. '/cmd-usr.lua'
v.Dir.c.nvim_lua_hl_file_path        = v.Dir.c.nvim_lua_etc_dir .. '/hl.lua'
v.Dir.c.nvim_lua_key_map_file_path   = v.Dir.c.nvim_lua_etc_dir .. '/key-map.lua'

v.Dir.c.nvim_lua_fnc_basic_file_path = v.Dir.c.nvim_lua_fnc_dir .. '/fnc-basic.lua'
v.Dir.c.nvim_lua_plg_fzf_file_path   = v.Dir.c.nvim_lua_fnc_dir .. '/fnc-plg-fzf.lua'

v.Dir.c.cheat_sheet_file_path = v.Dir.c.nvim_lua_dir .. '/txt/cheat-sheet.txt'

function v.Dir.pth()

  v.Cmd.cmd('pwd')
end

function v.Dir.crnt() -- alias

  v.Dir.pth()
end

-- dir __ ch

function v.Dir.__(dir)

  v.Cmd.cmd('cd ' .. dir)
  v.Dir.pth()
end

-- dir __ ch slf

function v.Dir.__buf_file_dir()

  local dir = v.Buf.file_dir()
  v.Dir.__(dir)
end

-- dir __ ch parent

function v.Dir.__parent(lvl)

  local cnt = 1
  while cnt <= lvl do

    v.Cmd.cmd('cd ..')

    cnt = cnt + 1
  end

  v.Dir.pth()
end

v.Dir.nvim_launch_dir = vf.system('pwd')
-- Dir.nvim_launch_dir = v.Sys.cmd('pwd')-- rpl not

function v.Dir.__nvim_launch()

  local dir = v.Dir.nvim_launch_dir
  v.Dir.__(dir)
end

function v.Dir.git_root()

  local sys_cmd = 'git rev-parse --show-cdup'
  local git_root_dir = v.Sys.cmd(sys_cmd)
  git_root_dir = v.Str.trim(git_root_dir)
  return git_root_dir
end

function v.Dir.__git_root()

  local dir = v.Dir.git_root()
  v.Dir.__(dir)
end

