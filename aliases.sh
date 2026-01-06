#!/usr/bin/env sh

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

# Basic command aliases
alias ls="lsd"
alias l="ls -l"
alias ll="lsd -lh"
alias la="lsd -a"
alias lla="lsd -lah"
alias lt="lsd --tree"
alias cat="bat"
export HOMEBREW_BAT=true # https://docs.brew.sh/Manpage#environment
alias cd="z"
alias gearlever="flatpak run it.mijorus.gearlever" # gearlever.mijorus.it/docs/update-source/
alias neofetch="fastfetch"
alias neowofetch="fastfetch"

# Brewry
alias brewfile-edit="brew bundle edit"
alias brewfile="brewfile-edit"
alias brewfile-check="brew bundle check"
alias brewfile-install="brew bundle --upgrade"
alias brewfile-cleanup="brew bundle cleanup --force"

# Python serpentings
# alias py="python3"
# alias python="python3"
# alias pie="python3"
# alias python-venv="python3 -m venv ${VIRTUAL_ENV:-.venv} --upgrade-deps"
alias python-install-requirements="python3 -m pip install --upgrade --requirement requirements.txt"

# Terraforming and Tofu cooking machinery
alias tfs="tfswitch"
alias tf="opentofu"
