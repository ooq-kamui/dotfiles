function stdin_file_name

  cat - |\
  awk -F/ '{print $NF}' \

  # sed -e 's|^.*\([^/.]+\.[^/.]+\)$|\1|'
end

