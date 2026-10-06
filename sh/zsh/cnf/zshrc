
#
# prompt
#

autoload -Uz vcs_info add-zsh-hook
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr   ' s'
zstyle ':vcs_info:git:*' unstagedstr ' w'
zstyle ':vcs_info:git:*' formats '%F{10}%b%f%c%u:'
zstyle ':vcs_info:git:*' actionformats '%F{10}%b%f|%F{9}%a%f%c%u:'

add-zsh-hook precmd vcs_info

PROMPT='${vcs_info_msg_0_}%F{2}_%f '

# 
# path
# 

# PATH=$PATH:~/wrk/pri/dotfiles/sh/bash/cmd
PATH=$PATH:~/wrk/pri/dotfiles/sh/bash/fish-fnc


# fzf
export FZF_DEFAULT_OPTS='--ansi --bind=ctrl-o:accept,ctrl-s:backward-char,ctrl-l:forward-char,ctrl-f:forward-word'
source <(fzf --zsh)

bindkey '^Y' fzf-file-widget


# 
# key-bind
# 

# ^S を flow control (XOFF) に取られないようにする
setopt no_flow_control

# corsor mv char
bindkey '^S' backward-char
bindkey '^L' forward-char

# corsor mv word
bindkey '^O' backward-word
bindkey '^F' forward-word

bindkey '^K' kill-word


# zoxide
eval "$(zoxide init zsh)"


# fnc
fpath=(~/wrk/pri/dotfiles/sh/zsh/fnc $fpath)
autoload -Uz ~/wrk/pri/dotfiles/sh/zsh/fnc/*(N.:t)


# 
# alias
# 

# alias shutdown_start="sudo shutdown -r now"

# login sh ch
#   confirm : echo $SHELL
# alias login_sh__fish='chsh -s /opt/homebrew/bin/fish'
# alias login_sh__bash='chsh -s /bin/bash'

alias fsh='fish'

alias clr='clear; pwd'
alias c='clr'

alias src="source"

alias his='history'
alias his_del='history delete'


alias mkdir='mkdir -p'
alias mkd='mkdir -p'
alias rmd='rmdir'

alias cd_parent='cd ../; pwd'
alias k='cd_parent'
alias kk='k;k'
alias kkk='k;k;k'
alias kkkk='k;k;k;k'
alias kr='cd-git-root'

alias f='dir_jmp_with_zoxide'
alias fo='dir_jmp_with_zoxide dotfiles'
alias fl='dir_jmp_with_zoxide life'

alias dir-pin-lst='printf "%s\n" $dirstack'
alias dir-pin='pushd .; dir-pin-lst'
alias dir-pin-bck='popd; pwd'
alias dir-pin-clr='dirs -c'
alias pl='dir-pin-lst'
alias p='dir-pin'
alias pb='dir-pin-bck'
alias pc='dir-pin-clr'


# alias lr   # fnc
alias lr-oo='lr-d2'
alias lr-ooo='lr-d3'

alias fd='fd --hidden --follow -I --exclude .git'
alias lfd='fd'

alias lf='lrf'
alias lfl='lrf -l'

alias lf-oo='lrf-d2'
alias lf-ooo='lrf-d3'

alias ld='lrd'
alias ld-oo='lrd-d2'
alias ld-ooo='lrd-d3'

alias lf-ext='lrf-ext'
# alias ext-lst='lrf-ext'

alias o='pth'

alias oo-l='pwd ../      ; l  ../      '
alias ooo-l='pwd ../../   ; l  ../../   '
alias oooo-l='pwd ../../../; l  ../../../'

alias oo-ll='pwd ../      ; ll ../      '
alias ooo-ll='pwd ../../   ; ll ../../   '
alias oooo-ll='pwd ../../../; ll ../../../'

alias oo-lf='pwd ../      ; lf ../'
alias ooo-lf='pwd ../../   ; lf ../../'
alias oooo-lf='pwd ../../../; lf ../../../'

alias to='touch'
alias to-clr=':>'
alias to-add-line-emp='echo "" >>'

alias tmp='file_tmp'

alias mv='mv -i'
alias rn='rename'

alias cp='cp -ip'
alias fdpl='file_dpl'

alias rm='rm -i'
alias trsh='trash -F'

alias chmod-cp='chmod-ref'

# alias e='echo'

alias line= 'cat_line'


# nvim
# alias nvim='env NVIM_APPNAME=nvim_my nvim'
alias vi='nvim -p'
alias vim='nvim -p'
alias vi-lf='nvim -p ( lf )'

# git
alias ji='git'
alias j='git status'
alias jc='git-st-my'

alias jl-dflt='git log'
alias jld='jl-dflt'
alias jl-line='git-log-line'
alias jll='jl-line'
alias jl='jl-line'
alias jl-graph='git-log-graph'
alias jlg='jl-graph'

alias jj='git add .; git status'
alias jp='git pll'

# alias jsl='git sl'
# alias jsd='git sd'
# alias jwl='git wl'
# alias jwd='git wd'

alias ji-file-lst-by-st='git-file-lst-by-status'
alias ji-file-lst-by-co='git-file-lst-by-commit-id'
alias ji-co-lst-by-file='git-log-line'
alias ji-co-smry='git-co-summary'

alias get-branch-upstream='git branch --set-upstream-to=origin/main main'
alias ji-b-upstream='get-branch-upstream'

alias lj='lazygit'

alias dif='difft'
alias di='difft'


# alias pd='podman'
# alias pl='podman container ls -a'
# alias pil='podman image ls'
# alias pnl='podman network ls'
## alias pdcl='podman container ls -a'
## alias pdil='podman image ls'


# date
export LC_TIME=en_US
alias da="date_ymd"
alias da_y1="date_y 1"
alias da_y2="date_y 2"
alias date_y1="date_y 1"
alias date_y2="date_y 2"

alias date-utc='date_utc_fr_jst'
alias utc='date_utc_fr_jst'

alias ca='cal'
alias ca-y='cal-y'

alias du='du -h'
alias du-1='du -hd1'
alias df='df -h'

# alias x='xargs'

alias zip-un='unzip'

alias pw-gen='pwgen'
alias pw-cre='pwgen'

alias clc='math'

# alias cnt='count'

alias tbl='/usr/bin/column -t'

alias mb-chk='file -i'

alias trns='trans {en=ja}'
alias trns-e2j='trans {en=ja}'
alias trns-j2e='trans {ja=en}'

alias e='eng-teacher'
alias q='ai-chat'


# nginx
alias nx-vi-cnf='vi /etc/nginx/nginx.conf'
alias nx-start-re='sudo nginx -s reload'

# uconv
# alias uconv='/opt/homebrew/Cellar/icu4c/73.2/bin/uconv'
alias uconv='/home/linuxbrew/.linuxbrew/Cellar/icu4c@77/77.1/bin/uconv'
alias ucnv='uconv'
alias sjis='ucnv_sjis'

# wez
alias wez-color-scheme-lua-clp='echo "window:get_config_overrides().color_scheme" | clp'

# variety
# alias ba='battery' # mac
alias wthr='weather'
alias mtrx='cmatrix'
alias ncat='nyancat'
alias nc='nyancat'
alias rcat='lolcat'
alias tmr='countdown'

# alias rf='ruff'


# 
# plgin
# 

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list \
  '' \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

## cmd-line color

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=250'


# 
# node
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"          ] && \. "$NVM_DIR/nvm.sh"           # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


