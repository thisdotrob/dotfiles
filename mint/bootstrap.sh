#!/bin/bash
sudo apt add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update

sudo apt upgrade -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add

sudo apt install -y apt-transport-https ca-certificates software-properties-common curl

sudo apt install -y docker-ce

sudo usermod -aG docker $USER

sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo apt install -y zsh zsh-syntax-highlighting

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

sudo apt install -y vim-gtk3 i3-wm i3status tmux htop libanyevent-i3-perl jq chromium-browser

git clone https://github.com/sindresorhus/pure.git /tmp/pure

sudo mv /tmp/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
sudo mv /tmp/pure/async.zsh /usr/local/share/zsh/site-functions/async

sudo rm -rf /tmp/pure

mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status

ln -sf "$(pwd)/gitconfig" ~/.gitconfig
ln -sf "$(pwd)/zshrc" ~/.zshrc
ln -sf "$(pwd)/vimrc" ~/.vimrc
ln -sf "$(pwd)/i3config" ~/.config/i3/config
ln -sf "$(pwd)/i3statusconfig" ~/.config/i3status/config
