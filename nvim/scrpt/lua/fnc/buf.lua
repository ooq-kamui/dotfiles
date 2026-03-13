
-- buf

v.Buf = {}

function v.Buf.num()

  return vf.bufnr('%')
end

function v.Buf.file_dir()

  local dir = vf.expand('%:p:h')
  return dir
end

function v.Buf.file_type()

  local file_type = vim.bo.filetype
  return file_type
end

-- buf opn

function v.Buf.opn(file_path, line_num)

  local cmd = 'tab drop ' .. file_path

  if line_num then
    cmd = cmd .. ' +' .. line_num
  end

  v.Cmd.cmd(cmd)

  -- local file_encode = v.Buf.file_encode()
  -- v.Log.log(file_encode)
end

function v.Buf.Opn_splt(file_path, line_num, width_byte_idx)

  local win_id = vim.fn.bufwinid(file_path)

  if win_id == -1 then -- not is_file__opn(file_path)
    v.Buf.opn(file_path)
    return
  end

  vim.api.nvim_set_current_win(win_id)

  v.Win.__splt_v(width_byte_idx)

  if not line_num then return end

  v.Cursor.__mv_by_line_num(line_num)
end

-- コマンド登録 (引数 1〜2 個を受け付ける)
vim.api.nvim_create_user_command('SmartOpen', function(opts)
  smart_open(opts.fargs[1], opts.fargs[2])
end, { nargs = '+', complete = 'file' })


function v.Buf.opn_tab_prv()

  v.Cmd.cmd('tab drop #')
end

function v.Buf.opn_tmp_file()

  local path = v.File.tmp__cre()
  -- v.Log.val(path)
  v.Buf.opn(path)
end

function v.Buf.opn_fish_cnf()

  local file_path = v.File.path.fish_cnf_path
  v.Buf.opn(file_path)
end

function v.Buf.opn_nvim_init()

  v.Buf.opn(v.Dir.c.nvim_lua_key_map_file_path)
end

function v.Buf.opn_cheat_sheet()

  local file_path = v.Dir.c.cheat_sheet_file_path
  v.Buf.opn(file_path)
end

function v.Buf.opn_nvim_init_l() -- use not

  v.Buf.opn(v.Dir.c.nvim_lua_opt_file_path     )
  v.Buf.opn(v.Dir.c.nvim_lua_cmd_file_path     )

  v.Buf.opn(v.Dir.c.nvim_lua_init_file_path    )

  v.Buf.opn(v.Dir.c.nvim_lua_hl_file_path      )

  v.Buf.opn(v.Dir.c.nvim_lua_plg_fzf_file_path )
end

function v.Buf.opn_man(cmd)

  v.Cmd.cmd('tab new')
  v.Cmd.cmd('Man ' .. cmd)
  v.Cmd.cmd('only')
end

function v.Buf.opn_memo()

  local sys_cmd      = 'git rev-parse --show-cdup'
  local git_root_dir = v.Sys.cmd(sys_cmd)
  git_root_dir = v.Str.trim(git_root_dir)
  -- v.Log.val(git_root_dir)

  local srch_byte_idx = v.Str.srch_byte_idx_by_ptn_vim(git_root_dir, 'fatal:')
  -- v.Log.val(srch_byte_idx)
  if srch_byte_idx == 1 then
    git_root_dir = v.Dir.c.dotfiles_dir .. '/'
  end
  -- v.Log.val(git_root_dir)

  local file_path = git_root_dir .. v.File.path.memo_path
  -- v.Log.val(file_path)

  v.Buf.opn(file_path)
end

function v.Buf.opn_by_git_st_file_pth(git_st_file_pth)

  local git_root_dir = v.Dir.git_root()
  local file_path = git_root_dir .. git_st_file_pth
  -- v.Log.val(file_path)
  v.Buf.opn(file_path)
end

-- tag jmp

-- tag jmp by str ( refactoring path )

