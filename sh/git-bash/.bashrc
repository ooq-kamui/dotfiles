
export PS1="_ "

chcp.com 65001

stty stop undef

#export MSYS=winsymlinks:nativestrict

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
#alias his='history | grep'

alias src='source'

alias cd_dl='cd ~/Downloads/'

#alias cdp='cd ..; pwd'
alias pp='cd ..; pwd'

alias psh='pushd'
alias pop='popd'


alias ls='ls -a'
alias ll='ls -lgohAG --time-style="+%Y-%m-%d %H:%M"'
alias ll.='ll -d .*'
alias l.='ls -1d .*'

alias lf='lf_by_fd'
alias ld='ld_by_fd'
alias lfd='lfd_by_fd'
alias ldf='lfd_by_fd'
alias l='l_by_fd'

alias l_clp='l | clip'

alias cp='cp -p'

alias to='touch'
alias to_clr=':>'

alias p='pth'
alias p_clp='p | clip'


alias da='date +"%Y-%m-%d"'
alias dt='date +"%Y-%m-%d.%H:%M"'
alias ts='date +"%Y-%m-%d.%H:%M:%S"'
alias tm='date +"%H:%M"'

alias cal='gcal $(date +"%m %Y" -d "-1 month");gcal;gcal $(date +"%m %Y" -d "+1 month")'
alias ca='cal'

alias vi='vi -p'

alias ggl='opn https://google.com/'
alias opn_brwsr='ggl'


alias fd='fd --hidden --follow --exclude .git'

alias gr='grep'
alias rg='rg -nS --path-separator "//"'


alias fzf='winpty fzf'
#alias ff="winpty ff"

export FZF_DEFAULT_COMMAND='fd --type f --color=always --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--ansi'


#alias cnf

alias src_bashrc='source ~/.bashrc'
alias src_cnf='src_bashrc'

alias vi_bashrc='vi ~/.bashrc ~/.bashrc_env'
alias vi_cnf='vi_bashrc'


#alias wrk, src  -  tpl

alias cd_wrk='cd ~/wrk/prj/'
alias cdw='cd_wrk'

alias cd_src='cd ~/wrk/prj/src/'
alias cds='cd_src'

alias psh_wrk='psh ~/wrk/prj/'
alias psh_src='psh ~/wrk/prj/src/'

alias ssh_dev='sh ~/sh/ssh.dev.sh'


[ -f ~/.bashrc_env ] && source ~/.bashrc_env

[ -f ~/.fzf.bash ] && source ~/.fzf.bash



