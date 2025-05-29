#!/usr/bin/env bash

set -e

HOMEBREW_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
OH_MY_ZSH_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

ensure_zsh_shell() {
	# Change shell to zsh if it's not already the default shell
	if [[ "$SHELL" != "$(which zsh)" ]]; then
		echo "Current shell is not zsh. Press ENTER to change shell to zsh."
		read -r
		chsh -s "$(which zsh)"
	else
		echo "Current shell is already zsh."
	fi
}

ensure_homebrew_installed() {
	if ! command -v brew &>/dev/null; then
		echo "Homebrew not found. Installing..."
		bash -c "$(curl -fsSL "$HOMEBREW_URL")"
	else
		echo "Homebrew is already installed."
	fi
}

install_oh_my_zsh() {
	if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
		echo "Oh My Zsh not found. Installing..."
		sh -c "$(curl -fsSL "$OH_MY_ZSH_URL")"
	else
		echo "Oh My Zsh is already installed."
	fi
}

install_powerlevel10k() {
	local oh_my_zsh_custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
	local theme_dir="$oh_my_zsh_custom/themes/powerlevel10k"

	if [[ ! -d "$theme_dir" ]]; then
		echo "Installing Powerlevel10k theme..."
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$theme_dir"
	else
		echo "Powerlevel10k theme is already installed."
	fi

	# Backup current .zshrc before modifying
	if [[ -f "$HOME/.zshrc" ]]; then
		cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%s)"
	fi

	# If ZSH_THEME line exists, replace it; else add it
	if grep -q '^ZSH_THEME=' "$HOME/.zshrc"; then
		sed -i.bak 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$HOME/.zshrc"
	else
		echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >>"$HOME/.zshrc"
	fi

	echo "Set ZSH_THEME to powerlevel10k in ~/.zshrc"
	echo "If you open a new terminal, you should see the Powerlevel10k configuration wizard."
}

install_zsh_plugins() {
	local plugins_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

	# Install zsh-autosuggestions if missing
	if [[ ! -d "$plugins_dir/zsh-autosuggestions" ]]; then
		git clone https://github.com/zsh-users/zsh-autosuggestions "$plugins_dir/zsh-autosuggestions"
	else
		echo "zsh-autosuggestions plugin already installed."
	fi

	# Install zsh-syntax-highlighting if missing
	if [[ ! -d "$plugins_dir/zsh-syntax-highlighting" ]]; then
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$plugins_dir/zsh-syntax-highlighting"
	else
		echo "zsh-syntax-highlighting plugin already installed."
	fi

	local desired_plugins='plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    web-search
    virtualenv
  )'

	# Backup .zshrc before modifying
	if [[ -f "$HOME/.zshrc" ]]; then
		cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%s)"
	fi

	# Check if plugins line exists (rough check)
	if grep -q '^plugins=(' "$HOME/.zshrc"; then
		# Replace existing plugins line with desired one
		# Note: this replaces only the first plugins=(...) block, assumes it is single-line or multi-line
		# For multiline, a more complex sed or awk script would be needed. This assumes single-line for simplicity.
		sed -i.bak -E '/^plugins=\(.*\)/c\'"$desired_plugins" "$HOME/.zshrc"
	else
		# Append plugins line at the end
		echo -e "\n$desired_plugins" >>"$HOME/.zshrc"
	fi

	echo "Installed plugins and updated plugins list in ~/.zshrc"
}
