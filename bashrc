#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

unset DISPLAY # fix firefox (use wayland instead of x11)

export GPG_TTY=$(tty)
export HISTSIZE=10000
export HISTCONTROL=ignorespace:erasedups
export HISTIGNORE="ls:ps:history"

[[ -f ~/.localrc ]] && . ~/.localrc
[[ -f /usr/share/fzf/completion.bash ]] && . /usr/share/fzf/completion.bash
[[ -f /usr/share/fzf/key-bindings.bash ]] && . /usr/share/fzf/key-bindings.bash

dotfiles_dir="$(dirname $(readlink $HOME/.bashrc))"
if [[ -d "$dotfiles_dir/functions" ]]
then
    for i in $(/bin/ls $dotfiles_dir/functions)
    do
        . "$dotfiles_dir/functions/$i"
    done
fi

. "$dotfiles_dir/colors"
. "$dotfiles_dir/alias"
. "$dotfiles_dir/ps1"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
