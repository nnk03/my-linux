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
	eza
	zoxide
	kitty
)

# Check for the below things
# Latex

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
		sudo apt install -y "$pkg"
	fi
done

echo "All APT packages processed."
