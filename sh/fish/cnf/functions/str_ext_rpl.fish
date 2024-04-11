function str_ext_rpl
  
  string replace -r '[^.]+$' $argv[2] $argv[1]
end

