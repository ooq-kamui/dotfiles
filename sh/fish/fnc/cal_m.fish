function cal_m

  if test -n "$argv[1]"
    set m_dlt $argv[1]
  else
    set m_dlt "+0"
  end

  set m_y ( date -v {$m_dlt}m +"%m %Y" | string split " " )

  cal $m_y
end

