# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#
# Completion
#
unsetopt flow_control   # disable output flow control in the shell's editor
unsetopt menu_complete  # do not autoselect the first completion entry
setopt always_to_end    # move cursor to the end of the word
setopt auto_menu        # show completion menu on successive tab press
setopt complete_in_word # set cursor to the end of the word if completion is started

zstyle ':completion:*:*:*:*:*' menu select

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

autoload -Uz compinit && compinit

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

#
# Aliases
#
alias vim="nvim"
alias vi="nvim"
alias rm='rm -i'
alias nf='fzf -m --preview "bat --color=always {}" --bind "enter:become(nvim {+})"'

#
# History
#
HISTSIZE=50000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=30000
HISTDUP=erase

setopt append_history       # sessions will append their history list to the history file
setopt extended_history     # record timestamp of command in HISTFILE
setopt hist_find_no_dups    # when searching for history entries in the line editor, do not display duplicates of a line previously found
setopt hist_ignore_all_dups # if a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event)
setopt hist_ignore_dups     # do not enter command lines into the history list if they are duplicates of the previous even
setopt hist_ignore_space    # remove command lines from the history list when the first character on the line is a space
setopt hist_save_no_dups    # when writing out the history file, older commands that duplicate newer ones are omitted
setopt hist_verify          # show command with history expansion to user before running it
setopt inc_append_history   # new history lines are added to the HISTFILE incrementally
setopt share_history        # this option both imports new commands from the history file, and also causes your typed commands to be appended to the history file

#
# Directories
#

# Changing/making/removing directory
setopt auto_pushd        # make `cd` push the old directory onto the directory stack
setopt pushd_ignore_dups # don’t push multiple copies of the same directory onto the directory stack
setopt pushd_minus       # exchanges the meanings of ‘+’ and ‘-’ when used with a number to specify a directory in the stack

alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}

compdef _dirs d

#
# Colors
#

# ls colors
autoload -U colors && colors

# Enable ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# For GNU ls, we use the default ls color theme. They can later be overwritten by themes.
if [[ -z "$LS_COLORS" ]]; then
    (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }

# Take advantage of $LS_COLORS for completion as well.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# enable diff color if possible.
if command diff --color /dev/null /dev/null &>/dev/null; then
  alias diff='diff --color'
fi

setopt auto_cd
setopt multios
setopt prompt_subst

#
# Zsh line editor
#

# Emacs mode
bindkey -e

#
# Syntax highlighting
#

# Fish shell-like command syntax highlighting for Zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#
# Source fuzzy completion and key-bindings for Zsh
#
source <(fzf --zsh)

#
# Dotnet
#

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet

#
# Azure CLI
#
# source "$HOME/lib/azure-cli/az.completion"
