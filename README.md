vimrc
=====

My vimrc file. Tested on Ubuntu/Mac with vim 7.4.

If you have `~/.vim` and/or `~/.vimrc`, rename them/it.

```
git clone https://github.com/caiguanhao/vimrc.git ~/.vim
cd ~/.vim
./install.sh
cp vimrc ~/.vimrc

git submodule update --init --recursive
cd bundle/YouCompleteMe && ./install.sh --clang-completer
```

The plugin YouCompleteMe is very big, it may take a long time to
download. If you don't like it, just don't download the plugin.
To use Ag inside vim, build Ag first. You must set up GOPATH.
For more info on installation of each plugin, see the Dockerfile
or the README file of each plugin.

If you want to use vim inside a Docker container, build it first.

```
docker build -t vim .
```

Warning: This vim config file is suitable for editing small files.

LICENSE: MIT
