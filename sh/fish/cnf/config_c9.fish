
# set

# color

#set fish_color_autosuggestion brmagenta
set fish_color_autosuggestion cyan
set fish_color_command        brcyan
set fish_color_param          brcyan
set fish_color_quote          brgreen
#set fish_color_error          brmagenta
set fish_color_error          grey


# rg ( ripgrep )

#set -x RIPGREP_CONFIG_PATH ~/wrk/cnf/sh/rg/.ripgreprc
set -x RIPGREP_CONFIG_PATH ~/wrk/cnf/sh/rg/.ripgreprc_c9


# alias

alias clp 'osc52.sh'

#alias ll "ls -lgohAGD '%Y-%m-%d %H:%M'"
alias ll 'ls -lgohA --time-style=long-iso --color=auto'

alias vim 'vim -p'
alias vi  'vim -p'

alias column '/usr/bin/column'



