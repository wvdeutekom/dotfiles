#! /bin/bash
# Install script for my dotfiles
# Advanced construction techniques (duct tape.)

dotfiles=${PWD}
home=${HOME}

link_git () {
    ln -fs ${dotfiles}/git/gitignore ${home}/.gitignore
    ln -fs ${dotfiles}/git/gitconfig ${home}/.gitconfig	
    echo "Git is symlinked."
}

link_vim () {
    rm -rf ${HOME}/.vim
    ln -fs ${dotfiles}/vim/vimrc ${HOME}/.vimrc
    ln -fs ${dotfiles}/vim/vim ${HOME}/.vim
    echo "Vim is symlinked."
}

link_zsh () {
    ln -fs ${dotfiles}/zsh/zshrc ${HOME}/.zshrc
    ln -fs ${dotfiles}/zsh/zshalias ${HOME}/.zshalias
    ln -fs ${dotfiles}/zsh/env ${HOME}/.zshenv
    ln -fns ${dotfiles}/zsh/oh-my-zsh ${HOME}/.oh-my-zsh
    echo "ZSH symlinked."
}

link_tmux () {
    ln -fs ${dotfiles}/tmux/tmux.conf ${HOME}/.tmux.conf
    echo "tmux is symlinked."
}

link_tmuxinator () {
    ln -fs ${dotfiles}/tmuxinator/ ${HOME}/.tmuxinator
    echo "tmuxinator is symlinked"
}

link_osx () {
    ln -fs ${dotfiles}/osx/osx ${HOME}/.osx
    echo ".osx dotfile is symlinked"
}

link_git 
link_vim 
link_zsh 
link_tmux 
link_tmuxinator 
link_osx
