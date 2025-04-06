
export PS1="_ "

PATH=$PATH:~/wrk/prj-pri/dotfiles/sh/bash/cmd


# alias

alias c='clear'

alias o='pth'

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

alias ls='ls -a'
alias ll='ls -lgohAD "%Y-%m-%d %H:%M" --color=auto'



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


