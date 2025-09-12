function file_dpl_path

  set file_path_bfr $argv[1]

  set ext ( str_ext $file_path_bfr )
  set ts  ( date_ts )

  echo ( str_ext_rpl $file_path_bfr $ts ).$ext
  # echo ( str_ext_del $file_path_bfr )-$ts.$ext
end

