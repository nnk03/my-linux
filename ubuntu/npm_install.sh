#!/bin/bash

# Array of npm packages to install globally
packages=(
	tree-sitter-cli
)

echo "Updating npm..."
npm install -g npm

echo "Installing npm packages..."
for pkg in "${packages[@]}"; do
	if npm list -g --depth=0 "$pkg" &>/dev/null; then
		echo "$pkg is already installed globally."
	else
		echo "Installing $pkg..."
		npm install -g "$pkg"
	fi
done

echo "All npm packages processed."