function v.Buf.opn_by_path(rg_rslt_line)

  local rg_rslt_line = v.Str.trim(rg_rslt_line)

  if v.Str.is__emp(rg_rslt_line) then
    return
  end

  local rg_rslt_line    = v.Str.sub_by_ptn(rg_rslt_line, v.Ptn.vim.space_not_str)
  local rg_rslt_line_ar = v.Rg.rslt_line_parse_ar(rg_rslt_line)

  local file_name = rg_rslt_line_ar[1]
  local line_num  = v.Tbl.get_by_key(rg_rslt_line_ar, 1, 1)

  if not v.File.is__readable(file_name) then
    v.Log.val( 'file does not exist' )
    return
  end

  v.Buf.opn(filename, line_num)
end

function v.Buf.opn_by_cursor_line_pth()

  local base_buf_num = v.Buf.num()

  local str = v.Cursor.line_str()
  v.Buf.opn_by_path(str)

  v.Cmd.cmd('sbuffer ' .. base_buf_num)
  -- v.Nml.exe('j')
  v.Cursor__mv_d()
end

function v.Buf.opn_by_slctd_line() -- range

  local base_buf_num = v.Buf.num()

  local line_str

  for idx, line_num in pairs(v.Slctd_line_num_seq()) do

    line_str = v.Line.str_by_line_num(line_num)

    v.Buf.opn_by_path(line_str)
    v.Cmd.cmd('sbuffer ' .. base_buf_num)
  end
end

-- buf quit

function v.Buf.__quit()

  v.Buf.quit.rcnt__save()

  local cmd = 'bd'
  v.Cmd.cmd(cmd)
end

v.Buf.quit = {}

function v.Buf.quit.rcnt_opn_re()

  local quit_rcnt_file_path = v.Buf.quit.rcnt_file_path()
  v.Buf.opn(quit_rcnt_file_path)
end

function v.Buf.quit.rcnt_file_path()

  local save_file_path = v.Buf.quit.save_file_path()
  local quit_rcnt_file_path = v.File.load(save_file_path)
  return quit_rcnt_file_path
end

function v.Buf.quit.rcnt__save()

  local file_path = v.Buf.file_path()

  local save_file_path = v.Buf.quit.save_file_path()
  v.File.save(save_file_path, file_path)
end

function v.Buf.quit.save_file_path()

  local data_dir = vf.stdpath('data')

  local save_file_path = data_dir .. '/buf-quit.txt'
  -- v.Log.log(save_file_path)
  return save_file_path
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
  v.Nml.exe([[a <bs><esc>]])
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

-- load re

function v.Buf.opn_re()

  v.Cmd.cmd('e ')
end

-- load re  -  encode sjis

function v.Buf.opn_re_sjis()

  v.Cmd.cmd('e ++enc=sjis')
end

-- encode

function v.Buf.file_encode()

  local file_encode = vim.opt.fileencoding:get()
  return file_encode

  -- v.Cmd.cmd('set enc?')
end

function v.Buf.file_bom()

  v.Cmd.cmd('set bomb?')
end

-- file cnd

function v.Buf.is_file_type__(type)

  if v.Buf.file_type() == type then
    return bl.t
  else
    return bl.f
  end
end

function v.Buf.is_file_type__in(type_lst)

  local ret = v.Tbl.is__in(v.Buf.file_type(), type_lst)
  return ret
end

function v.Buf.__fltr(sys_fltr_cmd)

  local sys_cmd = '%! ' .. sys_fltr_cmd
  local rslt = v.Cmd.cmd(sys_cmd)
end

function v.Buf.__fltr_jq()

  local sys_fltr_cmd = 'jq'
  local rslt = v.Buf.__fltr(sys_fltr_cmd)
end

-- win

-- win splt

v.Win = {}

function v.Win.__splt_h() -- alias

  local cmd = 'split'
  v.Cmd.cmd(cmd)
end

function v.Win.__splt_v(width_byte_idx)

  local cmd = 'vsplit'
  v.Cmd.cmd(cmd)

  if width_byte_idx then
    v.Cmd.cmd('vertical resize ' .. width_byte_idx)
  end

  v.Win.splt_cursor__mv_nxt()
end

function v.Win.splt_cursor__mv_nxt() -- alias

  v.Nml.exe([[<c-w>w>]])
end

function v.Win.splt__quit() -- alias

  v.Nml.exe([[<c-w>c>]])
end

function v.Win.view_save() -- alias

  local view = vf.winsaveview()
  return view
end

function v.Win.view_restore(view) -- alias

  vf.winrestview(view)
end

