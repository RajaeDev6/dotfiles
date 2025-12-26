#!/usr/bin/env bash
set -e

echo "🚀 Installing Starship..."
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config
touch ~/.config/starship.toml
starship preset pure-preset -o ~/.config/starship.toml
grep -qxF 'eval "$(starship init bash)"' ~/.bashrc || echo 'eval "$(starship init bash)"' >> ~/.bashrc

echo "🧠 Setting up Vim..."
cp .vimrc ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/colors
wget https://raw.githubusercontent.com/lunacookies/vim-colors-xcode/master/colors/xcodedark.vim \
    -O ~/.vim/colors/xcodedark.vim

echo "📦 Installing NVM & Node.js..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh"
nvm install 22

echo "🌀 Installing Zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc || echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
grep -qxF 'eval "$(zoxide init bash)"' ~/.bashrc || echo 'eval "$(zoxide init bash)"' >> ~/.bashrc

echo "🎨 Adding terminal art..."
grep -qxF 'cat ~/dotfiles/art' ~/.bashrc || echo 'cat ~/dotfiles/art' >> ~/.bashrc
echo "Setting up tmux"
rm ~/.tmux.conf
cp ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "✅ Setup complete! Run:"
echo "source ~/.bashrc"

