#!/usr/bin/env bash

echo "Installing VirtualBox"
./devops/osx/install-app.sh http://download.virtualbox.org/virtualbox/5.1.10/VirtualBox-5.1.10-112026-OSX.dmg VirtualBox

echo "Installing Vagrant"
./devops/osx/install-app.sh https://releases.hashicorp.com/vagrant/1.9.0/vagrant_1.9.0.dmg Vagrant

cd project
vagrant up 