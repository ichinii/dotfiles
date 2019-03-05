#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

set bell-style none

alias l='ls'
alias ls='ls --color=auto'
alias la='ls --color=auto -alh'
alias v='vim'
alias vi='vim'
alias grep='grep --color --line-number'
alias f='fzf'
alias fzf='fzf -m'
alias fcd='FZF=$(fzf +m) && cd $(realpath --no-symlinks "$FZF" | xargs dirname)'
alias fadd='FZF=$(fzf -m) && [ -n "$FZF" ] && xargs git add "$FZF"'
alias cal='cal -m'
alias make='make -j $(nproc)'
alias try='. try'
alias term="i3-msg exec \"urxvtc -cd \$(pwd)\" 1> /dev/null"
alias linphone="/opt/linphone-desktop/bin/linphone"
alias scrot='scrot '"'"'%Y-%m-%d__%T__$wx$h.png'"'"' -e '"'"'mv $f '"$HOME"'/.screenshots'"'"
alias iceon='source icepath on'
alias iceoff='source icepath off'
alias icetoggle='source icepath toggle'
alias icestatus='icepath status'

export TERM='xterm-256color'
export VISUAL='vim'
export EDITOR='vi'

#export WORKON_HOME=~/.virtualenvs
#source /usr/bin/virtualenvwrapper.sh

if [ -d "/usr/lib/icecream/bin" ]; then
	export PATH=$PATH:/usr/lib/icecream/bin
fi

if [ -d "$HOME/.bin" ]; then
	export PATH=$HOME/.bin:$PATH
fi

if [ -d "$HOME/.lib" ]; then
	export LD_LIBRARY_PATH=$HOME/.lib:$LD_LIBRARY_PATH
fi

LS_COLORS=$LS_COLORS:'di=0;36:' ; export LS_COLORS

# FZF
#export FZF_DEFAULT_OPTS='-m'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# use
export USE_CONFIG_FILE=$HOME/.use/config.json
export USE_TARGETS_FOLDER=$HOME/.use
export USE_EDITOR=vim

# automacs-ui
export AUTOMACS_MOUSE=1
