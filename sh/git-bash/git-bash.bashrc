

export PS1="_ "


#PATH=$PATH':/c/Users/yinou/.fzf/bin'
#PATH=$PATH':/c/Users/yinou/.config/fzf'
#PATH=$PATH':/c/Users/yinou/.config/ff'


bind '"\C-f": forward-word'
bind '"\C-o": backward-word'

bind '"\C-l": forward-char'
bind '"\C-s": backward-char'

bind '"\C-k": kill-word'

alias ll='ls -la'
alias ll_='ll -d .*'

alias vi='vi -p'

alias opn='explorer'

#alias fzf="winpty fzf"
#alias ff="winpty ff"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash



cd

