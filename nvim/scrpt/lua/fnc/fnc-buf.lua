
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

-- buf

function v.Buf.num()

  return vf.bufnr('%')
end

function v.Buf.file_dir()

  local dir = vf.expand('%:p:h')
  return dir
end

-- buf opn

function v.Buf.opn(filename)

  v.Cmd.cmd('tab drop ' .. filename)
end

function v.Buf.opn_tab_prv()

  v.Cmd.cmd('tab drop #')
end

function v.Buf.opn_tmp_file()

  local path = v.File.tmp__cre()
  v.Log.val( path )
  v.Buf.opn(path)
end

function v.Buf.opn_init_vim()

  -- v.Buf.opn(g.nvim_lua_fnc_basic_file_path)
  v.Buf.opn(g.nvim_lua_key_map_file_path)
end

function v.Buf.opn_by_git_st_file_pth(git_st_file_pth)

  local git_root_dir = v.Dir.git_root()
  local file_path = git_root_dir .. git_st_file_pth
  -- v.Log.val(file_path)
  v.Buf.opn(file_path)
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

  local sys_cmd      = 'git rev-parse --show-cdup'
  local git_root_dir = v.Sys.cmd(sys_cmd)
  git_root_dir = v.Str.trim(git_root_dir)
  -- v.Log.val(git_root_dir)

  local srch_idx = v.Str.srch_idx(git_root_dir, 'fatal:')
  -- v.Log.val(srch_idx)
  if srch_idx == 1 then
    git_root_dir = g.dotfiles_dir .. '/'
  end
  -- v.Log.val(git_root_dir)

  local file_path
  file_path = git_root_dir .. g.memo_path
  -- v.Log.val(file_path)

  v.Buf.opn(file_path)
end

-- tag jmp

-- tag jmp by str ( refactoring path )

function v.Buf.opn_by_path(rg_rslt_line)

  local rg_rslt_line = vf.trim(rg_rslt_line)

  if v.Str.is__emp(rg_rslt_line) then
    v.Log.val( 'empty' )
    return
  end

  local rg_rslt_line = vf.matchstr(rg_rslt_line, '\\S\\+')
  -- v.Log.val( rg_rslt_line )

  local rg_rslt_line_ar = v.Rg.rslt_line_parse(rg_rslt_line)
  -- v.Log.val( rg_rslt_line_ar )

  local filename = rg_rslt_line_ar[1]
  local line_num = vf.get(rg_rslt_line_ar, 1, 1)
  -- v.Log.val( line_num )
  -- return

  -- dev anchor
  if not vf.filereadable(filename) then
    v.Log.val( 'file does not exist' )
    return
  end

  v.Cmd.cmd('tab drop ' .. filename)
  v.Cursor.__mv_by_line_num(line_num)
end

function v.Buf.opn_by_cursor_line_pth()

  local base_buf_num = v.Buf.num()

  local str = v.Cursor.line_str()
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

    line_str = v.Line.str_by_line_num(line_num)

    v.Buf.opn_by_path(line_str)
    v.Cmd.cmd('sbuffer ' .. base_buf_num)
  end
end

-- buf

function v.Buf.__quit()

  local cmd = 'bd'
  v.Cmd.cmd(cmd)
end

function v.Buf.__quit_swtch()

  local win_num = vf.winnr('$')

  if win_num > 1 then
    v.Win.splt__quit()
  else
    v.Buf.__quit()
  end
end

-- file ( buf file )

function v.Buf.save()

  v.Cmd.cmd('w')
end

function v.Buf.undo__clr()

  local undo_lvl_tmp = vim.bo.undolevels

  vim.opt_local.undolevels = -1
  v.Cmd.cmd([[exe "normal! a \<bs>\<esc>"]])

  vim.bo.undolevels = undo_lvl_tmp
end

function v.Buf.file__dpl()

  local sys_cmd = 'dpl ' .. v.Buf.file_path()
  v.Sys.cmd(sys_cmd)
end

function v.Buf.file__mv(file_name_aft)

  local file_path_bfr = v.Buf.file_path()

  local sys_cmd = 'str_mv_f ' .. file_path_bfr .. ' ' .. file_name_aft
  local file_path_aft = v.Sys.cmd(sys_cmd)

  local sys_cmd = 'mv ' .. file_path_bfr .. ' ' .. file_path_aft
  v.Sys.cmd(sys_cmd)

  local cmd = 'file ' .. file_path_aft -- save file_path ch
  v.Cmd.cmd(cmd)
end

function v.Buf.file_path()

  local path = vf.expand('%:p')
  return path
end

function v.File_txt(file_path)

  if not vf.filereadable(file_path) then
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

function v.Buf.re__sjis()

  v.Cmd.cmd('e ++enc=sjis')
end

-- encode

function v.Buf.file_encode()

  v.Cmd.cmd('set enc?')
end

function v.Buf.file_bom()

  v.Cmd.cmd('set bomb?')
end

-- file cnd

function v.Buf.is_file_type__(type)

  if vim.bo.filetype == type then
    return bl.t
  else
    return bl.f
  end
end

function v.Buf.is_file_type__in(type_lst)

  local ret = v.Tbl.is_in(vim.bo.filetype, type_lst)
  return ret
end

-- dev anchor
function v.Buf.__fltr(sys_fltr_cmd)

  local sys_cmd = '%! ' .. sys_fltr_cmd
  local rslt = v.Cmd.cmd(sys_cmd)
end

function v.Buf.__fltr_jq()

  local sys_fltr_cmd = 'jq'
  local rslt = v.Buf.__fltr(sys_fltr_cmd)
end

-- file

v.File = {}

-- file tmp

function v.File.tmp__cre() -- alias

  local tmp_path = vf.system('mktemp ')
  return tmp_path
end


-- win

-- win splt

v.Win = {}

function v.Win.__splt_h()

  local cmd = 'split'
  v.Cmd.cmd(cmd)
end

function v.Win.__splt_v()

  local cmd = 'vsplit'
  v.Cmd.cmd(cmd)

  v.Win.splt_cursor__mv_nxt()
end

function v.Win.splt_cursor__mv_nxt()

  v.Cmd.cmd('exe "normal! \\<c-w>w>"')
end

function v.Win.splt__quit()

  v.Cmd.cmd('exe "normal! \\<c-w>c>"')
end

