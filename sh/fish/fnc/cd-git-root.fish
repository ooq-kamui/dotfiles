function cd-git-root

  set pth_rel ( git-root-pth-rel )

  if test -n $pth_rel
    cd $pth_rel
  end

  pth
end

