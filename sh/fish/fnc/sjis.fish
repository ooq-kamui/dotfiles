function sjis

  set i_file_path $argv[1]

  set o_file_path ( str_add_bfr_ext $i_file_path -sjis )

  echo $o_file_path

  cat $i_file_path | uconv -c -f UTF-8 -t SHIFT_JIS > $o_file_path
end

