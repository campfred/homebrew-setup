#!/usr/bin/env sh

shell_name="$(basename $SHELL)"

# Shell autocompletion setup
case "$shell_name" in
    bash)
        if [ -f /usr/local/etc/bash_completion ]
        then
            . /usr/local/etc/bash_completion
        elif [ -f /etc/bash_completion ]
        then
            . /etc/bash_completion
        elif [ -f /opt/homebrew/etc/bash_completion.d ]
        then
            . /opt/homebrew/etc/bash_completion.d
        fi
        ;;
    zsh)
        autoload -Uz compinit
        compinit
        autoload -Uz bashcompinit
        bashcompinit
        ;;
    fish)
        # No explicit setup needed as Fish has its own autocompletion system enabled by default
        ;;
    *)
        # Unknown shell, skip
        ;;
esac

# Autocompletion setup
if command -v pip &> /dev/null
then
    eval "$(python3 -m pip completion --$shell_name)" # https://pip.pypa.io/en/stable/user_guide/#command-completion
fi
if command -v docker &> /dev/null
then
    eval "$(docker completion $shell_name)" # https://docs.docker.com/engine/cli/completion
fi
if command -v talosctl &> /dev/null
then
    eval "$(talosctl completion $shell_name)" # https://docs.siderolabs.com/talos/v1.11/reference/cli#talosctl-completion
fi
if command -v kubectl &> /dev/null
then
    eval "$(kubectl completion $shell_name)" # https://kubernetes.io/docs/reference/kubectl/quick-reference/#kubectl-autocomplete
fi
if command -v helm &> /dev/null
then
    eval "$(helm completion $shell_name)" # https://helm.sh/docs/helm/helm_completion/
fi
if command -v fnm &> /dev/null
then
    eval "$(fnm completions --shell $shell_name)" # https://github.com/Schniz/fnm#completions
fi
if command -v doppler &> /dev/null
then
    eval "$(doppler completion 2> /dev/null)" # https://docs.doppler.com/docs/cli#shell-completion
fi
