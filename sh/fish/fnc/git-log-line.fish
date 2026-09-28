function git-log-line

  # git log --graph                              --pretty=format:'%C(auto)%h %C(green)%ad%C(reset) %s %C(auto)%d' -- $argv
  git log --graph --date=format:'%Y-%m-%d %H:%M' --pretty=format:'%C(auto)%h %C(green)%ad%C(reset) %s %C(auto)%d' -- $argv
end

