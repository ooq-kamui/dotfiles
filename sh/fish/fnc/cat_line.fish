function cat_line # cat line by sed

  if test -n "$argv[1]"
    set line_num_fr $argv[1]
  else
    set line_num_fr 1
  end

  if test -n "$argv[2]"
    set line_num_to $argv[2]
  else
    set line_num_to $line_num_fr
  end

  #cat - |\
  sed -n "$line_num_fr,$line_num_to p"
end

