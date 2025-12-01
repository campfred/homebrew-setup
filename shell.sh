# Base shell configuration
export HISTCONTROL=ignoreboth:erasedups

# Homebrew setup
# https://docs.brew.sh/Manpage#environment
export HOMEBREW_BAT=true

# TFSwitch setup
export TF_BINARY_PATH="${HOMEBREW_PREFIX:-/home/linuxbrew/.linuxbrew}/bin/terraform"

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
alias py="python3"
alias python="python3"
alias pie="python3"
alias python-venv="python3 -m venv ${VIRTUAL_ENV:-.venv} --upgrade-deps"
alias python-install-requirements="python3 -m pip install --upgrade --requirement requirements.txt"
alias tf="terraform"
alias tfs="tfswitch"
alias brew-bundle-upgrade="code --wait ~/.homebrew/brewfile; brew bundle --file ~/.homebrew/brewfile --upgrade"

# Shell setup
eval "$(thefuck --alias)"
eval "$(thefuck --alias heck)"
eval "$(thefuck --alias goddammit)"
eval "$(thefuck --alias FUCK)"
eval "$(direnv hook $(basename $SHELL))"
eval "$(zoxide init $(basename $SHELL))"
eval "$(starship init $(basename $SHELL))"
neofetch