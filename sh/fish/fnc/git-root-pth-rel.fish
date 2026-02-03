function git-root-pth-rel

  set pth_rel ( git rev-parse --show-cdup )
  echo $pth_rel
end

