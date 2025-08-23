#!/bin/bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -e ~/.zshrc ]; then
	time=$(date +"%Y-%m-%d-%H:%M:%S")
	echo "Zsh configuration file found at ~/.zshrc. Backing it up to ~/.zshrc-$time.bak"
	mv ~/.zshrc ~/.zshrc-$time.bak
fi

printf "export DOTFILES="$BASE_DIR"
source "\$DOTFILES/zsh/zshrc"
" > ~/.zshrc

sed -i 's/^RPROMPT=/#RPROMPT=/' ~/.oh-my-zsh/themes/dst.zsh-theme
