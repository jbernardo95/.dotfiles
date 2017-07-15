#!/usr/bin/env bash

set -eu

if [ ! -e "$HOME/.zshrc" ]
then
  ln -s $PWD/.zshrc $HOME/.zshrc
else
  echo "$HOME/.zshrc already exists" >&2
fi

if [ ! -e "$HOME/.vimrc" ]
then
  ln -s $PWD/.vimrc $HOME/.vimrc
else
  echo "$HOME/.vimrc already exists" >&2
fi

if [ ! -e "$HOME/.tmux.conf" ]
then
  ln -s $PWD/.tmux.conf $HOME/.tmux.conf
else
  echo "$HOME/.tmux.conf already exists" >&2
fi

if [ ! -e "$HOME/.gitconfig" ]
then
  ln -s $PWD/git/.gitconfig $HOME/.gitconfig
else
  echo "$HOME/.gitconfig already exists" >&2
fi

if [ ! -e "$HOME/.gitignore" ]
then
  ln -s $PWD/git/.gitignore $HOME/.gitignore
else
  echo "$HOME/.gitignore already exists" >&2
fi

if [ ! -e "$HOME/.ssh/config" ]
then
  ln -s $PWD/ssh/config $HOME/.ssh/config
else
  echo "$HOME/.ssh/config already exists" >&2
fi

if [ ! -e "$HOME/.ctags" ]
then
  ln -s $PWD/.ctags $HOME/.ctags
else
  echo "$HOME/.ctags already exists" >&2
fi

if [ ! -e "$HOME/.iterm" ]
then
  ln -s $PWD/iterm $HOME/.iterm
else
  echo "$HOME/.iterm already exists" >&2
fi
