#!/bin/bash

mkdir -p ~/.vim/pack/$USER/start
git submodule init
git submodule update
ln -sf "$(pwd)/../vim-plugins/ctrlp" ~/.vim/pack/$USER/start/ctrlp
ln -sf "$(pwd)/../vim-plugins/vim-airline" ~/.vim/pack/$USER/start/vim-airline
ln -sf "$(pwd)/../vim-plugins/vim-surround" ~/.vim/pack/$USER/start/vim-surround
ln -sf "$(pwd)/../vim-plugins/nerdtree" ~/.vim/pack/$USER/start/nerdtree
ln -sf "$(pwd)/../vim-plugins/vim-fireplace" ~/.vim/pack/$USER/start/vim-fireplace
