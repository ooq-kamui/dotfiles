function pth_file

  cat - |\
  awk -F/ '{print $NF}' \

  #sed -e 's| ??? |\1|'

end

