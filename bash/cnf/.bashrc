
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"



export PS1="_ "

PATH=$PATH:~/wrk/cnf/bash/cmd

bind '"\C-f": forward-word'
bind '"\C-o": backward-word'

bind '"\C-l": forward-char'
bind '"\C-s": backward-char'

bind '"\C-k": kill-word'

cmd_line__bracket(){

  READLINE_LINE='vi $( '"$READLINE_LINE"' )'
  READLINE_POINT=2
}

bind -x '"\C-y": cmd_line__bracket'


# alias

alias clr='clear'
alias c='clr'

alias clp_mac='pbcopy'
alias clp='clp_mac'

alias x='xargs'

alias src='source'

alias ls='ls -a'
alias ll='ls -lgohAGD "%Y-%m-%d %H:%M"'

alias lf='lrf'
alias ld='lrd'

#alias cd_dl='cd ~/Downloads/'

alias cd_parent='cd ..; pwd'
alias k='cd_parent'
alias kk='k;k'
alias kkk='k;k;k'

alias psh='pushd'
alias pop='popd'
alias pp='popd'

<<<<<<< HEAD
alias ls='ls -a'
alias ll='ls -lgohAGD "%Y-%m-%d %H:%M"'

=======
>>>>>>> b1199316aef8f4cbe0d4a6a34927a73ca11bb321
alias cp='cp -pi'

alias to='touch'
alias to_clr=':>'

alias p='pth'
#alias p_clp='p | clp'

alias vi='vi -p'

alias fd='fd --hidden --follow -I --exclude .git'

alias rg='rg -nS --path-separator "//"'
#alias gr='grep'

alias da='date +"%Y-%m-%d"'
alias dt='date +"%Y-%m-%d.%H:%M"'
alias ts='date +"%Y-%m-%d.%H:%M:%S"'
alias tm='date +"%H:%M"'

alias srt='sort'

alias tbl='column -t'

alias ca='cal'

alias ggl='opn https://google.com/'
alias opn_brwsr='ggl'


export FZF_DEFAULT_COMMAND='fd --type f --color=always --hidden --follow -I --exclude .git'
export FZF_DEFAULT_OPTS='--ansi'


#alias cnf

alias src_bashrc='src ~/.bashrc'
alias src_cnf='src_bashrc'

<<<<<<< HEAD
alias vi_bashrc='vi ~/.bashrc ~/.bashrc_env'
alias vi_cnf='vi_bashrc'

=======
#alias vi_bashrc='vi ~/.bashrc ~/.bashrc_env'
#alias vi_cnf='vi_bashrc'
>>>>>>> b1199316aef8f4cbe0d4a6a34927a73ca11bb321


[ -f ~/wrk/cnf/bash/cnf/.bashrc_gitbash ] && source ~/wrk/cnf/bash/cnf/.bashrc_gitbash

[ -f ~/.bashrc_env ] && source ~/.bashrc_env



