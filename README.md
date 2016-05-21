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
Compile YouCompleteMe
```
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.sh --clang-completer
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

### Mutt
To get offlineimap to work you need to provide the following in your 'remote' section in ~/.offlineimaprc:
```
auth_mechanisms = GSSAPI, CRAM-MD5, XOAUTH2, PLAIN, LOGIN
oauth2_request_url = https://accounts.google.com/o/oauth2/token
oauth2_client_id = xxxxx
oauth2_client_secret = xxxxx
oauth2_refresh_token = xxxxx
```

* [Get oauth2 credentials](https://support.google.com/cloud/answer/6158849?hl=en&ref_topic=6262490) and then use the `client_id` and `client_id_secret` to retrieve your refresh token. I'm not using the `access_token` because it expires; the `refresh_token` enables offlineimap to obtain new access tokens.
* Clone this project: https://github.com/google/gmail-oauth2-tools to retrieve your `refresh_token`.
```
python python/oauth2.py --generate_oauth2_token --client_id=YOUR_CLIENT_ID --client_secret=YOUR_CLIENT_SECRET
```
