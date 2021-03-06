#! /bin/bash

# Install script for my dotfiles
# Advanced construction techniques (duct tape.)

# Console colors
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
NC='\033[0m'

dotfiles=${PWD}
home=${HOME}

install_brew () {
    echo "${green}Installing Homebrew...${NC}"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "${green}Updating brew...${NC}"
    #brew update
}

install_git () {
    echo "${green}Installing git${NC}"
    brew install git
}

install_vundle () {
    echo "${green}Installing vundle${NC}"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    brew install CMake
    vim +PluginInstall +qall
}

install_tmux () {
    echo "${green}Installing tmux${NC}"
    brew install tmux
    brew install reattach-to-user-namespace
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    git clone https://github.com/powerline/fonts.git ~/Documents/powerline && ~/Documents/powerline/install.sh

    # Set '/bin/zsh -c tmux attach -t base || tmux new -s base' as login command in iTerm2 if tmux is your default
}

install_autojump () {
    echo "${green}Installing Autojump${NC}"
    brew install autojump
}

install_zsh () {
    echo "${green}Installing zsh${NC}"
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
}

install_fzf () {
    echo "${green}Installing fzf${NC}"
    brew install fzf
}

install_macvim () {
    #this hasn't been tested yet, take a look at http://stackoverflow.com/questions/21694327/installing-vim-with-homebrew
    echo "${green}Installing vim${NC}"
    brew install macvim --override-system-vim
}

install_spacemacs () {
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    brew tap d12frosted/emacs-plus
    brew install emacs-plus --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-spacemacs-icon
    brew linkapps
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
}

install_tmuxinator () {
    gem install tmuxinator
}

install_brews () {
    brew cask install osxfuse
    brew tap homebrew/fuse
    brew install encfs

    brew install fzf

    brew install Caskroom/cask/chitchat
}

link_git () {
    echo "${green}Linking git${NC}"
    ln -fs ${dotfiles}/git/gitignore ${home}/.gitignore
    ln -fs ${dotfiles}/git/gitconfig ${home}/.gitconfig
    echo "Git is symlinked."
}

link_vim () {
    echo "${green}Linking vim${NC}"
    rm -rf ${HOME}/.vim
    ln -fs ${dotfiles}/vim/vimrc ${HOME}/.vimrc
    ln -fs ${dotfiles}/vim/vim ${HOME}/.vim
    echo "Vim is symlinked."
}

link_zsh () {
    echo "${green}Linking zsh${NC}"
    ln -fs ${dotfiles}/zsh/zshrc ${HOME}/.zshrc
    ln -fs ${dotfiles}/zsh/zshalias ${HOME}/.zshalias
    ln -fs ${dotfiles}/zsh/env ${HOME}/.zshenv
    ln -fns ${dotfiles}/zsh/oh-my-zsh ${HOME}/.oh-my-zsh
    echo "ZSH symlinked."
}

link_tmux () {
    echo "${green}Linking tmux${NC}"
    rm -rf ${HOME}/.tmux.conf
    ln -fs ${dotfiles}/tmux/tmux.conf ${HOME}/.tmux.conf
    echo "tmux is symlinked."
}

link_tmuxinator () {
    echo "${green}Linking tmuxinator${NC}"
    rm -rf ${HOME}/.tmuxinator
    ln -fs ${dotfiles}/tmuxinator ${HOME}/.tmuxinator
    echo "tmuxinator is symlinked"
}

link_spacemacs () {
    echo "${green}Linking spacemacs${NC}"
    rm -rf ${HOME}/.spacemacs
    ln -fs ${dotfiles}/spacemacs ${HOME}/.spacemacs.d
}
link_osx () {
    echo "${green}Linking .osx${NC}"
    ln -fs ${dotfiles}/osx/osx ${HOME}/.osx
    echo ".osx dotfile is symlinked"
}

install_brew
install_macvim
install_tmux
install_autojump
install_zsh
#install_tmuxinator
link_git
link_vim
install_vundle
link_zsh
link_tmux
link_tmuxinator
link_osx
install_fzf
install_spacemacs
link_spacemacs
