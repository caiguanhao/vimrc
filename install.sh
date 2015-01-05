#!/bin/bash

set -e

SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd ~/.vim

if [[ ! -f autoload/pathogen.vim ]]; then
  echo "Installing pathogen..."
  mkdir -p autoload
  curl -Ls https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim -o autoload/pathogen.vim
fi

if [[ ! -f ftdetect/node.vim ]]; then
  echo "Installing node.vim..."
  mkdir -p ftdetect
  curl -Ls https://raw.githubusercontent.com/moll/vim-node/master/ftdetect/node.vim -o ftdetect/node.vim
fi

if [[ ! -f ftdetect/nginx.vim ]]; then
  echo "Installing nginx syntax..."
  curl -Ls http://nginx.org/download/nginx-1.7.5.tar.gz | \
    tar xfvz - -C . --strip-components 3 --wildcards "nginx-1.7.5/contrib/vim/*"
fi

echo "Copying vimrc..."
cp $SCRIPTDIR/vimrc ~/.vimrc

echo "Done."
