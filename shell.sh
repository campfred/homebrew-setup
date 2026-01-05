#!/usr/bin/env sh

shell_name="$(basename $SHELL)"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

source "$script_dir/profile.sh" # Already called from ~/.bash_profile but it seems like its setup is missing sometimes without calling it again...

# Autocompletion setup
source "$script_dir/completion.sh"

# Aliases
source "$script_dir/aliases.sh"

# Shell setup
eval "$(thefuck --alias)"
eval "$(thefuck --alias FUCK)"
eval "$(thefuck --alias heck)"
eval "$(thefuck --alias dammit)"
eval "$(thefuck --alias goddammit)"
eval "$(thefuck --alias wat)"
eval "$(direnv hook $shell_name)"
eval "$(zoxide init $shell_name)"
eval "$(fnm env --use-on-cd --shell $shell_name)"
eval "$(starship init $shell_name)"

# Fun init stuff
fastfetch
