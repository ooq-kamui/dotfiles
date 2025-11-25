function git-log-tree

  # git log --graph --pretty=format:"%x09%C(auto) %h %Cgreen %ar %Creset%x09by %C(cyan ul)%an%Creset  %x09%C(auto)%s %d"
  git log --graph --pretty=format:"%x09%C(auto) %h %Cgreen %ad %Creset%x09by %C(cyan ul)%an%Creset  %x09%C(auto)%s %d"
end

