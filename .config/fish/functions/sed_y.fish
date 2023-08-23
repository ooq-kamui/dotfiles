function sed_y

  set srch $argv[1]
  set rpl  $argv[2]

  cat - |\
  sed -e "y|$srch|$rpl|"
end

