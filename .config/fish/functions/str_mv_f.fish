function str_mv_f

  set file_path_bfr $argv[1]
  set file_name_aft $argv[2]

  echo (dirname $file_path_bfr)/$file_name_aft
end

