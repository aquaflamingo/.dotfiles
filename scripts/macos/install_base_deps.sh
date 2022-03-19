# !/bin/sh
# Install basic dependencies

cat <<-"EOF"
##################################################
# INSTALLING BASIC MACOS DEPENDENCIES
##################################################
EOF

# Perform Xcode Install
echo "\tA. Running xcode-select --install"
xcode-select --install

# Install Homebrew
echo "\tB. Install homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install git
echo "\tC. Installing git via brew"
brew install git
