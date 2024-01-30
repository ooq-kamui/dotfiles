
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


# alias

alias clr='clear'
alias clp='clip'
alias his='history | grep'

alias src='source'
alias src_bashrc='source ~/.bashrc'

alias cdp='cd ..; pwd'

alias ll='ls -lgohAG --time-style="+%Y-%m-%d %H:%M"'
alias ll.='ll -d .*'
alias l='ls -1a'
alias l.='ls -1d .*'

alias lf='ls -1d $( find * -type f )'
alias ld='ls -1d $( find * -type d )'
alias lfd='ls -1d $( find * )'
alias ldf='lfd'

alias l_clp='l | clip'

alias cp='cp -p'

alias to='touch'
alias to_clr=':>'

alias p='pwd'
alias p_clp='pwd | clip'

alias pth='readlink -f'

alias opn='explorer'

alias da='date +"%Y-%m-%d"'
alias dt='date +"%Y-%m-%d.%H:%M"'
alias ts='date +"%Y-%m-%d.%H:%M:%S"'
alias tm='date +"%H:%M"'

alias vi='vi -p'
#alias vi_ext
#alias vi_ext_md

alias vi_bashrc='vi ~/.bashrc'
alias vi_bashrc_env='vi ~/.bashrc_env'

alias fd='fd --hidden --follow --exclude .git'

alias gr='grep'
alias rg='rg -nS --path-separator "//"'

alias fzf='winpty fzf'
#alias ff="winpty ff"

export FZF_DEFAULT_COMMAND='fd --type f --color=always --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--ansi'


#alias wrk
alias cd_wrk='cd ~/wrk/prj/'
alias cdw='cd_wrk'
alias cd_dl='cd ~/Downloads/'

alias ssh_dev='sh ~/sh/ssh.dev.sh'

[ -f ~/.bashrc_env ] && source ~/.bashrc_env

[ -f ~/.fzf.bash ] && source ~/.fzf.bash



