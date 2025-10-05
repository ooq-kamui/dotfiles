
v.Dir = {}

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

function v.Dir.__git_root()

  local sys_cmd = 'git rev-parse --show-cdup'
  local dir     = v.Sys.cmd(sys_cmd)
  v.Dir.__(dir)
end

