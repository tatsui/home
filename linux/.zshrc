# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="rkj-repos"
ZSH_THEME="tjkirch"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# Customize to your needs...

################# add PATH ##################
typeset -U path PATH
# Java
#export JAVA_HOME=/usr/lib/jvm/java-7-oracle/jre/
#export JRE_HOME=$HOME/bin/java/jre
#export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
# bin
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin
export PATH=$PATH:$HOME/bin:$HOME/bin/sh:$HOME/bin/python:$HOME/bin/perl
# tools
if [ -d $HOME/bin/tools ] ; then
	for i in `ls $HOME/bin/tools/`
	do
		export PATH=$PATH:$HOME/bin/tools/$i
	done
fi
################# add PATH ##################

if [ `uname` = "Darwin" ]; then
	alias ls='ls -G'
elif [ `uname` = "Linux" ]; then
	#server
	case $TERM in
	linux) LANG=C ;;
	*) LANG=ja_JP.UTF-8 ;;
	esac
fi

# alias
alias nkf.utf8='nkf -w --overwrite'
alias nkf.sjis='nkf -s --overwrite'
alias objdump='objdump -M intel'
alias shutdown.now='sudo shutdown -h now'
alias w3m.tor='torsocks w3m https://www.google.co.jp'
alias w3m.home='w3m https://www.google.co.jp'
alias vi='vim -u NONE --noplugin'
alias xxd='xxd -g 1'
