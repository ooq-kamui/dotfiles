function date_utc_fr_jst


  if test -z "$argv"

    command date                    --utc "+%Y-%m-%d %H:%M:%S %Z"

  else
    command date --date "$argv JST" --utc "+%Y-%m-%d %H:%M:%S %Z"
  end
end

