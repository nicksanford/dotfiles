#!/bin/bash
# TESTED ON UBUNTU 18.04

set -e

# Update
apt-get update -y
apt-get upgrade -y

# Security
apt-get install -y fail2ban unattended-upgrades 

# Create & set up deploy
useradd deploy
git clone https://github.com/nicksanford/dotfiles.git && cp -r dotfiles/dotfiles /home/deploy
cp -R /root/.ssh /home/deploy/.ssh
cp /root/.bashrc /home/deploy
cp /root/.profile /home/deploy
chmod 700 /home/deploy/.ssh
chmod 400 /home/deploy/.ssh/authorized_keys

# Python
# python3 python3-venv python3-dev
apt-get install -y build-essential make \
                   libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
                   libsqlite3-dev wget curl llvm libncurses5-dev xz-utils \
                   tk-dev libxml2-dev libxmlsec1-dev libffi-dev
git clone https://github.com/pyenv/pyenv.git /home/deploy/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /home/deploy/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /home/deploy/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /home/deploy/.zshenv
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /home/deploy/.zshenv
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshenv

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

# Ensure deploy owns all it's dirs
chown deploy:deploy /home/deploy -R

# Install correct python version
su deploy
pyenv install 3.7.0
