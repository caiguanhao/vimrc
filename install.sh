#!/bin/bash

set -e

SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -f autoload/pathogen.vim ]]; then
  echo "Installing pathogen..."
  mkdir -p autoload
  curl -Ls https://github.com/tpope/vim-pathogen/raw/91e6378908721d20514bbe5d18d292a0a15faf0c/autoload/pathogen.vim -o autoload/pathogen.vim
fi

if [[ ! -f ftdetect/node.vim ]]; then
  echo "Installing node.vim..."
  mkdir -p ftdetect
  curl -Ls https://raw.githubusercontent.com/moll/vim-node/3a7d48a9c69e09ab5becf6ceab4ecc2f9851568f/ftdetect/node.vim -o ftdetect/node.vim
fi

if [[ ! -f ftdetect/nginx.vim ]]; then
  echo "Installing nginx syntax..."
  curl -Ls http://nginx.org/download/nginx-1.7.5.tar.gz | \
    tar xfvz - -C . --strip-components 3 --wildcards "nginx-1.7.5/contrib/vim/*"
fi

git submodule update --init --recursive

echo "Copying vimrc..."
cp $SCRIPTDIR/vimrc ~/.vimrc

echo "Done."
