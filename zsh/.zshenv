export GOPATH=$HOME/go

export PATH=$PATH:$GOPATH/bin:$HOME/bin:$HOME/.cargo/bin

# Setting nvim as my default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
export SUDO_EDITOR=$EDITOR

export GPG_TTY=$(tty)

# XDG Base directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Indentation between the right hand side of the right prompt
ZLE_RPROMPT_INDENT=0

# Disable dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Disable Azure cli telemetry
export AZURE_CORE_COLLECT_TELEMETRY=0

# Disable snyk cli analytics
export SNYK_DISABLE_ANALYTICS=1

#path=($path[@] $HOME/something/bin)
