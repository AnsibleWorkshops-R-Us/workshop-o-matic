#!/bin/bash

# bootstrap.sh is a local bootstrap shell povisioner for Vagrant. 

# function for calling apt-get
function aptget {
  # to prevent encoding problem
  sudo DEBIAN_FRONTEND=noninteractive apt-get -y \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    $@
}

# Environment Variables
HOME="/home/vagrant"

# add extra packages here (most are just "nice to have")
aptget install ack-grep
aptget install ctags
aptget install vim
aptget install vim-gnome
aptget install tmux
aptget install libnotify-bin
aptget install notify-osd-icons
aptget install humanity-icon-theme
aptget install ansible
aptget install beep
aptget install libxml2-utils
aptget install xsltproc
aptget install nodejs
aptget install npm
aptget install stow
aptget install rbenv
aptget install ruby-build

aptget update

# and just to be sure, let's just upgrade everything
aptget upgrade


# add the fingerprint for github
echo "Adding the fingerprint for github.com, shouldn't be necessary, but we don't want to get nagged later..."
ssh -T -oStrictHostKeyChecking=no git@github.com

# Git-smart is super helpful, especially for git newbies, and is worth installing just for smart-log
echo "installing git-smart gem"
sudo gem install git-smart

# notes is a nice little way to find TODO and FIXME notes, so you can work on them
echo "installing notes gem"
sudo gem install notes
#git config --global alias.n '!git ls-files | xargs notes'

# BASH history transplant (curse these lazy fingers)
if [ -f "/vagrant/config/dotfiles/bash_history" ]; then
    echo "transplanting BASH history file"
    cp /vagrant/config/dotfiles/bash_history /home/vagrant/.bash_history
    chown vagrant:vagrant /home/vagrant/.bash_history
fi

# # BASH inputrc customization 
 if [ -f "/vagrant/config/dotfiles/inputrc" ]; then
    echo "setting up BASH inputrc file"
    cp /vagrant/config/dotfiles/inputrc /home/vagrant/.inputrc
    chown vagrant:vagrant /home/vagrant/.inputrc
 fi

# BASH aliases customization
if [ -f "/vagrant/config/dotfiles/bash_aliases" ]; then
    echo "setting up .bash_aliases file"
    cp /vagrant/config/dotfiles/bash_aliases /home/vagrant/.bash_aliases
    chown vagrant:vagrant /home/vagrant/.bash_aliases
fi

# install Ansible
aptget install ansible

#install ServerSpec
sudo gem install serverspec

# if there isn't one there already, copy the workshop folder to the vagrant user's home folder
if [ ! -d "/home/vagrant/workshop" ]; then
    echo "copying workshop folder"
    cp -r /vagrant/workshop /home/vagrant/
    chown -R vagrant:vagrant /home/vagrant/workshop
fi
