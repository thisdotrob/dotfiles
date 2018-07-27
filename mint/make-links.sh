#!/bin/bash
apt add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"

apt update

apt install zsh vim-gtk3 curl i3-wm i3status tmux htop libanyevent-i3-perl jq docker-ce

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status

ln -sf "$(pwd)/zshrc" ~/.zshrc
ln -sf "$(pwd)/vimrc" ~/.vimrc
ln -sf "$(pwd)/i3config" ~/.config/i3/config
ln -sf "$(pwd)/i3statusconfig" ~/.config/i3status/config
