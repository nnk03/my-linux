#!/usr/bin/env bash

# ------------------------------------------
# User environment setup script
# Installs and configures:
# - Zsh shell as default shell
# - Oh My Zsh framework
# - Powerlevel10k theme
# - Essential Zsh plugins
# - Homebrew package manager and packages
#
# NOTE:
# 1. Follow prompts carefully and press ENTER to continue
# 2. Some steps require you to log out and log back in
# 3. You need to configure your terminal font manually for best appearance
# ------------------------------------------

# If debian
# switch to root and run the below command
# usermod -aG sudo username
# and then reboot

set -e # Exit immediately if any command fails

echo "Ensure HOMEBREW and OH_MY_ZSH and the ZSH PLUGINS LINK are valid"
echo "AND THEN COMMENT THESE LINES"
exit

# Move to home directory
cd ~/

# Load utility functions and package installer script
source "./setup_utils.sh"
source "./apt_install.sh"

echo "STEP 1: Ensure Zsh is your default shell"
echo "If your current shell is not Zsh, you will be prompted to change it."
read -r -p "Press ENTER to continue..."
ensure_zsh_shell

echo "IMPORTANT: If your shell was changed, please LOG OUT and LOG BACK IN before proceeding."
read -r -p "Press ENTER to continue..."

echo "STEP 2: Install Oh My Zsh framework"
read -r -p "Press ENTER to install Oh My Zsh..."
install_oh_my_zsh

echo "STEP 3: Install Powerlevel10k theme for Oh My Zsh"
read -r -p "Press ENTER to install Powerlevel10k theme..."
install_powerlevel10k

echo ""
echo "IMPORTANT: Change your terminal's font to 'Meslo LGS Nerd Font Mono' for proper Powerlevel10k display."
echo "After changing the font, quit and reopen your terminal."
read -r -p "Press ENTER once you have done this..."

echo "STEP 4: Install essential Zsh plugins (autosuggestions, syntax highlighting, etc.)"
install_zsh_plugins
echo "Zsh plugins installed and .zshrc updated."

echo ""
echo "STEP 5: Ensure Homebrew package manager is installed"
read -r -p "Press ENTER to check/install Homebrew..."
ensure_homebrew_installed

echo "STEP 6: Install packages using Homebrew or your package manager"
source "./install_packages.sh"

echo ""
echo "FINAL NOTES:"
echo "- Install Neovim via Homebrew or your preferred method."
echo "- Make sure your Neovim plugins are up to date."
echo "- Enjoy your customized shell environment!"
