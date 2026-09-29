
set fnc_name_lst ( ls ~/wrk/pri/dotfiles/sh/fish/fnc/*.fish )

for fnc_name in $fnc_name_lst

  ln -sfn fish-dispatch ( basename $fnc_name .fish )
end

