function lf

  set dir ( emp_2_wildcard $argv )

  set dir ( dir_trim $dir )

  set path (                     \
    find $dir                    \
      -name .git -type d -prune  \
      -o                         \
      \( -type f -o -type l \)   \
      -print                    |\
    sort -u
  )

  l1 $path
  #ls -1dFAG $path
end

