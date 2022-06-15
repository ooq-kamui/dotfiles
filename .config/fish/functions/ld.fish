function ld

  set dir ( emp_2_wildcard $argv )

  set dir ( dir_trim $dir )

  set path ( find_excld_git $dir )

  l1 $path
  #ls -1dFAG $path
end

