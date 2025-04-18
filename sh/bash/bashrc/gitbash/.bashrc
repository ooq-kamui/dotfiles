
# win command output lang code
chcp.com 65001

export LC_ALL=ja_JP.utf8
export LANG=ja_JP.utf8
export LANGUAGE=ja_JP.utf8
export LC_CTYPE="ja_JP.utf8"
export LC_NUMERIC="ja_JP.utf8"
export LC_TIME="ja_JP.utf8"
export LC_COLLATE="ja_JP.utf8"
export LC_MONETARY="ja_JP.utf8"
export LC_MESSAGES="ja_JP.utf8"


#alias

alias clp_win='clip'
alias clp='clp_win'

alias ggl='start chrome'

# gcal
PATH="$PATH:/c/Program Files (x86)/GnuWin32/bin"
alias cal='gcal $(date +"%m %Y" -d "-1 month");gcal;gcal $(date +"%m %Y" -d "+1 month")'
alias ca='cal'

# fd
#alias fd='fd --path-separator=/'

# rg
export RIPGREP_CONFIG_PATH=$HOME/wrk/cnf/sh/rg/.ripgreprc_gitbash

# fzf

export FZF_DEFAULT_COMMAND="fd --hidden -I --exclude .git --follow --color=always"

if test -d "$HOME/OneDrive"
then
  #echo "pri"
  fd_path_separator=//
else
  #echo "ofc"
  fd_path_separator=/
fi
export FZF_DEFAULT_COMMAND="$FZF_DEFAULT_COMMAND --path-separator=$fd_path_separator"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# zoxide ( z )
eval "$(zoxide init bash)"

function dir_jmp(){

  if test -z "$@"
  then
    dir=$( zoxide query --list | fzf )
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



