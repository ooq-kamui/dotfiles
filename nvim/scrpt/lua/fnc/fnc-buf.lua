
-- buf

v.Buf = {}
-- v.Opn = v.Buf -- old

g.nvim_lua_init_file_path      = g.nvim_lua_dir     .. '/init.lua'
g.nvim_lua_opt_file_path       = g.nvim_lua_etc_dir .. '/opt.lua'
g.nvim_lua_cmd_file_path       = g.nvim_lua_etc_dir .. '/cmd-usr.lua'
g.nvim_lua_hl_file_path        = g.nvim_lua_etc_dir .. '/hl.lua'
g.nvim_lua_key_map_file_path   = g.nvim_lua_etc_dir .. '/key-map.lua'

g.nvim_lua_fnc_basic_file_path = g.nvim_lua_fnc_dir .. '/fnc-basic.lua'
g.nvim_lua_plg_fzf_file_path   = g.nvim_lua_fnc_dir .. '/fnc-plg-fzf.lua'

-- buf opn

function v.Buf.num()

  return f.bufnr('%')
end

function v.Buf.file_dir()

  local dir = f.expand('%:p:h')
  return dir
end

-- buf opn

function v.Buf.opn(filename)

  v.Cmd.cmd('tab drop ' .. filename)
end

function v.Buf.opn_view_ltst()

  v.Cmd.cmd('tab drop #')
end

function v.Buf.opn_tmp_file()

  local path = v.File_tmp__cre()
  print( path )
  v.Buf.opn(path)
end

function v.Buf.Opn_init_vim()

  -- lua
  v.Buf.opn(g.nvim_lua_fnc_basic_file_path)
  v.Buf.opn(g.nvim_lua_key_map_file_path)

  -- env
  local init_vim_env_file_path

  if     v.Is_env__('linux')     then -- c9, s9

    init_vim_env_file_path = g.nvim_lua_env_dir .. '/env-c9.vim'
    -- v.Buf.opn(init_vim_env_file_path)

  elseif v.Is_env__('win32unix') then -- gitbash

    init_vim_env_file_path = g.nvim_lua_env_dir .. '/env-gitbash.vim'
    -- v.Buf.opn(init_vim_env_file_path)
  end
end

function v.Buf.opn_init_vim_l()

  v.Buf.opn(g.nvim_lua_opt_file_path     )
  v.Buf.opn(g.nvim_lua_cmd_file_path     )

  v.Buf.opn(g.nvim_lua_init_file_path    )

  v.Buf.opn(g.nvim_lua_hl_file_path      )

  v.Buf.opn(g.nvim_lua_plg_fzf_file_path )
end

function v.Buf.opn_fish_cnf()

  local path = '~/.config/fish/config.fish'
  v.Buf.opn(path)
end

function v.Buf.opn_man(cmd)

  v.Cmd.cmd('tab new')
  v.Cmd.cmd('Man ' .. cmd)
  v.Cmd.cmd('only')
end

g.memo_path = 'doc/memo.md'

function v.Buf.opn_memo()

  v.Buf.opn(g.memo_path)
end

-- tag jmp

-- tag jmp by str ( refactoring path )

-- function v.Tag_jmp_by_str(rg_rslt_line)
function v.Buf.opn_by_path(rg_rslt_line)

  local rg_rslt_line = f.trim(rg_rslt_line)

  if v.Is_str__emp(rg_rslt_line) then
    print( 'empty' )
    return
  end

  local rg_rslt_line = f.matchstr(rg_rslt_line, '\\S\\+')
  -- print( rg_rslt_line )

  local rg_rslt_line_ar = v.Rg_rslt_line_parse(rg_rslt_line)
  -- print( rg_rslt_line_ar )

  local filename = rg_rslt_line_ar[1]
  local line_num = f.get(rg_rslt_line_ar, 1, 1)
  -- print( line_num )
  -- return

  if not f.filereadable(filename) then
    print( 'file does not exist' )
    return
  end

  v.Cmd.cmd('tab drop ' .. filename)
  -- v.Cmd.nml(line_num .. 'G')
  v.Cursor__mv_by_line_num(line_num)
