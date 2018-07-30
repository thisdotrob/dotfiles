#!/bin/bash

sudo apt update
sudo apt upgrade -y

# hardware
chmod +x "$(pwd)/backlight.sh"
sudo ln -sf "$(pwd)/backlight.sh" /usr/local/bin/backlight
sudo ln -sf "$(pwd)/gxkbconfig" ~/.config/gxkb/gxkb.cfg

# git
sudo apt install -y git
ln -sf "$(pwd)/gitconfig" ~/.gitconfig
mkdir ~/.ssh
cp "$(pwd)/../id_rsa.pub" ~/.ssh/id_rsa.pub

# docker
sudo apt add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
sudo apt install -y apt-transport-https ca-certificates software-properties-common curl
sudo apt install -y docker.io
sudo usermod -aG docker $USER
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

# shell & term
sudo apt install -y zsh zsh-syntax-highlighting gnome-terminal
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/sindresorhus/pure.git /tmp/pure
sudo mv /tmp/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
sudo mv /tmp/pure/async.zsh /usr/local/share/zsh/site-functions/async
sudo rm -rf /tmp/pure
ln -sf "$(pwd)/zshrc" ~/.zshrc

# i3
sudo apt install -y i3-wm i3status dmenu libanyevent-i3-perl
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status
ln -sf "$(pwd)/i3config" ~/.config/i3/config
ln -sf "$(pwd)/i3statusconfig" ~/.config/i3status/config

# vim
sudo apt install -y vim-gtk3
ln -sf "$(pwd)/vimrc" ~/.vimrc
mkdir -p ~/.vim/pack/$USER/start
git submodule init
ln -sf "$(pwd)/../vim-plugins/ctrlp" ~/.vim/pack/$USER/start/ctrlp
ln -sf "$(pwd)/../vim-plugins/vim-airline" ~/.vim/pack/$USER/start/vim-airline
ln -sf "$(pwd)/../vim-plugins/vim-surround" ~/.vim/pack/$USER/start/vim-surround

# apps
sudo apt install -y tmux htop jq chromium-browser pavucontrol

# terraform
curl -L https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip -o /tmp/terraform.zip
sudo unzip /tmp/terraform.zip -d /usr/local/bin/
rm /tmp/terraform.zip

# nvm
git clone https://github.com/creationix/nvm.git ~/.nvm

chsh -s /bin/zsh
