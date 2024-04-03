
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"



export PS1="_ "

PATH=$PATH:$HOME/sh/cmd

bind '"\C-f": forward-word'
bind '"\C-o": backward-word'

bind '"\C-l": forward-char'
bind '"\C-s": backward-char'

bind '"\C-k": kill-word'

cmd_line__bracket(){

  READLINE_LINE='vi $( '"$READLINE_LINE"' )'
  READLINE_LINE=2
}

bind -x '"\C-y": cmd_line__bracket'


# alias

alias clr='clear'
alias c='clr'
alias clp_at_mac='pbcopy'
alias clp='clp_at_mac'

alias x='xargs'

#alias his_clp='!! | clp'
#alias re='!!'
#alias re_clp='$( tail -n 1 ~/.bash_history ) | clp'
#alias reclp='re_clp'

alias src='source'

alias cd_dl='cd ~/Downloads/'

alias cd_parent='cd ..; pwd'
alias k='cd_parent'
alias kk='k;k'
alias kkk='k;k;k'
#alias i='cd_parent'

alias psh='pushd'
alias pop='popd'
alias pp='popd'

alias ls='ls -a'
alias ll='ls -lgohAGD "%Y-%m-%d %H:%M"'

#alias l='l_by_fd'
#alias l_clp='l | clp'

#alias l_r='lf_by_fd'
#alias lrd='ld_by_fd'

# old
#alias lf='lf_by_fd'
#alias ld='ld_by_fd'
#alias lfd='lfd_by_fd'
#alias ldf='lfd_by_fd'

alias cp='cp -pi'

alias to='touch'
alias to_clr=':>'

alias p='pth'
alias p_clp='p | clp'

alias da='date +"%Y-%m-%d"'
alias dt='date +"%Y-%m-%d.%H:%M"'
alias ts='date +"%Y-%m-%d.%H:%M:%S"'
alias tm='date +"%H:%M"'

alias srt='sort'

alias tbl='column -t'

alias ca='cal'

alias vi='vi -p'

alias fd='fd --hidden --follow -I --exclude .git'

alias rg='rg -nS --path-separator "//"'
alias gr='grep'

alias ggl='opn https://google.com/'
alias opn_brwsr='ggl'


export FZF_DEFAULT_COMMAND='fd --type f --color=always --hidden --follow -I --exclude .git'
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

alias cd_git='cd ~/wrk/prj/src/'
alias cdg='cd_git'

alias psh_wrk='psh ~/wrk/prj/'
alias psh_src='psh ~/wrk/prj/src/'

alias ssh_dev='sh ~/sh/ssh.dev.sh'


[ -f ~/.bashrc_gitbash ] && source ~/.bashrc_gitbash

[ -f ~/.bashrc_env ] && source ~/.bashrc_env



