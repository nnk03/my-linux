#!/bin/bash

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
