#!/bin/bash

set -e

echo "Installing pathogen..."
mkdir -p autoload
curl -Ls https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim -o autoload/pathogen.vim

echo "Installing node.vim..."
mkdir -p ftdetect
curl -Ls https://raw.githubusercontent.com/moll/vim-node/master/ftdetect/node.vim -o ftdetect/node.vim

echo "Installing nginx syntax..."
curl -Ls http://nginx.org/download/nginx-1.7.5.tar.gz | \
  tar xfvz - -C . --strip-components 3 --wildcards "nginx-1.7.5/contrib/vim/*"

echo "Done."
