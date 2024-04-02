function rename

  if test -z "$argv[2]"
    echo 'necessary argv 2'
    return
  end

  set file_path_bfr $argv[1]
  set file_name_aft $argv[2]

  set file_path_aft (str_rename $file_path_bfr $file_name_aft)

  mv $file_path_bfr $file_path_aft
end

