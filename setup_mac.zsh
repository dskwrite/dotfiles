#!/usr/bin/env zsh

if test $(which brew); then
	echo "Homebrew: Already installed"
else
	echo "Hombrew: Starting install ..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo "Hombrew: Install completed"
fi

if test $(which nu); then
	echo "Nushell: Already installed"
else
	echo "Nushell: Starting install ..."
	/opt/homebrew/bin/brew install nushell
	echo "Nushell: Install completed"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
# add configuration symlinks
/opt/homebrew/bin/nu ~/.dotfiles/install_apps_mac.nu
# add mac settings