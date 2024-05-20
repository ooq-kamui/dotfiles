function str_rename

  set file_path_bfr $argv[1]
  set file_name_aft $argv[2]

  set file_path_aft (dirname $file_path_bfr)/$file_name_aft
  echo $file_path_aft
end

