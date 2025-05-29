#!/usr/bin/env bash
#
# ---------------------------------------------------------
#  User environment setup script
# ---------------------------------------------------------
#  Installs & configures:
#    1. Zsh as the default shell
#    2. Oh-My-Zsh
#    3. Powerlevel10k theme
#    4. Core Zsh plugins
#    5. Homebrew
#    6. Apt / Brew packages
#    7. Tmux Plugin Manager (TPM)
#    8. Rust toolchain (rustup + cargo)
#    9. Personal dotfiles (via stow)
#
#  - Follow the prompts and press ENTER to continue at each step.
#  - Some steps require you to log out/in or restart your terminal.
# ---------------------------------------------------------

set -e # Stop on first error

source "./stages.sh"
source "./setup_utils.sh"
source "./apt_install.sh"

# ---------------------------------------------------------
# Set up working directory and progress tracking
# ---------------------------------------------------------
cd ~/

CLONE_DIR="$HOME/my-dotfiles"
STAGE_FILE="$CLONE_DIR/stage_number.txt"

# Initialize stage tracking file if not present
if [[ ! -f "$STAGE_FILE" ]]; then
	echo 0 >"$STAGE_FILE"
fi

# Read last completed stage
last_completed_stage=$(cat "$STAGE_FILE")

# ---------------------------------------------------------
# Define stages in order
# ---------------------------------------------------------
stages=(
	stage_0
	stage_1
	stage_2
	stage_3
	stage_4
	stage_5
	stage_6
	stage_7
	stage_8
	stage_9
)

# ---------------------------------------------------------
# Execute remaining stages
# ---------------------------------------------------------
for i in "${!stages[@]}"; do
	if ((i > last_completed_stage)); then
		echo -e "\n🔧 Running ${stages[$i]} (Stage $i)"
		"${stages[$i]}"
		echo "$i" >"$STAGE_FILE"
	else
		echo "✅ Skipping ${stages[$i]} (already completed)"
	fi
done

# ---------------------------------------------------------
# Final message
# ---------------------------------------------------------
echo -e "\n🎉  All stages completed!"
echo "• Install Neovim via Homebrew or another method, then update your plugins."
echo "• Enjoy your customized shell environment!"
