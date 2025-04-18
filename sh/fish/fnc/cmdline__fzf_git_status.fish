function cmdline__fzf_git_status

  set tmp_file_path ( mktemp )

  git ls >  $tmp_file_path
  git lw >> $tmp_file_path

  commandline -i ( cat $tmp_file_path | fzf )
end

