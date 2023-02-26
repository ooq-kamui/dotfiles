function str_ext_ch
  
  string replace -r '\.[^.]+$' .$argv[2] $argv[1]
end

