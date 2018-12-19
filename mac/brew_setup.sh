#!/bin/bash

brew update
brew install ack
brew install colordiff
brew install entr
brew install exercism
brew install git
brew install jq
brew install kerl
brew install markdown
brew install neovim
brew install netcat
brew install nvm
brew install node
brew install openssl readline sqlite3 xz zlib # pyenv deps https://github.com/pyenv/pyenv/wiki
brew install openvpn
brew install pyenv
brew install rebar@3
brew install ruby
brew install stack
brew install the_silver_searcher
brew install tmux
brew install tree
brew install vim
brew install wget
brew install youtube-dl
brew install zsh
brew install elixir # want to do this after the erlang deps
brew install fwup squashfs coreutils xz # install nerves deps
brew install ocaml #TODO Do this
brew install opam
brew install rlwrap

# Spacemacs install https://github.com/syl20bnr/spacemacs#macos
brew tap d12frosted/emacs-plus
brew install emacs-plus --HEAD --with-natural-title-bars 
brew linkapps emacs-plus
brew linkapps #TODO do this
brew tap caskroom/fonts && brew cask install font-source-code-pro #TODO do this
brew install ispell
brew install aspel

brew cask install anaconda
brew cask install etcher
brew cask install libreoffice
brew cask install ngrok
brew cask install transmission
brew cask install vagrant
brew cask install vlc
brew cask install kap

#IHaskell Install
brew install python3 zeromq libmagic cairo pkg-config pango #haskell-stack omitting this as it is already installed above
# Needed for threadscope https://hackage.haskell.org/package/threadscope
brew install gtk+ gtk-mac-integration

# Ruby
brew install ruby-build rbenv
