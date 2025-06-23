#!/bin/bash

ERROR_LOG="install_errors.log"
>"$ERROR_LOG" # Clear the file at the beginning

echo "Installing Packages using APT"
source ./apt_install.sh
echo "Finished Installing using APT"
echo ""
echo ""

echo "Installing Packages using HomeBrew"
source ./brew_install.sh
echo "Finished Installing using HomeBrew"
echo ""
echo ""

echo "Installing Packages using NPM"
source ./npm_install.sh
echo "Finished Installing using NPM"
echo ""
echo ""
