function cal-y

  if test -n "$argv[1]"

    set y_dlt $argv[1]

  else
    set y_dlt "+0"
  end

  set uname ( uname -s )
  if test $uname = 'Darwin'

    set y ( date -v {$y_dlt}y     +"%Y" )

  else
    set y ( date -d "$y_dlt year" +"%Y" )
  end

  #echo $y
  cal $y
end

