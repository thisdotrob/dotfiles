#!/bin/bash

sudo apt update
sudo apt upgrade -y

# compton compositor to stop screen tearing
sudo apt install compton

# hardware
chmod +x "$(pwd)/backlight.sh"
sudo ln -sf "$(pwd)/backlight.sh" /usr/local/bin/backlight
sudo apt install gxkb
mkdir -p ~/.config/gxkb
ln -sf "$(pwd)/gxkbconfig" ~/.config/gxkb/gxkb.cfg

# slack & zoom
curl https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb -o /tmp/slack.deb
curl -L https://zoom.us/client/latest/zoom_amd64.deb -o /tmp/zoom.deb
sudo dpkg -i /tmp/slack.deb
sudo dpkg -i /tmp/zoom.deb
sudo apt install --fix-broken
rm /tmp/slack.deb
rm /tmp/zoom.deb

# tmux
sudo apt install -y tmux
ln -sf "$(pwd)/tmuxconfig" ~/.tmux.conf

# git
sudo apt install -y git
sudo ln -sf "$(pwd)/gstgcl" /usr/bin/gstgcl
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
sudo chmod +x /usr/local/bin/docker-compose

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
ln -sf "$(pwd)/profile" ~/.profile

# vim
sudo apt install -y vim-gtk3
ln -sf "$(pwd)/../debian/vimrc" ~/.vimrc
mkdir -p ~/.vim/pack/$USER/start
git submodule init
ln -sf "$(pwd)/../vim-plugins/ctrlp" ~/.vim/pack/$USER/start/ctrlp
ln -sf "$(pwd)/../vim-plugins/vim-airline" ~/.vim/pack/$USER/start/vim-airline
ln -sf "$(pwd)/../vim-plugins/vim-surround" ~/.vim/pack/$USER/start/vim-surround
ln -sf "$(pwd)/../vim-plugins/nerdtree" ~/.vim/pack/$USER/start/nerdtree
ln -sf "$(pwd)/../vim-plugins/vim-fireplace" ~/.vim/pack/$USER/start/vim-fireplace
ln -sf "$(pwd)/../vim-plugins/vim-commentary" ~/.vim/pack/$USER/start/vim-commentary
sudo chown rs-mint:rs-mint /usr/share/vim/vim80/doc/tags # fix permission issue with :helpt ALL

# apps
sudo apt install -y tmux htop jq chromium-browser pavucontrol

# aws cli
unzip awscli-bundle.zip
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm -rf awscli-bundle
rm awscli-bundle.zip

# terraform
curl -L https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip -o /tmp/terraform.zip
sudo unzip /tmp/terraform.zip -d /usr/local/bin/
rm /tmp/terraform.zip

# nvm
git clone https://github.com/creationix/nvm.git ~/.nvm

# java
sudo apt install openjdk-8-jdk
sudo update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64

# clojure
curl -L "https://download.clojure.org/install/linux-install-1.9.0.397.sh" -o /tmp/clojure.sh
chmod +x /tmp/clojure.sh
sudo /tmp/clojure.sh
rm /tmp/clojure.sh
sudo curl -L "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein" \
          -o /usr/local/bin/lein
sudo chmod a+x /usr/local/bin/lein
/usr/local/bin/lein

chsh -s /bin/zsh
