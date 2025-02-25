
# source ~/.config/fish/config.fish

set -U fish_greeting

# ls color, mac
#set -x LSCOLORS fxgxcxdxexegedabagacad
#set -x LSCOLORS fxgxcxdxxxegedabagacad
set -x LSCOLORS fxgxcxdxexegedabagacad
#               ^dir    ^exe           2 chars set, foreground background
#                 ^lnk
# a:black, b:red, c:green, d:brown, e:blue, f:magenta, g:cyan, h:grey, x:default

# ls color, linux
# ref: ~/.colorrc


# path

set -x PATH /opt/local/bin $PATH
set -x PATH /opt/homebrew/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH /opt/homebrew/var/nodebrew/current/bin $PATH
#set -x PATH $HOME/.nodebrew/current/bin $PATH

set -x NODEBREW_ROOT /opt/homebrew/var/nodebrew

# ripgrep ( rg )

set -x RIPGREP_CONFIG_PATH ~/wrk/cnf/sh/rg/.ripgreprc

# fzf

set -x FZF_DEFAULT_COMMAND ( fzf_fd_def )
set -x FZF_DEFAULT_OPTS    '--ansi --bind=ctrl-o:accept,ctrl-s:backward-char,ctrl-l:forward-char,ctrl-f:forward-word'
set -x FZF_CTRL_T_COMMAND  $FZF_DEFAULT_COMMAND
#set -x FZF_CTRL_T_OPTS
#set -x FZF_CTRL_R_OPTS

# zoxide ( z )
zoxide init fish | source

# 
# alias
# 

# alias shutdown_start "sudo shutdown -r now"

# login sh ch
#   confirm : echo $SHELL
#alias login_sh__fish 'chsh -s /opt/homebrew/bin/fish'
#alias login_sh__bash 'chsh -s /bin/bash'

alias fi 'fish'

alias tmx      'tmux'
#alias tmx_init 'fi ~/sh/tmux/tmux-win-init.fish'

alias src         "source"
alias src_fsh_cfg "source ~/.config/fish/config.fish"

alias his     'history'
alias his_del 'history delete'

alias clr 'clear; pwd'
alias c   'clr'

#alias clp 'pbcopy'

alias cd_parent 'cd ../; pwd'
alias k         'cd_parent'
alias kk        'k;k'
alias kkk       'k;k;k'

#alias d 'dir_jmp_with_z'
alias d 'dir_jmp_with_zoxide'

alias lr_oo  'lr_d2'
alias lr_ooo 'lr_d3'

alias lf     'lrf'
alias lf_oo  'lrf_d2'
alias lf_ooo 'lrf_d3'
alias lf_ext 'lrf_ext'

alias ld     'lrd'
alias ld_oo  'lrd_d2'
alias ld_ooo 'lrd_d3'

alias fd 'fd --hidden --follow -I --exclude .git'

#alias p 'pth'
alias o 'pth'
alias oo      'pwd ../       ; l  ../      '
alias ooo     'pwd ../../    ; l  ../../   '
alias oooo    'pwd ../../../ ; l  ../../../'
alias oo_ll   'pwd ../       ; ll ../      '
alias ooo_ll  'pwd ../../    ; ll ../../   '
alias oooo_ll 'pwd ../../../ ; ll ../../../'
alias oo_lf   'lf ../'
alias ooo_lf  'lf ../../'

#alias to     'touch'
alias to_clr ':>'
alias to_add_line_emp 'echo "" >>'

alias mv 'mv -i'
alias cp 'cp -ip'
alias rm 'rm -i'

alias mve 'mv_excld'
alias rn  'rename'

alias trash 'trash -F'

alias vim 'nvim -p'
#alias vim 'nvim -c / -p'
alias vi  'vim'

alias line 'cat_line'

alias ji     'git'
alias jis    'git s'
alias jia    'git aa'
alias ji_ssl 'git ssl' # status staged list

#alias fzf_ins 'cmdline__fzf'
#alias f       'cmdline__fzf'

set -x LC_TIME en_US
alias da      "date_ymd"
alias da_y1   "date_y 1"
alias da_y2   "date_y 2"
alias date_y1 "date_y 1"
alias date_y2 "date_y 2"
alias t       'ts'

alias ca 'cal'

alias du  'du -h'
alias du1 'du -hd1'
alias df  'df -h'

# alias x 'xargs'

alias zip_un 'unzip'

alias pw_cre 'pwgen'

alias clc 'math'

#alias cnt 'count'

alias tbl '/usr/bin/column -t'

alias mb_chk 'file -i'

alias trns     'trans'
alias trns_j2e 'trans {ja=en}'
alias trns_e2j 'trans {en=ja}'

alias ba 'battery'

alias amp 'amplify'

#alias rf 'ruff'

# alias cmd path

alias uconv '/opt/homebrew/Cellar/icu4c/73.2/bin/uconv'

# 
# bind
# 

# corsor mv char
bind \cs backward-char
bind \cl forward-char

# corsor mv word
bind \co backward-word
bind \cf forward-word

#bind \cx backward-delete-char
bind \ck kill-word

# cmdline

bind \c_ 'clear; commandline -f repaint'

#bind \cc cmdline_pbcopy
bind \cc cmdline_clp

bind \cb cmdline_bracket

#bind \c? cmdline_quote

#bind \ct cmdline_date
bind \ct cmdline_ts

bind \cx cmdline_his_del
#bind \cx 'cmdline_his_del;'

# fzf

bind \cy fzf-file-widget
bind \cr fzf-history-widget
bind \cu fzf-history-widget

bind \cg cmdline__fzf_git_ssl
bind \cq cmdline__fzf_git_ssl

# erase
#bind -e \cu
#bind -e \cr
#bind -e \ct
#bind -e \cx


# color
export GREP_COLOR="1;33"

set fish_color_autosuggestion cyan
set fish_color_search_match   --background=brmagenta
set fish_color_command   brmagenta


# git prompt
set __fish_git_prompt_showdirtystate        'yes'
set __fish_git_prompt_showstashstate        'yes'
set __fish_git_prompt_showuntrackedfiles    'yes'
set __fish_git_prompt_showupstream          'yes'
set __fish_git_prompt_color_branch          brgreen
set __fish_git_prompt_color_upstream_ahead  green
set __fish_git_prompt_color_upstream_behind red

# git prompt  -  status chars
set __fish_git_prompt_char_dirtystate      'w' # '$' # '⚡'
set __fish_git_prompt_char_stagedstate     's' # '>' # '→'
set __fish_git_prompt_char_untrackedfiles  'a' # 'z' # '☡'
set __fish_git_prompt_char_stashstate      't' # '<' # '↩'
set __fish_git_prompt_char_upstream_ahead  '+'
set __fish_git_prompt_char_upstream_behind '-'



