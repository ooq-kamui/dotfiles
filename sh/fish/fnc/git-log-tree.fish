function git-log-tree

  # git log --graph                              --pretty=format:"%x09%C(auto) %h %Cgreen %ar %Creset%x09 %C(cyan ul)%an%Creset  %x09%C(auto)%s %d"
  git log --graph --date=format:'%Y-%m-%d %H:%M' --pretty=format:"%x09%C(auto) %h %Cgreen %ad %Creset%x09 %C(cyan ul)%an%Creset  %x09%C(auto)%s %d" $argv
end

