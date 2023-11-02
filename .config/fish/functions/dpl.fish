function dpl

  set file_path_bfr $argv[1]

  cp $file_path_bfr (dpl_file_path $file_path_bfr)
end

