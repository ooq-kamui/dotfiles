function cnf

  set cnf_dir ~/wrk/prj-pri/dotfiles

  set cnf_fish_dir $cnf_dir/sh/fish

  set fish_cnf_dir $cnf_fish_dir/cnf
  set fish_fnc_dir $cnf_fish_dir/fnc

  set cnf_dflt_file $fish_cnf_dir/dflt/config.fish

  set cmdsub "$argv[1]"

  if      test $cmdsub = 'cd'

    cd $fish_cnf_dir

  else if test $cmdsub = 'src'

    src ~/.config/fish/config.fish

  else if test $cmdsub = 'vi'

    vi $cnf_dflt_file -c ":cd $fish_cnf_dir"

  else if test $cmdsub = 'slf'

    set slf_file_path $fish_fnc_dir/cnf.fish

    vi $slf_file_path -c ":cd $cnf_fish_dir"

  else
    echo $cmdsub
  end
end

