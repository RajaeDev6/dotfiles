#! /usr/bin/bash
NVIM_DIR="$HOME/.config/nvim"
TMUX_PATH="$HOME/.tmux.conf"
ZSH_PATH="$HOME/.zshrc"
current_dir=$(pwd)
function linkingTmux(){
        if [ -e "$HOME/.tmux.conf" ]
        then
            echo "found a tmux.conf \n removing it..."
            rm $TMUX_PATH 
            echo "file removed"
        fi
        echo "linking file"
        stow -t $HOME -v tmux
}
#install zsh
function installZsh(){
 if [[ $(uname -s) == "Darwin" ]];
 then 
     brew install zsh
 elif [[ $(uname -s) == "Linux" ]];
 then 
     sudo apt install zsh
 fi
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}
#function to install neovim
function installNeovim(){
if [[ $(uname -s) == "Darwin" ]];
then
    brew insall neovim
elif [[ $(uname -s) == "Linux" ]]
then
    sudo apt install neovim
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

function installStow(){
    echo "checking to see if stow is installed..."
    if [[ $(uname -s) == "Darwin" ]]
    then
        brew install stow
    elif [[ $(uname -s) == "Linux" ]]
    then
        sudo apt install stow
    fi
}
function tmuxInstall(){
    if [[ $(uname -s) == "Darwin" ]]
    then
        brew install tmux
    elif [[ $(uname -s) == "Linux" ]]
    then
        sudo apt install tmux
    fi
}

function linkNeovimConfig(){
    stow nvim -t $NVIM_DIR
}

if [[ $(uname -s) == "Linux" ]] || [[ $(uname -s) == "Darwin" ]];
then
    echo "setting up config"
    if which stow > /dev/null
    then
        echo "loading....."
    else
    installStow
    fi
    echo "checking to see if neovim is installed...."
    if which nvim > /dev/null
    then
       if [ -d $NVIM_DIR ] 
       then
           rm -rf $NVIM_DIR
        fi
           mkdir $NVIM_DIR
           linkNeovimConfig
    else
        echo "neovim is installing...."
        installNeovim
    fi
    echo "checking to see if tmux is installed..."
    if which tmux > /dev/null
    then
        echo "tmux is installing..."
        linkingTmux
    else
        echo "installing tmux..."
       echo "loading...."
        tmuxInstalled
        linkingTmux
    fi
if [ -f "/usr/bin/zsh" ]
then
    echo "zsh installed"
else
    echo "zsh not installed"
    installZsh
fi
if [ -e $HOME/.zshrc ]
then
    echo "found a .zshrc file\nremoving it..."
    rm $ZSH_PATH
    echo "file removed"
fi
echo linking file...
stow -t $HOME -v zsh
echo "setup finish"
else 
    echo "this machine might be windows try running install.batch"
fi



