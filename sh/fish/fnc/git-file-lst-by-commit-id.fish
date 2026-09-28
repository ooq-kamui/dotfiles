function git-file-lst-by-commit-id

  set commit_id_lst $argv[1]

  git show --pretty=format: --name-only $commit_id_lst | sort -u

  # git show --name-only $argv[1]
  # git diff --name-only $argv[1]
end

