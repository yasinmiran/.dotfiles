#!/usr/bin/env bash

# Homebrew setup

export HOMEBREW_BUNDLE_FILE="macos/Brewfile"

if command -v brew &>/dev/null; then
  echo "Hey $USER, homebrew is already installed :)"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --verbose &&
  brew cleanup &&
  brew bundle dump -v --force --describe

# Github setup

ssh-keygen -t ed25519 -C "wytm97@protonmail.com"
eval "$(ssh-agent -s)"
cat >~/.ssh/config <<EOF
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
echo "Please add the following public key to GitHub 🐙"
cat ~/.ssh/id_ed25519.pub
echo "After you add the key execute: 'ssh -T git@github.com' to see whether its working."

# OMZ setup

# First of all, make zsh my default shell.
if [ "/bin/zsh" != "$(which zsh)" ]; then
  # Attempt to change the shell using sudo, capturing any error.
  if ! sudo chsh -s "$(which zsh)" 2>/dev/null; then
    # If the first attempt fails, try changing the shell for the current user without sudo
    if ! chsh -s "$(which zsh)" 2>/dev/null; then
      # If both attempts fail, provide instructions for manual change
      echo "Unable to change the default shell automatically."
      echo "Please change your default shell manually using: chsh -s $(which zsh) or chsh"
      echo "You might need to enter your password."
    else
      echo "Successfully changed the default shell to zsh for $USER."
    fi
  else
    echo "Successfully changed the default shell to zsh with root privileges."
  fi
else
  echo "Hey $USER, zsh is already your default shell :) doing my happy dance..."
fi

if ! xcode-select --print-path &>/dev/null; then
  # Proceed to install if not-installed
  echo "Installing Xcode CLI" && xcode-select --install &>/dev/null
  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &>/dev/null; do
    sleep 5
  done
  echo $? 'Install Xcode Command Line Tools.'
  # Point the `xcode-select` developer directory to the appropriate directory
  # from within `Xcode.app` https://github.com/alrra/dotfiles/issues/13
  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
  # Prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10
  sudo xcodebuild -license
  echo $? 'Agree with the Xcode Command Line Tools licence.'
else
  echo "Xcode Command Line Tools already installed."
fi

if [[ -d "$OMZ_INSTALLATION_PATH" ]]; then
  echo "Oh-My-Zsh is already installed. Trying to update..."
  if command -v omz &>/dev/null; then
    command -v omz
  fi
else
  url=https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
  sh -c "$(curl -fsSL $url)" NUL --keep-zshrc
  unset url
fi
