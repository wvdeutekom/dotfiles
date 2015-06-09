DOTFILES = $(PWD)
all:: git vim zsh tmux tmuxinator

git::
	@ln -fs $(DOTFILES)/git/gitignore       ${HOME}/.gitignore
	@ln -fs $(DOTFILES)/git/gitconfig       ${HOME}/.gitconfig
	@echo Git is symlinked.

vim::
	@echo $(DOTFILES)
	@rm -rf ${HOME}/.vim
	@ln -fs $(DOTFILES)/vim/vimrc        ${HOME}/.vimrc
	@ln -sf $(DOTFILES)/vim/vim         ${HOME}/.vim
	@ln -fs $(DOTFILES)/vim/indent/*		${HOME}/.vim/indent        
	@echo Vim is symlinked.

zsh::
	@ln -fs $(DOTFILES)/zsh/zshrc ${HOME}/.zshrc
	@ln -fs $(DOTFILES)/zsh/zshalias ${HOME}/.zshalias
	@ln -fs $(DOTFILES)/zsh/env ${HOME}/.zshenv
	@ln -fns $(DOTFILES)/zsh/oh-my-zsh ${HOME}/.oh-my-zsh
	@echo ZSH symlinked.

tmux::
	@ln -fs $(DOTFILES)/tmux/tmux.conf 	${HOME}/.tmux.conf
	@echo tmux is symlinked.

tmuxinator::
	@ln -fs $(DOTFILES)/tmuxinator/ ${HOME}/.tmuxinator
	@echo tmuxinator is symlinked
