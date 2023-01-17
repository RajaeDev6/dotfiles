#! /usr/bin/bash
NVIM_DIR="$HOME/.config/nvim"
TMUX_PATH="$HOME/.tmux.conf"
ZSH_PATH="$HOME/.zshrc"

function linkingTmux(){
        if [ -e ~/.tmux.conf ]
        then
            rm $TMUX_PATH 
        fi
       ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf 
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
}

function installStow(){
    echo checking to see if stow is installed.....
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
    echo setting up config
    if which stow > /dev/null
    then
        echo loading.....
    else
    installStow
    fi
    echo checking to see if neovim is installed....
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
    echo checking to see if tmux is installed.....
    if which tmux > /dev/null
    then
        echo tmux is installing....
        linkingTmux
    else
        echo installing tmux....
       echo loading....
        tmuxInstalled
        linkingTmux
    fi
if [ -e ~/.zshrc ]
then
    rm $ZSH_PATH 
fi
ln -s zsh/.zshrc ~/.zshrc

echo setup finish
else 
    echo this machine might be windows try running install.batch
fi



