function str_ext_dot_del
  
  string replace -r '\.[^.]+$' '' $argv[1]
end

