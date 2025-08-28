function str_add_bfr_ext

  set file_path $argv[1]
  set str       $argv[2]

  echo ( str_ext_dot_del $file_path )$str.( str_ext $file_path )
end

