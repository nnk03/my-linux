#!/bin/bash

# Array of APT packages to install
packages=(
	build-essential
	vim
	git
	curl
	vim-gtk3
	stow
	zsh
	xclip
	wl-clipboard
	zoxide
	kitty
	ripgrep
)

echo "Updating package lists..."
sudo apt update

echo "Upgrading installed packages..."
sudo apt upgrade -y

echo "Installing APT packages..."
for pkg in "${packages[@]}"; do
	if dpkg -s "$pkg" &>/dev/null; then
		echo "$pkg is already installed."
	else
		echo "Installing $pkg..."
		if sudo apt install -y "$pkg"; then
			echo "$pkg installed successfully."
		else
			echo "APT_PACKAGE - $pkg" >>"$ERROR_LOG"
			echo "Failed to install $pkg. Logged to $ERROR_LOG"
		fi
	fi
done

echo "All APT packages processed."
