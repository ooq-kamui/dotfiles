function ld

  if test -n "$argv"
    set dir $argv
  else
    set dir * .*
  end

  for _dir in $dir
    set _dir ( string replace -r '/$' '' $_dir )
    set tmp $tmp $_dir
  end
  set dir $tmp

  #echo '-------'

  set path ( find_excld_git $dir )

  ls -1dFAG $path
end

