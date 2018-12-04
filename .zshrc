# zsh settings

# Get set, umask!
umask 027

# Set name of the theme to load.
ZSH_THEME="duly-oneline"

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

# -- preferences
	#bindkey -e # zsh emacs-mode.
	bindkey -v # zsh vi-mode!
	export KEYTIMEOUT=10 # Delay between entering from 'viins' to 'vicmd'.

	bindkey -M viins '^[[3~' delete-char # Delete
	bindkey -M viins '^[[H' beginning-of-line # Home
	bindkey -M viins '^[[F' end-of-line # End

# -- environment
	# ZSH_CUSTOM=/path/to/new-custom-folder

	export PATH=$PATH:~/bin # User binaries.
	export PATH=$PATH:~/go/bin # Golang, binaries installed with 'go get'.
        export PATH=$PATH:~/.cabal/bin # Haskell, binaries installed with cabal.
	export GOPATH=~/go

	export EDITOR="nvim"

# -- aliases
	# directories: ~alias
	hash -d Git=/home/${USER}/Git
	hash -d sh=/home/${USER}/sh

	hash -d mnt=/run/media/${USER}/

	# commands: alias
	alias minecraft="~sh/minecraft.sh"
	alias rgr="ranger"
	alias la="ls -lAh --color"
	alias lss="ls -sh1 --color"
	alias duu="du -hd 1"
	alias ip="ip -c"
	alias hd="hexdump -C"
	alias bc="bc -q"
	#alias ku="kubectl"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

