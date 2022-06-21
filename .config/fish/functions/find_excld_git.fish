function find_excld_git

  #echo $argv

  find $argv -name .git -type d -prune -o -print | sort -u
end

