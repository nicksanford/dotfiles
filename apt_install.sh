#!/usr/bin/env bash
set -Eeuox pipefail
# dev env
sudo apt install -y stow tmux ripgrep 
# livebook
sudo apt install -y erlang-inets erlang-os-mon erlang-runtime-tools erlang-ssl erlang-xmerl erlang-dev erlang-parsetools
