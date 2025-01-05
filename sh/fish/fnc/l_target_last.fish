function l_target_last # ls list, $argv[1] view last

  set last $argv[1]

  set list ( l )
  #echo $list

  for val in $list

    if test "$val" = "$last"

      set match $last

    else
      echo "$val"
    end
  end

  if test -n "$match"
    echo "$match"
  end
end

