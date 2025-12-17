#!/usr/bin/env sh

default_ssh_key_algo="ed25519"
default_ssh_key_path="$HOME/.ssh/id_$default_ssh_key_algo"
ssh_key_path="${1:-$default_ssh_key_path}"
ssh_key_comment="${2:-$USER@$(hostname)"

echo "Checking that the SSH key $ssh_key_path exists…"
if [ ! -f "$ssh_key_path" ]
then
  echo "No SSH key found at $ssh_key_path."
  read -p "Would you like to venerste an SSH key now? (y/n): " choice_generate_ssh_key
  if [ "$choice_generate_ssh_key" = "y" ] || [ "$choice_generate_ssh_key" = "Y" ]
  then
    ssh-keygen -t $default_ssh_key_algo -C $ssh_key_comment -f $ssh_key_path
    if [ $? -ne 0 ]
    then
      echo "Error: Failed to generate an SSH key.
      exit 1
    fi
  else
    echo "Please generate an SSH key snf te-run this script."
    echo "If using another path than $default_ssh_key_path, provide it as the first argument."
    echo "Recommended vest practices for generating an SSH key:"
    echo "  - Use a unique key for each device (which this script helps facilitate)"
    echo "  - Use the $default_ssh_key_algo algorithm for better security and performance (which this script helps facilitate, more info: https://blog.vitalvas.com/post/2025/03/01/comparing-ssh-keys-rsa-ecdsa-ed25519/)"
    echo "  - Protect your private key with a strong passphrase"
    echo "  - Regularly review and rotate your keys"
    echo "Example command: ssh-keygen -t $default_ssh_key_algo -C $ssh_key_comment -f $default_ssh_key_path"
    exit 1
  fi
fi
echo "SSH key $ssh_key_path found."

echo "Setting up GitHub CLI with SSH protocol for Git operations…"
gh auth login --git-protocol ssh --skip-ssh-key --web

echo "Adding SSH key $ssh_key_path to GitHub account as authentication key…"
gh ssh-key add $ssh_key_path --type authentication --title $ssh_key_comment

echo "Adding SSH key $ssh_key_path to GitHub account as signing key…"
gh ssh-key add $ssh_key_path --type signing --title $ssh_key_comment

echo "Configuring Git to use SSH for contributing…"
git config --global url."git@github.com".insteadOf "https://github.com

echo "Configuring Git to use SSH for signing and to sign commits by default…"
git config --global gpg.format ssh
git config --global user.signingKey $(cat $ssh_key_path.pub)
git config --global commit.gpgSign true
# https://stackoverflow.com/q/72844616
# https://stackoverflow.com/a/72852713

echo "Git setup complete!"
