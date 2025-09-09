function cmdline__fzf_git_status

  set tmp_file_path ( mktemp )

  # git ls >> $tmp_file_path  # file lst all
  git sl >> $tmp_file_path
  git wl >> $tmp_file_path

  commandline -i ( jrpr )( cat $tmp_file_path | sort -u | fzf )
  # commandline -i ( jrpr )( cat $tmp_file_path | fzf )
  # commandline -i ( cat $tmp_file_path | fzf )
end

