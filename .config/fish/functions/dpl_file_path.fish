function dpl_file_path

  set file_path_bfr $argv[1]

  set ext (str_ext $file_path_bfr)
  set ts  (ts)
  echo (str_ext_rpl $file_path_bfr $ts).$ext
end

