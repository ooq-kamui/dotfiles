
# alias

alias clp 'clp_by_tmp'

#alias ll "ls -lgohAGD '%Y-%m-%d %H:%M'"
alias ll 'ls -lgohA --time-style=long-iso --color=auto'

alias vim 'vim -p'
alias vi  'vim -p'


# color

#set fish_color_autosuggestion brmagenta
set fish_color_autosuggestion cyan
set fish_color_command        brcyan
set fish_color_param          brcyan
set fish_color_quote          brgreen
#set fish_color_error          brmagenta
set fish_color_error          grey


# rg ( ripgrep )

set -x RIPGREP_CONFIG_PATH ~/wrk/cnf/sh/rg/.ripgreprc



