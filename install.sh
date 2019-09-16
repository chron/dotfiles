#!/usr/bin/env bash

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore" ~
ln -sfv "$DOTFILES_DIR/system/.bashrc" ~
ln -sfv "$DOTFILES_DIR/system/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/system/.inputrc" ~
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~

mkdir ~/Library/KeyBindings
ln -sfv "$DOTFILES_DIR/system/DefaultKeyBindings.dict" ~/Library/KeyBindings

ln -sfv "$DOTFILES_DIR/bin" ~/bin

# TODO: VS Code symbolic links

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew upgrade

brew install brew-cask
brew tap caskroom/versions

brew install nvm git gnupg imagemagick rbenv hub vim postgresql mysql redis cowsay lastpass-cli ffmpeg overmind jq autojump awscli
brew cask install visual-studio-code amethyst iterm2 google-chrome spotify firefox vlc flux slack sourcetree rocket

# scroll reverser

rbenv install 2.6.4
rbenv global 2.6.4

apm install indent-guide-improved file-icons atom-beautify highlight-selected
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox

brew tap coinbase/assume-role
brew install assume-role

touch bash/secrets.bash

curl -o ~/.git-prompt "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"

# fonts
