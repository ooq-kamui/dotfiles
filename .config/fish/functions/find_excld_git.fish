function find_excld_git

  find $argv -name .git -type d -prune -o -print
end

