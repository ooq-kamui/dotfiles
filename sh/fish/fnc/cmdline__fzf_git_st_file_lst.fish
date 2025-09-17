function cmdline__fzf_git_st_file_lst

  set tmp_file_path ( mktemp )

  # git ls >> $tmp_file_path  # file lst all
  git sl >> $tmp_file_path
  git wl >> $tmp_file_path

  set git_root_dir_rel ( git_root_pth_rel )
  set file_path        ( cat $tmp_file_path | sort -u | fzf )

  commandline -i "$git_root_dir_rel$file_path"
end

