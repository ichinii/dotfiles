#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
LS_COLORS=$LS_COLORS:'di=0;36:' ; export LS_COLORS

set bell-style none

alias l='ls'
alias ls='ls --color=auto'
alias la='ls --color=auto -alh'
alias v='vim'
alias vi='vim'
alias t="i3-msg exec \"urxvtc -cd \$(pwd)\" 1> /dev/null"
alias grep='grep --color --line-number'
alias f='fzf'
alias ff='export F=$(fzf)'
alias ef='echo "$F"'
alias fzf='fzf -m'
alias fcd='FZF=$(fzf +m) && cd $(realpath --no-symlinks "$FZF" | xargs dirname)'
alias fadd='FZF=$(fzf -m) && [ -n "$FZF" ] && xargs git add "$FZF"'
alias cal='cal -m'
alias make='make -j $(nproc)'
cmake() { /bin/cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=true $@ && cp compile_commands.json "$(cmake_source_dir)"; }
alias try='source try'
alias linphone="/opt/linphone-desktop/bin/linphone"
alias scrot='scrot '"'"'%Y-%m-%d_%H-%M-%S_$wx$h.png'"'"' -e '"'"'mv $f '"$HOME"'/.screenshots'"'"
alias iceon='source icepath on'
alias iceoff='source icepath off'
alias icetoggle='source icepath toggle'
alias icestatus='icepath status'

export TERM='xterm-256color'
export VISUAL='vim'
export EDITOR='vi'

if [ -d "/usr/lib/icecream/bin" ]; then
	export PATH=$PATH:/usr/lib/icecream/bin
fi

if [ -d "$HOME/.bin" ]; then
	export PATH=$HOME/.bin:$PATH
fi

if [ -d "$HOME/.lib" ]; then
	export LD_LIBRARY_PATH=$HOME/.lib:$LD_LIBRARY_PATH
fi

# FZF
#export FZF_DEFAULT_OPTS='-m'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# use
export USE_CONFIG_FILE=$HOME/.use/config.json
export USE_TARGETS_FOLDER=$HOME/.use
export USE_EDITOR=vim

# local extra conf
if [ -f "$HOME/.bashrc_local" ]; then
	source "$HOME/.bashrc_local"
fi
