
export PS1="_ "

chcp.com 65001

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


alias clr='clear'
alias src='source'
alias his='history | grep'

alias cdp='cd ..; pwd'

#alias ll='ls -la'
alias ll='ls -lgohAG --time-style="+%Y-%m-%d %H:%M"'
alias ll.='ll -d .*'
alias l='ls -1a'
alias l.='ls -1d .*'
alias lf='ls -1d $( find * -type f )'
alias ld='ls -1d $( find * -type d )'
alias lfd='ls -1d $( find * )'
alias ldf='lfd'

#alias lf_ext
alias lf_ext_md='ls -1d $( find * -iname "*.md" -type f )'

alias l_clp='l | clip'

alias cp='cp -p'

alias to='touch'
alias to_clr=':>'

alias p='pwd'
alias p_clp='pwd | clip'

#alias pth='pwd' # todo cre

alias da='date +"%Y-%m-%d"'
alias dt='date +"%Y-%m-%d.%H:%M"'
alias ts='date +"%Y-%m-%d.%H:%M:%S"'
alias tm='date +"%H:%M"'

alias gr='grep'

alias opn='explorer'
alias clp='clip'

alias vi='vi -p'
#alias vi_ext
#alias vi_ext_md

alias fzf='winpty fzf'
#alias ff="winpty ff"


#alias wrk
alias cd_wrk='cd ~/wrk/prj/'
alias cdw='cd_wrk'
alias cd_dl='cd ~/Downloads/'

alias ssh_dev='sh ~/sh/ssh.dev.sh'

[ -f ~/.bashrc_env ] && source ~/.bashrc_env

[ -f ~/.fzf.bash ] && source ~/.fzf.bash



