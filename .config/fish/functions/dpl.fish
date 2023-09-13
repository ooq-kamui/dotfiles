function dpl

  set ext (str_ext $argv[1])

  set file_name (str_ext_rpl $argv[1] (ts)).$ext

  cp $argv[1] $file_name
end

