function git-co-summary

  set author $argv[1]
  set since "2024-01-01"
  set until "2026-01-31"

  git log --author=$author --since=$since --until=$until --numstat --pretty=tformat: |\
  awk '{add += $1; subs += $2; loc += $1 - $2} END {printf "追加行数: %s, 削除行数: %s, 純増行数: %s\n", add, subs, loc}'
end

