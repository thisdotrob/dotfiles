FROM ubuntu:18.10

ARG DEBIAN_FRONTEND=noninteractive

# Do not exclude man pages & other documentation
RUN rm /etc/dpkg/dpkg.cfg.d/excludes
# Reinstall all currently installed packages in order to get the man pages back
RUN apt-get update && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall && \
    rm -r /var/lib/apt/lists/*

RUN apt update
RUN apt upgrade -y

RUN apt install -y curl tmux git jq openjdk-8-jdk unzip locales sudo

RUN curl -L https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip -o /tmp/terraform.zip
RUN unzip /tmp/terraform.zip -d /usr/local/bin/
RUN rm /tmp/terraform.zip

RUN update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64

RUN apt install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN apt install -y docker-ce

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add
RUN curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

RUN sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8

# USER SPECIFIC SETUP
RUN groupadd rs-docker
RUN useradd -d /home/rs-docker -ms /bin/zsh -g rs-docker -G docker,sudo rs-docker
RUN chown rs-docker:rs-docker /home/rs-docker
RUN echo rs-docker:thepassword | chpasswd

RUN apt install -y zsh zsh-syntax-highlighting jq vim

RUN git clone https://github.com/sindresorhus/pure.git /tmp/pure
RUN mv /tmp/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
RUN mv /tmp/pure/async.zsh /usr/local/share/zsh/site-functions/async
RUN rm -rf /tmp/pure

USER rs-docker
ENV USER rs-docker

RUN git clone https://github.com/robbyrussell/oh-my-zsh.git /home/rs-docker/.oh-my-zsh

RUN mkdir -p /home/rs-docker/.vim/pack/rs-docker/start
RUN git clone https://github.com/ctrlpvim/ctrlp.vim.git /home/rs-docker/.vim/pack/rs-docker/start/ctrlp
RUN git clone https://github.com/vim-airline/vim-airline.git /home/rs-docker/.vim/pack/rs-docker/start/vim-airline
RUN git clone https://github.com/tpope/vim-surround.git /home/rs-docker/.vim/pack/rs-docker/start/vim-surround

COPY tmuxconfig /home/rs-docker/.tmux.conf
COPY gitconfig /home/rs-docker/.gitconfig
COPY zshrc /home/rs-docker/.zshrc
COPY vimrc /home/rs-docker/.vimrc

RUN git clone https://github.com/creationix/nvm.git /home/rs-docker/.nvm
ARG NVM_DIR=/home/rs-docker/.nvm
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && nvm install 10

WORKDIR /home/rs-docker
