function cmdline__fzf_git_status

  set tmp_file_path ( mktemp )

  # git ls >> $tmp_file_path
  # git wl >> $tmp_file_path
  git sl >> $tmp_file_path

  commandline -i ( cat $tmp_file_path | fzf )
end

