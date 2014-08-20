#!/bin/bash -eux

# install Homebrew - http://brew.sh/
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew --version

# install Packer - http://www.packer.io/
brew tap homebrew/binary
brew install packer
packer --version

# install Ansible - http://www.ansible.com/
brew install ansible
ansible --version

# install Cask for Homebrew - http://caskroom.io/
brew install caskroom/cask/brew-cask
brew info brew-cask

# install VirtualBox - https://www.virtualbox.org/
brew cask install virtualbox
VBoxManage --version
