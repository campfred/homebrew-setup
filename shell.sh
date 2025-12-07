source $HOME/.homebrew/profile.sh
export BASE_SHELL=$(basename $SHELL)

# Homebrew setup
# https://docs.brew.sh/Manpage#environment
export HOMEBREW_BAT=true
export HOMEBREW_NO_ENV_HINTS=true

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
alias brewfile="code --wait $HOME/.homebrew/brewfile; brew bundle --file $HOME/.homebrew/brewfile --upgrade"

# Autocompletion setup
source <(talosctl completion $BASE_SHELL) # https://docs.siderolabs.com/talos/v1.11/reference/cli#talosctl-completion
source <(kubectl completion $BASE_SHELL) # https://kubernetes.io/docs/reference/kubectl/quick-reference/#kubectl-autocomplete
source <(helm completion $BASE_SHELL) # https://helm.sh/docs/helm/helm_completion/
source <(fnm completions --shell $BASE_SHELL) # https://github.com/Schniz/fnm#completions

# Shell setup
eval "$(thefuck --alias)"
eval "$(thefuck --alias heck)"
eval "$(thefuck --alias goddammit)"
eval "$(thefuck --alias FUCK)"
eval "$(direnv hook $BASE_SHELL)"
eval "$(zoxide init $BASE_SHELL)"
eval "$(fnm env --use-on-cd --shell $BASE_SHELL)"
eval "$(starship init $BASE_SHELL)"

# Fun init stuff
fastfetch
