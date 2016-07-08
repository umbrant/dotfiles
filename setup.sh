#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
git submodule update --init

cd $HOME
# zsh
ln -s $DIR/oh-my-zsh .oh-my-zsh
ln -s $DIR/.zshrc .
# vim
ln -s $DIR/.vim .
ln -s .vim/vimrc .vimrc
# Vundle
vim +PluginInstall +qall
# Misc
ln -s $DIR/.ackrc .
mv .bashrc .bashrc.bak
ln -s $DIR/.bashrc .
ln -s $DIR/.gitconfig .
ln -s $DIR/.tmux.conf .
mkdir -p .config/terminator
ln -s $DIR/.config/terminator/config .config/terminator
