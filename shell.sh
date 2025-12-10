#!/bin/env sh

local base_shell="${SHELL##*/}"

# source "$(dirname $0)/profile.sh" # Already run in .bash_profile

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
alias brewfile-install="brew bundle --file $(dirname $0)/brewfile --upgrade"
alias brewfile-cleanup="brew bundle cleanup --file $(dirname $0)/brewfile --force"
alias brewfile-edit="code $(dirname $0)/.homebrew/brewfile"
alias brewfile="brewfile-edit"

# Shell setup
eval "$(thefuck --alias)"
eval "$(thefuck --alias FUCK)"
eval "$(thefuck --alias heck)"
eval "$(thefuck --alias dammit)"
eval "$(thefuck --alias goddammit)"
eval "$(thefuck --alias wat)"
eval "$(direnv hook $base_shell)"
eval "$(zoxide init $base_shell)"
eval "$(fnm env --use-on-cd --shell $base_shell)"
eval "$(starship init $base_shell)"

# Fun init stuff
fastfetch
