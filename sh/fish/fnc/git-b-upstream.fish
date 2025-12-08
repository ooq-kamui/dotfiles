function git-b-upstream

  if test -z "$argv[1]"
    return
  else
    set branch $argv[1]
  end

  git branch --set-upstream-to=origin/$branch $branch
end

