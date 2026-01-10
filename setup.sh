#!/usr/bin/env bash
set -Eeuo pipefail

NVIM_VERSION=v0.11.5
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
ASDF_VERSION="v0.18.0"
GO_VERSION="1.25.5"
TMPDIR="${TMPDIR:-/tmp}"

check_if_stop() {
  read -r -p "would you like to install $1? [y/N] " answer
  case "$answer" in [yY])
    echo "installing $1"
    return 1
    ;;
  *)
    echo "skipping $1 install"
    return 0
    ;;
  esac
}

install_go() {
  if check_if_stop "go"; then
    return
  fi

  curl -Lo https://go.dev/dl/go"$GO_VERSION"."$OS"-"$ARCH".tar.gz
  rm -rf /usr/local/go && tar -C /usr/local -xzf go"$GO_VERSION"."$OS"-"$ARCH".tar.gz
  echo 'export PATH=$PATH:/usr/local/go/bin' >>"$HOME/.zshrc"
  source "$HOME"/.zshrc
}

install_nvim() {
  if check_if_stop "neovim"; then
    return
  fi

  case "$OS" in
  linux)
    curl -Lo "$TMPDIR/.local/bin/nvim" "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-$ARCH.appimage"
    ;;
  darwin)
    curl -Lo "$TMPDIR/.local/bin/nvim" "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-$ARCH.tar.gz"
    # avoid "unknown developer" warning
    xattr -c "$TMPDIR/Downloads/nvim-macos-$ARCH.tar.gz"
    tar xzvf "$TMPDIR/Downloads/nvim-macos-$ARCH.tar.gz"
    cp -r "$HOME/Downloads/nvim-macos-$ARCH" "$HOME/.local/"
    ;;
  *)
    echo "unsupported $OS"
    exit 1
    ;;
  esac
}

install_ohmyzsh() {
  if check_if_stop "ohmyzsh"; then
    return
  fi

  echo "downloading ohmyzsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_rust() {
  if check_if_stop "rust"; then
    return
  fi

  echo "installing rust"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_asdf() {
  if check_if_stop "asdf"; then
    return
  fi

  command -v go >/dev/null 2>&1 || {
    echo "can't install asdf, go is required but not installed"
    exit 1
  }

  go install github.com/asdf-vm/asdf/cmd/asdf@"$ASDF_VERSION"
  echo 'export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"' >>"$HOME/.zshrc"
  source "$HOME/.zshrc"
}

main() {
  mkdir -p "$TMPDIR/.local/bin"
  install_go
  install_nvim
  install_ohmyzsh
  install_rust
  install_asdf
  install_golangling_ci
}

main
