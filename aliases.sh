#!/bin/env sh

# Basic command aliases
alias ls="lsd"
alias l="ls -l"
alias ll="lsd -lh"
alias la="lsd -a"
alias lla="lsd -lah"
alias lt="lsd --tree"
alias cat="bat"
alias cd="z"
alias cd..="cd .."

# Python shortcuts
# alias py="python3"
# alias python="python3"
# alias pie="python3"
# alias python-venv="python3 -m venv ${VIRTUAL_ENV:-.venv} --upgrade-deps"
alias python-install-requirements="python3 -m pip install --upgrade --requirement requirements.txt"

# Terraform / OpenTofu shortcuts
alias tfs="tfswitch"
alias tf="opentofu"

# Homebrew Brewfile shortcuts
alias brewfile-edit="code $_script_dir/brewfile"
alias brewfile="brewfile-edit"
alias brewfile-check="brew bundle check --file $_script_dir/brewfile"
alias brewfile-install="brew bundle --file $_script_dir/brewfile --upgrade"
alias brewfile-cleanup="brew bundle cleanup --file $_script_dir/brewfile --force"
