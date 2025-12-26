#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"
BASHRC="$HOME/.bashrc"

echo "Installing Starship..."
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config
touch ~/.config/starship.toml
starship preset pure-preset -o ~/.config/starship.toml
grep -qxF 'eval "$(starship init bash)"' "$BASHRC" || \
  echo 'eval "$(starship init bash)"' >> "$BASHRC"

echo "Setting up Vim..."
cp "$DOTFILES/.vimrc" ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/colors
wget -q https://raw.githubusercontent.com/lunacookies/vim-colors-xcode/master/colors/xcodedark.vim \
  -O ~/.vim/colors/xcodedark.vim

echo "Installing NVM & Node.js..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh"
nvm install 22

echo "Installing Zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' "$BASHRC" || \
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$BASHRC"
grep -qxF 'eval "$(zoxide init bash)"' "$BASHRC" || \
  echo 'eval "$(zoxide init bash)"' >> "$BASHRC"

echo "Adding terminal art..."
grep -qxF 'cat ~/dotfiles/art' "$BASHRC" || \
  echo 'cat ~/dotfiles/art' >> "$BASHRC"

echo "Installing Go (latest stable)..."
GO_VERSION="$(curl -s https://go.dev/VERSION?m=text)"
curl -LO "https://go.dev/dl/${GO_VERSION}.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "${GO_VERSION}.linux-amd64.tar.gz"
rm "${GO_VERSION}.linux-amd64.tar.gz"

grep -qxF 'export PATH=$PATH:/usr/local/go/bin' "$BASHRC" || \
  echo 'export PATH=$PATH:/usr/local/go/bin' >> "$BASHRC"

echo "Setting up dotfile symlinks..."

# Vim
[ -L ~/.vimrc ] && rm ~/.vimrc
ln -sf "$DOTFILES/.vimrc" ~/.vimrc

# tmux
[ -L ~/.tmux.conf ] && rm ~/.tmux.conf
ln -sf "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf

# kitty
mkdir -p ~/.config/kitty
[ -L ~/.config/kitty/kitty.conf ] && rm ~/.config/kitty/kitty.conf
ln -sf "$DOTFILES/kitty/kitty.conf" ~/.config/kitty/kitty.conf

# i3
mkdir -p ~/.config/i3
[ -L ~/.config/i3/config ] && rm ~/.config/i3/config
ln -sf "$DOTFILES/i3/config" ~/.config/i3/config

echo "Adding config edit aliases..."

ALIASES='
# >>> dotfile edit aliases >>>
alias vc="vim ~/dotfiles/.vimrc"
alias tc="vim ~/dotfiles/tmux/.tmux.conf"
alias kc="vim ~/dotfiles/kitty/kitty.conf"
alias ic="vim ~/dotfiles/i3/config"
# <<< dotfile edit aliases <<<
'

if ! grep -q "dotfile edit aliases" "$BASHRC"; then
  printf "%s\n" "$ALIASES" >> "$BASHRC"
fi

echo "Setup complete!"
echo "➡ Run: source ~/.bashrc"
echo "➡ Verify Go: go version"
