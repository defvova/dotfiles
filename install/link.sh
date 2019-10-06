#!/usr/bin/env bash

INSTALLDIR=$PWD

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Linking symlink files.$(tput sgr 0)"
linkables=$(find -H "$INSTALLDIR" -maxdepth 2 -name '*.symlink')

for file in $linkables; do
  basename=$(basename $file '.symlink')
  dirname=$(basename $(dirname $file))
  target="$HOME/.$dirname/.$basename"

  if [ -e $target ]; then
    echo "$(tput setaf 2)=====> $(tput setaf 2)R2-D2: ~${target#$HOME} already exists... Skipping.$(tput sgr 0)"
  else
    echo "$(tput setaf 2)=====> $(tput setaf 2)R2-D2: Creating symlink for $file.$(tput sgr 0)"
    ln -s $file $target
  fi
done

if [ ! -d $HOME/.config ]; then
  echo "Creating ~/.config"
  mkdir -p $HOME/.config
fi

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing config files.$(tput sgr 0)"
configs=$(find -H "$INSTALLDIR/config" -maxdepth 2 -name 'init.vim')

for config in $configs; do
  basename=$(basename $config)
  dirname=$(basename $(dirname $config))
  target=$HOME/.config/$dirname/$basename

  if [ -e $target ]; then
    echo "$(tput setaf 2)=====> $(tput setaf 2)R2-D2: ~${target#$HOME} already exists... Skipping.$(tput sgr 0)"
  else
    echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Creating symlink for ${config}.$(tput sgr 0)"
    ln -s $config $target
  fi
done
