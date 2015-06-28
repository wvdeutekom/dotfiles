# Wijnand's dotfiles

My personal configuration (dot)files so far for: 
* OSX
* [Git]
* [vim]
* [tmux]
* [oh-my-zsh]
* [tmuxinator]
[Git]:https://git-scm.com/
[vim]:http://www.vim.org/
[tmux]:http://tmux.sourceforge.net/
[oh-my-zsh]:https://github.com/robbyrussell/oh-my-zsh
[tmuxinator]:https://github.com/tmuxinator/tmuxinator

Based on [Joeri Djojosoeparto's] dotfiles :)
[Joeri Djojosoeparto's]:https://github.com/pinda/dotfiles

## Installation
I'll have to automate this later!

* Clone this repo using --recursive
```
$ git clone --recursive git@github.com:wvdeutekom/dotfiles.git
```

* Install zsh
```
$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```
* Run the install script
```
$ sh install.sh
```
Then you discover nothing works, so you actually install Vundle to manage your
plugins..
```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Open up vim and run PluginInstall
```
:PluginInstall
```
* Install autojump
``` 
brew install autojump
```


## Requirements
Don't forget to download the following *after* installing the above
* [Powerline] fonts (Meslo works great with this configuration)
* [MacVim] editor
* [Vundle] vundle vim plugin manager

[Powerline]: https://github.com/Lokaltog/powerline-fonts 
[MacVim]: https://code.google.com/p/macvim/
[Vundle]: https://github.com/gmarik/Vundle.vim
