#!/usr/bin/env sh

shell_name="$(basename $SHELL)"

# Pyenv setup
# https://github.com/pyenv/pyenv
# curl -fsSL https://pyenv.run | bash
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init - $shell_name)"
eval "$(pyenv virtualenv-init -)"
