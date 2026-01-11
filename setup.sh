#!/usr/bin/env bash
set -Eeuox pipefail

NVIM_VERSION=v0.11.5
ZIG_VERSION=0.15.2
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
GO_ARCH="${ARCH/#x86_64/amd64}"
ASDF_VERSION="v0.18.0"
GO_VERSION="1.25.5"
GOLANGCI_LINT_VERSION=v2.8.0
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

  curl -Lo "$TMPDIR"/go"$GO_VERSION"."$OS"-"$GO_ARCH".tar.gz https://go.dev/dl/go"$GO_VERSION"."$OS"-"$GO_ARCH".tar.gz
  rm -rf /usr/local/go && tar -C /usr/local -xzf "$TMPDIR"/go"$GO_VERSION"."$OS"-"$GO_ARCH".tar.gz
  rm "$TMPDIR"/go"$GO_VERSION"."$OS"-"$GO_ARCH".tar.gz
}

install_nvim() {
  if check_if_stop "neovim"; then
    return
  fi

  case "$OS" in
  linux)
    curl -Lo "$TMPDIR/nvim" "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-$ARCH.appimage"
    mv "$TMPDIR/nvim" "$HOME/.local/bin/nvim"
    chmod +x "$HOME/.local/bin/nvim"
    ;;
  darwin)
    curl -Lo "$TMPDIR/$NVIM_VERSION/nvim-linux-$ARCH.tar.gz" "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-$ARCH.tar.gz"
    # avoid "unknown developer" warning
    xattr -c "$TMPDIR/$NVIM_VERSION/nvim-linux-$ARCH.tar.gz"
    tar -C "$HOME/.local/" -xzvf "$TMPDIR/$NVIM_VERSION/nvim-linux-$ARCH.tar.gz"
    rm "$TMPDIR/$NVIM_VERSION/nvim-linux-$ARCH.tar.gz"
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

  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
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
}

install_golanglint_ci() {
  if check_if_stop "golanglint_ci"; then
    return
  fi
  curl -sSfL https://golangci-lint.run/install.sh | sh -s -- -b "$(go env GOPATH)"/bin"$GOLANGCI_LINT_VERSION"
}

install_zig() {
  if check_if_stop "zig"; then
    return
  fi

  curl -Lo "$TMPDIR/zig-$ARCH-$OS-$ZIG_VERSION.tar.xz" "https://ziglang.org/download/$ZIG_VERSION/zig-$ARCH-$OS-$ZIG_VERSION.tar.xz"
  tar -C "$HOME/.local/bin" -xzf "$TMPDIR/zig-$ARCH-$OS-$ZIG_VERSION.tar.xz"
  rm "$TMPDIR/zig-$ARCH-$OS-$ZIG_VERSION.tar.xz"
}

main() {
  mkdir -p "$HOME/.local/bin"
  install_ohmyzsh
  install_go
  install_nvim
  # install_rust
  install_asdf
  install_golanglint_ci
  install_zig
}

main
