function le # ls list target val mv last

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

