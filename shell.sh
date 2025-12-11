#!/bin/env sh

# shell_name="${SHELL##*/}"
shell_name="$(basename $SHELL)"

_script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
source "$_script_dir/profile.sh"

# Homebrew setup
# https://docs.brew.sh/Manpage#environment
export HOMEBREW_BAT=true

# Aliases
alias ls="lsd"
alias l="ls -l"
alias ll="lsd -lh"
alias la="lsd -a"
alias lla="lsd -lah"
alias lt="lsd --tree"
alias cat="bat"
alias cd="z"
alias cd..="cd .."
# alias py="python3"
# alias python="python3"
# alias pie="python3"
# alias python-venv="python3 -m venv ${VIRTUAL_ENV:-.venv} --upgrade-deps"
alias python-install-requirements="python3 -m pip install --upgrade --requirement requirements.txt"
alias tfs="tfswitch"
alias tf="opentofu"
alias brewfile-install="brew bundle --file $_script_dir/brewfile --upgrade"
alias brewfile-cleanup="brew bundle cleanup --file $_script_dir/brewfile --force"
alias brewfile-edit="code $_script_dir/brewfile"
alias brewfile="brewfile-edit"

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
