#!/usr/bin/env sh

if command -v ssh &> /dev/null
then
  echo "SSH is installed."
else
  echo "Error: SSH is not installed. Please install SSH and re-run this script."
  exit 1
fi

if command -v git &> /dev/null
then
  echo "Git is installed."
else
  echo "Error: Git is not installed. Please install Git and re-run this script."
  exit 1
fi

default_ssh_key_algo="ed25519"
default_ssh_key_path="$HOME/.ssh/id_$default_ssh_key_algo"
ssh_key_path="${1:-$default_ssh_key_path}"
ssh_pubkey_path="$ssh_key_path.pub"
ssh_key_comment="${2:-$USER@$(hostname)}"
platforms=(
  "codeberg.org"
  "gitlab.com"
  "github.com"
  "bitbucket.org"
)

echo "Checking that the SSH key $ssh_pubkey_path exists…"
if [ ! -f "$ssh_pubkey_path" ]
then
  echo "No SSH key found at $ssh_pubkey_path."
  read -p "Would you like to generate an SSH key now? (y/n): " choice_generate_ssh_key
  if [ "$choice_generate_ssh_key" = "y" ] || [ "$choice_generate_ssh_key" = "Y" ]
  then
    ssh-keygen -t $default_ssh_key_algo -C $ssh_key_comment -f $ssh_key_path
    if [ $? -ne 0 ]
    then
      echo "Error: Failed to generate an SSH key."
      exit 1
    fi
  else
    echo "Please generate an SSH key and re-run this script."
    echo "If using another path than $ssh_pubkey_path, provide it as the first argument."
    echo "If using an SSH agent (therefore inly having the public key present on disk), provide the private key's path like if jt wojld exist along side the public key."
    echo "Recommended best practices for generating an SSH key:"
    echo "  - Use a unique key for each device (which this script helps facilitate)"
    echo "  - Use the $default_ssh_key_algo algorithm for better security and performance (which this script helps facilitate, more info: https://blog.vitalvas.com/post/2025/03/01/comparing-ssh-keys-rsa-ecdsa-ed25519/)"
    echo "  - Protect your private key with a strong passphrase"
    echo "  - Regularly review and rotate your keys"
    echo "Example command: ssh-keygen -t $default_ssh_key_algo -C $ssh_key_comment -f $default_ssh_key_path"
    exit 1
  fi
fi
echo "SSH key $ssh_pubkey_path found."



if command -v gh &> /dev/null
then
  echo "\nSetting up GitHub CLI…"

  echo " - Logging in with SSH protocol for Git operations…"
  gh auth login --git-protocol ssh --skip-ssh-key --web

  echo " - Adding SSH key $ssh_pubkey_path to GitHub account as authentication and signing keys…"
  gh ssh-key add $ssh_pubkey_path --type authentication --title $ssh_key_comment
  gh ssh-key add $ssh_pubkey_path --type signing --title $ssh_key_comment
else
  echo "GitHub CLI (gh) not found, skipping GitHub CLI setup."
fi



echo "\nSetting up Git configuration…"
echo " - Redirect to SSH for connecting…"
for platform in "${platforms[@]}"; do
  git config --global url."git@${platform}".insteadOf "https://${platform}"
done

echo " - Use SSH for signing and sign commits by default…"
git config --global gpg.format ssh
# git config --global user.signingKey "$(cat $ssh_pubkey_path)"
git config --global user.signingKey "$ssh_pubkey_path"
git config --global commit.gpgSign true
# https://stackoverflow.com/q/72844616
# https://stackoverflow.com/a/72852713

echo " - Configuring global commit user name and email…"
default_git_username="$USER"
read -p " - - Username to use [$default_git_username]: " git_username
git_username="${git_username:-$default_git_username}"
git config --global user.name "$git_username"
default_git_email="${git_username}@$(hostname)"
read -p " - - Email to use [$default_git_email]: " git_email
git_email="${git_email:-$default_git_email}"
git config --global user.email $git_email



echo "Setting up SSH client configuration…"
echo " - Define the SSH key ($ssh_pubkey_path) to use…"
ssh_config_file="$HOME/.ssh/config"
{
  echo ""
  echo ""
  echo "# Added by $0/setup-git.sh on $(date -I)"
  echo "Host *.git"
  echo "  User git"
  echo "  IdentityFile $ssh_pubkey_path"
  for platform in "${platforms[@]}"
  do
    echo ""
    echo "Host ${platform}"
    echo "  HostName ${platform}"
  done
} >> "$ssh_config_file"

echo "Git setup complete!"
