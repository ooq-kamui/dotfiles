function git_co_file_lst

  set times 3
  if test -n "$argv[1]"
    set times     $argv[1]
  end

  set commit_id_lst ( git log -n $times --pretty=format:%H )

  git show --pretty=format: --name-only $commit_id_lst | sort -u

  # git show --name-only $argv[1]
  # git diff --name-only $argv[1]
end

