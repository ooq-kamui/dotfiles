function col

  set awk_arg

  for col_num in $argv

    set awk_arg $awk_arg '$'$col_num
  end

  set awk_arg ( string join , $awk_arg )

  #echo $awk_arg
  cat - | awk_arg $awk_arg
end

