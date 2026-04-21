#!/bin/sh

echo "Setting up your Mac..."

# Ask for computer name upfront
echo "What should this Mac be called? (e.g. MacBook Nikolaj)"
read -r COMPUTER_NAME
export COMPUTER_NAME

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &>/dev/null; then
  echo "Xcode Command Line Tools not found. Installing..."
  xcode-select --install
else
  echo "Xcode Command Line Tools already installed."
fi

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $HOME/.dotfiles/Brewfile || echo "Warning: some Brew packages failed to install, continuing..."

# Create projects directories
mkdir -p $HOME/Code
mkdir -p $HOME/Herd

# Clone Github repositories
$HOME/.dotfiles/clone.sh || echo "Warning: clone.sh encountered errors, continuing..."

# Symlink the Mackup config file to the home directory
ln -sf $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source $HOME/.dotfiles/.macos || echo "Warning: some macOS preferences failed to apply, continuing..."
