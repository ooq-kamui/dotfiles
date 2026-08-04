function excl_col_cnv

  set col_i_str $argv[1]

  set exe_dir  ~/wrk/pri/dotfiles/sh/fish/lua
  set exe_file excl-col-cnv.lua
  set exe_path $exe_dir/$exe_file

  set col_o_str ( lua $exe_path $col_i_str )
  echo $col_o_str
end

