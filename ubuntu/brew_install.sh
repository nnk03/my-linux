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
	# nvim
	fzf
	eza
)

echo "Updating Homebrew..."
brew update

echo "Installing packages..."
for pkg in "${packages[@]}"; do
	if brew list "$pkg" &>/dev/null; then
		echo "$pkg is already installed."
	else
		echo "Installing $pkg..."
		if brew install "$pkg"; then
			echo "$pkg installed successfully."
		else
			echo "BREW_PACKAGE - $pkg" >>"$ERROR_LOG"
			echo "Failed to install $pkg. Logged to $ERROR_LOG"
		fi
	fi
done

echo "All packages processed."
