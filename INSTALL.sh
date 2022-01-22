#!/usr/bin/env bash

CWD="$(pwd)"

ln -sf ${CWD}/config/alacritty $HOME/.config/
ln -sf ${CWD}/gitconfig $HOME/.gitconfig
ln -sf ${CWD}/tmux.conf $HOME/.tmux.conf
ln -sf ${CWD}/bash_profile $HOME/.bash_profile
ln -sf ${CWD}/bashrc $HOME/.bashrc
ln -sf ${CWD}/config/nvim $HOME/.config/nvim

for i in $(/bin/ls ./scripts)
do
  ln -sf $CWD/scripts/$i $HOME/Bin/$i
done
