# zsh settings

# Set name of the theme to load.
ZSH_THEME="duly"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

# oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configurations.

# -- environment
	# ZSH_CUSTOM=/path/to/new-custom-folder

	export PATH=~/bin:$PATH # User binaries.
	export PATH=~/go/bin:$PATH # Golang.
	export GOPATH=~/go

	export EDITOR="nvim"
	export GIT="~/Git"
	export SCRIPTS="~/sh/"

	export mnt="/run/media/blue/"
# -- aliases
	# directories
	alias _html="cd /var/www/html"

	# commands
	alias minecraft="$SCRIPTS/minecraft.sh"
	alias rgr="ranger"
	alias ip="ip -c"
	alias hd="hexdump -C"
	#alias ku="kubectl"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

