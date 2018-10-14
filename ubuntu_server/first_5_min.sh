#!/bin/bash
# TESTED ON UBUNTU 18.04

set -e

# Update
apt-get update -y
apt-get upgrade -y

# Security
apt-get install -y fail2ban unattended-upgrades 

# Python
apt-get install -y build-essential python3 python3-venv python3-dev 

# Utils
apt-get install -y tree silversearcher-ag ack

# Erlang / Elixir
apt-get install -y automake autoconf libreadline-dev libncurses-dev \
                   libyaml-dev libxslt-dev libffi-dev libtool \
                   unixodbc-dev zlib1g-dev m4 wx-common libwxgtk3.0-dev \
                   erlang elixir

# Haskell
apt-get install -y haskell-stack

# Ruby
 apt-get install -y ruby ruby-dev

# Create & set up deploy
useradd deploy
mkdir /home/deploy
git clone https://github.com/nicksanford/dotfiles.git && cp dotfiles/dotfiles/* /home/deploy
cp -R /root/.ssh /home/deploy/.ssh
cp /root/.bashrc /home/deploy
cp /root/.viminfo /home/deploy
cp /root/.profile /home/deploy
chmod 700 /home/deploy/.ssh
chmod 400 /home/deploy/.ssh/authorized_keys
chown deploy:deploy /home/deploy -R

# Zsh
apt-get install -y  zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git /home/deploy/.oh-my-zsh
sudo chsh -s /bin/zsh deploy

# Vim
apt-get install -y ncurses-dev
cd /tmp && git clone https://github.com/vim/vim.git && cd vim
./configure -enable-perlinterp --enable-python3interp --enable-rubyinterp --enable-multibyte --with-features=huge
make && sudo make install
cd
git clone https://github.com/VundleVim/Vundle.vim.git /home/deploy/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
