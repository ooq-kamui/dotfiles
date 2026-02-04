function git-co-summary

  set author $argv[1]

  # set date_fr "2024-01-01"
  # set date_to "2026-01-31"
  set date_fr ( date -d '-3 year' +'%Y-%m-%d' )
  set date_to ( date_ymd )

  git log --author=$author --since=$date_fr --until=$date_to --numstat --pretty=tformat: |\
  awk '{add += $1; subs += $2; loc += $1 - $2} END {printf "    line\n+ %6d\n- %6d\n= %6d\n", add, subs, loc}'
end

