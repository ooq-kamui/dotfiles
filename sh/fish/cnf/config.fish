
# source ~/.config/fish/config.fish

set -U fish_greeting

# ls color, mac
# set -x LSCOLORS fxgxcxdxexegedabagacad
# #               ^dir    ^exe           2 chars set, foreground background
# #                 ^lnk
# a:black, b:red, c:green, d:brown, e:blue, f:magenta, g:cyan, h:grey, x:default


# path

set -x PATH /opt/local/bin $PATH
set -x PATH /opt/homebrew/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH /opt/homebrew/var/nodebrew/current/bin $PATH
#set -x PATH $HOME/.nodebrew/current/bin $PATH

# cp -b
set -gx VERSION_CONTROL numbered


# set -x NODEBREW_ROOT /opt/homebrew/var/nodebrew


# ripgrep ( rg )

set -x RIPGREP_CONFIG_PATH ~/wrk/prj-pri/dotfiles/cli/rg/ripgreprc/.ripgreprc

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
# alias login_sh__fish 'chsh -s /opt/homebrew/bin/fish'
# alias login_sh__bash 'chsh -s /bin/bash'

alias fi 'fish'

# alias tmx      'tmux'
# alias tmx_init 'fi ~/sh/tmux/tmux-win-init.fish'

alias clr 'clear; pwd'
alias c   'clr'

alias src         "source"
alias src_fsh_cfg "source ~/.config/fish/config.fish"

alias his     'history'
alias his_del 'history delete'

# alias clp 'pbcopy'
# alias clp 'xclip -selection clipboard'

alias cd_parent 'cd ../; pwd'
alias k    'cd_parent'
alias kk   'k;k'
alias kkk  'k;k;k'
alias kkkk 'k;k;k;k'
alias kr   'cd-git-root'

alias f  'dir_jmp_with_zoxide'
alias fo 'dir_jmp_with_zoxide dotfiles'
alias fl 'dir_jmp_with_zoxide life'
alias fp 'dir_jmp_with_zoxide life'
# alias fl 'dir_jmp_with_zoxide flofro'

alias mkdir 'mkdir -p'
alias mkd   'mkdir -p'
alias rmd   'rmdir'

# alias lr   # fnc
alias lr-oo  'lr-d2'
alias lr-ooo 'lr-d3'

alias fd  'fd --hidden --follow -I --exclude .git'
alias lfd 'fd'

alias lf     'lrf'
alias lfl    'lrf -l'

alias lf-oo  'lrf-d2'
alias lf-ooo 'lrf-d3'

alias ld     'lrd'
alias ld-oo  'lrd-d2'
alias ld-ooo 'lrd-d3'

alias lf-ext  'lrf-ext'
# alias ext-lst 'lrf-ext'

alias o 'pth'

alias oo-l    'pwd ../      ; l  ../      '
alias ooo-l   'pwd ../../   ; l  ../../   '
alias oooo-l  'pwd ../../../; l  ../../../'

alias oo-ll   'pwd ../      ; ll ../      '
alias ooo-ll  'pwd ../../   ; ll ../../   '
alias oooo-ll 'pwd ../../../; ll ../../../'

alias oo-lf   'pwd ../      ; lf ../'
alias ooo-lf  'pwd ../../   ; lf ../../'
alias oooo-lf 'pwd ../../../; lf ../../../'

alias to     'touch'
alias to-clr ':>'
alias to-add-line-emp 'echo "" >>'

alias tmp 'file_tmp'

alias mv  'mv -i'
alias rn  'rename'

alias cp  'cp -ip'
alias dpl 'file_dpl'

alias rm   'rm -i'
alias trsh 'trash -F'

alias e 'echo'

alias vi  'nvim -p'
alias vim 'nvim -p'
alias vi-lf 'nvim -p ( lf )'

alias ji 'git'
alias j  'git status'
alias ja 'git -C ~/wrk/prj-pri/dotfiles/ status; git -C ~/wrk/prj-pri/life/ status; git -C ~/wrk/prj-pri/doc-tech/ status'
alias jl 'git log'
alias jl-tree 'git-log-tree'
alias jlt     'jl-tree'
alias jlo     'jl-tree'
alias jlof    'jl-tree'

