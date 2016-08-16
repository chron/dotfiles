#!/usr/bin/env bash

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master


ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/system/.bashrc" ~
ln -sfv "$DOTFILES_DIR/system/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~

mkdir -p ~/.atom
ln -sfv "$DOTFILES_DIR/atom/config.cson" ~/.atom
ln -sfv "$DOTFILES_DIR/atom/keymap.cson" ~/.atom
ln -sfv "$DOTFILES_DIR/atom/init.coffee" ~/.atom
ln -sfv "$DOTFILES_DIR/atom/styles.less" ~/.atom

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap caskroom/cask
brew upgrade

brew install brew-cask
brew tap caskroom/versions

brew install node git gnupg gpg-agent imagemagick rbenv hub vim postgresql mysql redis phantomjs cowsay lastpass-cli ffmpeg
brew cask install atom google-chrome spotify firefox vlc flux slack sourcetree
