
export PS1="_ "

# PATH=$PATH:~/wrk/cnf/sh/bash/cmd
PATH=$PATH:~/wrk/prj-pri/dotfiles/sh/bash/cmd

# fnc

cmd_line__dt(){

  READLINE_LINE=$READLINE_LINE''$( dt )
}

cmd_line__bracket(){

  READLINE_LINE='vi $( '"$READLINE_LINE"')'
  READLINE_POINT=2
}

cmd_line__clp_by_tmp(){

  tmp_dir=~/wrk/tmp
  tmp_file_path=$tmp_dir/tmp.txt

  clp_str=$( cat $tmp_file_path )

  READLINE_LINE=$READLINE_LINE$clp_str
}

#export LSCOLORS=fxgxcxdxexegedabagacad
export LSCOLORS=fxgxcxdxxxegedabagacad
#               ^dir    ^exe
#                 ^lnk?
# a:black, b:red, c:green, d:brown, e:blue, f:magenta, g:cyan, h:grey

# alias

alias clr='clear'
alias c='clr; pwd'

alias src='source'

# alias p='pth'
alias o='pth'

alias ls='ls -a'
alias ll='ls -lgohA --time-style=long-iso --color=auto'
alias lll='ls -lhA --time-style=long-iso --color=auto'

alias lf='lrf'
alias ld='lrd'

alias cd_parent='cd ..; pwd'
alias k='cd_parent'
alias kk='k;k'
alias kkk='k;k;k'

alias mv='mv -i'
alias cp='cp -pi'
alias rm='rm -i'

alias to='touch'
alias to_clr=':>'

alias vi='nvim -p'

alias ji='git'

# etc

alias du1='du -h -d 1'
# alias du1='du -h --max-depth=1'

alias df='df -h'

alias da='date +"%Y-%m-%d"'
alias dt='date +"%Y-%m-%d.%H:%M"'
alias ts='date +"%Y-%m-%d.%H:%M:%S"'
alias tm='date +"%H:%M"'
alias t='ts'

# alias clp='clp_by_tmp'
# alias clp_mac='pbcopy'
# alias clp='clp_mac'

alias srt='sort'

# alias tbl='column -t'
alias tbl='/usr/bin/column -t'
alias col="$HOME/wrk/cnf/sh/bash/cmd/col"

alias cal='cal -3'
alias ca='cal'

# alias x='xargs'

# alias ggl='opn https://google.com/'
# alias opn_brwsr='ggl'

# fd

alias fd='fd --hidden -I --exclude .git --follow'

# rg ( ripgrep )

#alias rg='rg -nS'
#alias rg='rg -nS --path-separator "//"'

# export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
# export RIPGREP_CONFIG_PATH=$HOME/wrk/cnf/sh/rg/.ripgreprc
export RIPGREP_CONFIG_PATH=$HOME/wrk/prj-pri/dotfiles/cli/rg/ripgreprc/dflt/.ripgreprc

# fzf

test -f ~/.fzf.bash && source ~/.fzf.bash

#export FZF_DEFAULT_COMMAND='fd --type f --color=always --hidden --follow -I --exclude .git'
export FZF_DEFAULT_OPTS='--ansi --bind=ctrl-o:accept,ctrl-l:forward-char,ctrl-f:forward-word'

# z

# if test -f ~/wrk/app/z/z.sh
# then
#   source ~/wrk/app/z/z.sh
#   z_history_file_path=~/.z
# fi

eval "$(zoxide init bash)"

function dir_jmp(){

  # echo $z_history_file_path

  if test -z "$@"
  then
    dir=$( cat $z_history_file_path | sed 's/|.*//g' | fzf )
    # echo $dir
  
    if test -z "$dir"
    then
      return
    fi
  
    cd $dir
  
  else
    z "$@"
  fi

  pth
}
alias d='dir_jmp'

# cargo

# [ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"


# 
# key-bind
# 

if [[ -t 0 ]]
then
  # ctrl-s off
  stty stop  undef
  stty start undef

  #. ~/.bashrc_my_cloud9_bind
  bind '"\C-f": forward-word'
  bind '"\C-o": backward-word'

  bind '"\C-l": forward-char'
  bind '"\C-s": backward-char'

  bind '"\C-k": kill-word'

  #bind '"\C-q": yank'
  bind -x '"\C-q": cmd_line__clp_by_tmp'

  #bind -x '"\C-u": cmd_line__bracket'
  bind -x '"\C-b": cmd_line__bracket'

  bind -x '"\C-t": cmd_line__dt'

  # fzf
  bind -x '"\C-y": fzf-file-widget'
  #bind -x '"\C-r": fzf-history-widget'
fi



