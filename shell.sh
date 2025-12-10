#!/bin/env sh

# source "$(dirname $0)/profile.sh" # Already run in .bash_profile
# export BASE_SHELL=$(basename $SHELL) # Use {SHELL##*/} for POSIX-compliance

# Homebrew setup
# https://docs.brew.sh/Manpage#environment
export HOMEBREW_BAT=true
export HOMEBREW_NO_ENV_HINTS=true

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
eval "$(direnv hook ${SHELL##*/})"
eval "$(zoxide init ${SHELL##*/})"
eval "$(fnm env --use-on-cd --shell ${SHELL##*/})"
eval "$(starship init ${SHELL##*/})"

# Autocompletion setup
eval "$(talosctl completion ${SHELL##*/})" # https://docs.siderolabs.com/talos/v1.11/reference/cli#talosctl-completion
eval "$(kubectl completion ${SHELL##*/})" # https://kubernetes.io/docs/reference/kubectl/quick-reference/#kubectl-autocomplete
eval "$(helm completion ${SHELL##*/})" # https://helm.sh/docs/helm/helm_completion/
eval "$(fnm completions --shell ${SHELL##*/})" # https://github.com/Schniz/fnm#completions

# Fun init stuff
fastfetch
