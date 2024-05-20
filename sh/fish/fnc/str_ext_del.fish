function str_ext_del
  
  string replace -r '[^.]+$' '' $argv[1]
end

