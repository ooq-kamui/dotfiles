function cal_m

  if test -n "$argv[1]"

    set m_dlt $argv[1]

  else
    set m_dlt "+0"
  end

  set uname ( uname -s )
  if test $uname = 'Darwin'

    set m_y ( date -v {$m_dlt}m      +"%m %Y" | string split " " )

  else
    set m_y ( date -d "$m_dlt month" +"%m %Y" | string split " " )
  end

  #echo $m_y
  cal $m_y
end

