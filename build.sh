#!/bin/bash

VERSION=

if [[ $1 == "--full" ]]; then
  VERSION=Full
fi

if [[ $1 == "--slim" ]]; then
  VERSION=Slim
fi

while [[ -z $VERSION ]]; do
  echo -n "Which version you want to build? (s for Slim, f for Full) "
  read -n1 ANSWER
  echo
  if [[ $ANSWER == "s" ]]; then
    VERSION=Slim
  fi
  if [[ $ANSWER == "f" ]]; then
    VERSION=Full
  fi
done

if [[ $VERSION == "Full" ]]; then
  if [[ -f Dockerfile.full ]]; then
    mv Dockerfile.full Dockerfile
  fi
  docker build -t vim .
  mv Dockerfile Dockerfile.full
fi

if [[ $VERSION == "Slim" ]]; then
  if [[ -f Dockerfile.slim ]]; then
    mv Dockerfile.slim Dockerfile
  fi
  docker build -t vim_slim .
  mv Dockerfile Dockerfile.slim
fi
