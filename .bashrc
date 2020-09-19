#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias f='fzf'
alias v='vim'
alias vi='vim'
alias ls='ls --color=auto'
alias la='ls --color=auto -alh'
alias t="i3-msg exec \"urxvtc -cd \$(pwd)\" 1> /dev/null"
alias c="clear"
alias grep='grep --color --line-number'
alias cal='cal -m'
alias make='make -j $(nproc)'
cmake() { /bin/cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=true $@ && cp compile_commands.json "$(cmake_source_dir)"; }
alias scrot='scrot '"'"'%Y-%m-%d__%T__$wx$h.png'"'"' -e '"'"'mv $f '"$HOME"'/.screenshots'"'"
alias iceon='source icepath on'
alias iceoff='source icepath off'
alias icetoggle='source icepath toggle'
alias icestatus='icepath status'
alias try='. try'
alias ableton='wine "/home/ich/.wine/drive_c/ProgramData/Ableton/Live 10 Trial/Program/Ableton Live 10 Trial.exe"'

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

export FZF_DEFAULT_OPTS='-m'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export USE_TARGETS_FOLDER=$HOME/.use
export USE_CONFIG_FILE=$HOME/.use/config.json
