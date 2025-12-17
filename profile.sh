#!/usr/bin/env sh

shell_name="$(basename $SHELL)"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

# Base shell configuration
export HISTCONTROL=ignoreboth:erasedups
export EDITOR="code --wait"
export VISUAL="code --wait"

# Autocompletion setup
source "$script_dir/completion.sh"

# Homebrew setup
# https://docs.brew.sh/Manpage#environment
export HOMEBREW_BUNDLE_FILE="$(dirname $0)/.homebrew/brewfile"
export HOMEBREW_NO_ANALYTICS=true
export HOMEBREW_NO_ENV_HINTS=true

# TFSwitch setup
# https://tfswitch.warrensbox.com/usage/environment-variables/#tf_binary_path
export TF_BINARY_PATH="${HOMEBREW_PREFIX:-/home/linuxbrew/.linuxbrew}/bin/terraform"
export TF_PRODUCT=opentofu

# SSH Agent setup
export SSH_AUTH_SOCK=$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
