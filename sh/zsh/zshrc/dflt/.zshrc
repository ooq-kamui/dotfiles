
export PS1="_ "

PATH=$PATH:~/wrk/prj-pri/dotfiles/sh/bash/cmd


# fzf
source <(fzf --zsh)

bindkey '^Y' fzf-file-widget


# zoxide
eval "$(zoxide init zsh)"


# alias

alias c='clear'

alias o='pth'

alias cd_parent='cd ../; pwd'
alias k='cd_parent'
alias kk='k;k'
alias kkk='k;k;k'

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
    # zoxide query "$@"
  fi

  pth
}
alias d='dir_jmp'

alias ls='ls -a'
alias ll='ls -lgohAD "%Y-%m-%d %H:%M" --color=auto'
alias lll='ls -lhAD "%Y-%m-%d %H:%M" --color=auto'

alias lf='lrf'
alias ld='lrd'


alias vi='nvim -p'
alias vim='nvim -p'



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


