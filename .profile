###############################################################################
################################### environment ###############################
###############################################################################

# vars
if command -v nvim > /dev/null 2>&1; then
  export EDITOR="nvim"
  alias vim='nvim'
else
  export EDITOR="vim"
fi

export HISTCONTRAL=ignoredups
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTIGNORE="clear:keybase*"
if command -v dircolors > /dev/null 2>&1; then
  eval "$(dircolors -b "$HOME/.config/ls_colors")"
else
  export LSCOLORS=gxfxcxdxbxggedabagacad
fi
export CLICOLOR=1
if command -v ag > /dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore .sass-cache --ignore npm_modules -g ""'
fi
export FZF_DEFAULT_OPTS=""
export LYNX_CFG="$HOME/.config/lynx/config"
export CURL_HOME="$HOME/.config/curl"
export WWW_HOME="gopher://gopher.black"

# path vars
export SYNCTHING_PATH="$HOME/.syncthing"
export SSH_ENV="$HOME/.ssh/environment"
export NODE_PATH="/usr/local/lib/jsctags:/usr/local/lib/node:${HOME}/.yarn/bin:/usr/bin/npm"
export ANDROID_HOME="$HOME/sdk"

# lastpass
export LPASS_HOME="$HOME/.lpass"
export LPASS_DISABLE_PINENTRY=1
export SSH_KEY_LOCATIONS="${HOME}/.ssh/ ${HOME}/.spideroak/Documents/Keys/personal/ssh/ ${HOME}/.spideroak/Documents/Keys/work/ssh/"

# personal app storage paths
export TODO="$SYNCTHING_PATH/todo/personal.txt"
export NOTE_DIR="$SYNCTHING_PATH/notes"
export CONTACTS_DIR="$SYNCTHING_PATH/contacts"
export TRACK_DIR="$SYNCTHING_PATH/track"

# system
export TZ="Atlantic/Reykjavik"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# colors
export TERM=screen-256color
DIRECTORY_COLOR="$(tput setaf 222 0 0)"; export DIRECTORY_COLOR
PROMPT_COLOR="$(tput setaf 226 0 0)"; export PROMPT_COLOR
HOST_COLOR="$(tput setaf 213 0 0)"; export HOST_COLOR
RESET_COLOR="$(tput sgr0)"; export RESET_COLOR

# less and man colors
LESS_TERMCAP_mb=$(tput bold; tput setaf 2 0 0); export LESS_TERMCAP_mb
LESS_TERMCAP_md=$(tput bold; tput setaf 6 0 0); export LESS_TERMCAP_md
LESS_TERMCAP_me=$(tput sgr0); export LESS_TERMCAP_me
LESS_TERMCAP_so=$(tput bold; tput setaf 3 0 0; tput setab 4 0 0); export LESS_TERMCAP_so
LESS_TERMCAP_se=$(tput rmso; tput sgr0); export LESS_TERMCAP_se
LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7 0 0); export LESS_TERMCAP_us
LESS_TERMCAP_ue=$(tput rmul; tput sgr0); export LESS_TERMCAP_ue
LESS_TERMCAP_mr=$(tput rev); export LESS_TERMCAP_mr
LESS_TERMCAP_mh=$(tput dim); export LESS_TERMCAP_mh
LESS_TERMCAP_ZV=$(tput rsubm); export LESS_TERMCAP_ZV
LESS_TERMCAP_ZW=$(tput rsupm); export LESS_TERMCAP_ZW
export GROFF_NO_SGR=1;

# Base16 Tomorrow Night
_gen_fzf_default_opts() {
  color00='#1d1f21'
  color01='#282a2e'
#  color02='#373b41'
#  color03='#969896'
  color04='#b4b7b4'
#  color05='#c5c8c6'
  color06='#e0e0e0'
#  color07='#ffffff'
#  color08='#cc6666'
#  color09='#de935f'
  color0A='#f0c674'
#  color0B='#b5bd68'
  color0C='#8abeb7'
  color0D='#81a2be'
#  color0E='#b294bb'
#  color0F='#a3685a'

  export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  "
}
_gen_fzf_default_opts

# less settings
export PAGER=less

