#!/bin/bash
ln -sf "$(pwd)/zshrc" ~/.zshrc
ln -sf "$(pwd)/vimrc" ~/.vimrc
ln -sf "$(pwd)/i3config" ~/.config/i3/config
mkdir -p ~/.config/i3status
ln -sf "$(pwd)/i3statusconfig" ~/.config/i3status/config
