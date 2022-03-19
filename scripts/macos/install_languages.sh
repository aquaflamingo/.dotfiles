# !/bin/sh
#
# Installs programming languages and associated tools
#

cat <<-"EOF"
##################################################
# INSTALLING PROGRAMMING TOOLS
##################################################
EOF

echo "A. Installing GoLang"
brew install go

mkdir -p $GOPATH/{bin,src,pkg}

echo "B. Install Ruby 3"
brew install rbenv ruby-build
rbenv init

# Install Ruby 3
rbenv install 3.0.0

gem install rails
gem install solargraph
gem install rubocop

echo "C. Install Python 3"
brew install pyenv
pyenv install 3.9.2
pip install pyright

echo "D. Install Node"
echo "Install via https://github.com/nvm-sh/nvm"

echo "E. Install Crystal"
brew install crystal
echo "Install Crystal via: https://github.com/elbywan/crystalline"
