function pth_dir

  cat - |\
  sed 's|\(.*\)/.*|\1|'
end

