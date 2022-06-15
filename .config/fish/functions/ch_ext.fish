function chext
  string replace -r '\.[^.]+$' .$argv[2] $argv[1]
end

