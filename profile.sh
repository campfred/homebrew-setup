#!/bin/env sh

# Base shell configuration
export HISTCONTROL=ignoreboth:erasedups
export EDITOR="code --wait"
export VISUAL="code --wait"
# export BASE_SHELL=${SHELL##*/}
        
# Homebrew setup
export HOMEBREW_BUNDLE_FILE="$(dirname $0)/.homebrew/brewfile"
export HOMEBREW_NO_ANALYTICS=true

# # Pyenv setup
# # https://github.com/pyenv/pyenv
# # curl -fsSL https://pyenv.run | bash
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - ${SHELL##*/})"
# eval "$(pyenv virtualenv-init -)"
