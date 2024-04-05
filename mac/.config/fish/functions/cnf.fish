function cnf

  set dir      ~/doc/tech/cnf

  set cnf_file $dir/mac/.config/fish/config.fish

  set cmdsub "$argv[1]"

  if      test $cmdsub = 'cd'

    cd $dir

  else if test $cmdsub = 'vi'

    vi $cnf_file -c ":cd $dir"

  else if test $cmdsub = 'src'

    src ~/.config/fish/config.fish
  end
end

