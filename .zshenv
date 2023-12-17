# $HOME/.zshenv (or $ZDOTDIR/.zshenv)
# When this file exists it will always be read.
# https://wiki.archlinux.org/title/Zsh#Startup/Shutdown_files
#
# Used for setting user's environment variables.  It should not
# produce output or assume the shell is attached to a tty.

if [[ -r /usr/local/bin/brew ]]
then
	eval "$(/usr/local/bin/brew shellenv)"
elif [[ -r /opt/homebrew/bin/brew shellenv ]]
then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Setting up XDG base directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# zsh -- XDG 
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Rust -- XDG
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# Go -- XDG
export GOPATH="$XDG_DATA_HOME"/go

# Python -- XDG
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME"/python
export PYTHONUSERBASE="$XDG_DATA_HOME"/python

# Conan (C/C++) -- XDG
export CONAN_USER_HOME="$XDG_CONFIG_HOME"

# NPM (NodeJS) -- XDG
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

# readline -- XDG
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

# gpg -- XDG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# less -- XDG
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# Homebrew disable analytics
export HOMEBREW_NO_ANALYTICS=1
