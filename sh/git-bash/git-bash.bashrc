
export PS1="_ "

stty stop undef

#PATH=$PATH':/c/Users/yinou/.fzf/bin'
#PATH=$PATH':/c/Users/yinou/.config/fzf'
#PATH=$PATH':/c/Users/yinou/.config/ff'


bind '"\C-f": forward-word'
bind '"\C-o": backward-word'

bind '"\C-l": forward-char'
bind '"\C-s": backward-char'

bind '"\C-k": kill-word'

alias ll='ls -la'
alias l='ls -1a'
alias ll.='ls -ld .*'
alias l.='ls -1d .*'
alias lf='ls -1d $( find * -type f )'
alias ld='ls -1d $( find * )'
alias ldo='ls -1d $( find * -type d )'

alias cp='cp -p'

alias vi='vi -p'

alias opn='explorer'

#alias fzf="winpty fzf"
#alias ff="winpty ff"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash



cd ~/Downloads

