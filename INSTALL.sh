#!/usr/bin/env bash

CWD="$(pwd)"

ln -sf "${CWD}/gitconfig" "$HOME/.gitconfig"
ln -sf "${CWD}/tmux.conf" "$HOME/.tmux.conf"
ln -sf "${CWD}/bash_profile" "$HOME/.bash_profile"
ln -sf "${CWD}/bashrc" "$HOME/.bashrc"

for i in $(/bin/ls ./config)
do
  rm -rf "$HOME/.config/$i"
  ln -sf "${CWD}/config/$i" "$HOME/.config/$i"
done

for i in $(/bin/ls ./scripts)
do
  ln -sf $CWD/scripts/$i $HOME/.local/bin/$i
done
