function cmdline__fzf

  # dev

  set tmp_file_path ( mktemp )

  cat - > $tmp_file_path

  commandline -i ( cat $tmp_file_path | fzf )

  # echo 'cmdline__fzf, dev doing...'
end

