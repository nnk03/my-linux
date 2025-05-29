#!/bin/bash

# Array of packages to install
packages=(
	node
	tmux
	python
	yazi
	bat
	lazygit
	lazydocker
)

echo "Updating Homebrew..."
brew update

echo "Installing packages..."
for pkg in "${packages[@]}"; do
	if brew list "$pkg" &>/dev/null; then
		echo "$pkg is already installed."
	else
		echo "Installing $pkg..."
		brew install "$pkg"
	fi
done

echo "All packages processed."
