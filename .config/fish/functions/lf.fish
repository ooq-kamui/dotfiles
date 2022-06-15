function lf

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

  set path (                      \
    find $dir                     \
      -name .git -type d -prune   \
      -o                          \
      \( -type f -o -type l \)    \
      -print                      \
  )

  ls -1dFAG $path
end

