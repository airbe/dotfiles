#!/usr/bin/env bash

CWD="$(pwd)"

ln -sf ${CWD}/gitconfig ${HOME}/.gitconfig
ln -sf ${CWD}/tmux.conf ${HOME}/.tmux.conf
ln -sf ${CWD}/bash_profile ${HOME}/.bash_profile
ln -sf ${CWD}/bashrc ${HOME}/.bashrc
ln -sf ${CWD}/config/sublime-text/Packages/User/Preferences.sublime-settings ${HOME}/Library/Application\ Support/Sublime\ Text/Packages/User/Preferences.sublime-settings
ln -sf ${CWD}/config/sublime-text/Packages/User/Package\ Control.sublime-settings ${HOME}/Library/Application\ Support/Sublime\ Text/Packages/User/Package\ Control.sublime-settings
ln -sf ${CWD}/config/sublime-text/Packages/User/GitBlame.py ${HOME}/Library/Application\ Support/Sublime\ Text/Packages/User/GitBlame.py
ln -sf ${CWD}/config/nvim ${HOME}/.config/