alias jj 'git add .; git status'
alias jp 'git pll'

# alias jsl 'git sl'
# alias jsd 'git sd'
# alias jwl 'git wl'
# alias jwd 'git wd'

# alias jrp 'git-root-pth-rel'
# alias jr  'cd_git_root'
alias ji-st-file-lst 'git-st-file-lst'
alias ji-co-file-lst 'git-co-file-lst'
alias ji-co-smry     'git-co-summary'
# alias ji-co-summary  'git-co-summary'

alias get-branch-upstream 'git branch --set-upstream-to=origin/main main'
alias ji-b-upstream       'get-branch-upstream'

alias lj 'lazygit'

alias dif 'difft'
alias di  'difft'


alias pd   'podman'
alias pl   'podman container ls -a'
alias pil  'podman image ls'
alias pnl  'podman network ls'
# alias pdcl 'podman container ls -a'
# alias pdil 'podman image ls'

alias line 'cat_line'

set -x LC_TIME en_US
alias da      "date_ymd"
alias da_y1   "date_y 1"
alias da_y2   "date_y 2"
alias date_y1 "date_y 1"
alias date_y2 "date_y 2"

alias date-utc 'date_utc_fr_jst'
alias utc      'date_utc_fr_jst'

alias ca   'cal'
alias ca-y 'cal-y'

alias du   'du -h'
alias du-1 'du -hd1'
alias df   'df -h'

# alias x 'xargs'

alias zip-un 'unzip'

alias pw-gen 'pwgen'
alias pw-cre 'pwgen'

alias clc 'math'

# alias cnt 'count'

alias tbl '/usr/bin/column -t'

alias mb-chk 'file -i'

alias trns     'trans'
alias trns-j2e 'trans {ja=en}'
alias trns-e2j 'trans {en=ja}'
alias trns-je  'trans {ja=en}'
alias trns-ej  'trans {en=ja}'

# nginx
alias nx-vi-cnf   'vi /etc/nginx/nginx.conf'
alias nx-start-re 'sudo nginx -s reload'

# uconv
# alias uconv '/opt/homebrew/Cellar/icu4c/73.2/bin/uconv'
alias uconv '/home/linuxbrew/.linuxbrew/Cellar/icu4c@77/77.1/bin/uconv'
alias ucnv  'uconv'
alias sjis  'ucnv_sjis'

# wez
alias wez-color-scheme-lua-clp 'echo "window:get_config_overrides().color_scheme" | clp'

# variety
# alias ba   'battery' # mac
alias wthr 'weather'
alias mtrx 'cmatrix'
alias ncat 'nyancat'
alias nc   'nyancat'
alias rcat 'lolcat'
alias tmr  'countdown'

alias amp 'amplify'
# alias rf 'ruff'


# 
# key-bind
# 

stty -ixon

# corsor mv char
bind \cs backward-char
bind \cl forward-char

# corsor mv word
bind \co backward-word
bind \cf forward-word

# bind \cx backward-delete-char
bind \ck kill-word

# cmdline

bind \c_ 'clear; commandline -f repaint'

# bind \cc cmdline_pbcopy
bind \cc cmdline_clp

bind \cb cmdline__bracket

# bind \c? cmdline__quote

# bind \ct cmdline__date
bind \ct cmdline__ts

bind \cx cmd_his__del
# bind \cx 'cmd_his__del;'

# fzf

bind \cy fzf-file-widget
bind \cr fzf-history-widget
# bind \cu fzf-history-widget

bind \cu cmdline__fzf_git_st_file_lst
bind \cq cmdline__fzf_git_co_file_lst

# erase
# bind -e \cu
# bind -e \cr
# bind -e \ct
# bind -e \cx


# color
export GREP_COLOR=" 1;33"

set fish_color_autosuggestion brmagenta
set fish_color_search_match   --background=yellow
set fish_color_command        brgreen


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


