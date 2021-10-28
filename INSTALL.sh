#!/usr/bin/env bash

CWD="$(pwd)"

ln -sf ${CWD}/config/sway $HOME/.config/
ln -sf ${CWD}/config/wofi $HOME/.config/
ln -sf ${CWD}/config/waybar $HOME/.config/
ln -sf ${CWD}/config/alacritty $HOME/.config/
ln -sf ${CWD}/config/redshift $HOME/.config/
ln -sf ${CWD}/config/kanshi $HOME/.config/
ln -sf ${CWD}/gitconfig $HOME/.gitconfig
ln -sf ${CWD}/tmux.conf $HOME/.tmux.conf
ln -sf ${CWD}/bash_profile $HOME/.bash_profile
ln -sf ${CWD}/bashrc $HOME/.bashrc
ln -sf ${CWD}/config/sublime-text-3/Packages/User/Preferences.sublime-settings $HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -sf ${CWD}/config/sublime-text-3/Packages/User/Package\ Control.sublime-settings $HOME/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings
ln -sf ${CWD}/config/sublime-text-3/Packages/User/GitBlame.py $HOME/.config/sublime-text-3/Packages/User/GitBlame.py
ln -sf ${CWD}/config/nvim $HOME/.config/nvim
for i in $(/bin/ls ./scripts)
do
  ln -sf $CWD/scripts/$i $HOME/bin/$i
done
