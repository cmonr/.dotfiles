#!/bin/bash

# If this file is not in ~/Projects/.dotfiles, exit

# Move to base directory
cd ~/Projects/.dotfiles

#
# Symlinks, symlinks everywhere!
#

# Bash
ln -s {`pwd`,~}/.bashrc

# Vim
ln -s {`pwd`,~}/.vim
ln -s {`pwd`,~}/.vimrc

# Screen
ln -s {`pwd`,~}/.screenrc

# Urxvt
ln -s {`pwd`,~}/.Xdefaults
ln -s {`pwd`,~}/.Xresources

# Git
ln -s {`pwd`,~}/.gitconfig

# Gtk
ln -s {`pwd`,~}/.gtkrc-2.0

# Remap Caps Lock to Ctrl
ln -s {`pwd`,~}/.Xmodmap
sudo ln -s `pwd`/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
