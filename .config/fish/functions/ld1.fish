function ld1

  set dir ( emp_2_wildcard $argv )

  set dir ( dir_trim $dir )

  set path (                     \
    find $dir                    \
      -name .git -type d -prune  \
      -o                         \
      \( -type d \)              \
      -maxdepth 0                \
      -print                    |\
    sort -u
  )

  l1 $path
  #find $argv -type d
end

