#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias f='fzf'
alias ff='export F=$(fzf)'
alias ef='echo "$F"'
alias v='vim'
alias vi='vim'
alias ls='ls --color=auto'
alias la='ls --color=auto -alh'
alias grep='grep --color --line-number'
alias cal='cal -m'
alias scrot='scrot '"'"'%Y-%m-%d__%T__$wx$h.png'"'"' -e '"'"'mv $f '"$HOME"'/.screenshots'"'"
alias iceon='source icepath on'
alias iceoff='source icepath off'
alias icetoggle='source icepath toggle'
alias icestatus='icepath status'
alias make='make -j16'
alias try='. try'
alias term="i3-msg exec \"urxvtc -cd \$(pwd)\" 1> /dev/null"
alias linphone="/opt/linphone-desktop/bin/linphone"
alias fadd='git add $(fzf)'
alias fcheckout='git checkout -- $(fzf)'

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

LS_COLORS=$LS_COLORS:'di=0;36:' ; export LS_COLORS

# FZF
export FZF_DEFAULT_OPTS='-m'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# use
export USE_CONFIG_FILE=$HOME/.use/config.json
export USE_TARGETS_FOLDER=$HOME/.use
export USE_EDITOR=vim
