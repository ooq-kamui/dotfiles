function cd_git_root

  set pth_rel ( git_root_pth_rel )

  if test -n $pth_rel
    cd $pth_rel
  end

  pth
end

