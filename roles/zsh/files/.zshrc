# .zshrc
#
export HISTFILE=$XDG_STATE_HOME/zsh/history
export HISTSIZE=1000000
export SAVEHIST=1000000
export JQ_COLORS="1;30:0;39:0;39:0;39:0;32:1;39:1;39"
export LESS=-FXr
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt INC_APPEND_HISTORY

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

if [[ -x "$HOMEBREW_PREFIX"/bin/starship ]]
then
	eval "$(starship init zsh)"
fi

if [[ -x "$HOMEBREW_PREFIX"/bin/eza ]]
then
	alias ls="$HOMEBREW_PREFIX/bin/eza --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale=all"
	alias ll="$HOMEBREW_PREFIX/bin/eza -l --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale=all"
	alias la="$HOMEBREW_PREFIX/bin/eza -la --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale=all"
fi

autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|wezterm*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

if [[ -r "$HOMEBREW_PREFIX"/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]
then
	source "$HOMEBREW_PREFIX"/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
