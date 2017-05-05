export DEFAULT_USER=r
export ZSH=/Users/r/.oh-my-zsh
export NVM_DIR="$HOME/.nvm"

ZSH_THEME="agnoster"

plugins=(brew docker-compose docker z git npm thefuck yarn)

. $ZSH/oh-my-zsh.sh
. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/local/opt/nvm/nvm.sh
