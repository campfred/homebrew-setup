#!/bin/env sh

# shell_name="${SHELL##*/}"
shell_name="$(basename $SHELL)"

_script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
source "$_script_dir/profile.sh"

# Homebrew setup
# https://docs.brew.sh/Manpage#environment
export HOMEBREW_BAT=true

# Aliases
source "$_script_dir/aliases.sh"

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
