#!/bin/bash
set -e

apt-get update -y
apt-get upgrade -y
apt-get install -y fail2ban unattended-upgrades build-essential \
                   python3 python3-venv python3-dev tree silversearcher-ag \
                   ack automake autoconf libreadline-dev libncurses-dev \
                   libyaml-dev libxslt-dev libffi-dev libtool \
                   unixodbc-dev zlib1g-dev m4 wx-common libwxgtk3.0-dev \
                   erlang elixir haskell-stack zsh ncurses-dev \
                   ruby ruby-dev

useradd deploy
cp -R /root/.ssh /home/deploy/.ssh
cp /root/.bashrc /home/deploy
cp /root/.viminfo /home/deploy
cp /root/.profile /home/deploy
chmod 700 /home/deploy/.ssh
chmod 400 /home/deploy/.ssh/authorized_keys
chown deploy:deploy /home/deploy -R

git clone git://github.com/robbyrussell/oh-my-zsh.git /home/deploy/.oh-my-zsh
sudo chsh -s /bin/zsh deploy

cd /tmp && git clone https://github.com/vim/vim.git && cd vim
./configure -enable-perlinterp --enable-python3interp --enable-rubyinterp --enable-multibyte --with-features=huge
make && sudo make install
cd
git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
