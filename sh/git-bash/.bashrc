
export PS1="_ "

stty stop undef


PATH=$PATH:$HOME/sh/cmd

#PATH=$PATH':/c/Users/yinou/.fzf/bin'
#PATH=$PATH':/c/Users/yinou/.config/fzf'
#PATH=$PATH':/c/Users/yinou/.config/ff'


bind '"\C-f": forward-word'
bind '"\C-o": backward-word'

bind '"\C-l": forward-char'
bind '"\C-s": backward-char'

bind '"\C-k": kill-word'


#alias ll='ls -la'
alias ll='ls -lgohAG --time-style="+%Y-%m-%d %H:%M"'
alias ll.='ll -d .*'
alias l='ls -1a'
alias l.='ls -1d .*'
alias lf='ls -1d $( find * -type f )'
alias ld='ls -1d $( find * -type d )'
alias lfd='ls -1d $( find * )'
alias ldf='lfd'

alias cp='cp -p'

alias vi='vi -p'

alias to='touch'
alias clr='clear'
alias opn='explorer'

alias fzf="winpty fzf"
#alias ff="winpty ff"


#alias prj
alias cd_wrk='cd ~/Desktop/wrk/task/'
alias ssh_dev='sh ~/sh/ssh.dev.sh'


[ -f ~/.fzf.bash ] && source ~/.fzf.bash


cd_wrk



