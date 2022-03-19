#!/bin/bash
#
# macos/bootstrap.sh
#
# An installation script which installs various
# developer dependencies and environmental programs
# for a new MacOS developer machine.
#
echo "Welcome to your new Mac! Running setup scripts"

dotfiles_location="$HOME/.dotfiles"

./install_base_deps.sh
./install_devtools.sh
./install_languages.sh
