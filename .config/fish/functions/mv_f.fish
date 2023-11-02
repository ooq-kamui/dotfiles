function mv_f

  set file_path_bfr $argv[1]
  set file_name_aft $argv[2]

  set file_path_aft (str_mv_f $file_path_bfr $file_name_aft)

  mv $file_path_bfr $file_path_aft
end

