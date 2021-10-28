#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GPG_TTY=$(tty)
export HISTSIZE=10000
export HISTCONTROL=ignorespace:erasedups
export HISTIGNORE="ls:ps:history"

[[ -f ~/.localrc ]] && . ~/.localrc

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
. "$dotfiles_dir/ssh-agent"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
