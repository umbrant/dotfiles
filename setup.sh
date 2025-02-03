#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
git submodule update --init

cd $HOME
# zsh
ln -s $DIR/oh-my-zsh .oh-my-zsh
ln -s $DIR/.zshrc .
touch .zshrc.local
# vim
ln -s $DIR/.vim .
ln -s .vim/vimrc .vimrc
# Vundle
vim +PluginInstall +qall
# Misc
mv .bashrc .bashrc.bak
ln -s $DIR/.bashrc .
cp $DIR/.gitconfig.template .gitconfig
ln -s $DIR/.tmux.conf .
