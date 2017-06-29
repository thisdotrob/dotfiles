# New environment setup (OSX Sierra)

1. Set up github SSH by following [these instructions](https://help.github.com/articles/generating-an-ssh-key/).

1. Open terminal and install homebrew:
   ```sh
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   ```

1. Install zsh
   ```sh
   brew install zsh
   ```

1. Add the following line to /etc/shells
   ```sh
   /usr/local/bin/zsh
   ```

1. Change shell:
   ```sh
   chsh -s /usr/local/bin/zsh
   ```

1. Restart terminal to start using zsh. Choose 'q' when presented with the zsh new user configuration.

1. Install oh-my-zsh:
   ```sh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
   ```

1. Install command syntax highlighting and enable it:
   ```sh
   brew install zsh-syntax-highlighting
   echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
   source ~/.zshrc
   ```

1. Stop the 'last login' message displaying when opening a new terminal window:
   ```sh
   touch ~/.hushlogin
   ```

1. Install z:
   ```sh
   git clone git@github.com:rupa/z.git ~/z && echo ". ~/z/z.sh" >> ~/.zshrc
   source ~/.zshrc
   ```
