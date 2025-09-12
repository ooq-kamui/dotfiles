function file_dpl

  set file_path_bfr $argv[1]

  cp $file_path_bfr ( file_dpl_path $file_path_bfr )
end

