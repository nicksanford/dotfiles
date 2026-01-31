.PHONY: all

all:
	stow -t ~ tmux 
	stow -t ~ nvim
	stow -t ~ zsh
	stow -t ~ alacritty
	stow -t ~ asdf

setup:
	./setup.sh
