function ld_by_fd

  fd --type d '' $argv[1]

#  set dir ( emp_2_wildcard $argv )
#
#  set dir ( dir_trim $dir )
#  #echo $dir
#
#  set path (                     \
#    find $dir                    \
#      -name .git -type d -prune  \
#      -o                         \
#      \( -type d \)              \
#      -print                    |\
#    sort -u
#  )
#
#  l1 $path
#  #find $argv -type d
end

