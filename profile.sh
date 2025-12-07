# # Python version management with pyenv
# # https://github.com/pyenv/pyenv
# # curl -fsSL https://pyenv.run | bash
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - $(basename $SHELL))"
# eval "$(pyenv virtualenv-init -)"

# Base shell configuration
export HISTCONTROL=ignoreboth:erasedups
export EDITOR="code --wait"
export VISUAL="code --wait"
export HOMEBREW_BUNDLE_FILE="$HOME/.homebrew/brewfile"
export BASE_SHELL=$(basename $SHELL)