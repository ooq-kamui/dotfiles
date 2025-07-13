function cd_git_root

  set dir ( git rev-parse --show-cdup )

  if test -n $dir
    cd $dir
  end

  pth
end