end

-- function v.Tag_jmp_by_cursor_line()
function v.Buf.opn_by_cursor_line()

  local base_buf_num = v.Buf.num()

  local str = v.Cursor_line_str()
  v.Buf.opn_by_path(str)

  v.Cmd.cmd('sbuffer ' .. base_buf_num)
  -- v.Cmd.nml('j')
  v.Cursor__mv_d()
end

-- function v.Tag_jmp_by_slctd_line() -- range
function v.Buf.opn_by_slctd_line() -- range

  local base_buf_num = v.Buf.num()

  local line_str

  for idx, line_num in pairs(v.Slctd_line_num_seq()) do

    line_str = v.Line_str_by_line_num(line_num)

    v.Buf.opn_by_path(line_str)
    v.Cmd.cmd('sbuffer ' .. base_buf_num)
  end
end

-- buf

function v.Buf__quit()

  local cmd = 'bd'
  v.Cmd.cmd(cmd)
end

function v.Buf__quit_swtch()

  local win_num = f.winnr('$')

  if win_num > 1 then
    v.Win_splt__quit()
  else
    v.Buf__quit()
  end
end

function v.Buf__fltr() -- use not

end

-- file ( buf file )

function v.Buf.save()

  v.Cmd.cmd('w')
end

function v.Buf_file__dpl()

  local sys_cmd = 'dpl ' .. v.Buf_file_path()
  v.Sys.cmd(sys_cmd)
end

function v.Buf_file__mv(file_name_aft)

  local file_path_bfr = v.Buf_file_path()

  local sys_cmd = 'str_mv_f ' .. file_path_bfr .. ' ' .. file_name_aft
  local file_path_aft = v.Sys.cmd(sys_cmd)

  local sys_cmd = 'mv ' .. file_path_bfr .. ' ' .. file_path_aft
  v.Sys.cmd(sys_cmd)

  local cmd = 'file ' .. file_path_aft -- save file_path ch
  v.Cmd.cmd(cmd)
end

function v.Buf_file_path()

  local path = f.expand('%:p')
  return path
end

function v.File_txt(file_path)

  if not f.filereadable(file_path) then
    return
  end

  local cmd = 'cat ' .. file_path

  local pth_lst_txt = v.Sys.cmd(cmd)
  return pth_lst_txt
end

function v.File_line_ar(file_path)

  local file_txt = v.File_txt(file_path)
  local file_line_ar = v.Txt._to_ar(file_txt)
  return file_line_ar
end

-- load re

function v.Load_re()

  v.Cmd.cmd('e ')
end

-- load re  -  encode sjis

function v.Load_re__sjis()

  v.Cmd.cmd('e ++enc=sjis')
end

-- encode

function v.Buf_file_encode()

  v.Cmd.cmd('set enc?')
end

function v.Buf_file_bom()

  v.Cmd.cmd('set bomb?')
end

-- file tmp

function v.File_tmp__cre() -- alias

  local tmp_path = f.system('mktemp ')
  return tmp_path
end

-- file cnd

function v.Buf.is_file_type__(type)

  if vim.bo.filetype == type then
    return true
  else
    return false
  end
end

-- win

-- win splt

function v.Win__splt_h()

  local cmd = 'split'
  v.Cmd.cmd(cmd)
end

function v.Win__splt_v()

  local cmd = 'vsplit'
  v.Cmd.cmd(cmd)

  v.Win_splt_cursor__mv_nxt()
end

function v.Win_splt_cursor__mv_nxt()

  vim.cmd('exe "normal! \\<c-w>w>"')
end

function v.Win_splt__quit()

  vim.cmd('exe "normal! \\<c-w>c>"')
end

