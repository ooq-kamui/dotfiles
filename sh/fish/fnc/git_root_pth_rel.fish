function git_root_pth_rel

  set pth_rel ( git rev-parse --show-cdup )
  echo $pth_rel
end

