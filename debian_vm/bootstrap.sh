# install erlang solutions packages
# update
sudo apt-get update -y

# basics
sudo apt-get install -y build-essential libssl-dev git-core curl
# for erlang
sudo apt-get install -y automake autoconf libreadline-dev libncurses-dev \
                        libyaml-dev libxslt-dev libffi-dev libtool \
                        unixodbc-dev zlib1g-dev m4 wx-common libwxgtk3.0-dev

# set time correctly
sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/US/Eastern /etc/localtime

# tools
sudo apt-get install -y tree silversearcher-ag ack

# python ruby elixir erlang haskell
sudo apt-get install -y python3 python3-dev python-virtualenv python-dev
sudo apt-get install -y ruby ruby-dev
sudo apt-get install -y erlang
sudo apt-get install -y elixir
sudo apt-get install -y haskell-stack

# dotfiles
cd /vagrant/dotfiles/
cp -R \.* /home/vagrant
cd

# zsh
sudo apt-get install -y zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
sudo chsh -s /bin/zsh vagrant

# tmux
sudo apt-get install -y tmux

# vim
sudo apt-get install -y ncurses-dev
cd /tmp && git clone https://github.com/vim/vim.git && cd vim
./configure -enable-perlinterp --enable-python3interp --enable-rubyinterp --enable-multibyte --with-features=huge
make && sudo make install
cd
git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# spacemacs
sudo apt-get install emacs
cd ~
mv .emacs.d .emacs.d.bak
mv .emacs .emacs.bak
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
emacs --insecure


# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1
echo '. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
$HOME/.asdf/bin/asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
$HOME/.asdf/bin/asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
