# homebrew-setup 🍺

So, this was originally meant to contain only my `brewfile` but it evolved in having also some shell files too for my shell and environments.

## Installing 📥

1. Run `brew bundle --file brewfile` first to install the packages
2. Source the `profile.sh` file in the shell profile script
   - `~/bash_profile.sh` for `bash`
   - `~/zprofile.sh` for `zsh`
3. Start and login to Bitwarden to get the SSH agent ready (might need manual activation too)
4. Run the `setup-git.sh` file to setup git with GitHub login and commit signing using SSH keys

Yay! 🎉
