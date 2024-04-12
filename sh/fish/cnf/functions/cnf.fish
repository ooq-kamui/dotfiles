function cnf

  set git_cnf_dir  ~/wrk/cnf

  set fish_cnf_dir ~/wrk/cnf/sh/fish/cnf

  set cnf_file $fish_cnf_dir/config.fish

  set cmdsub "$argv[1]"

  if      test $cmdsub = 'cd'

    cd $fish_cnf_dir

  else if test $cmdsub = 'vi'

    vi $cnf_file -c ":cd $fish_cnf_dir"

  else if test $cmdsub = 'src'

    src ~/.config/fish/config.fish
  end
end