# path
path() { [ -d "$1" ] && PATH="${PATH}${PATH:+:}${1}"; }
PATH=/bin
path "/sbin"
path "/usr/bin"
path "/usr/sbin"
path "/usr/games"
path "/usr/pkg/bin"
path "/usr/local/sbin"
path "/usr/local/bin"
path "/usr/X11/bin"
path "/opt/local/bin"
path "/opt/local/sbin"
path "${HOME}/bin"
path "${HOME}/.yarn/bin"
path "${HOME}/.config/yarn/global/node_modules/.bin"
path "${HOME}/.node/bin"
path "${HOME}/.local/bin"
path "${HOME}/.fzf/bin"

# PROMPT COMMANDS
PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"

# umask liberal
umask 0022

# use vim on the command line
set -o vi

# Load functions
if [ -d "${HOME}/.functions" ]; then
  for f in "${HOME}/.functions/"*; do
    . "$f"
  done
fi

# basic shell aliases
if command -v colorls > /dev/null 2>&1; then
  alias ls='colorls -G'
  unset LSCOLORS
else
  alias ls='ls --color'
fi
alias lsd='ls -Gl | grep "^d"'
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# aliases to default commands with certain switches
alias grep='grep --color=auto'
alias mkdir='mkdir -p'

# utils
alias imgsz='sips -g pixelWidth -g pixelHeight'
alias lynx='lynx -display_charset=utf8 --lss=/dev/null'
alias utc='date -u +%H:%M:%S'

# vim
alias vimr='vim -u DEFAULTS -U NONE -i NONE'

# git
alias gs="git status"

# tmux
alias tmux='tmux -u2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias t='tmux attach || tmux new'

alias beat='echo "x = (`date +%s` + 3600) % 86400; scale=3; x / 86.4" | bc'

# radio
alias anonradio='mplayer http://anonradio.net:8000/anonradio'
alias tilderadio='mplayer https://radio.tildeverse.org/radio/8000/radio.ogg'
alias sleepbot='mplayer -playlist "http://www.sleepbot.com/ambience/cgi/listen.cgi/listen.pls"'
alias wrti="mplayer http://playerservices.streamtheworld.com/api/livestream-redirect/WRTI_CLASSICAL.mp3"

# youtube-dl to get music
alias getmusic="youtube-dl -x --audio-quality 0 --audio-format mp3"

# javascript
if command -v node > /dev/null 2>&1; then
  export NODE_PATH="/usr/local/lib/jsctags:/usr/local/lib/node:${HOME}/.yarn/bin:/usr/bin/npm"
  [ -d "$HOME/.yarn" ] && PATH=${PATH}:${HOME}/.yarn/bin
  [ -d "$HOME/.config/yarn" ] && PATH=${PATH}:${HOME}/.config/yarn/global/node_modules/.bin
  [ -d "$HOME/.node" ] && PATH=${PATH}:${HOME}/.node/bin
fi

# perl 5
if [ -d "${HOME}/perl5" ]; then
  PATH=${PATH}:${HOME}/perl5/bin
  export PERL5LIB="/home/tomasino/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
  export PERL_LOCAL_LIB_ROOT="/home/tomasino/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
  export PERL_MB_OPT="--install_base 'home/tomasino/perl5'"
  export PERL_MM_OPT="INSTALL_BASE=/home/tomasino/perl5"
  [ -f "$HOME/perl5/perlbrew/etc/bashrc" ] && . "$HOME/perl5/perlbrew/etc/bashrc"
fi

# android sdk
if [ -d "${HOME}/sdk/" ]; then  
  export ANDROID_HOME="$HOME/sdk"
  PATH=${PATH}:${HOME}/sdk/tools
  PATH=${PATH}:${HOME}/sdk/tools/bin
  PATH=${PATH}:${HOME}/sdk/platform-tools
  PATH=${PATH}:${HOME}/sdk/build-tools/25.0.3
fi

USER=$(id -un)
HOSTNAME=$(uname -n)
export PS1='${DIRECTORY_COLOR}$(pwd)${RESET_COLOR}
${HOST_COLOR}${HOSTNAME}${RESET_COLOR}${PROMPT_COLOR}-> ${RESET_COLOR}'
