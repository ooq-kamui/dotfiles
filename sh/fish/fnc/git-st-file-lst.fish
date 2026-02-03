function git-st-file-lst

  set tmp_file_path ( mktemp )

  # git ls >> $tmp_file_path  # file lst all
  git sl >> $tmp_file_path
  git wl >> $tmp_file_path

  cat $tmp_file_path | sort -u
end

