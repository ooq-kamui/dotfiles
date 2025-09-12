
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

# set -x RIPGREP_CONFIG_PATH ~/wrk/cnf/sh/rg/.ripgreprc
set -x RIPGREP_CONFIG_PATH ~/wrk/prj-pri/dotfiles/cli/rg/ripgreprc/dflt/.ripgreprc

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

alias clr 'clear; pwd'
alias c   'clr'

alias src         "source"
alias src_fsh_cfg "source ~/.config/fish/config.fish"

alias his     'history'
alias his_del 'history delete'

#alias clp 'pbcopy'

alias cd_parent 'cd ../; pwd'
alias k         'cd_parent'
alias kk        'k;k'
alias kkk       'k;k;k'
alias kkkk      'k;k;k;k'

# alias d   'dir_jmp_with_z'
alias d   'dir_jmp_with_zoxide'
alias do  'd dotfiles'
# alias dd  'd dotfiles'
# alias ddo 'd dotfiles'

alias mkdir 'mkdir -p'
alias mkd   'mkdir -p'

alias lroo   'lr_d2'
alias lrooo  'lr_d3'
alias lr-oo  'lr_d2'
alias lr-ooo 'lr_d3'
# alias lr_oo  'lr_d2'
# alias lr_ooo 'lr_d3'

alias lf     'lrf'
alias lfoo   'lrf_d2'
alias lfooo  'lrf_d3'
alias lf-oo  'lrf_d2'
alias lf-ooo 'lrf_d3'
# alias lf_oo  'lrf_d2'
# alias lf_ooo 'lrf_d3'

alias lf_ext  'lrf_ext'
alias ext_lst 'lrf_ext'

alias ld     'lrd'
alias ldoo   'lrd_d2'
alias ldooo  'lrd_d3'
alias ld-oo  'lrd_d2'
alias ld-ooo 'lrd_d3'
# alias ld_oo  'lrd_d2'
# alias ld_ooo 'lrd_d3'

alias fd 'fd --hidden --follow -I --exclude .git'

alias o 'pth'

alias ool     'pwd ../      ; l  ../      '
alias oool    'pwd ../../   ; l  ../../   '
alias ooool   'pwd ../../../; l  ../../../'
alias oo-l    'pwd ../      ; l  ../      '
alias ooo-l   'pwd ../../   ; l  ../../   '
alias oooo-l  'pwd ../../../; l  ../../../'

alias ooll    'pwd ../      ; ll ../      '
alias oooll   'pwd ../../   ; ll ../../   '
alias ooooll  'pwd ../../../; ll ../../../'
alias oo-ll   'pwd ../      ; ll ../      '
alias ooo-ll  'pwd ../../   ; ll ../../   '
alias oooo-ll 'pwd ../../../; ll ../../../'

alias oolf    'pwd ../      ; lf ../'
alias ooolf   'pwd ../../   ; lf ../../'
alias oooolf  'pwd ../../../; lf ../../../'
alias oo-lf   'pwd ../      ; lf ../'
alias ooo-lf  'pwd ../../   ; lf ../../'
alias oooo-lf 'pwd ../../../; lf ../../../'

# alias oo_ll   'pwd ../       ; ll ../      '
# alias ooo_ll  'pwd ../../    ; ll ../../   '
# alias oooo_ll 'pwd ../../../ ; ll ../../../'
# alias oo_lf   'lf ../'
# alias ooo_lf  'lf ../../'

alias to     'touch'
alias to_clr ':>'
alias to_add_line_emp 'echo "" >>'

alias tmp 'file_tmp'

alias mv  'mv -i'
alias mve 'mv_excld'
alias rn  'rename'

alias cp  'cp -ip'
alias dpl 'file_dpl'

alias rm    'rm -i'
alias trash 'trash -F'
alias gm    'trash -F'

alias vi  'nvim -p'
alias vim 'nvim -p'
# alias vid 'nvim -p doc/memo.md'
alias vi_lf 'nvim -p ( lf )'

alias ji  'git'
alias j   'git status'
alias jl  'git log'
alias jj  'git add .; git status'
# alias jp  'git pll origin main'
alias jp  'git pll'
alias jd  'git diff --staged'

alias jsl 'git sl'
alias jsd 'git sd'
alias jwl 'git wl'
alias jwd 'git wd'

alias git_root_pth_rel 'git rev-parse --show-cdup'
alias jrpr 'git_root_pth_rel'
# alias jr  'cd ( jrpr ); pth'
alias jr  'cd_git_root'

alias pd   'podman'
alias pl   'podman container ls -a'
alias pil  'podman image ls'
alias pnl  'podman network ls'
# alias pdcl 'podman container ls -a'
# alias pdil 'podman image ls'

# alias po   'podman'

alias line 'cat_line'

#alias fzf_ins 'cmdline__fzf'
#alias f       'cmdline__fzf'

set -x LC_TIME en_US
alias da      "date_ymd"
alias da_y1   "date_y 1"
alias da_y2   "date_y 2"
alias date_y1 "date_y 1"
alias date_y2 "date_y 2"

alias date-utc 'date_utc_fr_jst'
alias utc      'date_utc_fr_jst'

alias ca 'cal'

alias du   'du -h'
alias du_1 'du -hd1'
alias df   'df -h'

# alias x 'xargs'

alias zip_un 'unzip'

alias pw_gen 'pwgen'
alias pw_cre 'pwgen'

alias clc 'math'

#alias cnt 'count'

alias tbl '/usr/bin/column -t'

alias mb_chk 'file -i'

alias trns     'trans'
alias trns_j2e 'trans {ja=en}'
alias trns_e2j 'trans {en=ja}'
alias trns_je  'trans {ja=en}'
alias trns_ej  'trans {en=ja}'

alias ba      'battery'
alias weather 'wttr'

alias amp 'amplify'

# nginx
alias nx-vi-cnf   'vi /etc/nginx/nginx.conf'
alias nx-start-re 'sudo nginx -s reload'

#alias rf 'ruff'

# alias cmd path

# uconv
# alias uconv '/opt/homebrew/Cellar/icu4c/73.2/bin/uconv'
alias uconv '/home/linuxbrew/.linuxbrew/Cellar/icu4c@77/77.1/bin/uconv'
alias ucnv  'uconv'
alias sjis  'ucnv_sjis'


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

bind \cb cmdline__bracket

#bind \c? cmdline__quote

#bind \ct cmdline__date
bind \ct cmdline__ts

bind \cx cmd_his__del
#bind \cx 'cmd_his__del;'

# fzf

bind \cy fzf-file-widget
bind \cr fzf-history-widget
#bind \cu fzf-history-widget

bind \cu cmdline__fzf_git_st_file_lst

# erase
#bind -e \cu
#bind -e \cr
#bind -e \ct
#bind -e \cx


# color
export GREP_COLOR=" 1;33"

# set fish_color_autosuggestion yellow
set fish_color_autosuggestion brmagenta
# set fish_color_search_match   --background=brmagenta
set fish_color_search_match   --background=yellow
# set fish_color_command        brmagenta
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


