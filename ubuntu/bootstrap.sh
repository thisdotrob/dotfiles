!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt autoremove -y

sudo apt install -y chromium-browser curl pavucontrol tmux vim zsh \
                    zsh-syntax-highlighting apt-transport-https ca-certificates \
                    software-properties-common openjdk-8-jdk make gxkb

# keyboard
mkdir -p ~/.config/gxkb
ln -sf "$(pwd)/gxkbconfig" ~/.config/gxkb/gxkb.cfg

# git
ln -sf "$(pwd)/gitconfig" ~/.gitconfig
ln -sf "$(pwd)/../id_rsa.pub" ~/.ssh/id_rsa.pub

# zoom
curl -L "https://zoom.us/client/latest/zoom_amd64.deb" -o /tmp/zoom.deb
sudo dpkg -i /tmp/zoom.deb
sudo apt install --fix-broken -y
rm /tmp/zoom.deb

# shell & term
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/sindresorhus/pure.git /tmp/pure
sudo mv /tmp/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
sudo mv /tmp/pure/async.zsh /usr/local/share/zsh/site-functions/async
rm -rf /tmp/pure
ln -sf "$(pwd)/zshrc" ~/.zshrc

# hardware
chmod +x "$(pwd)/backlight.sh"
sudo ln -sf "$(pwd)/backlight.sh" /usr/local/bin/backlight

# i3
/usr/lib/apt/apt-helper download-file \
        "http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb" \
        keyring.deb \
        SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
sudo dpkg -i ./keyring.deb
sudo sh -c 'echo "deb http://debian.sur5r.net/i3/ cosmic universe" >> /etc/apt/sources.list.d/sur5r-i3.list'
sudo apt update
sudo apt install i3 -y
mkdir ~/.config/i3
ln -sf "$(pwd)/i3config" ~/.config/i3/config
ln -sf "$(pwd)/profile" ~/.profile
ln -sf "$(pwd)/dunstrc" ~/.dunstrc
rm keyring.deb

# atom
curl -L "https://atom-installer.github.com/v1.32.1/atom-amd64.deb?s=1540946396&ext=.deb" \
     -o /tmp/atom.deb
sudo dpkg -i /tmp/atom.deb
sudo apt install --fix-broken -y
rm /tmp/atom.deb

# slack
curl -L "https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.3-amd64.deb" \
     -o /tmp/slack.deb
sudo dpkg -i /tmp/slack.deb
sudo apt install --fix-broken -y
rm /tmp/slack.deb
# Slack is broken, use libnode.so from Atom to fix per
# http://ubuntuhandbook.org/index.php/2018/11/slack-app-not-launching-ubuntu-18-10/
sudo rm /usr/lib/slack/libnode.so
sudo cp /usr/share/atom/libnode.so /usr/lib/slack/libnode.so

# vim
ln -sf "$(pwd)/vimrc" ~/.vimrc
mkdir -p ~/.vim/pack/$USER/start
git submodule update
ln -sf "$(pwd)/../vim-plugins/ctrlp" ~/.vim/pack/$USER/start/ctrlp
ln -sf "$(pwd)/../vim-plugins/vim-airline" ~/.vim/pack/$USER/start/vim-airline
ln -sf "$(pwd)/../vim-plugins/vim-surround" ~/.vim/pack/$USER/start/vim-surround
ln -sf "$(pwd)/../vim-plugins/nerdtree" ~/.vim/pack/$USER/start/nerdtree
ln -sf "$(pwd)/../vim-plugins/vim-fireplace" ~/.vim/pack/$USER/start/vim-fireplace
ln -sf "$(pwd)/../vim-plugins/vim-commentary" ~/.vim/pack/$USER/start/vim-commentary
sudo chown $USER:$USER /usr/share/vim/vim80/doc/tags # fix permission issue with :helpt ALL

# tmux
ln -sf "$(pwd)/tmuxconfig" ~/.tmux.conf

# docker - change "bionic" for $(lsb_release -cs) once cosmic version available
sudo apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | sudo apt-key add
sudo apt install -y docker.io
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" \
          -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# nvm
curl -o- "https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh" | bash

# aws cli
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm -rf awscli-bundle
rm awscli-bundle.zip

# terraform
curl -L "https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip" \
     -o /tmp/terraform.zip
sudo unzip /tmp/terraform.zip -d /usr/local/bin/
rm /tmp/terraform.zip

# java
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
