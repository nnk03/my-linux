#!/usr/bin/env bash

CLONE_DIR='$HOME/my-linux/ubuntu'

# -----------------------------------------------------------------
# Stage 0 – sanity-check URLs / commands (comment-out once verified)
# -----------------------------------------------------------------
stage_0() {
	echo "⚠️  VERIFY that the following URLs / commands are correct *before* running:"
	echo "   • Homebrew install script"
	echo "   • Oh-My-Zsh install script"
	echo "   • Zsh-plugin git URLs"
	echo "   • Rust install script"
	echo "Then comment-out or remove stage_0 in this file."
	exit 1
}

# -----------------------------------------------------------------
# Stage 1 – ensure Zsh is the login shell
# -----------------------------------------------------------------
stage_1() {
	echo -e "\n🛠  Stage 1: Ensure Zsh is the default shell"
	read -r -p "Press ENTER to continue..."
	ensure_zsh_shell
	echo "➡️  If your shell was changed, please LOG OUT and LOG BACK IN, then rerun the script."
}

# -----------------------------------------------------------------
# Stage 2 – install Oh My Zsh
# -----------------------------------------------------------------
stage_2() {
	echo -e "\n🛠  Stage 2: Install Oh-My-Zsh"
	read -r -p "Press ENTER to install Oh-My-Zsh..."
	install_oh_my_zsh
}

# -----------------------------------------------------------------
# Stage 3 – install Powerlevel10k theme
# -----------------------------------------------------------------
stage_3() {
	echo -e "\n🛠  Stage 3: Install Powerlevel10k theme"
	read -r -p "Press ENTER to install Powerlevel10k..."
	install_powerlevel10k
	echo -e "\n⚠️  Set your terminal font to “Meslo LGS Nerd Font Mono”, restart the terminal, then continue."
	read -r -p "Press ENTER once the font is set..."
}

# -----------------------------------------------------------------
# Stage 4 – install core Zsh plugins
# -----------------------------------------------------------------
stage_4() {
	echo -e "\n🛠  Stage 4: Install Zsh plugins"
	install_zsh_plugins
	echo "✅  Plugins installed and ~/.zshrc updated."
}

# -----------------------------------------------------------------
# Stage 5 – ensure Homebrew is present
# -----------------------------------------------------------------
stage_5() {
	echo -e "\n🛠  Stage 5: Ensure Homebrew is installed"
	read -r -p "Press ENTER to check / install Homebrew..."
	ensure_homebrew_installed
}

# -----------------------------------------------------------------
# Stage 6 – install packages (apt / brew)
# -----------------------------------------------------------------
stage_6() {
	echo -e "\n🛠  Stage 6: Install additional packages"
	source "$CLONE_DIR/install_packages.sh"
}

# -----------------------------------------------------------------
# Stage 7 – install TPM for tmux
# -----------------------------------------------------------------
stage_7() {
	echo -e "\n🛠  Stage 7: Install Tmux Plugin Manager (TPM)"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm ||
		echo "TPM already cloned."
}

# -----------------------------------------------------------------
# Stage 8 – install Rust toolchain
# -----------------------------------------------------------------
stage_8() {
	echo -e "\n🛠  Stage 8: Install Rust (rustup + cargo)"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
}

# -----------------------------------------------------------------
# Stage 9 – clone personal dotfiles and run stow
# -----------------------------------------------------------------
stage_9() {
	echo -e "\n🛠  Stage 9: Clone dotfiles repo and run stow"
	read -r -p "Press ENTER after you have cloned your dotfiles into ~/my-dotfiles..."
	if [[ -d ~/my-dotfiles ]]; then
		(cd ~/my-dotfiles && ./stow_setup.sh)
	else
		echo "❌  ~/my-dotfiles not found – skipping stow setup."
	fi
}
